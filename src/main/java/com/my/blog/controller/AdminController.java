package com.my.blog.controller;

import com.my.blog.model.table.ArticleTable;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class AdminController {
    public AdminController(){
        System.out.println("init");
    }
    @RequestMapping("/admin/article")
    public String articleList(Model model, HttpServletRequest request, @RequestParam(name = "page", required = false, defaultValue = "1")int page){
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        //通过SessionFactory 获取 Session
        Session session = sessionFactory.openSession();
        int pageSize = 10;
        int offset = (page-1)*pageSize;
        //文章列表
        List articleList = session.createCriteria(ArticleTable.class)
                .add(Restrictions.eq("status",1))
                .setFirstResult(offset)
                .setMaxResults(pageSize)
                .list();
        System.out.println(articleList);
        model.addAttribute("articleList",articleList);
        return "admin/article";
    }

    @RequestMapping("/admin/category")
    public String categoryList(){
        //分类列表
        return "admin/category";
    }


}
