package com.example.hotel_demo.service.staff;

import com.example.hotel_demo.model.Staff;
import com.example.hotel_demo.model.StaffExample;

import java.util.List;

public interface StaffService {
    //    根据条件查询员工信息
    public List<Staff> selectByExample(StaffExample example)throws Exception;
    //    根据ID进入员工信息修改页面
    public Staff selectByPrimaryKey(Integer id)throws Exception;
    //    根据ID修改员工信息;
    public void updateByPrimaryKeySelective(Staff staff)throws Exception;
    //    查看员工编号是否存在
    public int selectStaffNumber(String number)throws Exception;
//    根据Id删除员工
    public void deleteByPrimaryKey(Integer id)throws Exception;
//    添加员工信息
    public void insertSelective(Staff staff)throws Exception;
}
