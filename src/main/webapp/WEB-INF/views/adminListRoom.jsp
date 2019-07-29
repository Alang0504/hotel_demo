<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE>
<html>
<head>
    <meta charset="UTF-8">
    <title>客房信息查看</title>
</head>
<style>
    .adminRoomHead{
        width: 100%;
        height: 5%;
        font-size: 20px;
    }
    .adminRoomBody{
        width: 100%;
        height: 80%;
    }
    .adminRoomTail{
        width: 100%;
        height: 5%;
        font-size: 20px;
    }
    .queryRoomText{
        width: 100px;
        height: 25px;
        font-weight: bolder;
        background-color: #EEEEEE;
        color:black;
        font-size: 15px;
        border-radius:10px;
    }
    .queryRoomButton{
        width: 80px;
        height: 25px;
        border-radius: 5px;
        background-color: rgba(0,0,0,.4);
        z-index: 999;
        color:white;
        font-weight: bold;
        font-size: 15px;
    }
    .adminRoomTable{
        width: 100%;
        text-align: center;
    }
    .pageTable{
        margin: 0px auto 0px;
    }
    a{
        text-decoration: none;
        margin-left: 10px;
    }
    th{
        font-size: 25px;
        background-color: #545c64;
        color: white;
    }
    td{
        font-size: 20px;
    }
</style>
<body>
    <form name="adminRoomForm" action="/room/adminFindRoomList" method="post">
        <div class="adminRoomHead">
            可入住人数<input type="number" value="${room.userNumber}" step="1" min="1" max="3" name="userNumber" class="queryRoomText" />成人
            床型<select name="bed" class="queryRoomText" >
                <option>${room.bed}</option>
                <option>单人床</option>
                <option>双人床</option>
                <option>大床</option>
                <option></option>
            </select>
            早餐<select name="breakfast" class="queryRoomText" >
                <option>${room.breakfast}</option>
                <option>无</option>
                <option>每天单早</option>
                <option>每天双早</option>
                <option></option>
            </select>
            状态<select name="roomStatus" class="queryRoomText" >
                <option>${room.roomStatus}</option>
                <option>空闲</option>
                <option>已订</option>
                <option></option>
            </select>
            <input type="submit" value="查询" class="queryRoomButton" />
        </div>
        <div class="adminRoomBody">
            <table class="adminRoomTable" border=0 cellpadding="0" cellspacing="0">
                <tr>
                    <th>房间号</th><th>房型</th><th>房间面积</th><th>床型</th><th>早餐</th><th>可入住人数</th><th>政策</th><th>房价(含服务费)</th><th>房间照片</th><th>状态</th><th>操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="room" varStatus="s">
                    <c:if test="${s.index%2==1}">
                        <tr style="background: white">
                            <td>${room.guestRoomNumber}</td>
                            <td>${room.category}</td>
                            <td>${room.areas}㎡</td>
                            <td>${room.bed}</td>
                            <td>${room.breakfast}</td>
                            <td>${room.userNumber}</td>
                            <td>${room.policy}</td>
                            <td>${room.price}</td>
                            <td><img src="/static/images/${room.pic}" width="100" height="100"></td>
                            <td>${room.roomStatus}</td>
                            <td>
                                <a href="/room/findRoomById?roomId=${room.id}">修改</a>
                                <a style="color: red" href="/room/cancelRoom?roomId=${room.id}">删除</a>
                            </td>
                        </tr>
                    </c:if>
                    <c:if test="${s.index%2==0}">
                        <tr style="background: #EEEEEE">
                            <td>${room.guestRoomNumber}</td>
                            <td>${room.category}</td>
                            <td>${room.areas}㎡</td>
                            <td>${room.bed}</td>
                            <td>${room.breakfast}</td>
                            <td>${room.userNumber}</td>
                            <td>${room.policy}</td>
                            <td>${room.price}</td>
                            <td><img src="/static/images/${room.pic}" width="100" height="100"></td>
                            <td>${room.roomStatus}</td>
                            <td>
                                <a href="/room/findRoomById?roomId=${room.id}">修改</a>
                                <a style="color: red" href="/room/cancelRoom?roomId=${room.id}">删除</a>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </table>
        </div>
        <div class="adminRoomTail">
            <table class="pageTable">
                <tr>
                    <td><input class="queryRoomButton" type="button" value="首页" onclick="firstPage()"></td>
                    <td><input class="queryRoomButton" type="button" value="上一页" onclick="prePage()"></td>
                    <td><input class="queryRoomButton" type="button" value="下一页" onclick="nextPage(${pageInfo.pages})"></td>
                    <td><input type="hidden" id="pageNum" value="${pageInfo.pageNum}">当前页:${pageInfo.pageNum}/${pageInfo.pages}</td>
                    <td><input class="queryRoomButton" type="button" value="尾页" onclick="lastPage(${pageInfo.pages})"></td>
                    <td><input class="queryRoomText" type="text" id="skip"><input class="queryRoomButton" type="button" value="跳转" onclick="transferPage(${pageInfo.pages})"></td>
                </tr>
            </table>
        </div>
    </form>
    <script type="text/javascript">
        // 分页JS代码
        // 首页
        function firstPage() {
            var pageNum = document.getElementById("pageNum").value;
            if (pageNum==1){
                alert("当前页面已是首页");
            } else {
                // window.location.href="/room/adminFindRoomList?pageNum=1";
                document.adminRoomForm.action="/room/adminFindRoomList?pageNum=1";
                document.adminRoomForm.submit();
            }
        }
        // 上一页
        function prePage() {
            var pageNum = document.getElementById("pageNum").value;
            if (pageNum==1){
                alert("当前页面已是首页");
            }else {
                pageNum = parseInt(pageNum)-1;
                // window.location.href="/room/adminFindRoomList?pageNum="+pageNum;
                document.adminRoomForm.action="/room/adminFindRoomList?pageNum="+pageNum;
                document.adminRoomForm.submit();
            }
        }
        // 下一页
        function nextPage(last) {
            var pageNum = document.getElementById("pageNum").value;
            if (pageNum==last){
                alert("当前页面已是尾页");
            }else {
                pageNum = parseInt(pageNum)+1;
                // window.location.href="/room/adminFindRoomList?pageNum="+pageNum;
                document.adminRoomForm.action="/room/adminFindRoomList?pageNum="+pageNum;
                document.adminRoomForm.submit();
            }
        }
        // 尾页
        function lastPage(last) {
            var pageNum = document.getElementById("pageNum").value;
            if (pageNum==last){
                alert("当前页面已是尾页");
            } else {
                // window.location.href="/room/adminFindRoomList?pageNum="+last;
                document.adminRoomForm.action="/room/adminFindRoomList?pageNum="+last;
                document.adminRoomForm.submit();
            }
        }
        // 跳转页
        function transferPage(last) {
            var skip = document.getElementById("skip").value;
            if (skip>last){
                // window.location.href="/room/adminFindRoomList?pageNum="+last;
                document.adminRoomForm.action="/room/adminFindRoomList?pageNum="+last;
                document.adminRoomForm.submit();
            }
            if (skip<1){
                // window.location.href="/room/adminFindRoomList?pageNum=1";
                document.adminRoomForm.action="/room/adminFindRoomList?pageNum=1";
                document.adminRoomForm.submit();
            }
            document.adminRoomForm.action="/room/adminFindRoomList?pageNum="+skip;
            document.adminRoomForm.submit();
        }
    </script>
</body>
</html>