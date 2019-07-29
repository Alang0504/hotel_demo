package com.example.hotel_demo.service.user;

import com.example.hotel_demo.model.User;

public interface UserService {
//    用户注册
    public void insertSelective(User user)throws Exception;
//    用户登录
    public User selectByKeyAndPassword(User user)throws Exception;
//    查看个人订单
    public User selectUserWithOrders(Integer id)throws Exception;
//    查看昵称是否存在
    public int selectUserName(String userName)throws Exception;
//    查看账号是否存在
    public int selectUserKey(String userKey)throws Exception;
//    查看身份证是否注册过
    public int selectCid(String cid)throws Exception;
//    根据Id查看个人信息
    public User selectByPrimaryKey(Integer id)throws Exception;
//    修改个人信息,密码
    public void updateByPrimaryKeySelective(User user)throws Exception;
}

