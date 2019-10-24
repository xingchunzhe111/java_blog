package com.my.blog.controller;

import com.my.blog.model.table.ArticleTable;
import com.my.blog.model.table.CategoryTable;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

import java.util.List;

import static java.lang.Math.ceil;

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
            //当前页
            //计算总数

            Query query = session.createQuery("select count(*) from ArticleTable ");
            Long count = (Long) query.getSingleResult();

            int l = (int) (count/pageSize);
            int maxPage = l==0 ? 1 : l+1;

            model.addAttribute("catList", catList);
            model.addAttribute("articleList", articleList);
            model.addAttribute("count", count);
            model.addAttribute("page", page);
            model.addAttribute("maxPage", maxPage);


            System.out.println("offset:"+offset);
            System.out.println("pageSize:"+pageSize);
            System.out.println("count:"+count);
            System.out.println("maxPage:"+maxPage);
            System.out.println("page:"+page);
            //System.out.println(catList);
            //System.out.println(articleList);
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
