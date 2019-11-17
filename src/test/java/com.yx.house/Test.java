package com.yx.house;

import com.yx.common.MD5;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Test {

    public static void main(String[] args) {
//        String s = "asdfdoc";
//        System.out.println(s.split("\\.").length);
//        System.out.println(s.substring(0,s.indexOf(".")));

//        Calendar calendar = Calendar.getInstance();
//        calendar.set(2018,9,31);
//        calendar.add(Calendar.MONTH,0);
//        System.out.println(new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime()));

        System.out.println(MD5.EncoderByMd5("123456"));
    }
}
