package com.example.hotel_demo.controller;

import com.example.hotel_demo.model.*;
import com.example.hotel_demo.service.admin.AdminService;
import com.example.hotel_demo.service.orders.OrderService;
import com.example.hotel_demo.service.room.RoomService;
import com.example.hotel_demo.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private RoomService roomService;

    private String number=null;


    //    文件上传，用户头像
    public void fileUploadUserPic(User user, MultipartFile pictureFile)throws Exception{
        if(!pictureFile.isEmpty() && pictureFile.getSize()>0){
            String fileName = pictureFile.getOriginalFilename();  // 获取文件名
            String suffixName = fileName.substring(fileName.lastIndexOf("."));  // 获取文件后缀名
            String filePath = "E://IDEA//hotel_demo//src//main//resources//static//images//"; // 文件上传后的路径
            String newFileName = UUID.randomUUID() + suffixName; // 生成新文件名
            File file = new File(filePath + newFileName);//新文件
            if(!file.getParentFile().exists()){
                file.getParentFile().mkdirs();
            }
            //将文件存入上传的路径里
            pictureFile.transferTo(file);
            //将文件名称写入数据库
            user.setUserpic(newFileName);
        }
    }

//    用户注册
    @RequestMapping(value = "/addUserRegister")
    public String addUserRegister(User user,Model model,@RequestParam("pictureFile") MultipartFile pictureFile)throws Exception{
        int nameNumber=0,keyNumber=0,cidNumber=0;
        if (user.getUsername()!=null&&user.getUserkey()!=""){
            nameNumber = userService.selectUserName(user.getUsername());
        }
        if (user.getUserkey()!=null&&user.getUserkey()!=""){
            keyNumber = userService.selectUserKey(user.getUserkey());
        }
        if (user.getCid()!=null&&user.getCid()!=""){
            cidNumber = userService.selectCid(user.getCid());
        }
        if (nameNumber>0&&keyNumber>0&&cidNumber>0){
            model.addAttribute("nameMessage","该昵称已经存在");
            model.addAttribute("keyMessage","该账号已经存在");
            model.addAttribute("cidMessage","该身份证号码已经注册过了");
            model.addAttribute("user",user);
            return "register";
        }
        if (nameNumber>0){
            model.addAttribute("nameMessage","该昵称已经存在");
            model.addAttribute("user",user);
            return "register";
        }
        if (keyNumber>0){
            model.addAttribute("keyMessage","该账号已经存在");
            model.addAttribute("user",user);
            return "register";
        }
        if (cidNumber>0){
            model.addAttribute("cidMessage","该身份证号码已经注册过了");
            model.addAttribute("user",user);
            return "register";
        }
        user.setIdentity("会员");
        fileUploadUserPic(user,pictureFile);
        userService.insertSelective(user);
        return "login";
    }

//    用户登录
    @RequestMapping(value = "/userOrAdminLogin")
    public String userOrAdminLogin(User user, String ident, HttpSession session, Model model)throws Exception{
        User user1 = null;
        Admin admin1 = null;
        if (ident.equals("会员"))
        {
            user1 =  userService.selectByKeyAndPassword(user);
        }
        if (user1!=null)
        {
            session.setAttribute("userKey",user1.getUserkey());
            session.setAttribute("userName",user1.getUsername());
//            session.setAttribute("userPic",user1.getUserpic());
            session.setAttribute("userId",user1.getId());
            return "redirect:/room/findRoomByExample";
        }
        if (ident.equals("管理员"))
        {
            Admin admin = new Admin();
            if (user.getUserkey()!=null&&user.getUserkey()!="")
            {
                admin.setAdminname(user.getUserkey());
            }
            if (user.getPassword()!=null&&user.getPassword()!="")
            {
                admin.setAdminpassword(user.getPassword());
            }
            admin1 = adminService.selectByNameAndPassword(admin);
        }
        if (admin1!=null){
//            return "redirect:/staff/findStaffByExample";
            session.setAttribute("adminId",admin1.getId());
            session.setAttribute("adminName",admin1.getAdminname());
            session.setAttribute("adminPic",admin1.getAdminpic());
            return "redirect:/adminPage";
        }
        model.addAttribute("loginMessage","用户名或密码错误");
        return "login";
    }

    //    查看我的订单
    @RequestMapping(value = "/queryMyOrders")
    public String queryMyOrders(Model model,HttpSession session)throws Exception{
//        查看是否已经使用过订单
        User user = userService.selectUserWithOrders((Integer) session.getAttribute("userId"));
        for (Orders orders: user.getOrdersList()) {
            Orders orders1 = orderService.selectOrderWithDetails(orders.getId());
            List<Orderdetails> orderdetailsList = orders1.getOrderdetailsList();
            int res = 0;
            for (Orderdetails orderdetails:orderdetailsList) {
//                res = new Date().compareTo(orderdetails.getOutTime());
//                Calendar c = Calendar.getInstance();
//                Date date = c.getTime();
                Date date = new Date();
//                Date date1 = orderdetails.getOutTime();
                if (date.getTime()>orderdetails.getOutTime().getTime()){
                    res=1;
                }else {
                    res=-1;
                }
            }
            if (res>0&&!orders.getStatus().equals("已取消")){
                orders.setStatus("已使用");
                OrdersExample ordersExample = new OrdersExample();
                OrdersExample.Criteria ordersCriteria = ordersExample.createCriteria();
                if (orders.getId()!=null){
                    ordersCriteria.andIdEqualTo(orders.getId());
                }
                orderService.updateByExampleSelective(orders,ordersExample);
            }
        }
        model.addAttribute("ordersList",user.getOrdersList());
//        model.addAttribute("message",session.getAttribute("cancelMessage"));
//        model.addAttribute("messageTwo",session.getAttribute("cancelUseMessage"));
        return "queryListOrders";
    }

//    查看自己还未使用的订单
    @RequestMapping(value = "/queryPendingOrders")
    public String queryPendingOrders(Model model,HttpSession session)throws Exception{
        User user = userService.selectUserWithOrders((Integer) session.getAttribute("userId"));
        for (Orders orders: user.getOrdersList()) {
            Orders orders1 = orderService.selectOrderWithDetails(orders.getId());
            List<Orderdetails> orderdetailsList = orders1.getOrderdetailsList();
            int res = 0;
            for (Orderdetails orderdetails:orderdetailsList) {
                Date date = new Date();
                if (date.getTime()>orderdetails.getOutTime().getTime()){
                    res=1;
                }else {
                    res=-1;
                }
            }
            if (res>0&&!orders.getStatus().equals("已取消")){
                orders.setStatus("已使用");
                OrdersExample ordersExample = new OrdersExample();
                OrdersExample.Criteria ordersCriteria = ordersExample.createCriteria();
                if (orders.getId()!=null){
                    ordersCriteria.andIdEqualTo(orders.getId());
                }
                orderService.updateByExampleSelective(orders,ordersExample);
            }
        }
        List<Orders> ordersList = new ArrayList<Orders>();
        for (Orders orders:user.getOrdersList()) {
            if (orders.getStatus().equals("待使用")){
                ordersList.add(orders);
            }
        }
        if (ordersList!=null){
            model.addAttribute("ordersList",ordersList);
        }
//        model.addAttribute("message",session.getAttribute("cancelMessage"));
//        model.addAttribute("messageTwo",session.getAttribute("cancelUseMessage"));
        return "queryListOrders";
    }


//    查看个人信息
    @RequestMapping(value = "/findUserInformation")
    public String findUserInformation(Model model,HttpSession session)throws Exception{
        Integer userId = (Integer) session.getAttribute("userId");
        User user = userService.selectByPrimaryKey(userId);
        model.addAttribute("user",user);
        return "queryUser";
    }

//    进入修改个人信息页面
    @RequestMapping(value = "findUserPage")
    public String findUserPage(Model model,HttpSession session)throws Exception{
        Integer userId = (Integer) session.getAttribute("userId");
        User user = userService.selectByPrimaryKey(userId);
        if (user.getUsername()!=null&&user.getUsername()!=""){
            number = user.getUsername();
        }
        model.addAttribute("user",user);
        return "editUser";
    }

//    提交修改个人信息
    @RequestMapping(value = "editUserInformation")
    public String editUserInformation(User user,HttpSession session,Model model,@RequestParam("pictureFile") MultipartFile pictureFile)throws Exception{
        user.setId((Integer) session.getAttribute("userId"));
        if (user.getUsername()!=null&&user.getUsername()!=""){
            if (!number.equals(user.getUsername())){
                int num = userService.selectUserName(user.getUsername());
                if (num>0){
                    model.addAttribute("message","用户昵称已存在");
                    model.addAttribute("user",user);
                    return "editUser";
                }
            }
        }
        fileUploadUserPic(user,pictureFile);
        userService.updateByPrimaryKeySelective(user);
        return "redirect:findUserInformation";
    }

    //    提交修改密码
    @RequestMapping(value = "editUserPassword")
    public String editUserPassword(String originalPassword,User user,HttpSession session,Model model)throws Exception{
        User user1 = userService.selectByPrimaryKey((Integer) session.getAttribute("userId"));
        if (!user1.getPassword().equals(originalPassword)){
            model.addAttribute("message","原始密码不正确");
            model.addAttribute("user",user);
            model.addAttribute("originalPassword",originalPassword);
            return "editUserPassword";
        }
        user.setId((Integer) session.getAttribute("userId"));
        userService.updateByPrimaryKeySelective(user);
        return "redirect:loginOut";
    }

//    退出登录
    @RequestMapping(value = "/loginOut")
    public String loginOut(HttpSession session)throws Exception{
        session.invalidate();
        return "login";
    }
}
