package com.my.blog.Interceptor;

import com.sun.istack.Nullable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        System.out.println("==========登录状态拦截");

        HttpSession session = request.getSession();
        System.out.println("sessionId为：" + session.getId());

        // 获取用户信息，如果没有用户信息直接返回提示信息

        Object uid = session.getAttribute("uid");
        System.out.println("ssssssss：" +uid);
        if (uid == null) {
            System.out.println("没有登录");
            //response.getWriter().write("Please Login In");
            response.sendRedirect(request.getContextPath()+"/login/index");
            return false;
        } else {
            System.out.println("已经登录过啦，用户信息为：" + session.getAttribute("uid"));
        }
        return true;
    }
    /** -
     * 生成视图之前执行，可以修改ModelAndView
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable ModelAndView modelAndView) throws Exception {
    }
    /**
     * 生成视图时执行，可以用来处理异常，并记录在日志中
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable Exception ex) throws Exception {
    }

}