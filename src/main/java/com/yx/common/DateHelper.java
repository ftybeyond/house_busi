package com.yx.common;

import org.apache.commons.lang.time.DateUtils;

import java.util.Calendar;
import java.util.Date;

public class DateHelper extends DateUtils {

    public static Date firstDayOfYear(){
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_YEAR,1);
        return calendar.getTime();
    }

    public static Date lastDayOfYear(){
        Calendar calendar = Calendar.getInstance();
        calendar.set(calendar.get(Calendar.YEAR),11,31);
        return calendar.getTime();
    }

    public static Date firstDayOfMonth(){
        Calendar calendar = Calendar.getInstance();
        calendar.set(calendar.DAY_OF_MONTH,1);
        return calendar.getTime();
    }

    public static Date lastDayOfMonth(){
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_MONTH,calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
        return calendar.getTime();
    }

}
