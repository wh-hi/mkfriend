<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/8/4
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>根据姓名查找用户</title>
    <%@include file="/pages/common/head.jsp"%>
</head>
<body bgcolor="#f08080">
<%@include file="/pages/common/menu.jsp"%>
    <div align="center">
        <div style="font-size: 20px;color: red">${requestScope.msg}</div>
        <br/><br/><table border="2">
            <th>会员名</th>
            <th>电话</th>
            <th>email</th>
            <th>简历和交友标准</th>
            <th>用户照片</th>
            <tr>
                <td>${requestScope.user.username}</td>
                <td>${requestScope.user.phone}</td>
                <td>${requestScope.user.email}</td>
                <td>${requestScope.user.message}</td>
                <td><img src="http://localhost:8080/mkfriend/static/img/${requestScope.user.username}${user.pic}" width="100" height="100" alt=""/></td>
            <tr/>
        </table>
    </div>
</body>
</html>
