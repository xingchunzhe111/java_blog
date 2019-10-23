package com.my.blog.controller;

import com.my.blog.model.base.CategoryBase;
import com.my.blog.model.table.ArticleTable;
import com.my.blog.model.table.CategoryTable;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
//前台首页控制器
public class TestController {
    @GetMapping(value = "/test")
    public String index(HttpServletRequest request,@RequestParam(name = "page", required = false, defaultValue = "1")int page){
        //Configuration cfg = new Configuration();
        //cfg.configure("hibernate.cfg.xml");
        //cfg.addAnnotatedClass(ArticleTable.class);

        //顶部栏目
        //获取SessionFactory
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        //通过SessionFactory 获取 Session
        Session session = sessionFactory.openSession();

        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<ArticleTable> criteria = builder.createQuery(ArticleTable.class);

        Root<ArticleTable> employeeRoot = criteria.from(ArticleTable.class);
        criteria.select(employeeRoot);
        criteria.where(builder.equal(employeeRoot.get("article_title"), "nihao"));
        //criteria.orderBy(Order.desc("id"));


        //栏目列表
        //获取SessionFactory
        //SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        ////通过SessionFactory 获取 Session
        //Session session = sessionFactory.openSession();
        //
        //CriteriaBuilder builder = session.getCriteriaBuilder();
        //CriteriaQuery<ArticleTable> criteria = builder.createQuery(ArticleTable.class);
        //
        //Root<ArticleTable> employeeRoot = criteria.from(ArticleTable.class);
        //criteria.select(employeeRoot);
        //criteria.where(builder.equal(employeeRoot.get("article_title"), "nihao"));
        //
        //List<ArticleTable> employeeList = session.createQuery(criteria).getResultList();
        //
        //List list = session.createCriteria(CategoryTable.class)
        //        .add(Restrictions.between("age",new Integer(20),new Integer(30)).list();
        //
        ////分类列表
        //int pageSize = 10;
        //int offset = (page-1)*pageSize;
        //int yes = 0;
        //CategoryTable crit = session.createCriteria(CategoryTable.class).add(Restrictions.eq("title","123"));
        //((Criteria) crit).addOrder(Order.desc("id"));
        //((Criteria) crit).setFirstResult(offset);
        //((Criteria) crit).setFirstResult(pageSize);
        //List list = ((Criteria) crit).list();

        //List cats = session.createCriteria(CategoryTable.class)
        //        .add( Restrictions.like("name", "Fritz%") )
        //        .add( Restrictions.or(
        //                Restrictions.eq( "age", 0 ),
        //                Restrictions.isNull("age")
        //        ) )
        //        .add(Restrictions.eq("is_del",1))
        //        .list();
        //右边的文章分类
        System.out.println(page);
        return "index";
    }

    @RequestMapping("/test/list")
    public String list(){
        return "list";
    }

    @RequestMapping("/test/detail")
    public String detail(){
        return "detail";
    }

    @ResponseBody
    @RequestMapping("/test/get-data")
    public CategoryTable getData(HttpServletRequest request,@RequestParam(name = "id", required = false, defaultValue = "0")int id){
        CategoryTable cate = new CategoryTable();
        cate.setTitle("title");
        cate.setTime("2019-12-02 12:00:11");
        cate.setIs_del(0);

        System.out.println(id);
        return cate;
    }

    @RequestMapping("/test/select")
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
//        CategoryTable categoryEntity2 = session.load(CategoryTable.class, 29);
//        System.out.println("load:id=29的title:" + categoryEntity2.getTitle());



        //提交事物
        session.getTransaction().commit();
//        session.getTransaction().rollback();
        //关闭事物
        session.close();
        sessionFactory.close();
    }
    @ResponseBody
    @RequestMapping("/test/insert")
    public CategoryTable insertData(){
        //获取SessionFactory
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        //通过SessionFactory 获取 Session
        Session session = sessionFactory.openSession();
        //在Session基础上开启一个事务
        session.beginTransaction();

        //查询方式get
        CategoryTable categoryEntity = new CategoryTable();
        categoryEntity.setTitle("插入标题");
        categoryEntity.setIs_del(1);
        categoryEntity.setTime("2019-01-01 00:00:00");
        System.out.println("瞬时状态");
        session.save(categoryEntity);

        //提交事物
        session.getTransaction().commit();
//        session.getTransaction().rollback();
        //关闭事物
        session.close();
        sessionFactory.close();
        return categoryEntity;
    }
    @ResponseBody
    @RequestMapping("/test/update")
    public CategoryTable updateData(){
        //获取SessionFactory
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        //通过SessionFactory 获取 Session
        Session session = sessionFactory.openSession();
        //在Session基础上开启一个事务
        session.beginTransaction();

        //查询方式get
        CategoryTable categoryEntity = session.get(CategoryTable.class, 4);
        System.out.println("get:id=4的time:" + categoryEntity.getTime());

        categoryEntity.setTitle("修改的标题");
        categoryEntity.setIs_del(1);
        categoryEntity.setTime("2019-01-01 00:00:00");
        System.out.println("瞬时状态");
        session.update(categoryEntity);

        //提交事物
        session.getTransaction().commit();
//        session.getTransaction().rollback();
        //关闭事物
        session.close();
        sessionFactory.close();
        return categoryEntity;
    }

    @ResponseBody
    @RequestMapping("/test/del")
    public CategoryTable delData(){
        //获取SessionFactory
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        //通过SessionFactory 获取 Session
        Session session = sessionFactory.openSession();
        //在Session基础上开启一个事务
        session.beginTransaction();

        //查询方式get
        CategoryTable categoryEntity = session.get(CategoryTable.class, 36);
        System.out.println("get:id=36的time:" + categoryEntity.getTime());
        session.delete(categoryEntity);

        //提交事物
        session.getTransaction().commit();
        //session.getTransaction().rollback();
        //关闭事物
        session.close();
        sessionFactory.close();
        return categoryEntity;
    }


}
