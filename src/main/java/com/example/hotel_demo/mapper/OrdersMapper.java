package com.example.hotel_demo.mapper;

import com.example.hotel_demo.model.Orders;
import com.example.hotel_demo.model.OrdersExample;
import com.example.hotel_demo.model.Season;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface OrdersMapper {
    int countByExample(OrdersExample example);

    int deleteByExample(OrdersExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Orders record);

    int insertSelective(Orders record);

    List<Orders> selectByExample(OrdersExample example);

//    查看已使用的订单
    @Select("<script>SELECT * FROM orders WHERE STATUS=#{status}<if test='createtime!=null'>AND createtime LIKE #{createtime}</if></script>")
    List<Orders> selectAll(@Param("status") String status,@Param("createtime") String createtime);

//    统计日营业额
    @Select("<script>SELECT SUM(order_price) AS sumprice FROM orders WHERE STATUS=#{status} <if test='createtime!=null'>AND createtime LIKE #{createtime}</if></script>")
    String selectSumFinance(@Param("status") String status,@Param("createtime") String createtime);

//    统计季度营业额,一年分为四个季度
    @Select("SELECT SUM(order_price) AS sumprice FROM orders WHERE STATUS=#{status} AND (createtime LIKE #{oneCreatetime} OR createtime LIKE #{twoCreatetime} OR createtime LIKE #{threeCreatetime})")
    String selectFinanceBySeason(Season season);

//    统计季度订单,一年分为四个季度
    @Select("SELECT * FROM orders WHERE STATUS=#{status} AND (createtime LIKE #{oneCreatetime} OR createtime LIKE #{twoCreatetime} OR createtime LIKE #{threeCreatetime})")
    List<Orders> selectAllBySeason(Season season);

    Orders selectByPrimaryKey(Integer id);

        //    根据外键用户Id查询表信息
    @Select("SELECT * FROM orders WHERE user_id = #{userId}")
    List<Orders> selectOrdersByUserId(Integer userId);

//    返回自增主键
    @Insert("INSERT INTO orders(user_id,number,createtime,order_price,STATUS,note) VALUES(#{userId},#{number},#{createtime},#{orderPrice},#{status},#{note})")
    @Options(useGeneratedKeys = true,keyProperty = "id")
    int insertBackId(Orders orders);

    //    查询一个订单的多有明细，一对多
    @Select("SELECT *,id nodid FROM orders WHERE id = #{id}")
    @Results({@Result(property ="orderdetailsList" ,column ="nodid",id = true,many = @Many(select = "com.example.hotel_demo.mapper.OrderdetailsMapper.selectDetailsByOrderId"))})
    Orders selectOrderWithDetails(Integer id);

    int updateByExampleSelective(@Param("record") Orders record, @Param("example") OrdersExample example);

    int updateByExample(@Param("record") Orders record, @Param("example") OrdersExample example);

    int updateByPrimaryKeySelective(Orders record);

    int updateByPrimaryKey(Orders record);
}