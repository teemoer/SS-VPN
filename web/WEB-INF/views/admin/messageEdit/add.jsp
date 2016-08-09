<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/7/13 0013
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/default/default.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="text-align: center">

<form action="${ctx}">


    <label for="userId">用户名</label>
    <select name="userId" id="userId">
        <c:forEach items="${userList}" var="oneUser">
            <option value="${oneUser.id}">${oneUser.userName}</option>
        </c:forEach>
    </select>
    <br />

    <label for="newsId">选择新闻</label>
    <select name="newsId" id="newsId">
        <c:forEach items="${newsList}" var="oneNews">
            <option value="${oneNews.id}">${oneUser.title}</option>
        </c:forEach>
    </select>
    <br />

    <label for="message">评论内容</label>
    <input type="text" name="message" id="message">
    <br />
    <input type="submit" value="保存" />


</form>
</body>
</html>
