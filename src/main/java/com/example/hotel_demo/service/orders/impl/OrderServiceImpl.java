package com.example.hotel_demo.service.orders.impl;

import com.example.hotel_demo.mapper.OrdersMapper;
import com.example.hotel_demo.model.Orders;
import com.example.hotel_demo.model.OrdersExample;
import com.example.hotel_demo.model.Season;
import com.example.hotel_demo.service.orders.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrdersMapper ordersMapper;

    //    添加订单,返回订单Id
    @Override
    public int insertBackId(Orders orders) throws Exception {
        return ordersMapper.insertBackId(orders);
    }

    //    查看订单明细
    @Override
    public Orders selectOrderWithDetails(Integer id) throws Exception {
        return ordersMapper.selectOrderWithDetails(id);
    }

    //    根据条件更新不为空的字段
    @Override
    public int updateByExampleSelective(Orders orders, OrdersExample example) throws Exception {
        return ordersMapper.updateByExampleSelective(orders,example);
    }

    //    营业额统计
    @Override
    public String selectSumFinance(String status,String createtime) throws Exception {
        return ordersMapper.selectSumFinance(status,createtime);
    }

    //    根据条件查询订单
    @Override
    public List<Orders> selectByExample(OrdersExample example) throws Exception {
        return ordersMapper.selectByExample(example);
    }

    //    查看已使用的订单
    @Override
    public List<Orders> selectAll(String status,String createtime) throws Exception {
        return ordersMapper.selectAll(status,createtime);
    }

    //    根据Id查询订单
    @Override
    public Orders selectByPrimaryKey(Integer id) throws Exception {
        return ordersMapper.selectByPrimaryKey(id);
    }

    //    查询季度营业额
    @Override
    public String selectFinanceBySeason(Season season) throws Exception {
        return ordersMapper.selectFinanceBySeason(season);
    }

    //    查询季度订单
    @Override
    public List<Orders> selectAllBySeason(Season season) throws Exception {
        return ordersMapper.selectAllBySeason(season);
    }

}
