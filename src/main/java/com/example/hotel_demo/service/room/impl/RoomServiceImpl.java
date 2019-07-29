package com.example.hotel_demo.service.room.impl;

import com.example.hotel_demo.mapper.RoomMapper;
import com.example.hotel_demo.model.Room;
import com.example.hotel_demo.model.RoomExample;
import com.example.hotel_demo.service.room.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomServiceImpl implements RoomService {

    @Autowired
    private RoomMapper roomMapper;

    //    根据条件查询房间列表
    @Override
    public List<Room> selectByExample(RoomExample roomExample) throws Exception {
//        RoomExample roomExample = new RoomExample();
//        RoomExample.Criteria criteria = roomExample.createCriteria();
        List<Room> roomList = roomMapper.selectByExample(roomExample);
        return roomList;
    }

    //    根据Id查询房间信息
    @Override
    public Room selectByPrimaryKey(Integer id) throws Exception {
        return roomMapper.selectByPrimaryKey(id);
    }

    //   根据条件更新值不为空的字段
    @Override
    public int updateByExampleSelective(Room room, RoomExample example) throws Exception {
        return roomMapper.updateByExampleSelective(room,example);
    }

    //    根据ID修改房间信息
    @Override
    public void updateByPrimaryKeySelective(Room room) throws Exception {
        roomMapper.updateByPrimaryKeySelective(room);
    }

    //    查询房间号是否存在
    @Override
    public int selectRoomNumber(String roomNumber) throws Exception {
        return roomMapper.selectRoomNumber(roomNumber);
    }

    //    添加房间信息
    @Override
    public void insertSelective(Room room) throws Exception {
        roomMapper.insertSelective(room);
    }

    //    根据ID删除房间信息
    @Override
    public void deleteByPrimaryKey(Integer id) {
        roomMapper.deleteByPrimaryKey(id);
    }
}
