package com.feras.controller;

import com.feras.Dao.GCBuddyDao;
import com.feras.Dao.SlackApiCalls;
import com.feras.DaoFactory.DaoFactory;
import com.feras.Models.MenteesEntity;
import com.feras.Models.MentorsEntity;
import com.feras.Models.UsersEntity;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@Controller
public class HomeController {
    private GCBuddyDao dao = DaoFactory.getInstance(GCBuddyDao.HIBERNATE_DAO);
    private UsersEntity loginUser;
    private String message;
    private boolean menteeSelected = false;

    @RequestMapping("/")

    public ModelAndView helloWorld() {
        return new
                ModelAndView("welcome", "message", "Hello World");

    }

    @RequestMapping("/dontLook")

    public String getToken() {
        return "dontLook";
    }


    @RequestMapping(value = "/RegistrationForm", method = RequestMethod.GET)

    public ModelAndView RegistrationForm(Model model, @RequestParam("tempCode") String tempCode) {
        String authToken = SlackApiCalls.getOAuthToken(tempCode);
        System.out.println(authToken);
        JSONObject userProfile = SlackApiCalls.getUserInfo(authToken);
        if (isUserRegistered(authToken) && !authToken.equalsIgnoreCase("")) {
            loginUser = dao.getUserByAuth(authToken);
            return new ModelAndView("homepage", "", "");
        }
        System.out.println(userProfile);
        try {
            model.addAttribute("email", userProfile.getJSONObject("profile").getString("email"));
            model.addAttribute("firstName", userProfile.getJSONObject("profile").getString("first_name"));
            model.addAttribute("lastName", userProfile.getJSONObject("profile").getString("last_name"));
            model.addAttribute("authToken", authToken);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return new ModelAndView("RegistrationForm", "command", new UsersEntity());
    }

    @RequestMapping(value = "/login")
    public String login(Model model) {
        model.addAttribute("button", "Sign in with Slack");
        model.addAttribute("isLogin", true);
        model.addAttribute("msg", message);
        return "login";
    }

    @RequestMapping(value = "/signUp")
    public String signUp(Model model) {
        model.addAttribute("button", "Connect with Slack");
        model.addAttribute("isLogin", false);
        return "login";
    }

    @RequestMapping(value = "/logInUser")
    public String logUserIn(@RequestParam("email") String email, @RequestParam("pass") String password, Model model){
        if (validEmailAndPass(email, password) != null){
            loginUser = validEmailAndPass(email, password);
            return "homepage";
        } else {
            message = "WORNG EMAIL OR PASSWORD";
            return "redirect:login";
        }
    }


    @RequestMapping(value = "/addUser", method = RequestMethod.POST)

    public String homePage(UsersEntity usersEntity) {
        System.out.println(usersEntity);
        if (dao.getUser(usersEntity.getUsername()) != null) {
            return "RegistrationForm";
        }
        usersEntity.setAbleToMentor(false);
        usersEntity.setExperience("a million");
        dao.addUser(usersEntity);
        loginUser = dao.getUser(usersEntity.getUsername());
        return ("homepage");
    }

    @RequestMapping(value = "/addMentor", method = RequestMethod.POST)

    public ModelAndView addMentor(MentorsEntity mentorsEntity) {

        loginUser.setAbleToMentor(true);
        mentorsEntity.setMentorId(loginUser.getUserId());
        dao.addMentor(mentorsEntity);

        return mentorPortal();
    }


    @RequestMapping(value = "/addMentee", method = RequestMethod.POST)
    public ModelAndView addMentee(MenteesEntity menteesEntity) {

        menteesEntity.setMenteeId(loginUser.getUserId());
        dao.addMentee(menteesEntity);

        return menteePage();
    }


    @RequestMapping("/homepage")
    public String goHome() {
        return "homepage";
    }

    @RequestMapping("/mentorship")

    public ModelAndView mentorPage() {
        return new
                ModelAndView("mentorship", "message", "Test");
    }

    @RequestMapping("/profilepage")

    public ModelAndView profilePage(Model model) {
        model.addAttribute("userName", loginUser.getUsername());
        model.addAttribute("firstName", loginUser.getFirstName());
        model.addAttribute("lastName", loginUser.getLastName());
        model.addAttribute("email", loginUser.getEmail());
        model.addAttribute("BioBlurb", loginUser.getBioBlurb());


        return new
                ModelAndView("profilepage", "message", "Test");
    }

    @RequestMapping("mentor")

    public ModelAndView mentorPortal() {
        ArrayList<UsersEntity> mentorList = dao.getAllMentees();
        return new
                ModelAndView("mmpage", "cList", mentorList);
    }

    @RequestMapping("mentee")

    public ModelAndView menteePage() {
        ArrayList<UsersEntity> menteeList = dao.getAllMentors();
        return new
                ModelAndView("mmpage", "cList", menteeList);
    }

    @RequestMapping(value = "/mentorregistration", method = RequestMethod.GET)

    public ModelAndView mentorReg(Model model) {
        menteeSelected = false;
        model.addAttribute("action", "addMentor");
        model.addAttribute("isMentor", !isMentor());
        model.addAttribute("desc", "mentor");
        if (isMentee()){
            model.addAttribute("disciplines", dao.getMentor(loginUser.getUserId()).getDisciplines());
        }
        return new
                ModelAndView("mentorshipRegistration", "command", new MentorsEntity());
    }

    @RequestMapping(value = "/menteeregistration", method = RequestMethod.GET)

    public ModelAndView menteeReg(Model model) {
        menteeSelected = true;
        model.addAttribute("action", "addMentee");
        model.addAttribute("isMentor", !isMentee());
        model.addAttribute("desc", "mentee");
        if (isMentee()){
            model.addAttribute("disciplines", dao.getMentee(loginUser.getUserId()).getDisciplines());
        }
        return new
                ModelAndView("mentorshipRegistration", "command", new MenteesEntity());
    }

    @RequestMapping(value = "/goToPortal")
    public String goToPortal(@RequestParam("addMore") boolean addMore){
        if (addMore){
            if (menteeSelected){
                return "redirect:updateMenteeReg";
            }else {
                return "redirect:updateMentorReg";
            }
        } else {
            if (menteeSelected){
                return "redirect:mentee";
            }else {
                return "redirect:mentor";
            }
        }
    }

    @RequestMapping(value = "updateMentorReg", method = RequestMethod.GET)
    public ModelAndView updateMentorReg(Model model) {
        model.addAttribute("action", "updateMentor");
        model.addAttribute("isMentor", isMentor());
        model.addAttribute("desc", "mentor");
        if (isMentee()){
            model.addAttribute("disciplines", dao.getMentor(loginUser.getUserId()).getDisciplines());
        }
        return new
                ModelAndView("mentorshipRegistration", "command", new MentorsEntity());
    }

    @RequestMapping(value = "updateMenteeReg", method = RequestMethod.GET)

    public ModelAndView updateMenteeReg(Model model) {
        model.addAttribute("action", "updateMentee");
        model.addAttribute("isMentor", isMentee());
        model.addAttribute("desc", "mentee");
        if (isMentee()){
            model.addAttribute("disciplines", dao.getMentee(loginUser.getUserId()).getDisciplines());
        }
        return new
                ModelAndView("mentorshipRegistration", "command", new MenteesEntity());
    }

    @RequestMapping(value = "/updateMentee", method = RequestMethod.POST)
    public ModelAndView updateMentee(MenteesEntity menteesEntity) {

        menteesEntity.setMenteeId(loginUser.getUserId());
        dao.updateMentee(menteesEntity);

        return menteePage();
    }

    @RequestMapping(value = "/updateMentor", method = RequestMethod.POST)
    public ModelAndView updateMentor(MentorsEntity mentorsEntity) {

        mentorsEntity.setMentorId(loginUser.getUserId());
        dao.updateMentor(mentorsEntity);

        return menteePage();
    }

    private boolean isUserRegistered(String authToken) {
        for (UsersEntity user : dao.getAllUsers()) {
            if (user.getAuthToken().equals(authToken)) {
                return true;
            }
        }
        return false;
    }

    private UsersEntity validEmailAndPass(String email, String pass){
        return dao.getUser(email, pass);
    }

    private boolean isMentee(){
        try {
            UsersEntity test = dao.getUser(dao.getMentee(loginUser.getUserId()).getMenteeId());
            if (test != null) {
                return true;
            }
        }catch (NullPointerException e){
                return false;
            }
        return false;
    }
    private boolean isMentor(){
        try {
            UsersEntity test = dao.getUser(dao.getMentor(loginUser.getUserId()).getMentorId());
            if (test != null) {
                return true;
            }
        }catch (NullPointerException e){
            return false;
        }
        return false;
    }


}
