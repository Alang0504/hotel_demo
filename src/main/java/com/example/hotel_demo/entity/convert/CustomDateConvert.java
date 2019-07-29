package com.example.hotel_demo.entity.convert;

import org.springframework.core.convert.converter.Converter;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CustomDateConvert implements Converter<String, Date> {

    @Override
    public Date convert(String s) {
        try {
            //进行日期转换
            return new SimpleDateFormat("yyyy-MM-dd").parse(s);
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return null;
    }
}
