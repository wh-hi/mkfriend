<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/8/5
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码成功</title>
    <%@include file="/pages/common/head.jsp"%>
</head>
<body bgcolor="yellow">
<%@include file="/pages/common/menu.jsp"%>
    <div align="center">
        密码更新成功<br/>
        您的新密码为：${requestScope.newPsd}<br/>
        您的旧密码为：${requestScope.oldPsd}

    </div>
</body>
</html>
