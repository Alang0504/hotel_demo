package com.example.hotel_demo.service.orderdetails.impl;

import com.example.hotel_demo.mapper.OrderdetailsMapper;
import com.example.hotel_demo.model.Orderdetails;
import com.example.hotel_demo.model.OrderdetailsExample;
import com.example.hotel_demo.model.Orders;
import com.example.hotel_demo.service.orderdetails.OrderdetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderdetailServiceImpl implements OrderdetailService {

    @Autowired
    private OrderdetailsMapper orderdetailsMapper;

    //    添加订单明细
    @Override
    public int insertSelective(Orderdetails orderdetails) throws Exception {
        return orderdetailsMapper.insertSelective(orderdetails);
    }

    //    根据条件删除
    @Override
    public void deleteByExample(OrderdetailsExample example) throws Exception {
        orderdetailsMapper.deleteByExample(example);
    }

    //    根据条件查找订单明细信息
    @Override
    public List<Orderdetails> selectByExample(OrderdetailsExample example) {
        return orderdetailsMapper.selectByExample(example);
    }
}
