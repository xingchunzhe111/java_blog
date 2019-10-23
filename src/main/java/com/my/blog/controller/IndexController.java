package com.my.blog.controller;

import com.my.blog.model.table.ArticleTable;
import com.my.blog.model.table.CategoryTable;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

import java.util.List;

@Controller
//前台首页控制器
public class IndexController {
    @GetMapping(value = "/")
    public String index(HttpServletRequest request,@RequestParam(name = "page", required = false, defaultValue = "1")int page,Model model){
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        //通过SessionFactory 获取 Session
        Session session = sessionFactory.openSession();
        try{
            //栏目列表
            int pageSize = 10;
            int offset = (page-1)*pageSize;
            List catList = session.createCriteria(CategoryTable.class)
                    .add(Restrictions.eq("is_del",0))
                    .list();

            //文章列表
            List articleList = session.createCriteria(ArticleTable.class)
                    .add(Restrictions.eq("status",1))
                    .setFirstResult(offset)
                    .setMaxResults(pageSize)
                    .list();

            model.addAttribute("catList", catList);
            model.addAttribute("articleList", articleList);
            System.out.println("offset:"+offset);
            System.out.println("pageSize:"+pageSize);
            System.out.println(catList);
            System.out.println(articleList);
        }finally {
            session.close();
        }
        return "index";
    }

    @RequestMapping("/list")
    public String list(Model model){
        return "list";
    }

    @RequestMapping("/detail")
    public String detail(){
        return "detail";
    }




}
