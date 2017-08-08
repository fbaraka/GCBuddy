package com.feras.controller;

import com.feras.Dao.GCBuddyDao;
import com.feras.Dao.SlackApiCalls;
import com.feras.DaoFactory.DaoFactory;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
    GCBuddyDao dao = DaoFactory.getInstance(GCBuddyDao.HIBERNATE_DAO);

    @RequestMapping("/")

    public ModelAndView helloWorld() {
        return new
                ModelAndView("welcome", "message", "Hello World");

    }

    @RequestMapping("/dontLook")

    public String getToken(){
        return "dontLook";
    }

    @RequestMapping("/RegistrationForm")

    public ModelAndView RegistrationForm(Model model, @RequestParam("tempCode") String tempCode) {
        String authToken = SlackApiCalls.getOAuthToken(tempCode);
        System.out.println(authToken);
        JSONObject userProfile = SlackApiCalls.getUserInfo(authToken);
        System.out.println(userProfile);
        return new
                ModelAndView("RegistrationForm", "message", "Test");

    }

    @RequestMapping("/homepage")

    public ModelAndView homePage() {
        return new
                ModelAndView("homepage", "message", "Test");

    }

    @RequestMapping("/mentorship")

    public ModelAndView mentorPage() {
        return new
                ModelAndView("mentorship", "message", "Test");
    }

    @RequestMapping("/profilepage")

    public ModelAndView profilePage() {
        return new
                ModelAndView("profilepage", "message", "Test");
    }

}
