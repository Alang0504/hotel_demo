package com.example.hotel_demo.entity.Interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURI();
        if (url.indexOf("findRoomByExample")>0||url.indexOf("userOrAdminLogin")>0||url.indexOf("login")>0||url.indexOf("register")>0||url.indexOf("addUserRegister")>0){
            return true;
        }
        HttpSession session = request.getSession();
        String userKey = (String) session.getAttribute("userKey");
        String adminName = (String) session.getAttribute("adminName");
        if (userKey!=null&&userKey!=""){
            return true;
        }
        if (adminName!=null&&adminName!=""){
            return true;
        }
        request.setAttribute("message","请您先进行身份验证登录！");
        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request,response);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
