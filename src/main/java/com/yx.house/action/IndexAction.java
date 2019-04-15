package com.yx.house.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexAction {

    @RequestMapping(value = "index")
    public String index(){
        return "welcome";
    }
}