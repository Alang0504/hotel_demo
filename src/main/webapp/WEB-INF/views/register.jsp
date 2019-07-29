<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>会员注册页面</title>
</head>
<style>
    body{
        background: url("/static/images/register.jpg");
        background-size: cover;
    }
    .registerDiv{
        width: 500px;
        height: 600px;
        position: absolute;
        top: 20%;
        left: 10%;
        background-color: rgba(0,0,0,.4);
    }
    .registerTable{
        width: 100%;
        height: 100%;
    }
    .tableHead{
        width: 100%;
        height: 10%;
        text-align:center ;
        color: beige;
        font-size: 25px;
    }
    .tableProperty{
        width: 20%;
        height: 9%;
        font-size:20px ;
        color: beige;
    }
    .tableValue{
        width: 70%;
        height: 9%;
        font-size: 20px;
        color: beige;
    }
    .registerText{
        width: 250px;
        height: 35px;
        font-weight: bolder;
        background-color: rgba(0,0,0,.2);
        color:white;
        font-size: 15px;
        border-radius:10px;
    }
    .registerRadio{
        width: 20px;
        height: 20px;
    }
    .tableTail{
        width: 100%;
        height: 9%;
        text-align:center ;
        color: beige;
        font-size: 25px;
    }
    .registerButton{
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
<body onload="sexChoose()">
    <div class="registerDiv">
        <form action="/user/addUserRegister" method="post" onsubmit="return check()" enctype="multipart/form-data">
            <table class="registerTable">
                <tr>
                    <td class="tableHead" colspan="2">会员注册</td>
                </tr>
                <tr>
                    <td class="tableProperty">昵&nbsp;&nbsp;&nbsp;&nbsp;称:</td><td class="tableValue"><input class="registerText" type="text" name="username" value="${user.username}"  required="true" maxlength="32">${nameMessage}</td>
                </tr>
                <tr>
                    <td class="tableProperty">头&nbsp;&nbsp;&nbsp;&nbsp;像</td><td><input type="file"  name="pictureFile"/></td>
                </tr>
                <tr>
                    <td class="tableProperty">账&nbsp;&nbsp;&nbsp;&nbsp;号:</td><td class="tableValue"><input class="registerText" type="text" name="userkey" value="${user.userkey}" required="true" maxlength="24">${keyMessage}</td>
                </tr>
                <tr>
                    <td class="tableProperty">密&nbsp;&nbsp;&nbsp;&nbsp;码:</td><td class="tableValue"><input class="registerText" type="password" id="password" name="password" value="${user.password}" required="true" maxlength="16"></td>
                </tr>
                <tr>
                    <td class="tableProperty">确认密码:</td><td class="tableValue"><input class="registerText" type="password" id="confirmPassword" value="${user.password}" required="true" maxlength="16"></td>
                </tr>
                <tr>
                    <td class="tableProperty">身&nbsp;份&nbsp;证:</td><td class="tableValue"><input class="registerText" type="text" name="cid" value="${user.cid}" required="true" pattern="[1-8]{1}[0-7]{3}[0-9]{2}[0-9]{11}[0-9,A-Z,a-z]{1}" maxlength="18"></td>
                </tr>
                <tr>
                    <td class="tableProperty">性&nbsp;&nbsp;&nbsp;&nbsp;别:<input type="hidden" id="sexValue" value="${user.sex}"></td><td class="tableValue"><input class="registerRadio" type="radio" name="sex" value="男" id="manRadio">男<input class="registerRadio" type="radio" name="sex" value="女" id="womanRadio">女</td>
                </tr>
                <tr>
                    <td class="tableProperty">生&nbsp;&nbsp;&nbsp;&nbsp;日:</td><td class="tableValue"><input class="registerText" type="date" name="birthday" value="<fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/>" /></td>
                </tr>
                <tr>
                    <td class="tableProperty">联系电话:</td><td class="tableValue"><input class="registerText" type="text" value="${user.phone}" name="phone" pattern="[1]{1}[3,5,7,8]{1}[0-9]{9}" required="true" maxlength="11"></td>
                </tr>
                <tr><td colspan="2" class="tableTail"><input class="registerButton" type="submit" value="注册"></td></tr>
            </table>
        </form>
    </div>
    <script type="text/javascript">
        function check() {
            var passWord = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            if (passWord!=confirmPassword){
                alert("前后两次密码不一致");
                return false
            }
            return true;
        }
        function sexChoose() {
            var sex = document.getElementById("sexValue").value;
            var manRadio = document.getElementById("manRadio");
            var womanRadio = document.getElementById("womanRadio");
            if (sex=='男'){
                manRadio.click();
            }
            if (sex=='女'){
                womanRadio.click();
            }
        }
    </script>
</body>
</html>