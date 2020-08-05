<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/8/5
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改注册信息</title>
    <%@include file="/pages/common/head.jsp"%>

</head>
<body bgcolor="#ff69b4">
<%@include file="/pages/common/menu.jsp"%>
<div align="center" style="color: lightcoral">
    <c:if test="${not empty sessionScope.loginUser}">
        <form action="userServlet?action=updateMess" method="post">
            <table border="0">
                <tr>
                    <td>新联系电话：</td>
                    <td><input type="text"  name="newPhone"/></td>
                </tr>
                <tr>
                    <td>新电子邮件：</td>
                    <td><input type="text" name="newEmail"/></td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>新简历和交友标准：</td>
                </tr>
                <tr>
                    <td><TextArea name="newMessage" Rows="6" Cols="30"></TextArea></td>
                </tr>
                <tr>
                    <td><Input type="submit" id="sub_update" value="提交修改"></td>
                </tr>
                <tr>
                    <td><Input type="reset" value="重置"></td>
                </tr>
            </table>
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
