package com.my.blog.controller;

import com.my.blog.model.base.CategoryBase;
import com.my.blog.model.table.CategoryTable;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;


@Controller
//前台首页控制器
public class IndexController {
    @GetMapping(value = "/")
    public String index(HttpServletRequest request,@RequestParam(name = "page", required = false, defaultValue = "1")int page){
        //顶部栏目
        //左边的倒序的文章列表
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
