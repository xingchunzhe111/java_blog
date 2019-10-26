package com.my.blog.controller;

import com.my.blog.common.Resp.RetResponse;
import com.my.blog.common.Resp.RetResult;
import com.my.blog.model.table.ArticleTable;
import com.my.blog.model.table.CategoryTable;
import com.my.blog.model.table.UsersTable;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


//登录注册相关页面
@Controller
public class LoginController {
    @RequestMapping("/login/index")
    public String index(){
        return "login/index";
    }

    @ResponseBody
    @RequestMapping("/login/do-login")
    public RetResult doLogin(HttpServletRequest request){
        try{
            SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
            //通过SessionFactory 获取 Session
            Session session = sessionFactory.openSession();

            //验证用户名和密码
            String password = request.getParameter("password");
            if(StringUtils.isEmpty(password)){
                return RetResponse.makeErrRsp("请填写密码");
            }
            String username = request.getParameter("username");
            if(StringUtils.isEmpty(username)){
                return RetResponse.makeErrRsp("错误的，必须填写用户名");
            }
            Query  q = session.createQuery("select t.password from UsersTable t where t.username='"+username+"'");
            Object o = q.uniqueResult();
            if(StringUtils.isEmpty(o)){
                System.out.println("jinrul");
                return RetResponse.makeErrRsp("未发现该用户名");
            }

            String md5Password = DigestUtils.md5DigestAsHex(password.getBytes());
            if(!md5Password.equals(o)){
                session.close();
                return RetResponse.makeRsp(123,"密码错误");
            }

            Map<String,String> map=new HashMap<>();
            map.put("url", "/admin/article");
            session.close();
            return RetResponse.makeRsp(0,"ok",map);
        }catch (Exception e){
            //System.out.println("eeeeeeeeeeeeeeeeeeeeeeee");
            //System.out.println(e);
            return RetResponse.makeRsp(123,"错误请求:"+e.getMessage()+"---"+e.getLocalizedMessage());
        }
    }
}
