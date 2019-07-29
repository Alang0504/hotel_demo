<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
    <meta charset="UTF-8">
    <title>首页索引页面</title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui@2.8.2/lib/theme-chalk/index.css">
</head>
<style>
    body{
        background-color: #545c64;
        color: #fff;
        font-size: 25px;
    }
    #userOrders{
        display: none;
    }
    ul li:hover{
        /*鼠标变为手指*/
        cursor: pointer;
    }
    ul,li{
        /*去掉前面的点*/
        list-style: none;
    }
    a{
        color: #ffffff;
        font-size: 25px;
        /*去掉下划线*/
        text-decoration: none;
    }
    li{
        margin-top: 20px;
    }
    .ordersHref{
        color: #ffffff;
        font-size: 20px;
        /*去掉下划线*/
        text-decoration: none;
    }
</style>
<body>
    <ul>
        <li><i class="el-icon-location"></i><a href="/room/findRoomByExample" target="_top">首页</a></li>
        <li><i class="el-icon-location"></i><span style="" onclick="f('userOrders')">我的订单</span>
            <ul id="userOrders">
                <li><i class="el-icon-menu"></i><a class="ordersHref" target="right" href="/user/queryMyOrders">历史订单</a></li>
                <li><i class="el-icon-menu"></i><a class="ordersHref" target="right" href="/user/queryPendingOrders">待使用订单</a></li>
            </ul>
        </li>
        <li><i class="el-icon-location"></i><a href="/user/findUserInformation" target="right">查看个人信息</a></li>
        <li><i class="el-icon-location"></i><a href="/user/findUserPage" target="right">修改个人信息</a></li>
        <li><i class="el-icon-setting"></i><a href="/editUserPassword" target="right">修改密码</a></li>
    </ul>
    <script>
        function f(str){
            var sub_menu = document.getElementById(str);
            var dis_v = sub_menu.style.display;

            if(dis_v == "block")
                sub_menu.style.display = "none";
            else
                sub_menu.style.display = "block";

        }
    </script>
</body>
</html>