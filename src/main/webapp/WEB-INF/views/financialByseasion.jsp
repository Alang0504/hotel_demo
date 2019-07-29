<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="UTF-8">
    <title>季度营业额管理页面</title>
    <style type="text/css">
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
    <form name="seasionForm" method="post">
        <div style="width: 500px;height: 300px;margin: 0px auto 0px;font-size: 25px">
                <table>
                    <tr>
                        <td><input class="financialButton" type="button" value="春季" onclick="selectSpring()"></td>
                        <td><input class="financialButton" type="button" value="夏季" onclick="selectSummer()"></td>
                        <td><input class="financialButton" type="button" value="秋季" onclick="selectAutumn()"></td>
                        <td><input class="financialButton" type="button" value="冬季" onclick="selectWinter()"></td>
                        <td><input type="hidden" name="oneCreatetime" id="one"></td>
                        <td><input type="hidden" name="twoCreatetime" id="two"></td>
                        <td><input type="hidden" name="threeCreatetime" id="three"></td>
                    </tr>
                </table >
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr style="background-color: #545c64;font-size: 25px;color: white">
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
                    <tr style="background-color: #545c64;color: white;font-size: 20px">
                        <td colspan="2">总数</td><td>${sumprice}元</td>
                    </tr>
                </table>
        </div>
    </form>
    <script type="text/javascript">
        function selectSpring() {
            document.getElementById("one").value="%-03-%";
            document.getElementById("two").value="%-04-%";
            document.getElementById("three").value="%-05-%";
            document.seasionForm.action="/admin/financialBySeason?status=已使用";
            document.seasionForm.submit();
        }
        function selectSummer() {
            document.getElementById("one").value="%-06-%";
            document.getElementById("two").value="%-07-%";
            document.getElementById("three").value="%-08-%";
            document.seasionForm.action="/admin/financialBySeason?status=已使用";
            document.seasionForm.submit();
        }
        function selectAutumn() {
            document.getElementById("one").value="%-09-%";
            document.getElementById("two").value="%-10-%";
            document.getElementById("three").value="%-11-%";
            document.seasionForm.action="/admin/financialBySeason?status=已使用";
            document.seasionForm.submit();
        }
        function selectWinter() {
            document.getElementById("one").value="%-12-%";
            document.getElementById("two").value="%-01-%";
            document.getElementById("three").value="%-02-%";
            document.seasionForm.action="/admin/financialBySeason?status=已使用";
            document.seasionForm.submit();
        }
    </script>
</body>
</html>