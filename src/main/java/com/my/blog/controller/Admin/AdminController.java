package com.my.blog.controller.Admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class AdminController {
    public AdminController(){
        System.out.println("init-admin");
    }
    @RequestMapping("/admin/index")
    public String articleIndex(HttpServletRequest request){
        return "admin/index";
    }


}
