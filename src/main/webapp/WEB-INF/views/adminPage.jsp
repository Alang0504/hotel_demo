<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理首页</title>
</head>
<%--<frameset cols="15%,*">--%>
    <%--<frame name="left" src="leftAdmin">--%>
    <%--<frame name="right" src="rightAdmin">--%>
<%--</frameset>--%>
<frameset rows="15%,*" >
    <frame noresize="noresize" name="top" src="/admin/topAdmin">
    <frame noresize="noresize" name="bottom" src="/bottomAdmin">
</frameset>
</html>