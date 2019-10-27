package com.my.blog.controller.Admin;

import com.my.blog.common.Resp.RetResponse;
import com.my.blog.common.Resp.RetResult;
import com.my.blog.controller.AdminController;
import com.my.blog.model.Article;
import com.my.blog.model.Category;
import com.my.blog.model.table.ArticleTable;
import com.my.blog.model.table.CategoryTable;
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
public class AdminCategoryController{
    public AdminCategoryController(){
        System.out.println("init-category");
    }


    @RequestMapping("/admin/category/list")
    public String list(Model model, HttpServletRequest request, @RequestParam(name = "page", required = false, defaultValue = "1")int page){
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        //通过SessionFactory 获取 Session
        Session session = sessionFactory.openSession();
        int pageSize = 10;
        int offset = (page-1)*pageSize;
        //文章列表
        List categoryList = session.createCriteria(CategoryTable.class)
                .add(Restrictions.eq("is_del",0))
                .setFirstResult(offset)
                .setMaxResults(pageSize)
                .addOrder(Order.desc("id"))
                .list();
        System.out.println(categoryList);
        model.addAttribute("categoryList",categoryList);
        return "admin/category/list";
    }
    //文章详情
    @ResponseBody
    @RequestMapping("/admin/category/detail")
    public RetResult detail(HttpServletRequest request, @RequestParam(name = "id",defaultValue = "0")int id){
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        //通过SessionFactory 获取 Session
        Session session = sessionFactory.openSession();
        if(id==0){
            return RetResponse.makeRsp(123,"缺少参数");
        }
        //文章列表
        CategoryTable category = session.get(CategoryTable.class,id);

        Map<String,Object> map=new HashMap<>();
        map.put("category", category);
        return RetResponse.makeRsp(0,"0",map);
    }

    //添加文章
    @ResponseBody
    @RequestMapping("/admin/category/add-category")
    public RetResult addCategory(HttpServletRequest request){
        //标题
        String title = request.getParameter("title");
        if(StringUtils.isEmpty(title)){
            return RetResponse.makeRsp(123,"标题必须填写");
        }
        Category Category = new Category();
        Category.addCategory(title);
        return RetResponse.makeRsp(0,"ok");
    }
    //修改文章
    @ResponseBody
    @RequestMapping("/admin/category/edit-category")
    public RetResult editCategory(HttpServletRequest request,@RequestParam(name = "id",  defaultValue = "0")int id){
        if(id==0){
            return RetResponse.makeRsp(123,"缺少必要参数");
        }
        //标题
        String title = request.getParameter("title");
        if(StringUtils.isEmpty(title)){
            return RetResponse.makeRsp(123,"标题必须填写");
        }
        Category Category = new Category();
        Category.editCategory(id,title);
        return RetResponse.makeRsp(0,"ok");
    }

    //删除接口
    @ResponseBody
    @RequestMapping("/admin/category/del-category")
    public RetResult delCategory(HttpServletRequest request,@RequestParam(name = "id",  defaultValue = "0")int id){
        if(id==0){
            return RetResponse.makeRsp(123,"缺少必要参数");
        }
        Category category = new Category();
        category.delCategory(id);
        return RetResponse.makeRsp(0,"ok");
    }



}
