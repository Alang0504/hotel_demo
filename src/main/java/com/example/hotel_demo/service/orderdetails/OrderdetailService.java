package com.example.hotel_demo.service.orderdetails;

import com.example.hotel_demo.model.Orderdetails;
import com.example.hotel_demo.model.OrderdetailsExample;

import java.util.List;

public interface OrderdetailService {
//    添加订单明细
    public int insertSelective(Orderdetails orderdetails)throws Exception;

//    根据条件删除
    public  void deleteByExample(OrderdetailsExample example)throws Exception;

//    根据条件查找订单明细信息
    public List<Orderdetails> selectByExample(OrderdetailsExample example);
}
