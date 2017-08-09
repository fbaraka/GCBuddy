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
    GCBuddyDao dao = DaoFactory.getInstance(GCBuddyDao.HIBERNATE_DAO);
    UsersEntity loginUser;

    @RequestMapping("/")

    public ModelAndView helloWorld() {
        return new
                ModelAndView("welcome", "message", "Hello World");

    }

    @RequestMapping("/dontLook")

    public String getToken(){
        return "dontLook";
    }


    @RequestMapping(value = "/RegistrationForm", method = RequestMethod.GET)

    public ModelAndView RegistrationForm(Model model, @RequestParam("tempCode") String tempCode) {
        String authToken = SlackApiCalls.getOAuthToken(tempCode);
        System.out.println(authToken);
        JSONObject userProfile = SlackApiCalls.getUserInfo(authToken);
        System.out.println(userProfile);
        try {
            model.addAttribute("email", userProfile.getJSONObject("profile").getString("email"));
            model.addAttribute("firstName", userProfile.getJSONObject("profile").getString("first_name"));
            model.addAttribute("lastName", userProfile.getJSONObject("profile").getString("last_name"));
            model.addAttribute("authToken", authToken);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return new
                ModelAndView("RegistrationForm", "command", new UsersEntity());

    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)

    public String homePage(UsersEntity usersEntity) {
        System.out.println(usersEntity);
        if (dao.getUser(usersEntity.getUsername()) != null){
            return "RegistrationForm";
        }
        usersEntity.setIsAbleToMentor(false);
        usersEntity.setExperience("a million");
        dao.addUser(usersEntity);
        loginUser=dao.getUser(usersEntity.getUsername());
        return ("homepage");
    }

    @RequestMapping(value = "/addMentor", method = RequestMethod.POST)

    public String addMentor(MentorsEntity mentorsEntity) {

        loginUser.setAbleToMentor(true);
        mentorsEntity.setMentorId(loginUser.getUserId());
        dao.addMentor(mentorsEntity);

        return ("mmpage");
    }


    @RequestMapping(value = "/addMentee", method = RequestMethod.POST)
    public String addMentee(MenteesEntity menteesEntity) {

        loginUser.setAbleToMentor(false);
        menteesEntity.setMenteeId(loginUser.getUserId());
        dao.addMentee(menteesEntity);

        return ("mmpage");
    }


    @RequestMapping("/homepage")
    public String goHome(){
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
        model.addAttribute("firstName",loginUser.getFirstName());
        model.addAttribute("lastName",loginUser.getLastName());
        model.addAttribute("email",loginUser.getEmail());
        model.addAttribute("BioBlurb",loginUser.getBioBlurb());


        return new
                ModelAndView("profilepage", "message", "Test");
    }

    @RequestMapping("mentor")

    public ModelAndView mentorPortal() {
        ArrayList<UsersEntity> mentorList = dao.getAllUsers();
        return new
                ModelAndView("mmpage", "cList", mentorList);
    }

    @RequestMapping("mentee")

    public ModelAndView menteePage() {
        ArrayList<UsersEntity> menteeList = dao.getAllUsers();
        return new
                ModelAndView("mmpage", "cList", menteeList);
    }

    @RequestMapping(value = "/mentorregistration", method = RequestMethod.GET)

    public ModelAndView mentorReg(Model model) {
        model.addAttribute("action", "addMentor");
        return new
                ModelAndView("mentorshipRegistration", "command", new MentorsEntity());
    }

    @RequestMapping(value = "/menteeregistration", method = RequestMethod.GET)

    public ModelAndView menteeReg(Model model) {
        model.addAttribute("action", "addMentee");
        return new
                ModelAndView("mentorshipRegistration", "command", new MenteesEntity());
    }



}
