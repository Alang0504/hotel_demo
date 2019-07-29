package com.example.hotel_demo.service.user.impl;

import com.example.hotel_demo.mapper.UserMapper;
import com.example.hotel_demo.model.User;
import com.example.hotel_demo.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

//    用户注册
    @Override
    public void insertSelective(User user) throws Exception {
        userMapper.insertSelective(user);
    }
//    用户登录
    @Override
    public User selectByKeyAndPassword(User user)throws Exception {
        return userMapper.selectByKeyAndPassword(user);
    }

    //    查看个人订单
    @Override
    public User selectUserWithOrders(Integer id) throws Exception {
        return userMapper.selectUserWithOrders(id);
    }

    //    查看昵称是否存在
    @Override
    public int selectUserName(String userName) throws Exception {
        return userMapper.selectUserName(userName);
    }

    //    查看账号是否存在
    @Override
    public int selectUserKey(String userKey) throws Exception {
        return userMapper.selectUserKey(userKey);
    }

    //    查看身份证是否注册过
    @Override
    public int selectCid(String cid) throws Exception {
        return userMapper.selectCid(cid);
    }

    //    查看个人信息
    @Override
    public User selectByPrimaryKey(Integer id)throws Exception {
        return userMapper.selectByPrimaryKey(id);
    }

    //    修改个人信息,密码
    @Override
    public void updateByPrimaryKeySelective(User user) throws Exception {
        userMapper.updateByPrimaryKeySelective(user);
    }
}
