<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/7/28
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册成功</title>
    <%@include file="/pages/common/head.jsp"%>
</head>
<body bgcolor="aqua">
    <%@include file="/pages/common/menu.jsp"%>
    <div id="register_success" align="center">
        <span>注册成功!</span><br/><br/>
        <div>
            <table>
                <tr>
                    <td>注册的会员名称:</td>
                    <td>${requestScope.username}</td>
                </tr>
                <tr>
                    <td>注册的电子邮件::</td>
                    <td>${requestScope.email}</td>
                </tr
                ><tr>
                <td>注册的联系电话::</td>
                <td>${requestScope.phone}</td>
                </tr>
            </table>
            您的简历和交友标准:<br>
            <textarea id="message">${requestScope.message}</textarea>
        </div>
    </div>
</body>
</html>
