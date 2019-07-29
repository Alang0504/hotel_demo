package com.example.hotel_demo.service.room;

import com.example.hotel_demo.model.Room;
import com.example.hotel_demo.model.RoomExample;

import java.util.List;

public interface RoomService {
    //    根据条件查询房间列表
   public List<Room> selectByExample(RoomExample roomExample)throws Exception;

//    根据Id查询房间信息
   public Room selectByPrimaryKey(Integer id)throws Exception;

//   根据条件更新值不为空的字段
    public int updateByExampleSelective(Room room,RoomExample example)throws Exception;

//    根据ID修改房间信息
    public void updateByPrimaryKeySelective(Room room)throws Exception;

//    查询房间号是否存在
    public int selectRoomNumber(String roomNumber)throws Exception;
//    添加房间信息
    public void insertSelective(Room room)throws Exception;
//    根据ID删除房间信息
    public void deleteByPrimaryKey(Integer id);
}
