package com.feras.controller;

import com.feras.Dao.GCBuddyDao;
import com.feras.DaoFactory.DaoFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
    GCBuddyDao dao = DaoFactory.getInstance(GCBuddyDao.HIBERNATE_DAO);

    @RequestMapping("/")

    public ModelAndView helloWorld() {
        return new
                ModelAndView("welcome", "message", "Hello World");

    }


    @RequestMapping("/RegistrationForm")

    public ModelAndView RegistrationForm() {
        return new
                ModelAndView("RegistrationForm", "message", "");

    }

}
