<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<head>
    <title>查看个人订单页面</title>
</head>
<style>
    .orderBodyDiv{
        width: 100%;
        height: 100%;
    }
    .ordersTable{
        width: 100%;
        text-align: center;
        font-size: 20px;
    }
    a{
        /*去掉下划线*/
        text-decoration: none;
    }
</style>
<body>
        <%--<input type="hidden" value="${message}" id="policy">--%>
    <div class="orderBodyDiv">
    <form>
        ${message}${messageTwo}
        <table class="ordersTable" border=0 cellpadding="0" cellspacing="0">
            <tr style="background-color: #545c64;color: white;font-size: 25px">
                <th>订单号</th><th>下单时间</th><th>订单价格</th><th>订单状态</th><th>备注</th><th>明细</th><th>操作</th>
            </tr>
            <c:forEach items="${ordersList}" var="orders" varStatus="s">
                <c:if test="${s.index%2==1}">
                    <tr style="background: white">
                        <td>${orders.number}</td>
                        <td><fmt:formatDate value="${orders.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                        <td>${orders.orderPrice}</td>
                        <td>${orders.status}</td>
                        <td>${orders.note}</td>
                        <td><a href="/orders/findOrdersdetails?ordersId=${orders.id}">订单明细</a></td>
                        <td>
                            <c:if test="${orders.status=='待使用'}">
                                <a href="/orders/cancellationOrders?ordersId=${orders.id}">取消订单</a>
                            </c:if>
                        </td>
                    </tr>
                </c:if>
                <c:if test="${s.index%2==0}">
                <tr style="background: #EEEEEE">
                    <td>${orders.number}</td>
                    <td><fmt:formatDate value="${orders.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>${orders.orderPrice}</td>
                    <td>${orders.status}</td>
                    <td>${orders.note}</td>
                    <td><a href="/orders/findOrdersdetails?ordersId=${orders.id}">订单明细</a></td>
                    <td>
                        <c:if test="${orders.status=='待使用'}">
                        <a href="/orders/cancellationOrders?ordersId=${orders.id}">取消订单</a>
                        </c:if>
                    </td>
                </tr>
                </c:if>
            </c:forEach>
        </table>
    </form>
    </div>
</body>
</html>