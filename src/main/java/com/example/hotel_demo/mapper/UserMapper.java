package com.example.hotel_demo.mapper;

import com.example.hotel_demo.model.User;
import com.example.hotel_demo.model.UserExample;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface UserMapper {
    int countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

//    查看昵称是否存在
    @Select("SELECT COUNT(*) FROM USER WHERE username = #{username}")
    int selectUserName(@Param("username") String userName);

//    查看账号是否存在
    @Select("SELECT COUNT(*) FROM USER WHERE userkey = #{userkey}")
    int selectUserKey(@Param("userkey") String userkey);

//    查看身份证号码是否存在
    @Select("SELECT COUNT(*) FROM USER WHERE cid = #{cid}")
    int selectCid(@Param("cid") String cid);

    User selectByPrimaryKey(Integer id);

//    一对多查询某个用户拥有的订单
    @Select("SELECT *,id nodid  FROM USER WHERE id = #{id}")
    @Results({@Result(property = "ordersList",column = "nodid",id = true,many = @Many(select = "com.example.hotel_demo.mapper.OrdersMapper.selectOrdersByUserId"))})
    User selectUserWithOrders(Integer id);

    @Select("SELECT * FROM USER WHERE userkey=#{userkey} AND PASSWORD=#{password}")
    User selectByKeyAndPassword(User user);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}