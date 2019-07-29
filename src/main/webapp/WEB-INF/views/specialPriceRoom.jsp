
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>特价房首页</title>
</head>
<style>
    .roomPageHead{
        background-color: #545c64;
        height: 10%;
        width: 100%;
    }
    .roomPageHead1{
        height: 90px;
        width: 90px;
        border-radius: 250px;
        float: left;
        overflow: hidden;
        background-color: white;
    }
    .userPic{
        height: 90px;
        width: 90px;
        border-radius: 250px;
    }
    .roomPageHead2{
        height: 10%;
        width: 90%;
        float: left;
        text-align: right;
    }
    .headHref{
        color: #ffffff;
        font-size: 20px;
        text-decoration: none;
    }
    .roomPageBody{
        width: 100%;
        height: 90%;
        margin: 0px auto 0px;
        clear: both;
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
        height: 80%;
    }
    .roomTable{
        width: 100%;
    }
    .roomTableHead{
        background-color: #545c64;
        font-size: 20px;
        height: 5%;
        color: white;
    }
    .roomTableBody{
        height: 19%;
        text-align: center;
    }
    .roomPageDiv4{
        text-align: center;
        width: 100%;
        height: 5%;
    }
    .pageTable{
        margin: 0px auto 0px;
    }
    #odd{
        background: white;
    }
    #even{
        background: #EEEEEE;
    }
</style>
<body onload="elementHiding()">
<div class="roomPageHead">
    <input type="hidden" value="${userName}" id="userName" >
    <div class="roomPageHead1" id="myPerson">
        <a class="headHref" href="/userPage"><img class="userPic" src="/static/images/${userPic}"></a>
    </div>
    <div class="roomPageHead2">
        <a class="headHref" href="/login" id="loginHyperlink">登录/</a><a class="headHref" href="/register" id="registerHyperlink">注册</a>
        <a class="headHref" href="/user/loginOut" id="loginOut">退出登录</a>
    </div>
</div>
<div class="roomPageBody">
    <form name="roomForm" action="/room/findRoomByExample?category=特价房" method="post">
        <div class="roomPageDiv1">
            <table class="queryTable">
                <tr><th class="queryTableProperty"><input class="roomHeadButton" type="button" name="category" value="首页" onclick="selectroomfour()"/></th><th class="queryTableProperty"><input class="roomHeadButton"  type="button" value="标准" name="category" onclick="selectroomOne()"/></th><th class="queryTableProperty"><input class="roomHeadButton"  type="button" name="category" value="豪华" onclick="selectroomTwo()"/></th class="queryTableProperty"><th><input class="roomHeadButton"  type="button" name="category" value="主题房" onclick="selectroomFive()"/></th><th class="queryTableProperty"><input class="roomHeadButton"  type="button" name="category" value="特价房" onclick="selectroomThree()"/></th></tr>
            </table>
        </div>
        <div class="roomPageDiv2">
            可入住人数<input type="number" value="${room.userNumber}" step="1" min="1" max="3" name="userNumber" class="queryText" />成人
            床型<select name="bed" class="queryText">
            <option>${room.bed}</option>
            <option>单人床</option>
            <option>双人床</option>
            <option>大床</option>
            <option></option>
        </select>
            早餐<select name="breakfast" class="queryText">
            <option>${room.breakfast}</option>
            <option>无</option>
            <option>每天单早</option>
            <option>每天双早</option>
            <option></option>
        </select>
            状态<select name="roomStatus" class="queryText">
            <option>${room.roomStatus}</option>
            <option>空闲</option>
            <option>已订</option>
            <option></option>
        </select>
            <input type="submit" value="搜索" class="queryButton" />
            <input type="button" value="预定" class="queryButton" onclick="addOrders()"/>
        </div>
        <div class="roomPageDiv3">
            <table class="roomTable" border=0 cellpadding="0" cellspacing="0">
                <tr class="roomTableHead">
                    <th>房间号</th><th>房型</th><th>面积</th><th>床型</th><th>早餐</th><th>入住人数</th><th>政策</th><th>房价(含服务费)</th><th>房间照片</th><th>状态</th><th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="room" varStatus="s">
                    <c:if test="${s.index%2==0}">
                        <tr class="roomTableBody" id="even">
                            <td width="10%"><input type="checkbox" name="id" value="${room.id}">${room.guestRoomNumber}<input id="room[${s.index}].status" type="hidden" value="${room.roomStatus}" /></td>
                            <td width="10%">${room.category}</td>
                            <td width="5%">${room.areas}㎡</td>
                            <td width="5%">${room.bed}</td>
                            <td width="5%" style="color: forestgreen">${room.breakfast}</td>
                            <td width="10%">${room.userNumber}成人</td>
                            <td width="10%">${room.policy}</td>
                            <td width="15%" style="color: red;font-size: 20px">¥${room.price}</td>
                            <td width="20%"><img src="/static/images/${room.pic}" class="roomPic" width="296" height="115"></td>
                            <c:if test="${room.roomStatus=='空闲'}">
                                <td width="5%" style="color: forestgreen">${room.roomStatus}</td>
                                <td width="5%"><a href="/orders/addOrdersPage?roomId=${room.id}" onclick="return userNameCheck('${room.roomStatus}')"><img src="/static/images/reserve.jpg" /></a></td>
                            </c:if>
                            <c:if test="${room.roomStatus=='已订'}">
                                <td width="5%" style="color: red">${room.roomStatus}</td>
                                <td width="5%"><a href="/orders/addOrdersPage?roomId=${room.id}" onclick="return userNameCheck('${room.roomStatus}')"><img src="/static/images/reserve.jpg" /></a></td>
                            </c:if>
                        </tr>
                    </c:if>
                    <c:if test="${s.index%2==1}">
                        <tr class="roomTableBody" id="odd">
                            <td width="10%"><input type="checkbox" name="id" value="${room.id}">${room.guestRoomNumber}<input id="room[${s.index}].status" type="hidden" value="${room.roomStatus}" /></td>
                            <td width="10%">${room.category}</td>
                            <td width="5%">${room.areas}㎡</td>
                            <td width="5%">${room.bed}</td>
                            <td width="5%" style="color: forestgreen">${room.breakfast}</td>
                            <td width="10%">${room.userNumber}成人</td>
                            <td width="10%">${room.policy}</td>
                            <td width="15%" style="color: red;font-size: 20px">¥${room.price}</td>
                            <td width="20%"><img src="/static/images/${room.pic}" class="roomPic" width="296" height="115"></td>
                            <c:if test="${room.roomStatus=='空闲'}">
                                <td width="5%" style="color: forestgreen">${room.roomStatus}</td>
                                <td width="5%"><a href="/orders/addOrdersPage?roomId=${room.id}" onclick="return userNameCheck('${room.roomStatus}')"><img src="/static/images/reserve.jpg" /></a></td>
                            </c:if>
                            <c:if test="${room.roomStatus=='已订'}">
                                <td width="5%" style="color: red">${room.roomStatus}</td>
                                <td width="5%"><a href="/orders/addOrdersPage?roomId=${room.id}" onclick="return userNameCheck('${room.roomStatus}')"><img src="/static/images/reserve.jpg" /></a></td>
                            </c:if>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </div>
        <div class="roomPageDiv4">
            <table class="pageTable">
                <tr>
                    <td><input class="queryButton" type="button" value="首页" onclick="firstPage()"></td>
                    <td><input class="queryButton" type="button" value="上一页" onclick="prePage()"></td>
                    <td><input class="queryButton" type="button" value="下一页" onclick="nextPage(${pageInfo.pages})"></td>
                    <td><input type="hidden" id="pageNum" value="${pageInfo.pageNum}">当前页:${pageInfo.pageNum}/${pageInfo.pages}</td>
                    <td><input class="queryButton" type="button" value="尾页" onclick="lastPage(${pageInfo.pages})"></td>
                    <td><input class="queryText" type="text" id="skip"></td>
                    <td><input class="queryButton" type="button" value="跳转" onclick="transferPage(${pageInfo.pages})"></td>
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
            document.roomForm.action="/room/findRoomByExample?category=特价房"+"&pageNum=1";
            document.roomForm.submit();
        }
    }
    // 上一页
    function prePage() {
        var pageNum = document.getElementById("pageNum").value;
        if (pageNum==1){
            alert("当前页面已是首页");
        }else {
            pageNum = parseInt(pageNum)-1;
            document.roomForm.action="/room/findRoomByExample?category=特价房"+"&pageNum="+pageNum;
            document.roomForm.submit();
        }
    }
    // 下一页
    function nextPage(last) {
        var pageNum = document.getElementById("pageNum").value;
        if (pageNum==last){
            alert("当前页面已是尾页");
        }else {
            pageNum = parseInt(pageNum)+1;
            document.roomForm.action="/room/findRoomByExample?category=特价房"+"&pageNum="+pageNum;
            document.roomForm.submit();
        }
    }
    // 尾页
    function lastPage(last) {
        var pageNum = document.getElementById("pageNum").value;
        if (pageNum==last){
            alert("当前页面已是尾页");
        } else {
            document.roomForm.action="/room/findRoomByExample?category=特价房"+"&pageNum="+last;
            document.roomForm.submit();
        }
    }
    // 跳转页
    function transferPage(last) {
        var skip = document.getElementById("skip").value;
        if (skip>last){
            document.roomForm.action="/room/findRoomByExample?category=特价房"+"&pageNum="+last;
            document.roomForm.submit();
        }
        if (skip<1){
            document.roomForm.action="/room/findRoomByExample?category=特价房"+"&pageNum=1";
            document.roomForm.submit();
        }
        document.roomForm.action="/room/findRoomByExample?pageNum="+skip;
        document.roomForm.submit();
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
        var myPerson = document.getElementById("myPerson");
        if (userName!=""){
            loginElement.style.display="none";
            registerElement.style.display="none";
        }
        if (userName==""){
            loginOut.style.display="none";
            myPerson.style.display="none";
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
    function addOrders() {
        var obj = document.getElementsByName("id");
        for (var i=0;i<obj.length;i++){
            if (obj[i].checked){
                var status = "room["+i+"].status";
                var status1 = document.getElementById(status).value;
                if (status1=='已订'){
                    alert("选中的房间中存在已订的房间");
                    return false;
                }
            }
        }
        document.roomForm.action="/orders/addOrdersList";
        document.roomForm.submit();
        return true;
    }
</script>
</body>
</html>










