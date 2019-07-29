<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
    <meta charset="UTF-8">
    <title>录入员工信息</title>
</head>
<style>
    .addStaffButton{
        width: 80px;
        height: 25px;
        border-radius: 5px;
        background-color: rgba(0,0,0,.4);
        z-index: 999;
        color:white;
        font-weight: bold;
        font-size: 15px;
    }
    .staffText{
        width: 150px;
        height: 25px;
        font-weight: bolder;
        background-color: #EEEEEE;
        color:black;
        font-size: 15px;
        border-radius:10px;
    }
    .staffProperty{
        background: #EEEEEE;
    }

</style>
<body>
    <form action="/staff/insertStaff" method="post" onsubmit="return check()">
        <div style="width: 300px;height: 500px;">
            <table>
                <tr>
                    <td class="staffProperty">员工姓名:</td><td><input class="staffText" type="text" id="employeeName" required="true"  name="employeeName" maxlength="16">${message}</td>
                </tr>
                <tr>
                    <td class="staffProperty">员工编号:</td><td><input class="staffText" id="employeeNumber" type="text" required="true" name="employeeNumber"  pattern="[1]{1}[0]{2}[1]{1}[0-9]{4}"  maxlength="8"></td>
                </tr>
                <tr>
                    <td class="staffProperty">员工手机:</td><td><input class="staffText" id="employeePhone" type="text" required="true" name="employeePhone" pattern="[1]{1}[3,5,7,8]{1}[0-9]{9}" maxlength="11"></td>
                </tr>
                <tr>
                    <td class="staffProperty">员工身份:</td>
                    <td>
                        <select name="employeeStatus" id="employeeStatus" class="staffText">
                            <option></option>
                            <option>服务员</option>
                            <option>前台</option>
                            <option>经理</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="提交" class="addStaffButton"></td>
                </tr>
            </table>
        </div>
    </form>
    <script type="text/javascript">
        function check() {
            var status = document.getElementById("employeeStatus").value;
            if (status==""){
                alert("身份不能为空");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>