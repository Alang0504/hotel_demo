package com.example.hotel_demo.controller;

import com.example.hotel_demo.model.*;
import com.example.hotel_demo.service.orderdetails.OrderdetailService;
import com.example.hotel_demo.service.orders.OrderService;
import com.example.hotel_demo.service.room.RoomService;
import com.example.hotel_demo.service.user.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping(value = "/room")
public class RoomController {

    @Autowired
    private RoomService roomService;

    @Autowired
    private OrderdetailService orderdetailService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private UserService userService;

    private String roomNumber=null;

    //    用户根据条件查询房间列表
    @RequestMapping(value = "/findRoomByExample")
    public String findRoomByExample(Model model, Room room, HttpSession session,@RequestParam(defaultValue = "1") Integer pageNum,@RequestParam(defaultValue = "5") Integer pageSize) throws Exception {
//        判断房间是否空闲
        OrderdetailsExample orderdetailsExample = new OrderdetailsExample();
        OrderdetailsExample.Criteria detailCriteria = orderdetailsExample.createCriteria();
        List<Orderdetails> orderdetailsList = orderdetailService.selectByExample(orderdetailsExample);
        for (Orderdetails orderdetails:orderdetailsList) {
//            int res = new Date().compareTo(orderdetails.getOutTime());
//            Calendar c = Calendar.getInstance();
//            Date date = c.getTime();
            Date date = new Date();
            Orders orders = orderService.selectByPrimaryKey(orderdetails.getOrdersId());
            if (date.getTime()>orderdetails.getOutTime().getTime()||orders.getStatus().equals("已取消")){

                Room room1 = new Room();
                room1.setId(orderdetails.getRoomId());
                room1.setRoomStatus("空闲");
                roomService.updateByPrimaryKeySelective(room1);
            }else {
                Room room1 = new Room();
                room1.setId(orderdetails.getRoomId());
                room1.setRoomStatus("已订");
                roomService.updateByPrimaryKeySelective(room1);
            }
        }
        RoomExample roomExample = new RoomExample();
        RoomExample.Criteria criteria = roomExample.createCriteria();
        if (room.getUserNumber()!=null)
        {
            criteria.andUserNumberEqualTo(room.getUserNumber());
        }
        if (room.getBed()!=null&&room.getBed()!="")
        {
            criteria.andBedLike("%"+room.getBed()+"%");
        }
        if (room.getBreakfast()!=null&&room.getBreakfast()!="")
        {
            criteria.andBreakfastEqualTo(room.getBreakfast());
        }
        if (room.getRoomStatus()!=null&&room.getRoomStatus()!="")
        {
            criteria.andRoomStatusEqualTo(room.getRoomStatus());
        }
        if (room.getCategory()!=null&&room.getCategory()!="")
        {
            criteria.andCategoryLike("%"+room.getCategory()+"%");
            PageHelper.startPage(pageNum,pageSize);
            List<Room> listRoom = roomService.selectByExample(roomExample);
            PageInfo<Room> pageInfo = new PageInfo<Room>(listRoom);
            model.addAttribute("pageInfo",pageInfo);
            model.addAttribute("userName",session.getAttribute("userName"));
            if (session.getAttribute("userId")!=null){
                User user = userService.selectByPrimaryKey((Integer) session.getAttribute("userId"));
                model.addAttribute("userPic",user.getUserpic());
            }
            model.addAttribute("room",room);
            if (room.getCategory().equals("标准"))
            {
                return "standardRoom";
            }
            if (room.getCategory().equals("豪华"))
            {
                return "deluxeRoom";
            }
            if (room.getCategory().equals("主题房")){
                return "themeRoom";
            }
            if (room.getCategory().equals("特价房"))
            {
                return "specialPriceRoom";
            }

        }
        PageHelper.startPage(pageNum,pageSize);
        List<Room> listRoom = roomService.selectByExample(roomExample);
        PageInfo<Room> pageInfo = new PageInfo<Room>(listRoom);
//        model.addAttribute("listRoom",listRoom);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("userName",session.getAttribute("userName"));
        if (session.getAttribute("userId")!=null){
            User user = userService.selectByPrimaryKey((Integer) session.getAttribute("userId"));
            model.addAttribute("userPic",user.getUserpic());
        }
//        数据回显，回显查询条件
        model.addAttribute("room",room);
        return "queryListRoom";
    }

//    管理员查看所有房间信息
    @RequestMapping(value = "/adminFindRoomList")
    public String adminFindRoomList(Room room,Model model,@RequestParam(defaultValue = "1") Integer pageNum,@RequestParam(defaultValue = "5") Integer pageSize)throws Exception{
        //        判断房间是否空闲
        OrderdetailsExample orderdetailsExample = new OrderdetailsExample();
        OrderdetailsExample.Criteria detailCriteria = orderdetailsExample.createCriteria();
        List<Orderdetails> orderdetailsList = orderdetailService.selectByExample(orderdetailsExample);
        for (Orderdetails orderdetails:orderdetailsList) {
//            int res = new Date().compareTo(orderdetails.getOutTime());
            Date date = new Date();
            if (date.getTime()>orderdetails.getOutTime().getTime()){

                Room room1 = new Room();
                room1.setId(orderdetails.getRoomId());
                room1.setRoomStatus("空闲");
                roomService.updateByPrimaryKeySelective(room1);
            }else {
                Room room1 = new Room();
                room1.setId(orderdetails.getRoomId());
                room1.setRoomStatus("已订");
                roomService.updateByPrimaryKeySelective(room1);
            }
        }
        RoomExample roomExample = new RoomExample();
        RoomExample.Criteria criteria = roomExample.createCriteria();
        if (room.getUserNumber()!=null)
        {
            criteria.andUserNumberEqualTo(room.getUserNumber());
        }
        if (room.getBed()!=null&&room.getBed()!="")
        {
            criteria.andBedLike("%"+room.getBed()+"%");
        }
        if (room.getBreakfast()!=null&&room.getBreakfast()!="")
        {
            criteria.andBreakfastEqualTo(room.getBreakfast());
        }
        if (room.getRoomStatus()!=null&&room.getRoomStatus()!="")
        {
            criteria.andRoomStatusEqualTo(room.getRoomStatus());
        }
        PageHelper.startPage(pageNum,pageSize);
        List<Room> listRoom = roomService.selectByExample(roomExample);
        PageInfo<Room> pageInfo = new PageInfo<Room>(listRoom);
        model.addAttribute("pageInfo",pageInfo);
//        model.addAttribute("listRoom",listRoom);
        model.addAttribute("room",room);
        return "adminListRoom";
    }




//    进入修改房间信息页面
    @RequestMapping(value = "findRoomById")
    public String findRoomById(Integer roomId,Model model)throws Exception{
        Room room = roomService.selectByPrimaryKey(roomId);
        roomNumber = room.getGuestRoomNumber();
        model.addAttribute("room",room);
        return "editRoom";
    }

//    文件上传，房间图片
    public void fileUpload(Room room,MultipartFile pictureFile)throws Exception{
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
            room.setPic(newFileName);
        }
    }

//    修改房间信息
    @RequestMapping(value = "/editRoomById")
    public String editRoomById(Room room, Model model, @RequestParam("pictureFile") MultipartFile pictureFile)throws Exception{
//        判断房间号是否存在
        if (room.getGuestRoomNumber()!=null&&room.getGuestRoomNumber()!=""){
            if (!roomNumber.equals(room.getGuestRoomNumber())){
                int num = roomService.selectRoomNumber(room.getGuestRoomNumber());
                if (num>0){
                    model.addAttribute("message","此房间号已存在");
                    model.addAttribute("room",room);
                    return "editRoom";
                }
            }
        }
//        文件上传,上传图片
        fileUpload(room,pictureFile);
        roomService.updateByPrimaryKeySelective(room);
        return "redirect:adminFindRoomList";
    }

//    房间信息录入
    @RequestMapping("addRoom")
    public String addRoom(Room room, Model model, @RequestParam("pictureFile") MultipartFile pictureFile)throws Exception{
        //        判断房间号是否存在
        if (room.getGuestRoomNumber()!=null&&room.getGuestRoomNumber()!=""){
                int num = roomService.selectRoomNumber(room.getGuestRoomNumber());
                if (num>0){
                    model.addAttribute("message","此房间号已存在");
                    model.addAttribute("room",room);
                    return "addRoomPage";
                }
        }
//        文件上传,上传图片
        fileUpload(room,pictureFile);
        roomService.insertSelective(room);
        return "redirect:adminFindRoomList";
    }

//    删除房间信息
    @RequestMapping(value = "/cancelRoom")
    public String cancelRoom(Integer roomId)throws Exception{
        roomService.deleteByPrimaryKey(roomId);
        return "redirect:adminFindRoomList";
    }

//    @RequestMapping(value = "/findAllRoom",method = RequestMethod.POST)
//    @ResponseBody
//    public Room findAllRoom(Integer id)throws Exception{
//        return roomService.selectByPrimaryKey(id);
//    }
}
