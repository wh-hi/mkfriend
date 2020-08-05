<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/7/29
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传照片</title>
    <%@include file="/pages/common/head.jsp"%>
    <script type="text/javascript">
        /*$(function () {
            $("#sub_photo").click(function () {
                if($(".photo").val()=="未选择任何文件"){
                    $(".errorMsg").text("请选择上传的照片！");
                    return false;
                }
                $(".errorMsg").text("");
            });
        });*/
    </script>
</head>
<body bgcolor="yellow">
    <%@include file="/pages/common/menu.jsp"%>
    <div id="uploadphoto" align="center">
        <br/><br/>
        <span class="errorMsg" style="color: red">
            ${requestScope.msg}
        </span>

        <c:if test="${empty sessionScope.loginUser}">
            <div>
                <a href="pages/user/login.jsp">您还未登录，点击此处登录</a>
            </div>
        </c:if>
        <c:if test="${not empty sessionScope.loginUser}">
            文件将被上传到web目录下的static/img中。<br/>
            请选择要上传的图片文件<br/>
            <form action="userServlet?action=uploadphoto" method="post" enctype="multipart/form-data">
                <input type="file" name="photo" class="photo"/><br/>
                <input type="submit" id="sub_photo"/>
            </form>
        </c:if>

    </div>
</body>
</html>
