<%--
  Created by IntelliJ IDEA.
  User: teemoer@cntv.cn
  Date: 2016/7/4 0004
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" href="${ctx}/assets/css/jquery-ui.css" />
    <link rel="stylesheet" href="${ctx}/assets/css/reset.css">
    <link rel="stylesheet" href="${ctx}/assets/css/common.css">
    <link rel="stylesheet" href="${ctx}/assets/css/jquery-labelauty.css">
    <script type="text/javascript" src="${ctx}/assets/js/jquery-1.8.2.min.js"></script>
    <!--captcha JS-->
    <script type="text/javascript" src="${ctx}/assets/js/common.js"></script>
    <!--日期吸取插件-->
    <script type="text/javascript" src="${ctx}/assets/js/jquery-ui-datepicker.js"></script>
    <!--图片上传预览-->
    <script type="text/javascript" src="${ctx}/assets/js/uploadImgPre.js"></script>
    <!--美化表单按钮-->
    <script src="${ctx}/assets/js/jquery-labelauty.js"></script>
    <script>
        $(function () {
            $(':input').labelauty();
            //日期吸取
            $("#birthdayDate").datepicker();
            $("#birthdayDate").datepicker("option", "showAnim", "slideDown");
            $('#birthdayDate').datepicker('option', 'yearRange', '1900:2022');
            //图片上传预览
//            $("#upUserHeadImg").uploadPreview({Img: "userHeadImgPr", Width: 120, Height: 120});
        });
    </script>
</head>
<body>


<div class="wrap register_wrap">
    <div class="content">

        <div class="register_logo"></div>

        <div class="login_box">

            <div class="login_form">
                <div class="login_title">
                    注册
                </div>
                <form action="${ctx}/registerUser" method="post">

                    <div class="form_text_ipt">
                        <input value="" name="userName" placeholder="用户名" type="text" required="required">
                    </div>
                    <div class="ececk_warning"><span>ajax错误信息</span></div>
                    <div style="" class="form_text_ipt">
                        <input name="password" placeholder="密码" type="password" required="required">
                    </div>
                    <div class="ececk_warning"><span>ajax错误信息</span></div>
                    <div class="form_text_ipt">
                        <input name="repassword" placeholder="重复密码" type="password" required="required">
                    </div>


                    <div class="ececk_warning"><span>ajax错误信息</span></div>
                    <div class="form_text_ipt">
                        <input value="" name="email" placeholder="邮箱" type="text">
                    </div>
                    <div class="ececk_warning"><span>ajax错误信息</span></div>
                    <div class="form_text_ipt">
                        <input name="address" placeholder="地址" type="text">
                    </div>
                    <div class="ececk_warning"><span>ajax错误信息</span></div>
                    <div class="form_text_ipt" style="position: relative;">
                        <input name="birthday" id="birthdayDate" placeholder="生日" type="text" readonly>
                    </div>
                    <div class="ececk_warning"><span>ajax错误信息</span></div>


                    <div class="form_check_ipt">
                        <div class="check_left">
                            <span>爱好：</span>
                            <ul class="dowebok">
                                <li><input name="hobby" value="" type="checkbox" data-labelauty="上网"></li>
                                <li><input name="hobby" value="" type="checkbox" data-labelauty="撩妹子"></li>
                                <li><input name="hobby" value="" type="checkbox" data-labelauty="写代码"></li>
                            </ul>
                        </div>
                    </div>

                    <div class="form_radio_ipt">
                        <div class="radio_left">
                            <span>性别：</span>
                            <ul class="dowebok">
                                <li><input name="gender" value="" type="radio" data-labelauty="女"></li>
                                <li><input name="gender" value="" type="radio" data-labelauty="男"></li>
                            </ul>
                        </div>
                    </div>


                    <div class="form_btn">
                        <input class="submit" type="submit" value="注册" />
                    </div>
                    <div class="form_reg_btn">
                        <span>已有帐号？</span><a href="${ctx}/login">马上登录</a>
                    </div>
                </form>
                <div class="other_login">

                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
