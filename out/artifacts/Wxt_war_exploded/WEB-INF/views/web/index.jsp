<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <link rel="stylesheet" href="${ctx}/assets/css/app.css" media="all">
    <!--[if lt IE 9]>
    <script src="${ctx}/assets/js/html5shiv.min.js"></script>
    <![endif]-->

</head>
<body class="page-home">

<header class="header">
    <c:import url="/web/head" />
</header>

<!--幻灯片-->
<div class="home-swiper">
    <div class="container">
        <div class="swiper-container">
            <div class="swiper-wrapper">
                <div class="swiper-slide swiper-slide-text">
                    <div class="home-swiper-inner">
                        <h2><i class="fa">&#xe600;</i></h2>

                        <h3>更好的Press新闻</h3>
                    </div>
                </div>
                <div class="swiper-slide">
                    <img src="${ctx}/assets/images/h-tob2.png">

                    <div class="home-swiper-inner">
                        <h2>tob主题</h2>

                        <h3>自适应响应式布局，不同设备不同展示 <br>
                            指定微信分享图片 / 全屏相册查看 / SEO优化 / 速度优化 / 14+颜色风格 / 6独立页面 / 4小工具 / 列表无限加载 / 多平台广告</h3>
                        <a href="http://themebetter.com/theme/tob" class="btn" target="_blank">专题介绍</a>
                        <a href="http://demo.themebetter.com/tob" class="btn" target="_blank">演示</a>
                    </div>
                </div>
                <div class="swiper-slide">
                    <img src="${ctx}/assets/images/h-dux.png">

                    <div class="home-swiper-inner">
                        <h2>DUX主题</h2>

                        <h3>响应式布局、扁平化、简洁白色、多设备支持、多功能配置 <br>
                            SEO优化 / 速度优化 / 会员中心 / 14+颜色风格 / 5+独立页面 / 8+小工具 / 直达链接 / 列表无限加载 / 多平台广告</h3>
                        <a href="http://themebetter.com/theme/dux" class="btn" target="_blank">专题介绍</a>
                        <a href="http://demo.themebetter.com/dux" class="btn" target="_blank">演示</a>
                    </div>
                </div>
                <div class="swiper-slide">
                    <img src="${ctx}/assets/images/h-xiu.png">

                    <div class="home-swiper-inner">
                        <h2>XIU主题</h2>

                        <h3>响应式布局、扁平化、简洁风、多设备支持、多功能配置 <br>
                            SEO优化 / 速度优化 / 14+颜色风格 / 5+独立页面 / 6+小工具 / 直达链接 / 列表无限加载 / 多平台广告</h3>
                        <a href="http://themebetter.com/theme/xiu" class="btn" target="_blank">专题介绍</a>
                        <a href="http://demo.themebetter.com/xiu" class="btn" target="_blank">演示</a>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<!--幻灯片-->

<div class="home-firstitems">
    <div class="container">
        <ul>
            <li>
                <a href="#">
                    <i class="fa">&#xe62e;</i>
                    <strong>LOGO</strong>

                    <p>军事新闻</p>
                    <span class="btn btn-primary">提交需求</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="fa">&#xe62f;</i>
                    <strong>Favicon.ico</strong>

                    <p>娱乐新闻</p>
                    <span class="btn btn-primary">提交需求</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="fa">&#xe630;</i>
                    <strong>Banner</strong>

                    <p>生活新闻</p>
                    <span class="btn btn-primary">提交需求</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="fa">&#xe631;</i>
                    <strong>SERVER</strong>

                    <p>国家新闻</p>
                    <span class="btn btn-primary">提交需求</span>
                </a>
            </li>
        </ul>
    </div>
</div>

<!--新闻展示-->
<div class="home-box home-news">
    <div class="container">
        <h2>Press新闻动态</h2>

        <h3>汇聚better所有Press新闻的更新和动态</h3>
        <ul>
            //循环遍历li
            <li>
                <a href="＃" title="新闻标题">
                    <img src="${ctx}/assets/images/tob-thumb222.png" class="thumb">//新闻图片
                    <h4>新闻名称</h4></a>

                <div class="note">新闻内容</div>
            </li>

        </ul>
    </div>
</div>
<!--新闻展示-->

<section class="service-show">
    <div class="container">
        <ul>
            <li>
                <i class="fa"></i>

                <h3>高端专业的开发团队</h3>

                <p>拥有多年Press博客/企业建站开发经验，独树一帜的设计，提供最专业的网站设计方案；原创的主题标签语义化，增强网站优化效果。</p>
            </li>
            <li>
                <i class="fa"></i>

                <h3>独一无二的视觉冲击</h3>

                <p>增强用户体验、提高品牌形象给人留下深刻的印象，那就选择我们，我们的每一款主题都是独一无二的，都有自己的灵魂，每款主题都有各自的配色方案。</p>
            </li>
            <li>
                <i class="fa"></i>

                <h3>完美的响应式布局</h3>

                <p>遵循现代网页设计的趋势，所有主题都提供完整的响应式布局，优化大桌面显示器以及对平板和智能手机的支持，从而提供一致性的用户体验。</p>
            </li>
            <li>
                <i class="fa"></i>

                <h3>免费及时的售后服务</h3>

                <p>长期及时地在线售后服务和免费升级更新，确保您的网站始终运行在最佳状态，实时在线工单沟通方式免去您的后顾之忧，替您节省网站维护成本。</p>
            </li>
        </ul>
    </div>
</section>


<footer class="footer">
    <div class="container">
        <p class="footer-logo">
            <i class="fa">&#xe600;</i>
        </p>

        <p class="footer-navs">
            <a href="＃">关于我们</a><a href="＃">广告合作</a><a href="＃">免责声明</a>
        </p>

        <p class="footer-links">
            <a target="_blank" href="＃">大前端</a><a target="_blank" href="＃">Press主题</a><a target="_blank" href="＃">Press中文主题</a><a target="_blank"
                                                                                                                                  href="＃">Press教程</a><a
                target="_blank" href="＃">博客导航</a><a target="_blank">推荐云服务器</a>
        </p>

        <p class="footer-copyright">
            &copy; 2016 <a href="＃">better</a> 更好的<a href="＃">Press主题</a>
        </p>
    </div>
</footer>


<script src="assets/js/loader.js"></script>

</body>
</html>
