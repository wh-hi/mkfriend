<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/7/29
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆</title>
    <%@include file="/pages/common/head.jsp"%>
</head>
<body bgcolor="#ffa2a5" >
    <%@include file="/pages/common/menu.jsp"%>
    <div id="login_form" align="center"><br/><br/>
        <span class="errorMsg" style="color: red">
            ${empty requestScope.msg ? "请输入用户名和密码":requestScope.msg}
        </span>
        <form action="userServlet" method="post" >
            <input type="hidden" name="action" value="login" />
            <table border="1px">
                <tr>
                    <td align="center" colspan="2"><h3>请您登陆</h3><td/>
                </tr>
                <tr>
                    <td>登陆名称：</td>
                    <td><input type="text" placeholder="请输入用户名"  name="username" id="username"/></td>
                </tr>
                <tr>
                    <td>输入密码：</td>
                    <td><input type="password" placeholder="请输入密码" name="password" id="password"/></td>
                </tr>
            </table><br/>
            <input type="submit" value="登陆" >
        </form>
    </div>
</body>
</html>
