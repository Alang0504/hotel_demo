<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户修改密码</title>
    <link rel="stylesheet" href="/css/password.css">
</head>
<body>
    <div class="editPasswordDiv">
        <form action="/user/editUserPassword" method="post" onsubmit="return check()" target="_top">
            <table>
                <tr>
                    <td class="editProperty">原始密码:</td><td><input class="editText" type="password" required="true" maxlength="16" value="${originalPassword}" id="originalPassword"  name="originalPassword">${message}</td>
                </tr>
                <tr>
                    <td class="editProperty">新密码:</td><td><input class="editText" type="password" required="true" maxlength="16" value="${user.password}" id="password"></td>
                </tr>
                <tr>
                    <td class="editProperty">确认密码:</td><td><input class="editText" type="password" required="true" maxlength="16" value="${user.password}" id="confirmPassword" name="password"></td>
                </tr>
                <tr>
                    <td class="editProperty" colspan="2" align="center"><input type="submit" value="确认修改" class="editPasswordButton"></td>
                </tr>
            </table>
        </form>
    </div>
    <script type="text/javascript">
        function check() {
            var originalPassword = document.getElementById("originalPassword").value;
            var passWord = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            if (passWord!=confirmPassword){
                alert("前后两次密码不一致");
                return false;
            }
            if (originalPassword==passWord){
                alert("新密码不能与原始密码一样");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>