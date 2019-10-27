package com.my.blog.model;

import org.hibernate.Session;
import org.hibernate.query.Query;

public class User {
    public static Object getFieldValue(Session session, String username){
        //SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        //通过SessionFactory 获取 Session
        Query q = session.createQuery("select t.password from UsersTable t where t.username='"+username+"'");
        return q.uniqueResult();
    }
}
