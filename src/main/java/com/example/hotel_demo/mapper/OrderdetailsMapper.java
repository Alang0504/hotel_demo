package com.example.hotel_demo.mapper;

import com.example.hotel_demo.model.Orderdetails;
import com.example.hotel_demo.model.OrderdetailsExample;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface OrderdetailsMapper {
    int countByExample(OrderdetailsExample example);

    int deleteByExample(OrderdetailsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Orderdetails record);

    int insertSelective(Orderdetails record);

//    根据外键订单Id查询订单详细信息
    @Select("SELECT * FROM orderdetails WHERE orders_id = #{ordersId}")
    List<Orderdetails> selectDetailsByOrderId(Integer ordersId);

    List<Orderdetails> selectByExample(OrderdetailsExample example);

    Orderdetails selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Orderdetails record, @Param("example") OrderdetailsExample example);

    int updateByExample(@Param("record") Orderdetails record, @Param("example") OrderdetailsExample example);

    int updateByPrimaryKeySelective(Orderdetails record);

    int updateByPrimaryKey(Orderdetails record);
}