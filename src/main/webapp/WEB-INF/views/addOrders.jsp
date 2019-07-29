<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>添加订单页面</title>
</head>
<style>
    .orderButton{
        width: 100px;
        height: 33px;
        border-radius: 5px;
        background-color: rgba(0,0,0,.4);
        z-index: 999;
        color:white;
        font-weight: bold;
        font-size: 15px;
    }
    .orderText{
        width: 150px;
        height: 30px;
        font-weight: bolder;
        background-color: rgba(0,0,0,.4);
        color:white;
        font-size: 15px;
        border-radius:10px;
        margin:0px auto 10px ;
    }
    .orderProperty{
        background: #EEEEEE;
    }
</style>
<body>
    <div style="width: 500px;height: 300px">
        <form action="/orders/addOrderReserve" method="post">
            <table width="100%">
                <tr>
                    <td class="orderProperty">房间类型:</td><td>${room.category}</td>
                </tr>
                <tr>
                    <td class="orderProperty">床型:</td><td>${room.bed}</td>
                </tr>
                <tr>
                    <td class="orderProperty">入住日期:</td><td><input class="orderText" id="inTime" required="true" type="date" name="inTime"></td>
                </tr>
                <tr>
                    <td class="orderProperty">退房日期:</td><td><input class="orderText" id="outTime" onchange="check()" required="true" type="date" name="outTime" onclick="count()"></td>
                </tr>
                <tr>
                    <td class="orderProperty">订单价格:</td>
                    <td>
                        <input type="hidden" name="number" value="${number}">
                        <input type="hidden" id="hidden_orderPrice" value="${room.price}">
                        <input style="border: 0;" type="text" id="orderPrice" name="orderPrice" value="${room.price}" readonly="ture">
                    </td>
                </tr>
                <tr>
                    <td class="orderProperty">备注:</td>
                    <td>
                        <input type="hidden" name="room_Id" value="${room.id}">
                        <input type="hidden" name="status" value="待使用">
                        <textarea cols="20" rows="5" name="note"></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="提交订单" class="orderButton"><td>
                </tr>
            </table>
        </form>
    </div>
    <script type="text/javascript">
        function check() {
            var date=0;
            var price=0;
            var inTime = document.getElementById("inTime").value;
            var outTime = document.getElementById("outTime").value;
            var date1 = new Date(inTime);
            var date2 = new Date(outTime);
            if (inTime!=null&&outTime!=null){
                date = (date2.getTime()-date1.getTime())/(24*60*60*1000);
                var orderPrice = document.getElementById("hidden_orderPrice").value;
                price = orderPrice*date;
            }
            document.getElementById("orderPrice").value=price;
        }
    </script>
</body>
</html>