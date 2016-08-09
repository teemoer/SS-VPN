<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <title>新闻后台-登录</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <meta http-equiv="Cache-Control" content="no-store" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link href="${ctx}/assets/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="${ctx}/assets/jquery/jquery-1.11.2.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/styles/style.css">
    <link rel="stylesheet" href="${ctx}/assets/styles/font-awesome/css/font-awesome.min.css">
    <link href="${ctx}/assets/jquery-validation/1.11.1/validate.css" type="text/css" rel="stylesheet" />
    <script type="application/javascript">

        $(function () {

        })
        function submitF() {
            $("#loginForm").submit();
        }
    </script>
</head>
<body>
<div class="container">
    <div class="login">
        <div class="company-name">
            <img src="${ctx}/assets/styles/images/logo.png" alt="logo">

            <h2>新闻后台登录</h2>
        </div>
        <span class="pull-right release">吴小甜</span>

        <div class="log-table">
            <form class="form-inline" id="loginForm" action="${ctx}/admin/loginChack" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" name="name" id="account" placeholder="手机号/邮箱">
                    <i class="fa fa-user"></i>
                </div>
                <br>

                <div class="form-group">
                    <input type="password" class="form-control" name="pwd" id="password" placeholder="密码">
                    <i class="fa fa-shield"></i>
                </div>
            </form>
        </div>
        <button type="submit" onclick="submitF()" class="btn-login">登录/OPEN</button>
        <c:if test="${error != null}">
            <div style="color:red;margin-top:20px">${error}</div>
        </c:if>
    </div>
</div>
<footer class="footer">
    ©2016 吴小甜版权所有 <span><a href="http://www.miitbeian.gov.cn/publish/query/indexFirst.action">粤ICP备666666666号-2</a></span>
</footer>
</div>
<script src="${ctx}/assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>