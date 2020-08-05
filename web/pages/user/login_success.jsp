<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/7/29
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录成功</title>
    <%@include file="/pages/common/head.jsp"%>
</head>
<body bgcolor="#ffa2a5">
<%@include file="/pages/common/menu.jsp"%>
    <div align="center" style="margin-top: 150px">
       <div class="login_success_h1">登录成功</div>
        <div class="login_success_h2">登录会员名称：${requestScope.username}</div>
    </div>
</body>
</html>
