package com.yx.component;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;

import javax.servlet.ServletContext;

@Component
public class StartupListener implements ApplicationContextAware, ServletContextAware,
        InitializingBean, ApplicationListener<ContextRefreshedEvent> {

    @Value("${report.url}")
    String reportUrl;

    @Value("${sys.name}")
    String sysName;

    @Value("${sys.header.title}")
    String sysHeaderTitle;

    @Value("${sys.title}")
    String sysTitle;

    @Override
    public void setApplicationContext(ApplicationContext ctx) throws BeansException {

    }
 
    @Override
    public void setServletContext(ServletContext context) {
        context.setAttribute("reportUrl",reportUrl);
        context.setAttribute("sysName",sysName);
        context.setAttribute("sysHeaderTitle",sysHeaderTitle);
        context.setAttribute("sysTitle",sysTitle);
    }

    @Override
    public void afterPropertiesSet() throws Exception {

    }
 
    @Override
    public void onApplicationEvent(ContextRefreshedEvent evt) {

    }
}