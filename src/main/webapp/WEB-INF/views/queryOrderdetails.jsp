<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<head>
    <title>查看个人订单页面</title>
    <style>
        .orderDetailsTable{
            width: 100%;
            text-align: center;
        }
        .returnMyOrdersButton{
            width: 100px;
            height: 33px;
            border-radius: 5px;
            background-color: rgba(0,0,0,.4);
            z-index: 999;
            color:white;
            font-weight: bold;
            font-size: 15px;
        }
    </style>
</head>
<body>
    <form action="/user/queryMyOrders" method="post">
        <table class="orderDetailsTable" border=0 cellpadding="0" cellspacing="0">
            <tr style="background-color: #545c64;color: white;font-size: 25px">
                <th>房间号</th><th>楼层</th><th>房间类别</th><th>房间面积</th><th>床型</th><th>早餐</th><th>可住人数</th>
                <th>政策</th><th>网络</th><th>价格</th><th>房间图片</th><th>入住日期</th><th>退房日期</th>
            </tr>
            <c:forEach items="${orderdetailsList}" var="details" varStatus="s">
                <c:if test="${s.index%2==1}">
                <tr style="background-color: white;font-size: 20px">
                    <td>${details.room.guestRoomNumber}</td>
                    <td>${details.room.location}</td>
                    <td>${details.room.category}</td>
                    <td>${details.room.areas}</td>
                    <td>${details.room.bed}</td>
                    <td>${details.room.breakfast}</td>
                    <td>${details.room.userNumber}</td>
                    <td>${details.room.policy}</td>
                    <td>${details.room.network}</td>
                    <td>${details.room.price}</td>
                    <td><img src="/static/images/${details.room.pic}" width="100" height="100"></td>
                    <td><fmt:formatDate value="${details.inTime}" pattern="yyyy-MM-dd"/></td>
                    <td><fmt:formatDate value="${details.outTime}" pattern="yyyy-MM-dd"/></td>
                </tr>
                </c:if>
                <c:if test="${s.index%2==0}">
                    <tr style="background-color: #EEEEEE;font-size: 20px">
                        <td>${details.room.guestRoomNumber}</td>
                        <td>${details.room.location}</td>
                        <td>${details.room.category}</td>
                        <td>${details.room.areas}</td>
                        <td>${details.room.bed}</td>
                        <td>${details.room.breakfast}</td>
                        <td>${details.room.userNumber}</td>
                        <td>${details.room.policy}</td>
                        <td>${details.room.network}</td>
                        <td>${details.room.price}</td>
                        <td><img src="/static/images/${details.room.pic}" width="100" height="100"></td>
                        <td><fmt:formatDate value="${details.inTime}" pattern="yyyy-MM-dd"/></td>
                        <td><fmt:formatDate value="${details.outTime}" pattern="yyyy-MM-dd"/></td>
                    </tr>
                </c:if>
            </c:forEach>
        </table>
        <table width="100%">
            <tr>
                <td align="center"><input type="submit" class="returnMyOrdersButton" value="返回"></td>
            </tr>
        </table>

    </form>
    <script>
        function backHomePage() {
            window.location.href="/room/findRoomByExample";
        }
    </script>
</body>
</html>