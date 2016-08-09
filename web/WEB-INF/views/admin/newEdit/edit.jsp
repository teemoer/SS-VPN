<%--
  Created by IntelliJ IDEA.
  User: teemoer@cntv.cn
  Date: 2016/7/4 0004
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/default/default.jsp" %>
<html>
<head>
    <title></title>
</head>
<body>
<form action="/news/save" method="post" id="userForm">
    <div class="text-center">
        <input name="id" value="${news.id}" type="hidden" />
        标题<input type="text" name="title" value="${news.title}"><br />
        作者:<input type="text" name="author" value="${news.author}"><br />
        正文:<input type="text" name="content" value="${news.content}"><br />
        关键字:<input type="text" name="keyWords" value="${news.keyWords}"><br />
        图片地址:<input type="text" name="picture" value="${news.picture}"><br />
        <button class="but btn-success" onclick="javascript:$('#userForm').submit()">
            <c:if test="${news==null}">
                增加
            </c:if>
            <c:if test="${news!=null}">
                修改
            </c:if>

        </button>
        <br />

        <h1 style="color: #00A8EC">${msg}</h1>

    </div>
</form>
</body>
</html>
