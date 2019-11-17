package com.yx.action;

import com.yx.model.Accessory;
import com.yx.service.IAccessoryService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;

@Controller
@RequestMapping(value = "download")
public class DownloadAction {

    @Autowired
    IAccessoryService accessoryService;

    @RequestMapping(value = "accessory")
    public void accessory(HttpServletRequest request, HttpServletResponse response,Integer id) throws IOException {
        Accessory accessory = accessoryService.loadFile(id);
        if (accessory!=null) {
            try (OutputStream outputStream = getOutputStream(request,response,accessory.getOriginalName());
                 ByteArrayInputStream inputStream = new ByteArrayInputStream(accessory.getContent())){
                byte[] buffer = new byte[1024];
                int len;
                while((len = inputStream.read(buffer))!=-1){
                    outputStream.write(buffer,0,len);
                }
            }
        }
    }

    private OutputStream getOutputStream(HttpServletRequest request, HttpServletResponse response, String filename) {
        try {
            final String userAgent = request.getHeader("USER-AGENT");
            if (StringUtils.contains(userAgent, "MSIE")) {//IE浏览器
                filename = URLEncoder.encode(filename, "UTF-8");
            } else if (StringUtils.contains(userAgent, "Mozilla")) {//google,火狐浏览器
                filename = new String(filename.getBytes(), "ISO8859-1");
            } else {
                filename = URLEncoder.encode(filename, "UTF-8");//其他浏览器
            }
            response.addHeader("Content-Disposition", "attachment;filename="
                    + filename);
            return response.getOutputStream();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
