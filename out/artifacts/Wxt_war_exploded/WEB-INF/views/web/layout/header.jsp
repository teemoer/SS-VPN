<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: teemoer@cntv.cn
  Date: 2016/7/4 0004
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container">
    <h1 class="logo"><a href="" title="更好的press新闻"><i class="fa">&#xe600;</i>better</a></h1>

    <div class="site-navbar">
        <ul>
            <li class=""><a href="#">Press新闻</a>

                <div class="sub-menu"></div>
            </li>
            <li class=""><a href="${ctx}/toNews">新闻动态</a>

                <div class="sub-menu"></div>
            </li>
            <li class=""><a href="#">服务</a>

                <div class="sub-menu"></div>
            </li>
            <%--<li class=""><a href="news.jsp">教程</a></li>--%>
            <%--<li class=""><a href="question.jsp">Press问答</a></li>--%>
            <%--<li class=""><a href="blogs.jsp">博客导航</a></li>--%>
        </ul>
    </div>
    <div class="wel-login">
        <c:if test="${isLogin}">
            <a href="#" class="btn btn-primary">欢迎您,${user.userName}</a>
            <a href="${ctx}/loginOut" class="btn">退出</a>
        </c:if>
        <c:if test="${user==null}">
            <a href="${ctx}/register" class="btn">注册</a>
            <a href="${ctx}/login" class="btn btn-primary">登录</a>
        </c:if>

    </div>


    <div class="m-navbar-start"><i class="fa">&#xe624;</i></div>
    <div class="m-wel-start"><i class="fa">&#xe632;</i></div>
    <div class="m-mask"></div>
</div>
