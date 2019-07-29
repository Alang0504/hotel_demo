package com.example.hotel_demo.entity;

import com.example.hotel_demo.entity.Interceptor.LoginInterceptor;
import com.example.hotel_demo.entity.convert.CustomDateConvert;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

//    视图链接
    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/leftAdmin").setViewName("/leftAdmin");
        registry.addViewController("/rightAdmin").setViewName("/rightAdmin");
        registry.addViewController("/adminPage").setViewName("/adminPage");
        registry.addViewController("/login").setViewName("/login");
        registry.addViewController("/register").setViewName("/register");
        registry.addViewController("/leftUser").setViewName("/leftUser");
        registry.addViewController("/rightUser").setViewName("/rightUser");
        registry.addViewController("/userPage").setViewName("/userPage");
        registry.addViewController("/editUserPassword").setViewName("/editUserPassword");
        registry.addViewController("/addRoomPage").setViewName("/addRoomPage");
        registry.addViewController("/editAdminPassword").setViewName("/editAdminPassword");
        registry.addViewController("/addStaff").setViewName("/addStaff");
        registry.addViewController("/topAdmin").setViewName("/topAdmin");
        registry.addViewController("/bottomAdmin").setViewName("/bottomAdmin");
    }

//    配置静态资源
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry.addResourceHandler("/images/**").addResourceLocations("classpath:/static/images");
        registry.addResourceHandler("/static/images/**").addResourceLocations("file:E:/IDEA/hotel_demo/src/main/resources/static/images/");
        registry.addResourceHandler("/css/**").addResourceLocations("file:E:/IDEA/hotel_demo/src/main/resources/static/css/");
    }

    //    注册拦截器Bean
    @Bean
    public LoginInterceptor loginInterceptor(){
        return new LoginInterceptor();
    }

//    注册拦截器
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(loginInterceptor()).addPathPatterns("/**");
    }

//    注册日期转换器Bean
    @Bean
    public CustomDateConvert customDateConvert(){
        return new CustomDateConvert();
    }

//    注册日期转换器
    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(customDateConvert());
    }
}
