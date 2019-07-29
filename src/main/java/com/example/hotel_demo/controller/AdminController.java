package com.example.hotel_demo.controller;

import com.example.hotel_demo.model.*;
import com.example.hotel_demo.service.admin.AdminService;
import com.example.hotel_demo.service.orderdetails.OrderdetailService;
import com.example.hotel_demo.service.orders.OrderService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderdetailService orderdetailService;

//    修改管理员密码
    @RequestMapping(value = "/editAdminPassword")
    public String editAdminPassword(String originalPassword, Admin admin, HttpSession session, Model model)throws Exception{
        Admin admin1 = adminService.selectByPrimaryKey((Integer) session.getAttribute("adminId"));
        if (!admin1.getAdminpassword().equals(originalPassword)){
            model.addAttribute("message","原始密码不正确");
            model.addAttribute("admin",admin);
            model.addAttribute("originalPassword",originalPassword);
            return "editAdminPassword";
        }
        admin.setId((Integer) session.getAttribute("adminId"));
        adminService.updateByPrimaryKeySelective(admin);
        return  "redirect:/user/loginOut";
    }

    //    统计营业额
    public void financialManage(String status, String createtime, Model model)throws Exception{
        String newCreatetime =null;
        if (createtime!=null&&createtime!=""){
            newCreatetime = createtime+"%";
        }
        List<Orders> ordersList = orderService.selectAll(status,newCreatetime);
        String sumprice = orderService.selectSumFinance(status,newCreatetime);
        model.addAttribute("ordersList",ordersList);
        model.addAttribute("sumprice",sumprice);
    }

//    查看所有订单的状态,并当订单已使用则修改订单状态
    public void orderStatus()throws Exception{
        OrdersExample ordersExample = new OrdersExample();
        OrdersExample.Criteria criteria = ordersExample.createCriteria();
        List<Orders> ordersList = orderService.selectByExample(ordersExample);
        for (Orders orders:ordersList) {
            Orders orders1 = orderService.selectOrderWithDetails(orders.getId());
            List<Orderdetails> orderdetailsList = orders1.getOrderdetailsList();
            int res = 0;
            for (Orderdetails orderdetails:orderdetailsList) {
                Calendar c = Calendar.getInstance();
                Date date = c.getTime();
                if (date.getTime()>orderdetails.getOutTime().getTime()){
                    res=1;
                }else {
                    res=-1;
                }
            }
            if (res>0&&!orders.getStatus().equals("已取消")){
                orders.setStatus("已使用");
                OrdersExample ordersExample1 = new OrdersExample();
                OrdersExample.Criteria ordersCriteria = ordersExample1.createCriteria();
                if (orders.getId()!=null){
                    ordersCriteria.andIdEqualTo(orders.getId());
                }
                orderService.updateByExampleSelective(orders,ordersExample1);
            }
        }
    }
//    日营业额统计
    @RequestMapping(value = "/financialStatistics")
    public String financialStatistics(String status,String createtime,Model model)throws Exception{
        orderStatus();
        financialManage(status,createtime,model);
        return "financialManagement";
    }


//    进入季度营业额统计页面
    @RequestMapping(value = "/financialByseasonPage")
    public String financialByseasonPage(String status,String createtime,Model model)throws Exception{
        orderStatus();
        financialManage(status,createtime,model);
        return "financialByseasion";
    }

//    按季度查看营业额统计
    @RequestMapping(value = "/financialBySeason")
    public String financialBySeason(Season season, Model model)throws Exception{
        orderStatus();
//        查询季度的所有订单
        List<Orders> ordersList = orderService.selectAllBySeason(season);
//        查看季度的营业额
        String sumprice = orderService.selectFinanceBySeason(season);
        model.addAttribute("ordersList",ordersList);
        model.addAttribute("sumprice",sumprice);
        return "financialByseasion";
    }

//    进入查看年度营业额统计页面
    @RequestMapping(value = "/financialYearPage")
    public String financialYearPage(String status,String year,Model model)throws Exception{
        orderStatus();
        financialManage(status,year,model);
        return "financialYear";
    }

    @RequestMapping(value = "/topAdmin")
    public String topAdmin(Model model,HttpSession session)throws Exception{
        model.addAttribute("adminPic",session.getAttribute("adminPic"));
        return "topAdmin";
    }
}
