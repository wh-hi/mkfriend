<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

    <c:if test="${empty sessionScope.loginUser}">
        <div>
            <a href="pages/user/login.jsp">您还未登录，点击此处登录</a>
        </div>
    </c:if>
    <c:if test="${not empty sessionScope.loginUser}">
        <div class="login_success_h1">上传成功</div>
        <div class="login_success_h2">上传照片名称：${sessionScope.loginUser.pic}</div>
    </c:if>
</div>
</body>
</html>
