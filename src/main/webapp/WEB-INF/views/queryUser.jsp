<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<head>
    <title>查看个人信息界面</title>
    <link rel="stylesheet" href="/css/cssUser.css">
</head>
<body>
    <div class="userDiv">
        <table class="userTable">
            <tr class="userRowOne">
                <td>昵&nbsp;&nbsp;&nbsp;&nbsp;称</td><td>${user.username}</td>
            </tr>
            <tr class="userRowTwo">
                <td>头&nbsp;&nbsp;&nbsp;&nbsp;像</td><td><img src="/static/images/${user.userpic}" width=100 height=100/></td>
            </tr>
            <tr class="userRowOne">
                <td>身&nbsp;份&nbsp;证</td><td>${user.cid}</td>
            </tr>
            <tr class="userRowTwo">
                <td>等&nbsp;&nbsp;&nbsp;&nbsp;级</td><td>${user.identity}</td>
            </tr>
            <tr class="userRowOne">
                <td>性&nbsp;&nbsp;&nbsp;&nbsp;别</td><td>${user.sex}</td>
            </tr>
            <tr class="userRowTwo">
                <td>生&nbsp;&nbsp;&nbsp;&nbsp;日</td><td><fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/></td>
            </tr>
            <tr class="userRowOne">
                <td>联系方式</td><td>${user.phone}</td>
            </tr>
        </table>
    </div>
</body>
</html>