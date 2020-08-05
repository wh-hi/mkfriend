<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/7/28
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <%@include file="/pages/common/head.jsp" %>
    <script type="text/javascript">
        $(function () {
            $("#sub_btn").click(function () {
                // 验证用户名：必须由字母，数字下划线组成，并且长度为 5 到 12 位
                var reg = /^\w{5,12}$/;
                var usernameval = $("#username").val();
                if (!reg.test(usernameval)){
                    $("span.errorMsg").text("用户名不合法，需由字母，数字下划线组成，并且长度为 5 到 12 位！");
                    return false;
                }
                // 验证密码：必须由字母，数字下划线组成，并且长度为 5 到 12 位
                var passwordval = $("#password").val();
                if (!reg.test(passwordval)){
                    $("span.errorMsg").text("密码不合法，须由字母，数字下划线组成，并且长度为 5 到 12 位！");
                    return false;
                }
                // 邮箱验证：xxxxx@xxx.com
                var emailreg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
                var emailval = $("#eamil").val();
                if(!emailreg.test(emailval)){
                    $("span.errorMsg").text("邮箱不合法！");
                    return false;
                }
                //电话验证:只能为数字
                var phonereg = /^\d{7,11}$/;
                var phoneval = $("#phone").val();
                if(phonereg.test(phoneval)){
                    $("span.errorMsg").text("电话号码不合法!");
                }
                $("span.errorMsg").text("");
            });
        });
    </script>
</head>
<body bgcolor="aqua">
    <%@include file="/pages/common/menu.jsp"%>
    <div id="form" align="center">
        <label>请输入您的信息，会员名字必须由字母或数字组成，带*号项必须填写</label><br/><br/>

            <span class="errorMsg" style="color: red">
                ${requestScope.msg}
            </span><br/>

        <form action="userServlet" method="post">
            <input type="hidden" name="action" value="register" />
            <label>会员名称:</label>
            <input type="text" placeholder="请输入用户名" name="username" id="username" value="${requestScope.username}"/>*<br/>
            <label>设置密码:</label>
            <input type="password" placeholder="请输入密码" name="password" id="password"/>*<br/>
            <label>电子邮件:</label>
            <input type="text" placeholder="请输入邮件" name="email" id="eamil" value="${requestScope.email}"/><br/>
            <label>联系电话:</label>
            <input type="text" placeholder="请输入电话号码" name="phone" id="phone" value="${requestScope.phone}"/><br/>
            输入您的简历和交友标准:<br/>
            <textarea id="message" name="message"value="${requestScope.message}"></textarea><br/>
            <input id="sub_btn" type="submit" value="提交"/>
        </form>
    </div>
</body>
</html>
