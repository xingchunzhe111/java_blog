package com.my.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
    public AdminController(){
        System.out.println("init-admin");
    }
    @RequestMapping("/admin/index")
    public String articleIndex(){
        return "admin/index";
    }


}
