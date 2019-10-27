package com.my.blog.model;

import com.my.blog.model.base.CategoryBase;
import com.my.blog.model.table.CategoryTable;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Category implements CategoryBase {
    public void addCategory(String title) {
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        //通过SessionFactory 获取 Session
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        //查询方式get
        CategoryTable categoryEntity = new CategoryTable();
        categoryEntity.setTitle(title);
        categoryEntity.setIs_del(0);

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String date = df.format(new Date());
        categoryEntity.setTime(date);
        session.save(categoryEntity);
        System.out.println("time:"+new Date().getTime());

        //提交事物
        session.getTransaction().commit();
        //关闭事物
        session.close();
        sessionFactory.close();
    }

    //修改
    public void editCategory(int id,String title){
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        //通过SessionFactory 获取 Session
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        //查询方式get
        CategoryTable categoryEntity = session.get(CategoryTable.class, id);
        System.out.println("empty---------------");
        System.out.println(categoryEntity);

        categoryEntity.setTitle(title);

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String date = df.format(new Date());
        categoryEntity.setTime(date);
        session.update(categoryEntity);

        //提交事物
        session.getTransaction().commit();
        //关闭事物
        session.close();
        sessionFactory.close();
    }

    //删除
    public void delCategory(int id){
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        //通过SessionFactory 获取 Session
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        //查询方式get
        CategoryTable categoryEntity = session.get(CategoryTable.class, id);
        System.out.println("empty---------------");
        System.out.println(categoryEntity);

        categoryEntity.setIs_del(1);
        session.update(categoryEntity);

        //提交事物
        session.getTransaction().commit();
        //关闭事物
        session.close();
        sessionFactory.close();
    }

}
