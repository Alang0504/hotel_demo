<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>修改房间信息</title>
    <style type="text/css">
        th{
            background-color: #545c64;
            font-size: 25px;
            color: white;
        }
        td{
            background-color: #EEEEEE;
            font-size: 20px;
        }
    </style>
    <link rel="stylesheet" href="/css/room.css">
</head>
<body>
<form action="/room/editRoomById" method="post" onsubmit="return check()" enctype="multipart/form-data">
    <table width="50%" border=0 align="center">
        <tr>
            <th>房间号</th>
            <td>
                <input type="hidden" name="id" value="${room.id}">
                <input class="roomText" type="text" name="guestRoomNumber" required="true" maxlength="16" value="${room.guestRoomNumber}">${message}
            </td>
        </tr>
        <tr>
            <th>楼层</th>
            <td>
                <select class="roomText" name="location" id="location">
                    <option>${room.location}</option>
                    <option>一楼</option>
                    <option>二楼</option>
                    <option>三楼</option>
                    <option>四楼</option>
                    <option>五楼</option>
                    <option>六楼</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>类型</th><td><input class="roomText" type="text" name="category" value="${room.category}" required="true" maxlength="32"></td>
        </tr>
        <tr>
            <th>面积</th><td><input class="roomText" type="text" name="areas" value="${room.areas}" required="true">㎡</td>
        </tr>
        <tr>
            <th>床型</th>
            <td>
                <select name="bed" class="roomText">
                    <option>${room.bed}</option>
                    <option>单人床</option>
                    <option>双人床</option>
                    <option>大床</option>
                    <option></option>
                </select>
            </td>
        </tr>
        <tr>
            <th>早餐</th>
            <td>
                <select class="roomText" name="breakfast" id="breakfast">
                    <option>${room.breakfast}</option>
                    <option>无</option>
                    <option>每天单早</option>
                    <option>每天双早</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>可住人数</th>
            <td>
                <select class="roomText" name="userNumber" id="userNumber">
                    <option>${room.userNumber}</option>
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                </select>人
            </td>
        </tr>
        <tr>
            <th>政策</th>
            <td>
                <select class="roomText" name="policy" id="policy">
                    <option>${room.policy}</option>
                    <option>可以取消</option>
                    <option>不可取消</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>网络</th>
            <td>
                <select class="roomText" name="network" id="network">
                    <option>${room.network}</option>
                    <option>wifi</option>
                    <option>有线宽带</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>价格</th><td><input class="roomText" type="text" name="price" value="${room.price}" required="true"></td>
        </tr>
        <tr>
            <th>图片</th>
            <td>
                <c:if test="${room.pic!=null}">
                    <img src="/static/images/${room.pic}" width=100 height=100/>
                    <br/>
                </c:if>
                <input type="file" name="pictureFile"/>
            </td>
        </tr>
        <tr>
            <th>状态</th>
            <td>
                <select class="roomText" name="roomStatus" id="roomStatus">
                    <option>${room.roomStatus}</option>
                    <option>空闲</option>
                    <option>已订</option>
                </select>
            </td>
        </tr>
        <tr>
            <th colspan="2" align="center"><input type="submit" class="roomButton"  value="更新"></th>
        </tr>
    </table>
    <script type="text/javascript">
        function check() {
            var location = document.getElementById("location").value;
            var breakfast = document.getElementById("breakfast").value;
            var userNumber = document.getElementById("userNumber").value;
            var policy = document.getElementById("policy").value;
            var network = document.getElementById("network").value;
            var roomStatus = document.getElementById("roomStatus").value;
            if (location==""){
                alert("楼层不能为空");
                return false;
            }
            if (breakfast==""){
                alert("早餐不能为空");
                return false;
            }
            if (userNumber==""){
                alert("可入住人数不能为空");
                return false;
            }
            if (policy==""){
                alert("政策不能为空");
                return false;
            }
            if (network==""){
                alert("网络不能为空");
                return false;
            }
            if (roomStatus==""){
                alert("房间状态不能为空");
                return false;
            }
            return true;
        }
    </script>
</form>
</body>
</html>