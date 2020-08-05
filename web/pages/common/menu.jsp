<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/7/28
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<span><h1 align="center">网络交友</h1></span>
<table align="center" width="1200" id="menu">
    <tr>
        <td><a href="pages/user/register.jsp"><h3>会员注册</h3></a></td>
        <td><a href="pages/user/login.jsp"><h3>会员登录</h3></a></td>
        <td><a href="pages/operation/uploadphoto.jsp"><h3>上传照片</h3></a></td>
        <td><a href="pages/operation/lookvip.jsp"><h3>浏览会员</h3></a></td>
        <td><a href="pages/operation/updateMess.jsp "><h3>修改注册信息</h3></a></td>
        <td><a href="pages/operation/changePassword.jsp"><h3>修改密码</h3></a></td>
        <td><a href="userServlet?action=logout"><h3>退出登录</h3></a></td>
        <td><a href="index.jsp"><h3>返回主页</h3></a></td>
    </tr>

</table>
