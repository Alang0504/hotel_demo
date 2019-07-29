<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>客房首页</title>
</head>
<style>
    .roomPageHead{
        height: 10%;
        width: 100%;
    }
    .headHref{
        font-size: 20px;
    }
    .roomPageBody{
        width: 80%;
        height: 90%;
        margin: 0px auto 0px;
    }
    .roomPageDiv1{
        width: 100%;
        height: 10%;
    }
    .queryTable{
        width: 100%;
        height: 100%;
    }
    .queryTableProperty{
        width: 20%;
        height: 100%;
    }
    .roomHeadButton{
        width: 100%;
        height: 100%;
        border-radius: 5px;
        background-color: rgba(0,0,0,.4);
        z-index: 999;
        color:white;
        font-weight: bold;
        font-size: 15px;
    }
    .roomPageDiv2{
        width: 100%;
        height: 5%;
        font-size: 20px;
    }
    .queryText{
        width: 100px;
        height: 25px;
        font-weight: bolder;
        background-color: #EEEEEE;
        color:black;
        font-size: 15px;
        border-radius:10px;
        margin:0px auto 10px ;
    }
    .queryButton{
        width: 80px;
        height: 25px;
        border-radius: 5px;
        background-color: rgba(0,0,0,.4);
        z-index: 999;
        color:white;
        font-weight: bold;
        font-size: 15px;
    }
    .roomPageDiv3{
        width: 100%;
        height: 85%;
    }
    .roomTableHead{
        background-color: aquamarine;
        font-size: 20px;
        height: 5%;
    }
</style>
<body onload="elementHiding()">
<div class="roomPageHead">
    <input type="hidden" value="${userName}" id="userName" >
    <a class="headHref" href="/userPage">${userName}</a><br>
    <a class="headHref" id="myOrders" href="/user/queryMyOrders" onclick=" return userNameCheck()">我的订单</a><br>
    <a class="headHref" href="/login" id="loginHyperlink">登录/</a><a class="headHref" href="/register" id="registerHyperlink">注册</a><br>
    <a class="headHref" href="/user/loginOut" id="loginOut">退出登录</a>
</div>
<div class="roomPageBody">
    <form name="roomForm" action="/room/findRoomByExample" method="post">
        <div class="roomPageDiv1">
            <table class="queryTable">
                <tr><th class="queryTableProperty"><input class="roomHeadButton" type="button" name="category" value="首页" onclick="selectroomfour()"/></th><th class="queryTableProperty"><input class="roomHeadButton"  type="button" value="标准" name="category" onclick="selectroomOne()"/></th><th class="queryTableProperty"><input class="roomHeadButton"  type="button" name="category" value="豪华" onclick="selectroomTwo()"/></th class="queryTableProperty"><th><input class="roomHeadButton"  type="button" name="category" value="主题房" onclick="selectroomFive()"/></th><th class="queryTableProperty"><input class="roomHeadButton"  type="button" name="category" value="特价房" onclick="selectroomThree()"/></th></tr>
            </table>
        </div>
        <div class="roomPageDiv2">
            可入住人数<input type="number" step="1" min="1" max="3" name="userNumber" class="queryText" />成人
            床型<select name="bed" class="queryText">
            <option></option>
            <option>单人床</option>
            <option>双人床</option>
            <option>三人床</option>
            <option>大床</option>
        </select>
            早餐<select name="breakfast" class="queryText">
            <option></option>
            <option>无</option>
            <option>单份早餐</option>
            <option>双份早餐</option>
            <option>三份早餐</option>
        </select>
            状态<select name="roomStatus" class="queryText">
            <option></option>
            <option>空闲</option>
            <option>已订</option>
        </select>
            <input type="submit" value="搜索" class="queryButton" />
        </div>
        <div class="roomPageDiv3">
            <table width="100%" border=1>
                <tr class="roomTableHead">
                    <th>房间号</th><th>房型</th><th>房间面积</th><th>床型</th><th>早餐</th><th>可入住人数</th><th>政策</th><th>房价(含服务费)</th><th>房间照片</th><th>状态</th><th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="room">
                    <tr>
                        <td>${room.guestRoomNumber}</td>
                        <td>${room.category}</td>
                        <td>${room.areas}</td>
                        <td>${room.bed}</td>
                        <td>${room.breakfast}</td>
                        <td>${room.userNumber}</td>
                        <td>${room.policy}</td>
                        <td>${room.price}</td>
                        <td><img src="/static/images/${room.pic}" width="100" height="100"></td>
                        <td>${room.roomStatus}</td>
                        <td><a href="/orders/addOrdersPage?roomId=${room.id}" onclick="return userNameCheck('${room.roomStatus}')">预定</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="roomPageDiv4">
        <table>
            <tr>
                <td><input type="button" value="首页" onclick="firstPage()"></td>
                <td><input type="button" value="上一页" onclick="prePage()"></td>
                <td><input type="button" value="下一页" onclick="nextPage(${pageInfo.pages})"></td>
                <td><input type="hidden" id="pageNum" value="${pageInfo.pageNum}">当前页:${pageInfo.pageNum}/${pageInfo.pages}</td>
                <td><input type="button" value="尾页" onclick="lastPage(${pageInfo.pages})"></td>
                <td><input type="text" id="skip"><input type="button" value="跳转" onclick="transferPage(${pageInfo.pages})"></td>
            </tr>
        </table>
        </div>
    </form>
</div>
<script type="text/javascript">

    // 分页JS代码
    // 首页
    function firstPage() {
        var pageNum = document.getElementById("pageNum").value;
        if (pageNum==1){
            alert("当前页面已是首页");
        } else {
            window.location.href="/room/pageTest?pageNum=1";
        }
    }
    // 上一页
    function prePage() {
        var pageNum = document.getElementById("pageNum").value;
        if (pageNum==1){
            alert("当前页面已是首页");
        }else {
            pageNum = parseInt(pageNum)-1;
            window.location.href="/room/pageTest?pageNum="+pageNum;
        }
    }
    // 下一页
    function nextPage(last) {
        var pageNum = document.getElementById("pageNum").value;
        if (pageNum==last){
            alert("当前页面已是尾页");
        }else {
            pageNum = parseInt(pageNum)+1;
            window.location.href="/room/pageTest?pageNum="+pageNum;
        }
    }
    // 尾页
    function lastPage(last) {
        var pageNum = document.getElementById("pageNum").value;
        if (pageNum==last){
            alert("当前页面已是尾页");
        } else {
            window.location.href="/room/pageTest?pageNum="+last;
        }
    }
    // 跳转页
    function transferPage(last) {
        var skip = document.getElementById("skip").value;
        if (skip>last){
            window.location.href="/room/pageTest?pageNum="+last;
        }
        if (skip<1){
            window.location.href="/room/pageTest?pageNum=1";
        }
    }


    function selectroomOne() {
        // window.location.href="/findRoomByExample";
        document.roomForm.action="/room/findRoomByExample?category=标准";
        document.roomForm.submit();
    }
    function selectroomTwo() {
        // window.location.href="/findRoomByExample";
        document.roomForm.action="/room/findRoomByExample?category=豪华";
        document.roomForm.submit();
    }
    function selectroomThree() {
        // window.location.href="/findRoomByExample";
        document.roomForm.action="/room/findRoomByExample?category=特价房";
        document.roomForm.submit();
    }
    function selectroomfour() {
        // window.location.href="/findRoomByExample";
        document.roomForm.action="/room/findRoomByExample";
        document.roomForm.submit();
    }
    function selectroomFive() {
        document.roomForm.action="/room/findRoomByExample?category=主题房";
        document.roomForm.submit();
    }
    function elementHiding() {
        var loginElement = document.getElementById("loginHyperlink");
        var registerElement = document.getElementById("registerHyperlink");
        var userName = document.getElementById("userName").value;
        var loginOut = document.getElementById("loginOut");
        var myOrders = document.getElementById("myOrders");
        if (userName!=""){
            loginElement.style.display="none";
            registerElement.style.display="none";
        }
        if (userName==""){
            loginOut.style.display="none";
            myOrders.style.display="none";
        }
    }
    function userNameCheck(status) {
        var userName = document.getElementById("userName").value;
        if (userName==""){
            alert("请先登录！");
            window.location.href="/login";
            return false;
        }
        if (status=='已订'){
            alert("房间已定，请选择其他房间");
            return false;
        }
        return true;
    }
</script>
</body>
</html>