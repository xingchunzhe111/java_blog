package com.my.blog.controller;

import com.my.blog.model.table.ArticleTable;
import com.my.blog.model.table.CategoryTable;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
@Controller
//前台首页控制器
public class IndexController {
    @GetMapping(value = "/")
    public String index(@RequestParam(name = "page", required = false, defaultValue = "1")int page,Model model){
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

            //热门文章
            List hotList = session.createCriteria(ArticleTable.class)
                    .add(Restrictions.eq("is_hot",1))
                    .setMaxResults(5)
                    .list();

            //浏览数倒序
            List viewList = session.createCriteria(ArticleTable.class)
                    .addOrder(Order.desc("views_count"))
                    .setMaxResults(5)
                    .list();

            //最新文章倒序
            List updateList = session.createCriteria(ArticleTable.class)
                    .addOrder(Order.desc("created_at"))
                    .setMaxResults(5)
                    .list();

            model.addAttribute("catList", catList);
            model.addAttribute("articleList", articleList);
            model.addAttribute("hotList", hotList);
            model.addAttribute("viewList", viewList);
            model.addAttribute("updateList", updateList);
            model.addAttribute("count", count);
            model.addAttribute("page", page);
            model.addAttribute("maxPage", maxPage);
            //System.out.println(catList);
            //System.out.println(articleList);
        }finally {
            session.close();
        }
        return "index";
    }

    //栏目ID
    @RequestMapping("/list/{cid}")
    public String list(HttpServletRequest request, Model model, @RequestParam(name = "page", required = false, defaultValue = "1")int page, @PathVariable("cid") int cid){
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        //通过SessionFactory 获取 Session
        Session session = sessionFactory.openSession();
        try{
            List catList = session.createCriteria(CategoryTable.class)
                    .add(Restrictions.eq("is_del",0))
                    .list();

            //查某一个栏目下面的所有文章
            int pageSize = 10;
            int offset = (page-1)*pageSize;
            if(cid==0){
                model.addAttribute("errMsg", "缺少参数");
                return "common/error";
            }
            List articleList = session.createCriteria(ArticleTable.class)
                    .add(Restrictions.eq("cid",cid))
                    .setFirstResult(offset)
                    .setMaxResults(pageSize)
                    .list();

            Query query = session.createQuery("select count(*) from ArticleTable where cid ="+Integer.toString(cid)+"");
            Long  count = (Long) query.getSingleResult();

            int l = (int) (count/pageSize);
            int maxPage = l==0 ? 1 : l+1;

            model.addAttribute("catList", catList);
            model.addAttribute("articleList", articleList);
            model.addAttribute("maxPage", maxPage);
            model.addAttribute("page", page);
            model.addAttribute("count", count);
        }finally {
            session.close();
        }
        return "list";
    }

    @RequestMapping("/list/detail/{id}")
    public String detail(Model model, @PathVariable("id") int id){
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        //通过SessionFactory 获取 Session
        Session session = sessionFactory.openSession();
        try{
            List catList = session.createCriteria(CategoryTable.class)
                    .add(Restrictions.eq("is_del",0))
                    .list();
            if(id==0){
                model.addAttribute("errMsg", "缺少参数");
                return "common/error";
            }
            ArticleTable article = session.get(ArticleTable.class,id);
            model.addAttribute("article", article);
            model.addAttribute("catList", catList);
            System.out.println(article);
            //<fmt:formatDate value="${dateValue}" pattern="yyyy年MM月dd日 HH:mm"/>
        }finally {
            session.close();
            System.out.println("end----------------!!!!!!!!");
        }
        return "detail";
    }

    @RequestMapping("/search")
    public String search(HttpServletRequest request, Model model, @RequestParam(name = "title", required = false, defaultValue = "1")int page){
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        //通过SessionFactory 获取 Session
        Session session = sessionFactory.openSession();
        try{
            List catList = session.createCriteria(CategoryTable.class)
                    .add(Restrictions.eq("is_del",0))
                    .list();

            String title = request.getParameter("title");
            System.out.println("title:"+title);

            //查某一个栏目下面的所有文章
            int pageSize = 10;
            int offset = (page-1)*pageSize;

            //String title = "";
            if(title.equals("")){
                model.addAttribute("errMsg", "缺少参数");
                return "common/error";
            }

            List articleList = session.createCriteria(ArticleTable.class)
                    .add(Restrictions.like("article_title",title))
                    .setFirstResult(offset)
                    .setMaxResults(pageSize)
                    .list();

            Query query = session.createQuery("select count(*) from ArticleTable where article_title like '%"+title+"%' ");
            Long  count = (Long) query.getSingleResult();

            int l = (int) (count/pageSize);
            int maxPage = l==0 ? 1 : l+1;

            model.addAttribute("catList", catList);
            model.addAttribute("articleList", articleList);
            model.addAttribute("maxPage", maxPage);
            model.addAttribute("page", page);
            model.addAttribute("count", count);
        }finally {
            session.close();
        }
        return "search";
    }



}
