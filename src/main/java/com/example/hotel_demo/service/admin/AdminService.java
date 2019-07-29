package com.example.hotel_demo.service.admin;

import com.example.hotel_demo.model.Admin;

public interface AdminService {
//    管理员登录
    public Admin selectByNameAndPassword(Admin admin)throws Exception;

//    根据Id查看信息
    public Admin selectByPrimaryKey(Integer id)throws Exception;

//    根据Id修改密码
    public  void updateByPrimaryKeySelective(Admin admin)throws Exception;
}
