package com.example.hotel_demo.service.staff.impl;

import com.example.hotel_demo.mapper.StaffMapper;
import com.example.hotel_demo.model.Staff;
import com.example.hotel_demo.model.StaffExample;
import com.example.hotel_demo.service.staff.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StaffServiceImpl implements StaffService {

    @Autowired
    private StaffMapper staffMapper;
    //    根据条件查询员工信息
    @Override
    public List<Staff> selectByExample(StaffExample example) throws Exception {
        return staffMapper.selectByExample(example);
    }

    //    根据ID进入员工信息修改界面
    @Override
    public Staff selectByPrimaryKey(Integer id) throws Exception {
        return staffMapper.selectByPrimaryKey(id);
    }

    //    根据ID修改员工信息;
    @Override
    public void updateByPrimaryKeySelective(Staff staff) throws Exception {
        staffMapper.updateByPrimaryKeySelective(staff);
    }
    //    查看员工编号是否存在
    @Override
    public int selectStaffNumber(String number) throws Exception {
        return  staffMapper.selectStaffNumber(number);
    }

    //    根据Id删除员工
    @Override
    public void deleteByPrimaryKey(Integer id) throws Exception {
        staffMapper.deleteByPrimaryKey(id);
    }

    //    添加员工信息
    @Override
    public void insertSelective(Staff staff) throws Exception {
        staffMapper.insertSelective(staff);
    }
}
