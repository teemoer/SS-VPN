<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE HTML>
<%@ include file="/WEB-INF/views/default/default.jsp" %>
<html>
<head>

    <link rel="stylesheet" href="${ctx}/assets/css/app.css" media="all">
    <script type="application/javascript">
        $(function () {
            laypage({
                cont: "pageDiv",
                pages: ${newsPage.getTotalPages()}, //可以叫服务端把总页数放在某一个隐藏域，再获取。假设我们获取到的是18
                curr: function () { //通过url获取当前页，也可以同上（pages）方式获取
//            var page = location.search.match(/page=(\d+)/);
                    var page = ${nowPage};
                    return page;
                }(),
                jump: function (e, first) { //触发分页后的回调
                    if (!first) { //一定要加此判断，否则初始时会无限刷新
                        window.location.href = ('${ctx}/toNews?page=' + (e.curr - 1));
                    }
                }
            });
        })
    </script>
</head>
<body class="page-cat page-cat-news">

<header class="header">
    <c:import url="/web/head" />
</header>
<div class="tbfocus">
    <div class="container">
        <h1>better最新动态</h1>
        <h5>汇聚better所有新闻的更新和动态</h5>
    </div>
</div>

<section class="container">
    <div class="content-wrap">
        <div class="content">
            <div class="excerpts">
                <!--新闻列表分页-->

                <c:forEach items="${newsPage.content}" var="oneUser">

                    <article class="excerpt">
                        <a class="focus" href="＃"><img src="../assets/images/tob-thumb222.png" class="thumb"></a>

                        <div class="meta">
                            <a class="meta-cat" href="＃">${oneUser.title}</a>
                            <time>
                                <fmt:formatDate value="${oneUser.submitDate}" pattern="yyyy/MM/dd" type="date" />
                            </time>
                            <span>评论(${oneUser.id})</span>
                        </div>
                        <h2><a href="＃" title="${oneUser.title}">${oneUser.title}</a></h2>

                        <div class="note">${oneUser.content}</div>
                    </article>
                </c:forEach>
                <!--新闻列表分页-->
            </div>

            <!--新闻页数-->
            <div class="pagination" id="pageDiv">

            </div>

            <!--新闻页数-->
        </div>
    </div>
    <div class="sidebar">
        <div class="widget widget_uis">
            <div class="item"><a target="_blank"><img src="../assets/images/tb_ecs_360.gif"></a></div>
        </div>

        <div class="widget widget_ui_posts">
            <h3>网站公告</h3>
            <ul>
                <li><a class="thumbnail" href="＃"><img src="../assets/images/question.jpg" class="thumb" alt="WordPress问答正式上线 出色回答将送现金TB_themebetter"></a><a
                        href="http://themebetter.com/question-release.html">WordPress问答正式上线 出色回答将送现金TB</a></li>
                <li><a class="thumbnail" href="http://themebetter.com/tb-wxpay.html"><img src="../assets/images/wxpay.png" class="thumb"
                                                                                          alt="themebetter 开启微信支付，爽翻你的支付体验_themebetter"></a><a
                        href="http://themebetter.com/tb-wxpay.html">themebetter 开启微信支付，爽翻你的支付体验</a></li>
                <li><a class="thumbnail" href="http://themebetter.com/tb-comment.html">
                    <%--<img src="../images/comment.jpg" class="thumb" alt="themebetter 开启文章评论功能，需要登录才能发表看法_themebetter">--%>
                </a><a
                        href="http://themebetter.com/tb-comment.html">themebetter 开启文章评论功能，需要登录才能发表看法</a></li>
                <li><a class="thumbnail" href="http://themebetter.com/tb-service-items.html">
                    <%--<img src="../images/fuwu.jpg" class="thumb"　 alt="themebetter付费服务上线仅一周，服务已超百单_themebetter">--%>
                </a><a
                        href="http://themebetter.com/tb-service-items.html">themebetter付费服务上线仅一周，服务已超百单</a></li>
            </ul>
        </div>

        <div class="widget widget_ui_posts">
            <h3>最新发布</h3>
            <ul>
                <li><a class="thumbnail" href="＃">
                    <%--<img src="../assets/images/tob-thumb222.png" class="thumb"--%>
                    <%--alt="tob主题0.2版本更新 新增24小时热门页面模板和微信公众号展示模块_themebetter">--%>
                </a><a
                        href="http://themebetter.com/tob-0-2.html">tob主题0.2版本更新 新增24小时热门页面模板和微信公众号展示模块</a></li>
                <li><a class="thumbnail" href="http://themebetter.com/dux-1-5.html">
                    <%--<img src="../assets/images/dux.jpg" class="thumb" alt="DUX主题1.5版本更新：新增底部友情链接、完善和修复多项问题_themebetter">--%>
                </a><a
                        href="http://themebetter.com/dux-1-5.html">DUX主题1.5版本更新：新增底部友情链接、完善和修复多项问题</a></li>
                <li><a class="thumbnail" href="http://themebetter.com/tob-release.html">
                    <%--<img src="../images/tob-thumb222.png" class="thumb" alt="themebetter tob主题正式发布，开启图片站新时代_themebetter">--%>
                </a><a
                        href="http://themebetter.com/tob-release.html">themebetter tob主题正式发布，开启图片站新时代</a></li>
                <li><a class="thumbnail" href="http://themebetter.com/dux-mini-cat.html">
                    <%--<img src="../images/dux.jpg" class="thumb"　 alt="快速了解DUX主题微分类功能_themebetter">--%>
                </a><a
                        href="http://themebetter.com/dux-mini-cat.html">快速了解DUX主题微分类功能</a></li>
            </ul>
        </div>


    </div>
</section>


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
            <a href="http://themebetter.com/about">关于我们</a><a href="http://themebetter.com/ads">广告合作</a><a href="http://themebetter.com/disclaimer">免责声明</a>
        </p>

        <p class="footer-links">
            <a target="_blank" href="http://www.daqianduan.com">大前端</a><a target="_blank" href="http://themebetter.com">Press主题</a><a target="_blank"
                                                                                                                                      href="http://themebetter.com">Press中文主题</a><a
                target="_blank" href="http://themebetter.com/course">Press教程</a><a target="_blank" href="http://themebetter.com/blogs">博客导航</a><a
                target="_blank"
                href="http://s.click.taobao.com/t?e=m%3D2%26s%3Dj2RAze3XQEwcQipKwQzePCperVdZeJviEViQ0P1Vf2kguMN8XjClAtBXBSxhUdbP7UHbJ4Ck3Og224abtBd47OrpJ5C0sDS5j7OotfTSvdoEK08Ctmo9qTDVuRn8ddiDsEVVC24eqozcHtRpEUy6RHVyxRO0gvF4QxJtmCgOmCLXl8Q7TEjBF%2BX11FSyvDCnQiv%2BJKjlPObGDmntuH4VtA%3D%3D">推荐云服务器</a>
        </p>

        <p class="footer-copyright">
            &copy; 2016 <a href="http://themebetter.com">better</a> 更好的<a href="http://themebetter.com">Press主题</a>
        </p>
    </div>
</footer>


<script>
    var TBUI = {
        URL: 'http://themebetter.com',
        STATIC: 'http://themebetter.com/static',
        VERSION: '4.0.06155',
    };
</script>

<script src="assets/js/loader.js"></script>


</body>
</html>
