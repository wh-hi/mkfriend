<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/8/5
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改信息成功</title>
    <%@include file="/pages/common/head.jsp"%>
</head>
<body bgcolor="yellow">
<%@include file="/pages/common/menu.jsp"%>
    <div align="center">
        修改信息成功，您修改信息如下：
        <table border="1">
            <tr>
                <th>新电话</th>
                <th>新email</th>
                <th>新简历和交友标准</th>
            </tr>
            <tr>
                <td>${requestScope.newPhone}</td>
                <td>${requestScope.newEmail}</td>
                <td><textarea>${requestScope.newMess}</textarea></td>
            </tr>
        </table>
    </div>

</body>
</html>
