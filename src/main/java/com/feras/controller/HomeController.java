package com.feras.controller;

import com.feras.API.ParkWhizApiCalls;
import com.feras.API.SlackApiCalls;
import com.feras.Dao.GCBuddyDao;
import com.feras.DaoFactory.DaoFactory;
import com.feras.Models.MenteesEntity;
import com.feras.Models.MentorsEntity;
import com.feras.Models.ParkingInfo;
import com.feras.Models.UsersEntity;
import com.feras.PasswordEncryption.CryptWithMD5;
import com.feras.API.Watson.MatchMaker;
import com.feras.API.Watson.ProfileGenerator;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.constraints.Null;
import java.util.ArrayList;

@Controller
public class HomeController {
    private GCBuddyDao dao = DaoFactory.getInstance(GCBuddyDao.HIBERNATE_DAO);
    private UsersEntity loginUser;
    private String message;
    private boolean menteeSelected = false;
    // the interface for the GCbuddyDao, outlines the methods for the Dao
    // there is also a global variable of UsersEntity, called loginUser. We use this in order to assign who is logged in at
    //   -- time. This is how we know what information to call from our database. This is all set in /RegistrationForm or /logInUser
    // the global String variable message is used throughout our program to display status messages of certain functions.

    //Welcome Page, which leads to Login JSP(/login)
    @RequestMapping("/")
    public String helloWorld() {

        return "welcome";
        // Displays the welcome page, which takes us to the login page.


    }

    //Leads to the login page
    @RequestMapping(value = "/login")
    public String login(Model model) {
        model.addAttribute("msg", message);
        message = "";
        return "login";
    }

    //Login Page
    @RequestMapping(value = "/logInUser")
    public String logUserIn(@RequestParam("email") String email, @RequestParam("pass") String password) {
        if (validEmailAndPass(email, CryptWithMD5.cryptWithMD5(password)) != null) {
            loginUser = validEmailAndPass(email, CryptWithMD5.cryptWithMD5(password));
            return "redirect:/homepage";
        } else {

            message = "WRONG EMAIL OR PASSWORD";
            return "redirect:login";
            //Logins in user with e-mail and password, only if the e-mail and password is already in database.
            // validEmailAndPass returns a userEntity, using the requestparams in logUserIn, which is then assigned to the loginUser global variable.
            // validEmailAndPass also checks to see if there is a null value for the user.
            // the redirects are in if/else statements, to point the user in the right direction.

        }
    }


    //This method logs our =user out by setting the global loginUser variable to null and sending them to the welcome page
    @RequestMapping("/logout")
    public String logout(){
        loginUser = null;
        return "welcome";
    }

    @RequestMapping("/dontLook")

    public String getToken() {
        return "dontLook";
    }
    //directs you to the don't look page, which logs your auth token.
    //refer to our dontLook.jsp to see the javascript that grabs the temporary token.


    @RequestMapping(value = "/RegistrationForm", method = RequestMethod.GET)

    public ModelAndView RegistrationForm(Model model, @RequestParam("tempCode") String tempCode) {
        String authToken = SlackApiCalls.getOAuthToken(tempCode); // this is where we convert the tempCode into an authToken, refer to the method getAuthToken to see how this is done
        System.out.println(authToken);
        //prints out the auth token from the dontlook page
        String usersId = SlackApiCalls.getUserId(authToken);
        System.out.println(usersId);
        // prints out the userid from slack
        JSONObject userProfile = SlackApiCalls.getUserInfo(authToken);
        if (isUserRegistered(authToken) && !authToken.equalsIgnoreCase("")) {
            // checks to see if the user is already in the data base, and if they are just automatically logs them in.
            loginUser = dao.getUserByAuth(authToken);
            return new ModelAndView("redirect:/homepage", "", "");

        }
        System.out.println(userProfile);
        // prints the user profile lines for debugging purposes

        model.addAttribute("action", "/addUser");
        try {
            model.addAttribute("photoUrl", userProfile.getJSONObject("profile").getString("image_72"));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        model.addAttribute("authToken", authToken);
        model.addAttribute("slackId", usersId);
        // populated hidden fields in the user registration form to make UsersEntity.
        return new ModelAndView("RegistrationForm", "command", new UsersEntity());
        // refers to the model name command which references the spring form and creates a new user entity that allows us to store data in the database.
    }


    //added this method to update the users info, created a copy of the RegisterForm.jsp named updateForm and changed a few things
    @RequestMapping(value = "/editUser", method = RequestMethod.GET)

    public ModelAndView editUser(Model model) {
        JSONObject userProfile = SlackApiCalls.getUserInfo(loginUser.getAuthToken());
        //if the user doesnt have an authtoken this will set the picture to our default pic
        try {
            model.addAttribute("photoUrl", userProfile.getJSONObject("profile").getString("image_72"));
        } catch (JSONException e) {
            e.printStackTrace();
            model.addAttribute("photoUrl","http://www.pgconnects.com/helsinki/wp-content/uploads/sites/3/2015/07/generic-profile-grey-380x380.jpg");
        }catch (NullPointerException e) {
            e.printStackTrace();
            model.addAttribute("photoUrl", "http://www.pgconnects.com/helsinki/wp-content/uploads/sites/3/2015/07/generic-profile-grey-380x380.jpg");
        }
        model.addAttribute("authToken", loginUser.getAuthToken());
        model.addAttribute("slackId", loginUser.getSlackId());
        // populated hidden fields in the user registration form to make UsersEntity.
        return new ModelAndView("updateForm", "command", new UsersEntity());
        // refers to the model name command which references the spring form and creates a new user entity that allows us to store data in the database.
    }

    @RequestMapping(value = "/updateUser", method = RequestMethod.POST)

    public String updateUser(UsersEntity usersEntity) {
        System.out.println(usersEntity);
        usersEntity.setUserId(loginUser.getUserId());
        dao.updateUser(usersEntity);
        loginUser = dao.getUser(usersEntity.getEmail());
        return ("redirect:/homepage");
    }
    //this is the same as the addUser method but instead does an update for the user. and it doesnt need to ask for permissions again and doesnt need to encrypt the password


    @RequestMapping(value = "/addUser", method = RequestMethod.POST)

    public String addUser(UsersEntity usersEntity) {
        System.out.println(usersEntity);
        usersEntity.setPassword(CryptWithMD5.cryptWithMD5(usersEntity.getPassword()));
        dao.addUser(usersEntity);
        loginUser = dao.getUser(usersEntity.getEmail());
        return ("redirect:https://slack.com/oauth/authorize?scope=chat:write:user&client_id=219461147683.223751169686&redirect_uri=http://localhost:8080/homepage");
    }
    //takes in the user entity, encrypts the password and stores this information in the database.


    @RequestMapping("/homepage")
    public String goHome(Model model) {

        //added this conditional check to the homepage to make sure there is actually a user logged in, if not, it sends them to the welcome page
        if (loginUser == null){
            return "welcome";
        }
        try {
            model.addAttribute("userPic", loginUser.getPhotoUrl());
        } catch (NullPointerException E) {
            model.addAttribute("userPic", "http://www.pgconnects.com/helsinki/wp-content/uploads/sites/3/2015/07/generic-profile-grey-380x380.jpg");
        } // if the logged in user doesnt have a photo from slack, a generic photo is produced in its place.
        return "homepage";
    }
    // after being stored in the database the user is returned to the homepage

    @RequestMapping("/mentorship")

    public String mentorPage() {
        return "mentorship";
               
    } // takes user to mentorship page where they can sign up to be a mentor or mentee.


    @RequestMapping("/profilepage")

    public ModelAndView profilePage(Model model) {

        //declaring a local boolean variable to determine if the user has a valid personality profile built up
        boolean hasPersonality = false;
        //if the user is a mentee then they have a valid personality built by watson
        //if they do we will addy the traits so the user can see them, I multiplied them by 100 to show them as a percent
        if (isMentee()) {
            hasPersonality = true;
            model.addAttribute("open", dao.getMentee(loginUser.getUserId()).getOpeness()*100);
            model.addAttribute("extra", dao.getMentee(loginUser.getUserId()).getExtraversion()*100);
            model.addAttribute("agree", dao.getMentee(loginUser.getUserId()).getAggreeableness()*100);
            model.addAttribute("conscience", dao.getMentee(loginUser.getUserId()).getConscience()*100);
            model.addAttribute("emotion", dao.getMentee(loginUser.getUserId()).getEmotion()*100);
            model.addAttribute("menteeDisc", dao.getMentee(loginUser.getUserId()).getDisciplines());
        }
        //if the user is a mentor then they have a valid personality built by watson
        //if they do we will addy the traits so the user can see them, I multiplied them by 100 to show them as a percent
        if (isMentor()) {
            hasPersonality = true;
            model.addAttribute("open", dao.getMentor(loginUser.getUserId()).getOpeness()*100);
            model.addAttribute("extra", dao.getMentor(loginUser.getUserId()).getExtraversion()*100);
            model.addAttribute("agree", dao.getMentor(loginUser.getUserId()).getAggreeableness()*100);
            model.addAttribute("conscience", dao.getMentor(loginUser.getUserId()).getConscience()*100);
            model.addAttribute("emotion", dao.getMentor(loginUser.getUserId()).getEmotion()*100);
            model.addAttribute("mentorDisc", dao.getMentor(loginUser.getUserId()).getDisciplines());
        }
        model.addAttribute("firstName", loginUser.getFirstName());
        model.addAttribute("lastName", loginUser.getLastName());
        model.addAttribute("email", loginUser.getEmail());
        model.addAttribute("bootCamp", loginUser.getBootcamp());

        //if the user isnt a mentor or mentee certain divs on the profile card will not show
        model.addAttribute("isMentor", isMentor());
        model.addAttribute("isMentee", isMentee());
        model.addAttribute("hasPersonality", hasPersonality);

        if (!loginUser.getPhotoUrl().equals("")) {
            model.addAttribute("userPic", loginUser.getPhotoUrl());
        } else {
            model.addAttribute("userPic", "https://secure.gravatar.com/avatar/a0e220c31d928457ac8a9754d2f75968.jpg?s=72&d=https%3A%2F%2Fa.slack-edge.com%2F66f9%2Fimg%2Favatars%2Fava_0015-72.png");
        }

        return new
                ModelAndView("profilepage", "message", "Test");
    }//

    @RequestMapping(value = "/deleteUser")

    public String deleteUser() {
        dao.deleteUser(loginUser.getUserId());
        return ("redirect:/");
    }
    //Allows user to delete themselves from the Database, and redirects them to the Welcome Page

    @RequestMapping(value = "/deleteMentor")

    public String deleteMentor() {
        dao.deleteMentor(loginUser.getUserId());
        return ("redirect:/profilepage");
    }
    //Allows user to delete themselves from the Database, and redirects them to the Welcome Page

    @RequestMapping(value = "/deleteMentee")

    public String deleteMentee() {
        dao.deleteMentee(loginUser.getUserId());
        return ("redirect:/profilepage");
    }
    //Allows user to delete themselves from the Database, and redirects them to the Welcome Page

    @RequestMapping("/parking")
    public ModelAndView parking(Model model) {
        ArrayList<ParkingInfo> information = ParkWhizApiCalls.getParking();

        //added these attributes to account for the nav bar
        model.addAttribute("firstName",  loginUser.getFirstName());
        model.addAttribute("lastName",  loginUser.getLastName());


        return new
                ModelAndView("parking", "c_List", information);

    }

    @RequestMapping(value = "/mentorregistration", method = RequestMethod.GET)

    public ModelAndView mentorReg(Model model) {
        menteeSelected = false;
        model.addAttribute("action", "addMentor");
        model.addAttribute("isMentor", !isMentor());
        model.addAttribute("desc", "mentor");

        //added these attributes to account for the nav bar
        model.addAttribute("firstName",  loginUser.getFirstName());
        model.addAttribute("lastName",  loginUser.getLastName());
        if (isMentor()) {
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

        //added these attributes to account for the nav bar
        model.addAttribute("firstName",  loginUser.getFirstName());
        model.addAttribute("lastName",  loginUser.getLastName());
        if (isMentee()) {
            model.addAttribute("disciplines", dao.getMentee(loginUser.getUserId()).getDisciplines());
        }
        return new
                ModelAndView("mentorshipRegistration", "command", new MenteesEntity());
    }

    @RequestMapping(value = "/goToPortal")
    public String goToPortal(@RequestParam("addMore") boolean addMore) {
        if (addMore) {
            if (menteeSelected) {
                return "redirect:updateMenteeReg";
            } else {
                return "redirect:updateMentorReg";
            }
        } else {
            if (menteeSelected) {
                return "redirect:mentee";
            } else {
                return "redirect:mentor";
            }
        }
    }

    @RequestMapping(value = "updateMentorReg", method = RequestMethod.GET)
    public ModelAndView updateMentorReg(Model model) {
        model.addAttribute("action", "updateMentor");
        model.addAttribute("isMentor", isMentor());
        model.addAttribute("desc", "mentor");

        //added these attributes to account for the nav bar
        model.addAttribute("firstName",  loginUser.getFirstName());
        model.addAttribute("lastName",  loginUser.getLastName());
        if (isMentee()) {
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

        //added these attributes to account for the nav bar
        model.addAttribute("firstName",  loginUser.getFirstName());
        model.addAttribute("lastName",  loginUser.getLastName());
        if (isMentee()) {
            model.addAttribute("disciplines", dao.getMentee(loginUser.getUserId()).getDisciplines());
        }
        return new
                ModelAndView("mentorshipRegistration", "command", new MenteesEntity());
    }

    @RequestMapping(value = "/addMentor", method = RequestMethod.POST)

    public ModelAndView addMentor(MentorsEntity mentorsEntity, Model model, @RequestParam("answer") String answer) {

        if (answer.split(" ").length >= 100) {
            JSONObject profileJson = ProfileGenerator.generateProfile(answer);
            mentorsEntity.setAggreeableness(getAgree(profileJson));
            mentorsEntity.setConscience(getConscience(profileJson));
            mentorsEntity.setEmotion(getEmotion(profileJson));
            mentorsEntity.setExtraversion(getExtro(profileJson));
            mentorsEntity.setOpeness(getOpenness(profileJson));
        }
        mentorsEntity.setMentorId(loginUser.getUserId());
        mentorsEntity.setFirstName(loginUser.getFirstName());
        mentorsEntity.setLastName(loginUser.getLastName());
        mentorsEntity.setSlackId(loginUser.getSlackId());
        //added these next two lines to pass the photoURL and city from the users table to the mentee/mentor table
        mentorsEntity.setCity(loginUser.getCity());
        mentorsEntity.setPhotoUrl(loginUser.getPhotoUrl());
        //added these attributes to account for the nav bar
        model.addAttribute("firstName",  loginUser.getFirstName());
        model.addAttribute("lastName",  loginUser.getLastName());
        dao.addMentor(mentorsEntity);

        return mentorPortal(model);
    }

    @RequestMapping(value = "/addMentee", method = RequestMethod.POST)
    public ModelAndView addMentee(MenteesEntity menteesEntity, Model model, @RequestParam("answer") String answer) {

        if (answer.split(" ").length >= 100) {
            JSONObject profileJson = ProfileGenerator.generateProfile(answer);
            menteesEntity.setAggreeableness(getAgree(profileJson));
            menteesEntity.setConscience(getConscience(profileJson));
            menteesEntity.setEmotion(getEmotion(profileJson));
            menteesEntity.setExtraversion(getExtro(profileJson));
            menteesEntity.setOpeness(getOpenness(profileJson));
        }
        menteesEntity.setMenteeId(loginUser.getUserId());
        menteesEntity.setFirstName(loginUser.getFirstName());
        menteesEntity.setLastName(loginUser.getLastName());
        menteesEntity.setSlackId(loginUser.getSlackId());
        //added these next two lines to pass the photoURL and city from the users table to the mentee/mentor table
        menteesEntity.setCity(loginUser.getCity());
        menteesEntity.setPhotoUrl(loginUser.getPhotoUrl());
        //added these attributes to account for the nav bar
        model.addAttribute("firstName",  loginUser.getFirstName());
        model.addAttribute("lastName",  loginUser.getLastName());
        dao.addMentee(menteesEntity);

        return menteePage(model);
    }

    @RequestMapping(value = "/updateMentee", method = RequestMethod.POST)
    public ModelAndView updateMentee(MenteesEntity menteesEntity, Model model, @RequestParam("answer") String answer) {
        if (answer.split(" ").length > 100) {
            JSONObject profileJson = ProfileGenerator.generateProfile(answer);
            menteesEntity.setAggreeableness(getAgree(profileJson));
            menteesEntity.setConscience(getConscience(profileJson));
            menteesEntity.setEmotion(getEmotion(profileJson));
            menteesEntity.setExtraversion(getExtro(profileJson));
            menteesEntity.setOpeness(getOpenness(profileJson));
            //added these attributes to account for the nav bar
            model.addAttribute("firstName",  loginUser.getFirstName());
            model.addAttribute("lastName",  loginUser.getLastName());
        }
        menteesEntity.setMenteeId(loginUser.getUserId());
        menteesEntity.setFirstName(loginUser.getFirstName());
        menteesEntity.setLastName(loginUser.getLastName());
        //added these next two lines to pass the photoURL and city from the users table to the mentee/mentor table
        menteesEntity.setCity(loginUser.getCity());
        menteesEntity.setPhotoUrl(loginUser.getPhotoUrl());
        dao.updateMentee(menteesEntity);

        return menteePage(model);
    }

    @RequestMapping(value = "/updateMentor", method = RequestMethod.POST)
    public ModelAndView updateMentor(MentorsEntity mentorsEntity, Model model, @RequestParam("answer") String answer) {
        if (answer.split(" ").length > 100) {
            JSONObject profileJson = ProfileGenerator.generateProfile(answer);
            mentorsEntity.setAggreeableness(getAgree(profileJson));
            mentorsEntity.setConscience(getConscience(profileJson));
            mentorsEntity.setEmotion(getEmotion(profileJson));
            mentorsEntity.setExtraversion(getExtro(profileJson));
            mentorsEntity.setOpeness(getOpenness(profileJson));
            //added these attributes to account for the nav bar
            model.addAttribute("firstName",  loginUser.getFirstName());
            model.addAttribute("lastName",  loginUser.getLastName());
        }
        mentorsEntity.setMentorId(loginUser.getUserId());
        mentorsEntity.setFirstName(loginUser.getFirstName());
        mentorsEntity.setLastName(loginUser.getLastName());
        //added these next two lines to pass the photoURL and city from the users table to the mentee/mentor table
        mentorsEntity.setCity(loginUser.getCity());
        mentorsEntity.setPhotoUrl(loginUser.getPhotoUrl());
        dao.updateMentor(mentorsEntity);

        return menteePage(model);
    }

    @RequestMapping("mentor")

    public ModelAndView mentorPortal(Model model) {
        ArrayList<MenteesEntity> menteeList = MatchMaker.narrowMenteebyWatson(dao.getMentor(loginUser.getUserId()), dao.getAllMentees());
        model.addAttribute("msg", message);
        //added these attributes to account for the nav bar
        model.addAttribute("firstName",  loginUser.getFirstName());
        model.addAttribute("lastName",  loginUser.getLastName());
        message = "";
        return new
                ModelAndView("mmpage", "cList", menteeList);
    }

    @RequestMapping("mentee")

    public ModelAndView menteePage(Model model) {
        ArrayList<MentorsEntity> mentorList = MatchMaker.narrowMentorbyWatson(dao.getMentee(loginUser.getUserId()), dao.getAllMentors());
        model.addAttribute("msg", message);
        //added these attributes to account for the nav bar
        model.addAttribute("firstName",  loginUser.getFirstName());
        model.addAttribute("lastName",  loginUser.getLastName());
        message = "";
        return new
                ModelAndView("mmpage", "cList", mentorList);
    }

    @RequestMapping(value = "/sendmessage")
    public String sendSlackMessage(Model model, @RequestParam("slackMessage") String slackMessage, @RequestParam("slackId") String slackId, HttpServletRequest request) {
        message = SlackApiCalls.sendDirectMessage(loginUser.getAuthToken(), slackId, slackMessage, loginUser.getSlackId());
        return "redirect:messageRedirect";
    }

    @RequestMapping("messageRedirect")
    public ModelAndView messageRedirect(Model model) {
        if (menteeSelected) {
            ArrayList<MentorsEntity> mentorList = MatchMaker.narrowMentorbyWatson(dao.getMentee(loginUser.getUserId()), dao.getAllMentors());
            model.addAttribute("msg", message);
            message = "";
            return new
                    ModelAndView("mmpage", "cList", mentorList);
        } else {
            ArrayList<MenteesEntity> menteeList = MatchMaker.narrowMenteebyWatson(dao.getMentor(loginUser.getUserId()), dao.getAllMentees());
            model.addAttribute("msg", message);
            message = "";
            return new
                    ModelAndView("mmpage", "cList", menteeList);
        }
    }

    private boolean isUserRegistered(String authToken) {
        for (UsersEntity user : dao.getAllUsers()) {
            if (user.getAuthToken().equals(authToken)) {
                return true;
            }
        }
        return false;
    }

    private UsersEntity validEmailAndPass(String email, String pass) {
        return dao.getUser(email, pass);
    }
    // only used in our logUserIn method to check our database for a particular user, passing in the above parameters

    private boolean isMentee() {
        try {
            UsersEntity test = dao.getUser(dao.getMentee(loginUser.getUserId()).getMenteeId());
            if (test != null) {
                return true;
            }
        } catch (NullPointerException e) {
            return false;
        }
        return false;
    }

    private boolean isMentor() {
        try {
            UsersEntity test = dao.getUser(dao.getMentor(loginUser.getUserId()).getMentorId());
            if (test != null) {
                return true;
            }
        } catch (NullPointerException e) {
            return false;
        }
        return false;
    }

    private double getOpenness(JSONObject profileJson) {
        double openness = 0.0;
        try {
            openness = Double.parseDouble(profileJson.getJSONArray("personality").getJSONObject(0).getString("percentile"));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return openness;
    }

    private double getConscience(JSONObject profileJson) {
        double conscience = 0.0;
        try {
            conscience = Double.parseDouble(profileJson.getJSONArray("personality").getJSONObject(1).getString("percentile"));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return conscience;

    }

    private double getExtro(JSONObject profileJson) {
        double extro = 0.0;
        try {
            extro = Double.parseDouble(profileJson.getJSONArray("personality").getJSONObject(2).getString("percentile"));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return extro;

    }

    private double getEmotion(JSONObject profileJson) {
        double emotion = 0.0;
        try {
            emotion = Double.parseDouble(profileJson.getJSONArray("personality").getJSONObject(4).getString("percentile"));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return emotion;
    }

    private double getAgree(JSONObject profileJson) {
        double agree = 0.0;
        try {
            agree = Double.parseDouble(profileJson.getJSONArray("personality").getJSONObject(3).getString("percentile"));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return agree;
    }
}
