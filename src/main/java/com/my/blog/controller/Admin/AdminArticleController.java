package com.my.blog.controller.Admin;

import com.my.blog.common.Resp.RetResponse;
import com.my.blog.common.Resp.RetResult;
import com.my.blog.model.Article;
import com.my.blog.model.bean.ArticleTable;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AdminArticleController {
    public AdminArticleController(){
        System.out.println("init-article");
    }


    @RequestMapping("/admin/article/list")
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
                .addOrder(Order.desc("id"))
                .list();
        System.out.println(articleList);
        model.addAttribute("articleList",articleList);
        return "admin/article/list";
    }
    //文章详情
    @ResponseBody
    @RequestMapping("/admin/article/detail")
    public RetResult articleArticleDetail(Model model, HttpServletRequest request, @RequestParam(name = "id",defaultValue = "0")int id){
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        //通过SessionFactory 获取 Session
        Session session = sessionFactory.openSession();
        if(id==0){
            return RetResponse.makeRsp(123,"缺少参数");
        }
        //文章列表
        ArticleTable article = session.get(ArticleTable.class,id);

        Map<String,Object> map=new HashMap<>();
        map.put("article", article);
        return RetResponse.makeRsp(0,"0",map);
    }

    //添加文章
    @ResponseBody
    @RequestMapping("/admin/article/add-article")
    public RetResult addArticle(HttpServletRequest request){
        //标题
        String article_title = request.getParameter("article_title");
        if(StringUtils.isEmpty(article_title)){
            return RetResponse.makeRsp(123,"标题必须填写");
        }
        //描述
        String article_desc = request.getParameter("article_desc");
        if(StringUtils.isEmpty(article_desc)){
            return RetResponse.makeRsp(123,"描述必须填写");
        }
        //描述内容
        String article_content = request.getParameter("article_content");
        if(StringUtils.isEmpty(article_content)){
            return RetResponse.makeRsp(123,"内容必须填写");
        }
        Article Article = new Article();
        Article.addArticle(article_title,article_desc,article_content);
        return RetResponse.makeRsp(0,"ok");
    }
    //添加文章
    @ResponseBody
    @RequestMapping("/admin/article/edit-article")
    public RetResult editArticle(HttpServletRequest request,@RequestParam(name = "id",  defaultValue = "0")int id){
        if(id==0){
            return RetResponse.makeRsp(123,"缺少必要参数");
        }
        //标题
        String article_title = request.getParameter("article_title");
        if(StringUtils.isEmpty(article_title)){
            return RetResponse.makeRsp(123,"标题必须填写");
        }
        //描述
        String article_desc = request.getParameter("article_desc");
        if(StringUtils.isEmpty(article_desc)){
            return RetResponse.makeRsp(123,"描述必须填写");
        }
        //内容
        String article_content = request.getParameter("article_content");
        if(StringUtils.isEmpty(article_content)){
            return RetResponse.makeRsp(123,"内容必须填写");
        }
        Article Article = new Article();
        Article.editArticle(id,article_title,article_desc,article_content);
        return RetResponse.makeRsp(0,"ok");
    }

    //删除接口
    @ResponseBody
    @RequestMapping("/admin/article/del-article")
    public RetResult delArticle(HttpServletRequest request,@RequestParam(name = "id",  defaultValue = "0")int id){
        if(id==0){
            return RetResponse.makeRsp(123,"缺少必要参数");
        }
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        //通过SessionFactory 获取 Session
        Session session = sessionFactory.openSession();
        //在Session基础上开启一个事务
        session.beginTransaction();

        //查询方式get
        ArticleTable articleEntity = session.get(ArticleTable.class, id);
        //System.out.println("get:id=36的time:" + articleEntity.getTime());
        session.delete(articleEntity);

        //提交事物
        session.getTransaction().commit();
        return RetResponse.makeRsp(0,"ok");
    }



}
