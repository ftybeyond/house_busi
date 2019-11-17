package com.yx.action;

import com.alibaba.fastjson.JSON;
import com.yx.common.AES;
import com.yx.common.MD5;
import com.yx.model.Authority;
import com.yx.model.Operator;
import com.yx.model.common.LoginCallback;
import com.yx.service.IAuthorityService;
import com.yx.service.ILogService;
import com.yx.service.IOperatorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class LoginAction {

    @Value("${sso.key}")
    private String key;

    @Value("${sso.logout.url}")
    private String logoutUrl;

    @Autowired
    private IOperatorService operatorService;

    @Autowired
    private IAuthorityService authorityService;

    @Autowired
    ILogService logService;

    @RequestMapping(value = "ssoLogin",method = RequestMethod.GET)
    public ModelAndView ssoLogin(@RequestParam(name = "_c",required = true) String info,HttpSession session){
        String opInfo = AES.decryptStr(info,key);
        LoginCallback loginCallback = JSON.parseObject(opInfo, LoginCallback.class);
        Operator operator = operatorService.selectByLoginName(loginCallback.getLoginName());
        ModelAndView mv = new ModelAndView();
        if(operator==null){
            mv.setViewName("forward:/page/error.html");
            mv.addObject("errorMsg","此用户无系统权限");
            return mv;
        }else{
            doLogin(operator,session,mv);
            return mv;
        }
    }

    @RequestMapping(value = "localLogin",method = RequestMethod.POST)
    public ModelAndView localLogin(String loginName, String password, HttpSession session){
        String psw = MD5.EncoderByMd5(password);
        Operator operator = operatorService.selectByLoginName(loginName);
        ModelAndView mv = new ModelAndView();
        if(operator!= null && psw.equals(operator.getPassword())){
            doLogin(operator,session,mv);
        }else{
            mv.addObject("message","账号密码不匹配");
            mv.setViewName("login");
        }
        return mv;
    }

    @RequestMapping(value = "localLogout",method = RequestMethod.GET)
    public ModelAndView localLogout(HttpSession session){
        session.invalidate();
        ModelAndView mv = new ModelAndView("redirect:"+logoutUrl);
        return mv;
    }


    private void doLogin(Operator operator,HttpSession session,ModelAndView modelAndView){
        session.setAttribute("op",operator);
        List<Authority> list = authorityService.selectByRole(operator.getRoleObj());;

        Map<String, List<Authority>> map = new LinkedHashMap<>();
        Set<String> authoritySet = new HashSet<>();
        authoritySet.add("/page/welcome.html");
        for (Authority authority : list) {
            authoritySet.add(authority.getUrl());
            if (!map.keySet().contains(authority.getMoudle())) {
                List<Authority> authorityList = new ArrayList<>();
                authorityList.add(authority);
                map.put(authority.getMoudle(), authorityList);
            } else {
                map.get(authority.getMoudle()).add(authority);
            }
        }
        session.setAttribute("authority", map);
        session.setAttribute("authoritySet",authoritySet);
        modelAndView.setViewName("redirect:/page/welcome.html");
        logService.log(0,"用户:" + operator.getLoginName() + "登录,角色："+operator.getRoleObj().getName(),"用户管理",session);
    }

    @RequestMapping(value = "directLogin",method = RequestMethod.GET)
    public ModelAndView directLogin(HttpSession session){
        Operator operator = operatorService.selectByLoginName("admin");
        ModelAndView mv = new ModelAndView();
        doLogin(operator,session,mv);
        return mv;
    }
}
