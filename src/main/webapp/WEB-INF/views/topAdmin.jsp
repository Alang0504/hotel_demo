<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <style>
        body{
            background-color: #545c64;
        }
        .adminTopDiv{
            width: 100px;
            height: 100px;
            border-radius: 250px;
            overflow: hidden;
            margin-left: 90%;
            background-color: white;
        }
        img{
            width: 100px;
            height: 100px;
            border-radius: 250px;
        }
    </style>
</head>
<body>
    <div class="adminTopDiv">
        <img src="/static/images/${adminPic}">
    </div>
</body>
</html>