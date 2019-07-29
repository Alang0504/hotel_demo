<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>员工信息</title>
    <style type="text/css">
        th{
            background-color: #545c64;
            color: white;
            font-size: 25px;
        }
        td{
            background-color: #EEEEEE;
            font-size: 20px;
        }
        .staffText{
            width: 200px;
            height: 30px;
            font-weight: bolder;
            background-color: rgba(0,0,0,.4);
            color:white;
            font-size: 15px;
            border-radius:10px;
        }
        .staffButton{
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
    <form action="/staff/editStaffById" method="post" onsubmit="return check()">
        <table width="50%" border=0 align="center">
            <tr>
                <th>姓名</th>
                <td>
                    <input type="hidden" id="employeeId" name="id" value="${staff.id}">
                    <input type="text" class="staffText" id="employeeName" required="true" name="employeeName" value="${staff.employeeName}" maxlength="16">
                </td>
            </tr>
            <tr><th>编号</th><td><input class="staffText" id="employeeNumber" required="true" type="text" name="employeeNumber" value="${staff.employeeNumber}" pattern="[1]{1}[0]{2}[1]{1}[0-9]{4}"  maxlength="8">${message}</td></tr>
            <tr><th>联系方式</th><td><input class="staffText" id="employeePhone" required="true" type="text" name="employeePhone" pattern="[1]{1}[3,5,7,8]{1}[0-9]{9}" maxlength="11" value="${staff.employeePhone}"></td></tr>
            <tr>
                <th>身份</th>
                <td>
                    <select class="staffText"  name="employeeStatus" id="employeeStatus">
                        <option>${staff.employeeStatus}</option>
                        <option>经理</option>
                        <option>前台</option>
                        <option>服务员</option>
                    </select>
                </td>
            </tr>
            <%--<input id="employeeStatus" type="text" name="employeeStatus" value="${staff.employeeStatus}">--%>
            <tr><th colspan="2" align="center"><input class="staffButton" type="submit" value="更新"></th></tr>
        </table>
    </form>
    <script type="text/javascript">
        function check() {
            var name = document.getElementById("employeeName").value;
            var number = document.getElementById("employeeNumber").value;
            var phone = document.getElementById("employeePhone").value;
            var status = document.getElementById("employeeStatus").value;
            if (name==""){
                alert("姓名不能为空");
                return false;
            }
            if (number==""){
                alert("编号不能为空")
                return false;
            }
            if (phone==""){
                alert("联系方式不能为空");
                return false;
            }
            if (status==""){
                alert("身份不能为空");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>