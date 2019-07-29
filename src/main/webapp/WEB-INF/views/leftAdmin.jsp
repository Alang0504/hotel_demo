<%--
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="UTF-8">
    <title>首页索引页面</title>
</head>
<body>
    <ul>
        <li>
            <span>员工信息模块</span>
            <ul>
                <li><a href="/staff/findStaffByExample" target="right">员工信息查看</a></li>
                <li><a href="/addStaff" target="right">员工信息录入</a></li>
            </ul>
        </li>
    </ul>
    <ul>
        <li>
            <span>房间信息模块</span>
            <ul>
                <li><a href="/room/adminFindRoomList" target="right">房间信息查看</a></li>
                <li><a href="/addRoomPage" target="right">房间信息录入</a></li>
            </ul>
        </li>
    </ul>
    <ul>
        <li>
            <span>财务管理</span>
            <ul>
                <li><a href="/admin/financialStatistics?status=已使用" target="right">查看日营业额统计</a></li>
                <li><a href="/admin/financialByseasonPage?status=已使用" target="right">查看季度营业额统计</a></li>
                <li><a href="/admin/financialYearPage?status=已使用" target="right">查看年度营业额统计</a></li>
            </ul>
        </li>
    </ul>
    <ul>
        <li>
            <span>账号管理</span>
            <ul>
                <li><a href="/editAdminPassword" target="_top">修改密码</a></li>
                <li><a href="/user/loginOut" target="_top">退出登录</a></li>
            </ul>
        </li>
    </ul>
</body>
</html>--%>
<%--<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>菜鸟教程(runoob.com)</title>

    <link rel="stylesheet" href="https://static.runoob.com/assets/js/jquery-treeview/jquery.treeview.css" />
    <link rel="stylesheet" href="https://static.runoob.com/assets/js/jquery-treeview/screen.css" />

    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://static.runoob.com/assets/js/jquery-treeview/jquery.cookie.js"></script>
    <script src="https://static.runoob.com/assets/js/jquery-treeview/jquery.treeview.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function(){
            $("#browser").treeview({
                toggle: function() {
                    console.log("%s was toggled.", $(this).find(">span").text());
                }
            });
        });
    </script>
</head>
<body>
    <div id="main">
        <ul id="browser" class="filetree treeview-famfamfam">
            <li class="closed"><span class="folder">员工信息模块</span>
                <ul>
                    <li><a href="/staff/findStaffByExample" target="right">员工信息查看</a></li>
                    <li><a href="/addStaff" target="right">员工信息录入</a></li>
                </ul>
            </li>

            <li class="closed"><span class="folder">房间信息模块</span>
                <ul>
                    <li><a href="/room/adminFindRoomList" target="right">房间信息查看</a></li>
                    <li><a href="/addRoomPage" target="right">房间信息录入</a></li>
                </ul>
            </li>

            <li class="closed"><span class="folder">财务管理模块</span>
                <ul>
                    <li><a href="/admin/financialStatistics?status=已使用" target="right">查看日营业额统计</a></li>
                    <li><a href="/admin/financialByseasonPage?status=已使用" target="right">查看季度营业额统计</a></li>
                    <li><a href="/admin/financialYearPage?status=已使用" target="right">查看年度营业额统计</a></li>
                </ul>
            </li>

            <li class="closed"><span class="folder">账号管理模块</span>
                <ul>
                    <li><a href="/editAdminPassword" target="_top">修改密码</a></li>
                    <li><a href="/user/loginOut" target="_top">退出登录</a></li>
                </ul>
            </li>
        </ul>
    </div>
</body>
</html>--%>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="https://unpkg.com/element-ui@2.8.2/lib/theme-chalk/index.css">
    <style type="text/css">
        body{
            background-color:#545c64 ;
            color: #fff;
            font-size: 25px;
        }
        #sub_menu_1,#sub_menu_2,#sub_menu_3,#sub_menu_4{
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
        .leftHref{
            color: #ffffff;
            font-size: 20px;
            text-decoration: none;
        }
        li{
            margin-top: 20px;
        }
    </style>
</head>
<body>
<ul>
    <li><i class="el-icon-location"></i><span onclick = "f('sub_menu_1')">员工信息模块</span>
        <ul id="sub_menu_1">
            <li><i class="el-icon-menu"></i><a href="/staff/findStaffByExample" target="right" class="leftHref">员工信息查看</a></li>
            <li><i class="el-icon-menu"></i><a href="/addStaff" target="right" class="leftHref">员工信息录入</a></li>
        </ul>
    </li>

    <li><i class="el-icon-location"></i><span onclick="f('sub_menu_2')">房间信息模块</span>
        <ul  id="sub_menu_2">
            <li><i class="el-icon-menu"></i><a href="/room/adminFindRoomList" target="right" class="leftHref">房间信息查看</a></li>
            <li><i class="el-icon-menu"></i><a href="/addRoomPage" target="right" class="leftHref">房间信息录入</a></li>
        </ul>

    </li>

    <li><i class="el-icon-location"></i><span onclick="f('sub_menu_3')">财务管理模块</span>
        <ul id="sub_menu_3">
            <li><i class="el-icon-menu"></i><a href="/admin/financialStatistics?status=已使用" target="right" class="leftHref">查看日营业额统计</a></li>
            <li><i class="el-icon-menu"></i><a href="/admin/financialByseasonPage?status=已使用" target="right" class="leftHref">查看季度营业额统计</a></li>
            <li><i class="el-icon-menu"></i><a href="/admin/financialYearPage?status=已使用" target="right" class="leftHref">查看年度营业额统计</a></li>
        </ul>
    </li>

    <li><i class="el-icon-setting"></i><span onclick="f('sub_menu_4')">账号管理模块</span>
        <ul id="sub_menu_4">
            <li><i class="el-icon-menu"></i><a href="/editAdminPassword" target="right" class="leftHref">修改密码</a></li>
            <li><i class="el-icon-menu"></i><a href="/user/loginOut" target="_top" class="leftHref">退出登录</a></li>
        </ul>
    </li>
</ul>
<script type="text/javascript">
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

