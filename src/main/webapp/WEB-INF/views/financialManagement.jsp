<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="UTF-8">
    <title>营业额管理页面</title>
    <style type="text/css">
        .financialText{
            width: 200px;
            height: 30px;
            font-weight: bolder;
            background-color: rgba(0,0,0,.4);
            color:white;
            font-size: 15px;
            border-radius:10px;
        }
        .financialButton{
            width: 100px;
            height: 30px;
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
    <div style="width: 500px;height: 300px;margin: 0px auto 0px;font-size: 25px">
        <form action="/admin/financialStatistics?status=已使用" method="post">
            <table>
                <tr>
                    <td>下单时间</td><td><input class="financialText" type="date" name="createtime"></td><td><input class="financialButton" type="submit" value="查询"></td>
                </tr>
            </table >
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr style="background-color: #545c64;color: white;font-size: 25px">
                    <td>订单号</td><td>下单时间</td><td>价格</td>
                </tr>
                <c:forEach items="${ordersList}" var="orders" varStatus="s">
                    <c:if test="${s.index%2==1}">
                        <tr style="background-color: white;font-size: 20px">
                            <td>${orders.number}</td><td><fmt:formatDate value="${orders.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td><td>${orders.orderPrice}元</td>
                        </tr>
                    </c:if>
                    <c:if test="${s.index%2==0}">
                        <tr style="background-color: #EEEEEE;font-size: 20px">
                            <td>${orders.number}</td><td><fmt:formatDate value="${orders.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td><td>${orders.orderPrice}元</td>
                        </tr>
                    </c:if>
                </c:forEach>
                <tr style="background-color: #545c64;font-size: 20px;color: white">
                    <td colspan="2">总数</td><td>${sumprice}元</td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>