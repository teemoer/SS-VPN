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
<form action="/user/save" method="post" id="userForm">
    <div class="text-center">
        <input name="id" value="${user.id}" type="hidden" />
        用户名<input type="text" name="userName" value="${user.userName}"><br />
        密码:<input type="text" name="password" value="${user.password}"><br />
        邮箱:<input type="text" name="email" value="${user.email}"><br />
        地址:<input type="text" name="adderss" value="${user.adderss}"><br />
        <%--生日:<input type="date" name="brithday" value="${user.brithday}"><br />--%>
        性别:<input type="text" name="gender" value="${user.gender}"><br />
        <button class="but btn-success" onclick="javascript:$('#userForm').submit()">修改</button>
        <br />
        <h1 style="color: #00A8EC">${msg}</h1>

    </div>
</form>

</body>
</html>
