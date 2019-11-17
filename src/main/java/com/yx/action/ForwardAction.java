package com.yx.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "page")
public class ForwardAction {

    @RequestMapping(value = "{path}")
    public String forward(@PathVariable String path){
        if(path.indexOf(".")>0){
            return path.substring(0,path.indexOf("."));
        }
        return path;
    }
}
