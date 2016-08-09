<%--
  Created by IntelliJ IDEA.
  User: teemoer@cntv.cn
  Date: 2016/7/4 0004
  Time: 18:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/views/default/default.jsp" %>
<html>
<head>
    <title>登录</title>
    <link rel="stylesheet" href="${ctx}/assets/css/reset.css">
    <link rel="stylesheet" href="${ctx}/assets/css/common.css">
    <%--<script type="text/javascript" src="${ctx}/assets/js/jquery-1.8.2.min.js"></script>--%>
    <!--captcha JS-->
    <!--x验证码-->
    <script type="text/javascript" src="${ctx}/assets/js/common.js"></script>

    <script type="text/javascript">
        function checkVerificationCode() {
            $.postJSON("${ctx}/web/pub/checkVerificationCode", {verifyCode: $("#verify").val()}, function (res) {
                if (res.success) {
                    Alert.success("验证码正确!");
                } else {
                    Alert.error("验证码错误!")
                }
            })
        }
    </script>
</head>
<body>

<div class="wrap login_wrap">
    <div class="content">

        <div class="login_logo"></div>

        <div class="login_box">

            <div class="login_form">
                <div class="login_title">
                    登录
                </div>
                <form action="${ctx}/web/loginChack" method="post">

                    <div style="" class="form_text_ipt">
                        <input style="" name="username" placeholder="用户名/邮箱" type="text" required="required">
                    </div>
                    <div style="" class="ececk_warning"><span>数据不能为空</span></div>
                    <div style="" class="form_text_ipt">
                        <input style="" name="password" placeholder="密码" type="password" required="required">
                    </div>
                    <div style="" class="ececk_warning"><span>数据不能为空</span></div>
                    <!--验证码开始-->
                    <div style="" class="form_text_iptcha">
                        <div class="captcha_input">
                            <input style="width:80%" name="validateCode" id="verify" onblur="checkVerificationCode()"
                                   placeholder="验证码" type="text"
                                   required="required">
                        </div>
                        <div class="captcha_img">
                            <img src="${ctx}/web/pub/getYzmImage" style="width: 100px;height: 45px;" alt="验证码">
                        </div>
                    </div>
                    <div style="" class="ececk_warning"><span>数据不能为空</span></div>
                    <!--验证码结束-->

                    <div class="form_btn">
                        <input class="submit" type="submit" value="登录" />
                    </div>
                    <div class="form_reg_btn">
                        <span>还没有帐号？</span><a href="${ctx}/register">马上注册</a>
                        <br />
                        <span style="color: red">${error}</span>
                    </div>
                </form>
                <div class="other_login">

                </div>
            </div>
        </div>
    </div>
</div>


</body>

</body>
</html>
