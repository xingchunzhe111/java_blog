package com.my.blog.controller;

import com.my.blog.common.Resp.RetResponse;
import com.my.blog.common.Resp.RetResult;
import com.my.blog.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
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
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        //通过SessionFactory 获取 Session
        Session session = sessionFactory.openSession();
        try{
            //验证用户名和密码
            String password = request.getParameter("password");
            if(StringUtils.isEmpty(password)){
                return RetResponse.makeErrRsp("请填写密码");
            }
            String username = request.getParameter("username");
            if(StringUtils.isEmpty(username)){
                return RetResponse.makeErrRsp("错误的，必须填写用户名");
            }
            Object o = User.getFieldValue(session,username);
            if(StringUtils.isEmpty(o)){
                System.out.println("jinrul");
                return RetResponse.makeErrRsp("未发现该用户名");
            }

            String md5Password = DigestUtils.md5DigestAsHex(password.getBytes());
            if(!md5Password.equals(o)){
                return RetResponse.makeRsp(123,"密码错误");
            }
            //登录处理
            HttpSession sessionReq = request.getSession();
            sessionReq.setAttribute("uid", 1);

            Map<String,String> map=new HashMap<>();
            map.put("url", "/admin/index");
            return RetResponse.makeRsp(0,"ok",map);
        }catch (Exception e){
            return RetResponse.makeRsp(123,"错误请求:"+e.getMessage());
        }finally {
            System.out.println("关闭session");
            session.close();
            sessionFactory.close();
        }
    }

    @ResponseBody
    @RequestMapping("/login/logout")
    public RetResult logout(HttpServletRequest request){
        try{
            HttpSession session = request.getSession();

            // 将用户信息从session中删除
            session.removeAttribute("uid");
            Object uid = session.getAttribute("uid");
            if (uid != null) {
                return RetResponse.makeRsp(123,"登出失败");
            }
            return RetResponse.makeRsp(0,"ok");
        }catch (Exception e){
            return RetResponse.makeRsp(123,"错误请求:"+e.getMessage());
        }
    }


}
