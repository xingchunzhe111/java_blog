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

    @ResponseBody
    @RequestMapping("/get-data")
    public CategoryTable getData(HttpServletRequest request,@RequestParam(name = "id", required = false, defaultValue = "0")int id){
        CategoryTable cate = new CategoryTable();
        cate.setId(1);
        cate.setTime("title");
        cate.setTime("2019-12-02 12:00:11");

        System.out.println(id);
        return cate;
    }

    @RequestMapping("/select")
    public void selectData(){
        //获取SessionFactory
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        //通过SessionFactory 获取 Session
        Session session = sessionFactory.openSession();
        //在Session基础上开启一个事务
        session.beginTransaction();

        //查询方式get
        CategoryTable categoryEntity = session.get(CategoryTable.class, 4);
        System.out.println("get:id=4的title:" + categoryEntity.getTitle());

        //查询方式load
        CategoryTable categoryEntity2 = session.load(CategoryTable.class, 29);
        System.out.println("load:id=29的title:" + categoryEntity2.getTitle());

        //提交事物
        session.getTransaction().commit();
//        session.getTransaction().rollback();
        //关闭事物
        session.close();
        sessionFactory.close();
    }

}
