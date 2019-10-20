package com.my.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;


@Controller
public class IndexController {
    @GetMapping(value = "/")
    public String index(HttpServletRequest request,@RequestParam(name = "page", required = false, defaultValue = "1")int page){
        //顶部栏目

        //左边的倒序的文章列表

        //右边的文章分类
        System.out.println(page);
        return "index";
    }

    @RequestMapping("/list")
    public String list(){
        return "list";
    }

    @RequestMapping("/detail")
    public String detail(){
        return "detail";
    }

}
