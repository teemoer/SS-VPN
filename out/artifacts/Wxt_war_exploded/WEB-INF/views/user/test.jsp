<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/7/9 0009
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/default/default.jsp" %>

<html>
<head>
    <title>Title</title>

    <link href="${ctx}/assets/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="${ctx}/assets/bootstrap/js/bootstrap.min.js" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="${ctx}/assets/jquery/jquery-1.11.2.min.js"></script>
    <style>
        .divcss5 { border-style: solid; border-width: 1px; border-color: #000 }

        span {
            display: inline-block;
        }

        input {
            width: 30px;
        }
    </style>


    <script type="application/javascript">
        function changeToNo(obj) {
            $(obj).attr("ondblclick", "changeToYes(this)");
            $(obj).find("input").attr("style", "");
            $("#noDiv").append($(obj));
//            $(obj).remove();

        }
        function changeToYes(obj) {
            $(obj).attr("ondblclick", "changeToNo(this)");

            $(obj).find("input").attr("style", "display: none;");
            $("#yesDiv").append($(obj));
//            $(obj).remove();
        }

        $(function () {
            $("#yesDiv").find("input").each(function () {
                $(this).attr("style", "display: none;")
            })
        })

    </script>
</head>
<body>

<h1>已选择</h1>

<div id="yesDiv" class="divcss5" style="width: 300px;height: 300px">
    <span ondblclick="changeToNo(this)">
                 1111
                <input type="number" name="size" />

    </span>

     <span ondblclick="changeToNo(this)">
             2222
          <input type="hidden" name="ids" />
            <input type="number" name="size" />
    </span>

     <span ondblclick="changeToNo(this)">
             3333
            <input type="hidden" name="ids" value="" />
            <input type="number" name="size" />
    </span>
</div>
<h1>未选择</h1>

<div id="noDiv" class="divcss5" style="width: 300px;height: 300px">

    <span ondblclick="changeToYes(this)">
        4444
        <input type="number" name="size" />
    </span>

    <span ondblclick="changeToYes(this)">
        5555
        <input type="number" name="size" />
    </span>

    <span ondblclick="changeToYes(this)">
        6666
        <input type="number" name="size" />
    </span>

</div>

</body>
</html>
