<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>浏览会员</title>
    <%@include file="/pages/common/head.jsp"%>

</head>
<body bgcolor="aqua">
    <%@include file="/pages/common/menu.jsp"%>

    <div align="center">
        <c:if test="${ not empty sessionScope.loginUser}">
            <form action="userServlet?action=page" method="post">
                分页显示全体会员：<input type="submit"  value="显示"/><br/><br/>
            </form>
            <form action="userServlet?action=queryOne" method="post">
                    输入要查找的会员名:<input type="text" name="searchName">
                    <input type="submit"  value="显示"/>
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
