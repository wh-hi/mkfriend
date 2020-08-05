<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/8/4
  Time: 21:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看全部会员信息</title>
    <%@include file="/pages/common/head.jsp"%>
    <script type="text/javascript">
        $(function () {
            $("#searchPageBtn").click(function () {
                var pageNo = $("#pn_input").val();
                if (pageNo>${requestScope.page.pageTotal}){
                    pageNo=${requestScope.page.pageTotal};
                }else if (pageNo<1){
                    pageNo=1
                }
                location.href = "${pageScope.basePath}${requestScope.page.url}&pageNo="+pageNo;
            });
        });
    </script>
</head>
<%@include file="/pages/common/menu.jsp"%>
<body bgcolor="#f0e68c">
    <div align="center">
        <table border="2">
            <th>会员名</th>
            <th>电话</th>
            <th>email</th>
            <th>简历和交友标准</th>
            <th>用户照片</th>
            <c:forEach items="${requestScope.page.items}" var="user">
                <tr>
                    <td>${user.username}</td>
                    <td>${user.phone}</td>
                    <td>${user.email}</td>
                    <td>${user.message}</td>
                    <td><img src="http://localhost:8080/mkfriend/static/img/${user.username}${user.pic}" width="100" height="100" alt=""/></td>
                <tr/>
            </c:forEach>
        </table>
        <div id="page_nav">
            <c:if test="${requestScope.page.pageNo>1}">
                <a href="${requestScope.page.url}&pageNo=1">首页</a>
                <a href="${requestScope.page.url}&pageNo=${requestScope.page.pageNo-1}">上一页</a>
            </c:if>
            <c:choose>
                <%--			情况一：总页码小于5，页码范围：1-总页码--%>
                <c:when test="${requestScope.page.pageTotal<=5}">
                    <c:set var="begin" value="1"/>
                    <c:set var="end" value="${requestScope.page.pageTotal}"/>
                </c:when>

                <c:when test="${requestScope.page.pageTotal>5}">
                    <c:choose>
                        <c:when test="${requestScope.page.pageNo<=3}">
                            <c:set var="begin" value="1"/>
                            <c:set var="end" value="5"/>
                        </c:when>
                        <c:when test="${requestScope.page.pageNo>requestScope.page.pageTotal-3}">
                            <c:set var="begin" value="${requestScope.page.pageTotal-4}"/>
                            <c:set var="end" value="${requestScope.page.pageTotal}"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="begin" value="${requestScope.page.pageNo-2}"/>
                            <c:set var="end" value="${requestScope.page.pageNo+2}"/>
                        </c:otherwise>
                    </c:choose>
                </c:when>
            </c:choose>
            <c:forEach begin="${begin}" end="${end}" var="i">
                <c:if test="${i==requestScope.page.pageNo}">
                    【${i}】
                </c:if>
                <c:if test="${i!=requestScope.page.pageNo}">
                    <a href="${requestScope.page.url}&pageNo=${i}">${i}</a>
                </c:if>
            </c:forEach>

            <c:if test="${requestScope.page.pageNo<requestScope.page.pageTotal}">
                <a href="${requestScope.page.url}&pageNo=${requestScope.page.pageNo+1}">下一页</a>
                <a href="${requestScope.page.url}&pageNo=${requestScope.page.pageTotal}">末页</a>
            </c:if>
            共${requestScope.page.pageTotal}页，${requestScope.page.pageTotalCount}条记录
            到第<input value="${(param.pageNo>requestScope.page.pageTotal?requestScope.page.pageTotal:param.pageNo)}" style="width: 25px" name="pn" id="pn_input"/>页
            <input type="button" value="确定" id="searchPageBtn">
        </div>
    </div>
</body>
</html>
