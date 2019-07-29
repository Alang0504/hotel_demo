package com.example.hotel_demo.controller;

import com.example.hotel_demo.model.Staff;
import com.example.hotel_demo.model.StaffExample;
import com.example.hotel_demo.service.staff.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = "/staff")
public class StaffController {

    @Autowired
    private StaffService staffService;
    private String number=null;

    //根据条件查询员工信息
    @RequestMapping(value = "/findStaffByExample")
    public String findStaffByExample(Model model, Staff staff)throws Exception{
        StaffExample staffExample = new StaffExample();
        StaffExample.Criteria criteria = staffExample.createCriteria();
        List<Staff> staffList = staffService.selectByExample(staffExample);
        model.addAttribute("staffList",staffList);
        return "queryStaff";
    }

    //    根据ID进入修改员工信息界面
    @RequestMapping(value = "/findStaffById")
    public String findStaffById(Model model,Integer id)throws Exception{
        Staff staff = staffService.selectByPrimaryKey(id);
        if (staff.getEmployeeNumber() != null && staff.getEmployeeNumber() != "")
        {
            number = staff.getEmployeeNumber();
        }

        model.addAttribute("staff",staff);
        return "editStaff";
    }

    //    根据ID修改员工信息
    @RequestMapping(value = "/editStaffById")
    public String editStaffById(Staff staff,Model model)throws Exception{
        if (staff.getEmployeeNumber()!=null && staff.getEmployeeNumber()!="")
        {
            String numberTwo = staff.getEmployeeNumber();
            if (!number.equals(numberTwo)){
                int num = staffService.selectStaffNumber(numberTwo);
                if (num>0)
                {
                    model.addAttribute("message","员工编号已存在");
                    model.addAttribute("staff",staff);
                    return "editStaff";
                }
            }

        }
        staffService.updateByPrimaryKeySelective(staff);
        return "redirect:findStaffByExample";
    }

//    根据Id删除员工
    @RequestMapping(value = "/cancelStaffByid")
    public String cancelStaffByid(Integer id)throws Exception{
        staffService.deleteByPrimaryKey(id);
        return "redirect:findStaffByExample";
    }

//    添加员工信息
    @RequestMapping(value = "/insertStaff")
    public String insertStaff(Staff staff,Model model)throws Exception{
        int num = 0;
        if (staff.getEmployeeNumber()!=null&&staff.getEmployeeNumber()!=""){
            num = staffService.selectStaffNumber(staff.getEmployeeNumber());
        }
        if (num>0){
            model.addAttribute("message","员工编号已存在");
            return "addStaff";
        }
        staffService.insertSelective(staff);
        return "redirect:findStaffByExample";
    }
}
