package com.example.hotel_demo.service.admin.Impl;

import com.example.hotel_demo.mapper.AdminMapper;
import com.example.hotel_demo.model.Admin;
import com.example.hotel_demo.service.admin.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    //    管理员登录
    @Override
    public Admin selectByNameAndPassword(Admin admin) throws Exception {
        return adminMapper.selectByNameAndPassword(admin);
    }

    //    根据Id查看信息
    @Override
    public Admin selectByPrimaryKey(Integer id) throws Exception {
        return adminMapper.selectByPrimaryKey(id);
    }

    //    修改密码
    @Override
    public void updateByPrimaryKeySelective(Admin admin)throws Exception {
        adminMapper.updateByPrimaryKeySelective(admin);
    }
}
