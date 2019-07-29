package com.example.hotel_demo.controller;

import com.example.hotel_demo.model.*;
import com.example.hotel_demo.service.orderdetails.OrderdetailService;
import com.example.hotel_demo.service.orders.OrderService;
import com.example.hotel_demo.service.room.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/orders")
public class OrdersController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private OrderdetailService orderdetailService;

//    生成随机的factor位的数字字符串
    public static Long randomNum(int factor){
        return new Double((Math.random() + 1) * Math.pow(10, factor - 1)).longValue();
    }

//    查看订单明细
    @RequestMapping(value = "/findOrdersdetails")
    public String findOrdersdetails(Model model,Integer ordersId)throws Exception{
        Orders orders = orderService.selectOrderWithDetails(ordersId);
        List<Orderdetails> orderdetailsList = orders.getOrderdetailsList();
//        根据订房间Id查询房间信息
        for (Orderdetails  orderdetails: orderdetailsList) {
           Room room = roomService.selectByPrimaryKey(orderdetails.getRoomId());
           orderdetails.setRoom(room);
        }
        model.addAttribute("orderdetailsList",orderdetailsList);
        return "queryOrderdetails";
    }

//    进入生成订单页面
    @RequestMapping(value = "/addOrdersPage")
    public String addOrdersPage(Model model,Integer roomId)throws Exception{
        Room room = roomService.selectByPrimaryKey(roomId);
//        model.addAttribute("roomPrice",room.getPrice());
        model.addAttribute("room",room);
        model.addAttribute("number",randomNum(16));
        return "addOrders";
    }

//    进入预定多个房间页面
    @RequestMapping(value = "/addOrdersList")
    public String addOrdersList(Integer[] id,Model model)throws Exception{
        if (id!=null){
            List<Room> roomList = new ArrayList<Room>();
            float num = 0;
            for (Integer roomId:id) {
                Room room = roomService.selectByPrimaryKey(roomId);
                roomList.add(room);
                num+=room.getPrice();
            }
            model.addAttribute("roomList",roomList);
            model.addAttribute("number",randomNum(16));
            model.addAttribute("num",num);
            return "addOrdersList";
        }else {
            model.addAttribute("orderMessage","请您先选择要预定的房间!");
            return "redirect:/room/findRoomByExample";
        }
    }

//    提交订单
    @RequestMapping(value = "/addOrderReserve")
    public String addOrderReserve(Orders orders, HttpSession session,Integer[] room_Id,Orderdetails orderdetails)throws Exception{
        orders.setCreatetime(new Date());
        orders.setUserId((Integer) session.getAttribute("userId"));
    //        添加订单,返回ID
        orderService.insertBackId(orders);
        Integer ordersId =orders.getId();
        orderdetails.setOrdersId(ordersId);
        for (Integer id:room_Id) {
            orderdetails.setRoomId(id);
            //        添加订单明细
            orderdetailService.insertSelective(orderdetails);
            //        修改房间状态
            Room room = new Room();
            RoomExample roomExample = new RoomExample();
            RoomExample.Criteria criteria = roomExample.createCriteria();
            criteria.andIdEqualTo(id);
            room.setRoomStatus("已订");
            roomService.updateByExampleSelective(room,roomExample);
        }
        return "redirect:/userPage";
    }

//    取消订单,订单状态分为待使用/已使用/已取消
    @RequestMapping(value = "/cancellationOrders")
    public String cancellationOrders(Integer ordersId,HttpSession session)throws Exception{
        Orders orders = new Orders();
        OrdersExample ordersExample = new OrdersExample();
        OrdersExample.Criteria ordersCriteria = ordersExample.createCriteria();
        if (orders!=null)
        {
            ordersCriteria.andIdEqualTo(ordersId);
        }
//        判断订单是否可以取消
        Orders orders1 = orderService.selectOrderWithDetails(ordersId);
        List<Orderdetails> orderdetailsList = orders1.getOrderdetailsList();
        for (Orderdetails  orderdetails: orderdetailsList) {
            Room room = roomService.selectByPrimaryKey(orderdetails.getRoomId());
//            orderdetails.setRoom(room);
            if (room.getPolicy().equals("不可取消")){
//                session.setAttribute("cancelMessage","订单不可取消，详情请查看订单明细");
                return "redirect:/user/queryMyOrders";
            }
//            Calendar c = Calendar.getInstance();
//            Date date = c.getTime();
            Date date = new Date();
            if ((date.getTime()-(24*60*60*1000))>orderdetails.getInTime().getTime()){
//                session.setAttribute("cancelUseMessage","订单正在使用中，不可取消");
                return "redirect:/user/queryMyOrders";
            }
        }
        orders.setStatus("已取消");
        orderService.updateByExampleSelective(orders,ordersExample);
        OrderdetailsExample orderdetailsExample = new OrderdetailsExample();
        OrderdetailsExample.Criteria detailsCriteria1 = orderdetailsExample.createCriteria();
        if (ordersId!=null)
        {
            detailsCriteria1.andOrdersIdEqualTo(ordersId);
        }
//        修改房间状态
        List<Orderdetails> orderdetailsList1 = orderdetailService.selectByExample(orderdetailsExample);//根据订单ID查看订单明细
        for (Orderdetails orderdetails1:orderdetailsList1) {
            Room room = new Room();
            RoomExample roomExample = new RoomExample();
            RoomExample.Criteria roomCriteria = roomExample.createCriteria();
            roomCriteria.andIdEqualTo(orderdetails1.getRoomId());
            room.setRoomStatus("空闲");
            roomService.updateByExampleSelective(room,roomExample);
        }
        return "redirect:/user/queryMyOrders";
    }
}
