<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>员工信息</title>
    <style type="text/css">
        a{
            /*去掉超链接下划线*/
            text-decoration: none;
            margin-left: 10px;
        }
        .staffTable{
            width: 100%;
            font-size: 25px;
            text-align: center;
        }
    </style>
</head>
<body>
    <table class="staffTable" border=0 cellpadding="0" cellspacing="0">
        <tr style="background-color: #545c64"><th>姓名</th><th>编号</th><th>联系方式</th><th>身份</th><th>操作</th></tr>
        <c:forEach items="${staffList}" var="staff" varStatus="s">
        <c:if test="${s.index%2==1}">
            <tr style="background-color: white;font-size: 20px">
                <td>${staff.employeeName}</td>
                <td>${staff.employeeNumber}</td>
                <td>${staff.employeePhone}</td>
                <td>${staff.employeeStatus}</td>
                <td><a href="/staff/findStaffById?id=${staff.id}">修改</a><a style="color: red" href="/staff/cancelStaffByid?id=${staff.id}">删除</a></td>
            </tr>
        </c:if>
        <c:if test="${s.index%2==0}">
            <tr style="background-color: #EEEEEE;font-size: 20px">
                <td>${staff.employeeName}</td>
                <td>${staff.employeeNumber}</td>
                <td>${staff.employeePhone}</td>
                <td>${staff.employeeStatus}</td>
                <td><a href="/staff/findStaffById?id=${staff.id}">修改</a><a style="color: red" href="/staff/cancelStaffByid?id=${staff.id}">删除</a></td>
            </tr>
        </c:if>
        </c:forEach>
    </table>
</body>
</html>