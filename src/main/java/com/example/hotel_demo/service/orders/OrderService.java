package com.example.hotel_demo.service.orders;

import com.example.hotel_demo.model.Orders;
import com.example.hotel_demo.model.OrdersExample;
import com.example.hotel_demo.model.Season;

import java.util.List;

public interface OrderService {

//    添加订单,返回订单Id
    public int insertBackId(Orders orders)throws Exception;

//    查看订单明细
    public Orders selectOrderWithDetails(Integer id)throws Exception;

//    根据条件更新不为空的字段
    public int updateByExampleSelective(Orders orders, OrdersExample example)throws Exception;

//    日营业额统计
    public String selectSumFinance(String status,String createtime)throws Exception;

//    根据条件查询订单
    public List<Orders> selectByExample(OrdersExample example)throws Exception;

//    查看已使用的订单
    public List<Orders> selectAll(String status,String createtime)throws Exception;

//    根据Id查询订单
    public Orders selectByPrimaryKey(Integer id)throws Exception;

//    查询季度营业额
    public String selectFinanceBySeason(Season season)throws Exception;

//    查询季度订单
    public List<Orders> selectAllBySeason(Season season)throws Exception;
}

