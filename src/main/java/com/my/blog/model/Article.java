package com.my.blog.model;

import com.my.blog.model.base.ArticleBase;
import com.my.blog.model.table.ArticleTable;
import com.my.blog.model.table.CategoryTable;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Article implements ArticleBase {
    //@Override
    public void addArticle(String article_title,String article_desc,String article_content) {
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        //通过SessionFactory 获取 Session
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        //查询方式get
        ArticleTable articleEntity = new ArticleTable();
        articleEntity.setArticle_title(article_title);
        articleEntity.setArticle_desc(article_desc);
        articleEntity.setArticle_content(article_content);
        articleEntity.setStatus(1);
        session.save(articleEntity);

        //提交事物
        session.getTransaction().commit();
        //关闭事物
        session.close();
        sessionFactory.close();
    }

    //修改
    public void editArticle(int id,String article_title,String article_desc,String article_content){
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        //通过SessionFactory 获取 Session
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        //查询方式get
        ArticleTable articleEntity = session.get(ArticleTable.class, id);
        System.out.println("empty---------------");
        System.out.println(articleEntity);
        //System.out.println("get:id=4的time:" + articleEntity.getTime());

        articleEntity.setArticle_title(article_title);
        articleEntity.setArticle_desc(article_desc);
        articleEntity.setArticle_content(article_content);
        System.out.println("瞬时状态");
        session.update(articleEntity);

        //提交事物
        session.getTransaction().commit();
        //关闭事物
        session.close();
        sessionFactory.close();
    }
}
