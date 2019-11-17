package com.yx.interceptor;

import com.yx.model.Operator;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Set;

public class LoginInterceptor implements HandlerInterceptor {

    @Value("${sso.login.url}")
    String loginUrl;

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        Operator user = (Operator) httpServletRequest.getSession().getAttribute("op");
        Set authoritySet = (Set) httpServletRequest.getSession().getAttribute("authoritySet");
        if(user!=null&&authoritySet.contains(httpServletRequest.getServletPath())){
            return true;
        }
        httpServletResponse.sendRedirect(loginUrl);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
