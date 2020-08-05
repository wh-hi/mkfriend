<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/8/5
  Time: 9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <%@include file="/pages/common/head.jsp"%>
</head>
<body bgcolor="aqua">
    <%@include file="/pages/common/menu.jsp"%>
    <div align="center" style="color: red;font-size: 20px">
        ${requestScope.msg}
    </div>
    <br/><br/>
    <div align="center">
        <c:if test="${not empty sessionScope.loginUser}">
            <form action="userServlet?action=changePassword" method="post">
                <table border="0" style="text-align: center">
                    <tr>
                        <td>当前密码:</td>
                        <td><input type="password" name="password"/></td>
                    </tr>
                    <tr>
                        <td>新密码:</td>
                        <td><input type="password" name="newPassword"/></td>
                    </tr>
                </table>
                <input type="submit" value="提交"/>
            </form>

        </c:if>
        <c:if test="${empty sessionScope.loginUser}">
            <div>
                <a href="pages/user/login.jsp">您还未登录，点击此处登录</a>
            </div>
        </c:if>
    </div>
</body>
</html>
