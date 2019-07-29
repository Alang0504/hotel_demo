<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>修改个人信息界面</title>
    <link rel="stylesheet" href="/css/cssUser.css">
</head>
<body onload="sexChoose()">
    <form action="/user/editUserInformation" method="post" enctype="multipart/form-data">
        <div class="userDiv">
            <table class="userTable">
                <tr class="userRowOne">
                    <td>昵称</td><td><input class="userText" type="text" name="username" value="${user.username}" required="true" maxlength="32">${message}</td>
                </tr>
                <tr>
                    <td>头像</td>
                    <td>
                        <c:if test="${user.userpic!=null}">
                            <img src="/static/images/${user.userpic}" width=100 height=100/>
                            <br/>
                        </c:if>
                        <input type="file"  name="pictureFile"/>
                    </td>
                </tr>
                <tr class="userRowTwo">
                    <td>身份证</td><td><input class="userText" type="text" name="cid" value="${user.cid}" required="true" pattern="[1-8]{1}[0-7]{3}[0-9]{2}[0-9]{11}[0-9,A-Z,a-z]{1}" maxlength="18"></td>
                </tr>
                <tr class="userRowOne">
                    <td>性别<input type="hidden" id="sexValue" value="${user.sex}"></td><td><input class="userRadio" type="radio" name="sex" value="男" id="manRadio">男<input class="userRadio" type="radio" name="sex" value="女" id="womanRadio">女</td>
                </tr>
                <tr class="userRowTwo">
                    <td>生日</td><td><input class="userText" type="date" name="birthday" value="<fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/>" /></td>
                </tr>
                <tr class="userRowOne">
                    <td>联系方式</td><td><input class="userText" type="text" name="phone" value="${user.phone}" pattern="[1]{1}[3,5,7,8]{1}[0-9]{9}" required="true" maxlength="11"></td>
                </tr>
                <tr class="userRowTwo">
                    <td colspan="2" align="center"><input type="submit" value="确认修改" class="editUserButton"></td>
                </tr>
            </table>
        </div>
    </form>
    <script type="text/javascript">
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