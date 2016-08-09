<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: teemoer@cntv.cn
  Date: 2016/7/3 0003
  Time: 1:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/default/default.jsp" %>
<html>
<head>
    <title>用户管理</title>
</head>

<body>
<script type="application/javascript">
    $(function () {
        laypage({
            cont: "page11",
            pages: ${newsPage.getTotalPages()}, //可以叫服务端把总页数放在某一个隐藏域，再获取。假设我们获取到的是18
            curr: function () { //通过url获取当前页，也可以同上（pages）方式获取
//            var page = location.search.match(/page=(\d+)/);
                var page = ${nowPage};
                return page;
            }(),
            jump: function (e, first) { //触发分页后的回调
                if (!first) { //一定要加此判断，否则初始时会无限刷新
                    parent.loadRightPage('${ctx}/newsList?page=' + (e.curr - 1));
                }
            }
        });
    })

    function editUser(id) {
        layer.open({
            btn: ["关闭"],
            type: 2,
            title: '修改新闻',
            area: ['800px', '400px'],
            scrollbar: false,
            content: '/news/edit?id=' + id,
            end: function () {
                Alert.success("修改成功");
                parent.loadRightPage('${ctx}/newsList');

            }
        });
    }

    function delUser(id) {
        $.postJSON("/news/delNews", {id: id}, function (res) {
            if (res.success) {
                Alert.success("删除成功!");
                parent.loadRightPage('${ctx}/newsList');
            }
        })
    }

    function addNews() {
        layer.open({
            btn: ["关闭"],
            type: 2,
            title: '增加新闻',
            area: ['800px', '400px'],
            scrollbar: false,
            content: '/news/addNews',
            end: function () {
                parent.loadRightPage('${ctx}/newsList');
                Alert.success("增加成功");
            }
        });

    }

</script>

<div class="container">
    <table class="text-center">
        <colgroup width="10%"></colgroup>
        <colgroup width="15%"></colgroup>
        <colgroup width="15%"></colgroup>
        <colgroup width="10%"></colgroup>
        <colgroup width="10%"></colgroup>
        <colgroup width="10%"></colgroup>
        <colgroup width="10%"></colgroup>
        <colgroup width="10%"></colgroup>
        <colgroup width="10%"></colgroup>
        <tr>
            <th>标题</th>
            <th>作者</th>
            <th>正文</th>
            <th>关键字</th>
            <th>图片</th>
            <th>提交时间</th>
            <th>操作</th>
        </tr>
        <sss id="tableBody">
            <c:forEach items="${newsPage.content}" var="oneUser">
                <tr>
                    <td>${oneUser.title}</td>
                    <td>${oneUser.author}</td>
                    <td>${oneUser.content}</td>
                    <td>${oneUser.keyWords}</td>
                    <td>${oneUser.picture}</td>
                    <td>
                        <fmt:formatDate value="${oneUser.submitDate}" pattern="yyyy/MM/dd" type="date" />
                    </td>
                    <td>
                        <button onclick="editUser('${oneUser.id}')" class="btn btn-success">修改</button>
                        <button onclick="delUser('${oneUser.id}')" class="btn btn-success">删除</button>
                    </td>
                </tr>
            </c:forEach>
        </sss>
    </table>
    <br />

    <div id="page11">


    </div>
    <div>
        <button class="btn btn-success" onclick="addNews()">增加新闻</button>

    </div>

</div>

</body>

</html>
