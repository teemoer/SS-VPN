<%--
  Created by IntelliJ IDEA.
  User: teemoer@cntv.cn
  Date: 2016/7/4 0004
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/default/default.jsp" %>
<html>
<head>
    <title>新闻管理后台</title>

    <style>
        body { margin: 0; font-family: 微软雅黑; }

        .left { position: absolute; width: 200px; height: 100%; border-right: 1px solid #CCCCCC; #FFFFFF; color: #000000; font-size: 14px; text-align: center; }

        .div1 { text-align: center; width: 200px; padding-top: 10px; }

        .div2 { height: 40px; line-height: 40px; cursor: pointer; font-size: 13px; position: relative; border-bottom: #ccc 1px dotted; }

        .xwzx { position: absolute; height: 20px; width: 20px; left: 40px; top: 10px; background: url(${ctx}/assets/images/2.png); }

        .div3 { display: block; cursor: pointer; font-size: 13px; }

        .div3 ul { margin: 0; padding: 0; }

        .div3 li { height: 30px; line-height: 30px; list-style: none; border-bottom: #ccc 1px dotted; text-align: center; }
    </style>
    <script type="text/javascript">
        function loadRightPage(url) {
            $("#rightDiv").load(url);
        }
    </script>
</head>
<body>
<div>
    <div class="left" style="height: 960px;float: left">
        <div class="div1">
            <div class="left_top"><img src="${ctx}/assets/images/bbb_01.jpg"><img src="${ctx}/assets/images/bbb_02.jpg" id="2"><img
                    src="${ctx}/assets/images/bbb_03.jpg"><img
                    src="${ctx}/assets/images/bbb_04.jpg"></div>
            <div class="div2">
                <div class="xwzx"></div>
                新闻系统
            </div>
            <div class="div3">
                <ul>
                    <li onclick="loadRightPage('${ctx}/newsList')"> 管理新闻</li>
                    <li onclick="loadRightPage('${ctx}/messageList')"> 管理评论</li>
                    <li onclick="loadRightPage('${ctx}/userList')"> 管理用户</li>
                </ul>
            </div>
        </div>
    </div>
    <div id="rightDiv" style="float: right;left: 200px;position: absolute;">

    </div>

</div>


</body>
</html>
