package com.feras.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
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
