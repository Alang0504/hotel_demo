<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
</head>
    <style>
        body{
            background: url("/static/images/loginPage.jpg");
            background-size: cover;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="/css/login.css">
<body>
<div class="loginDiv">
    <form action="/user/userOrAdminLogin" method="post">
        <div class="loginDiv1">
            ${message}${loginMessage}<br>
            <select id="identity" name="ident" class="loginSelect">
                 <option>会员</option>
                <option>管理员</option>
            </select>
        </div>
        <div class="loginDiv2">
           <input type="text" placeholder="用户名/手机号/邮箱" required="true" name="userkey" class="loginText">
           <input type="password" placeholder="登录密码" required="true" name="password" class="loginText">
        </div>
        <div class="loginDiv3">
            <input type="submit" value="登录" class="loginButton">
        </div>
        <div class="loginDiv4">
            还没有账户？点击<a href="/register" onclick="return verification()" style="color: red">注册</a>
        </div>

    </form>
</div>
    <script type="text/javascript">
       function verification() {
           var identity = document.getElementById("identity").value;
           if (identity=='会员')
           {
               return true;
           }
           if (identity=='管理员')
           {
               alert("只能进行会员身份注册，请您选择会员身份再进行注册");
               return false;
           }
           return false;
       }
    </script>
</body>
</html>