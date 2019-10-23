<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Language" content="zh-CN"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="edge"/>
    <title>首页</title>
    <meta name="description" content="desc"/>
    <link rel="stylesheet" rev="stylesheet" href="https://lusongsong.com/zb_users/theme/LuSongSong/style/style.css" type="text/css" media="all"/>
</head>
<body>
<div id="container">
    <div class="header"><h1 class="logo"><a title="" href="https://lusongsong.com/">卢松松博客</a></h1>
        <ul class="nav">
            <li>
                <a href="/">
                <span>
                <img alt="全站首页"  src="//lusongsong.com/zb_users/theme/LuSongSong/style/icon/home.png"/>
                </span>全站首页
                </a>
            </li>
            <c:forEach items="${catList}" var="catList">
            <li>
                <a href="/list/${catList.id}" target="_blank">
                    <span>
                    <img alt="${catList.title}"  src="//lusongsong.com/zb_users/theme/LuSongSong/style/icon/shipin.png"/>
                    </span>${catList.title}
                </a>
            </li>
            </c:forEach>
        </ul>

        <script>
            (function () {
                var s = "_" + Math.random().toString(36).slice(2);
                document.write('<div id="' + s + '"></div>');
                (window.slotbydup = window.slotbydup || []).push({
                    id: '2660075',
                    container: s,
                    size: '0,0',
                    display: 'inlay-fix'
                });
            })();
        </script>
    </div>
    <div class="content">
        <div class="nbcontent">
            <div class="postt">
                <div id="noticet">
                    <h3>
                        <li>
                            <a href="http://lusongsong.com/reed/12347.html" target="_blank" rel="nofollow">【松松任务派单平台正式上线】在测试运营2个月之后，松松任务派单平台(beta)正式上线，本程序集成在松松营销生态体系中，用户即可登录后台发单派单，以前客户只能做推广项目，现在不仅能发单，还能接单赚钱了。
                        </li></h3>
                </div>
            </div>
            <div id="post-list-news">
                <ul></ul>
            </div>

            <jsp:useBean id="dateValue" class="java.util.Date"/>


            <c:forEach items="${articleList}" var="articleList">
                <div class="post">
                    <h2>
                        <a href="/list/detail/${articleList.id}" title="${articleList.article_title}" target="_blank" rel="bookmark"><span class="jinrituijian">今日推荐</span>${articleList.article_title}</a>
                    </h2>
                    <div class="intro yincang">
                        <a href="/list/detail/${articleList.id}" target="_blank"  rel="bookmark">
                            <p>${articleList.article_desc}</p>
                        </a>
                    </div>
                    <jsp:setProperty name="dateValue" property="time" value="${articleList.created_at}"/>
                    <h6><fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd/ HH:mm"/>--${articleList.created_at}| <span class="yincang">作者: <a href="/list/detail/${articleList.id}"  title="${articleList.article_title}" target="_blank">${articleList.author}</a> |</span> 浏览:${articleList.views_count}</h6>
                </div>
            </c:forEach>

            <div class="pagenavi"><a href="https://lusongsong.com/"><span class="page">‹‹</span></a> <span
                    class="page now-page">1</span> <a href="https://lusongsong.com/default_2.html"><span
                    class="page">2</span></a> <a href="https://lusongsong.com/default_3.html"><span
                    class="page">3</span></a> <a href="https://lusongsong.com/default_4.html"><span
                    class="page">4</span></a> <a href="https://lusongsong.com/default_5.html"><span
                    class="page">5</span></a> <a href="https://lusongsong.com/default_6.html"><span
                    class="page">6</span></a> <a href="https://lusongsong.com/default_7.html"><span
                    class="page">7</span></a> <a href="https://lusongsong.com/default_8.html"><span
                    class="page">8</span></a> <a href="https://lusongsong.com/default_9.html"><span
                    class="page">9</span></a> <a href="https://lusongsong.com/default_10.html"><span
                    class="page">10</span></a> <a href="https://lusongsong.com/default_2.html"><span
                    class="page">›</span></a> <a href="https://lusongsong.com/default_760.html"><span
                    class="page">››</span></a>
            </div>
            <div class="ads-banner">
                <script>
                    (function () {
                        var s = "_" + Math.random().toString(36).slice(2);
                        document.write('<div id="' + s + '"></div>');
                        (window.slotbydup = window.slotbydup || []).push({
                            id: '5940994',
                            container: s,
                            size: '760,60',
                            display: 'inlay-fix'
                        });
                    })();
                </script>
            </div>
        </div>
    </div>
    <div class="sidebar">
        <div class="sidebar-inner">
            <dl class="function" id="baiduZN">
                <dt class="function_t">站内搜索</dt>
                <dd class="function_c">
                    <div>
                        <form method="get" target="_blank" action="https://www.baidu.com/baidu">
                            <input type="text" name="word" size="12" id="s">
                            <input type="submit" value="提交" name="btnG" id="searchsubmit">
                            <input name="ie" type="hidden" value="utf-8">
                            <input name="tn" type="hidden" value="bds"> <input name="cl" type="hidden" value="3">
                            <input name="ct" type="hidden" value="94749616">
                            <input name="si" type="hidden" value="lusongsong.com">
                        </form>
                    </div>
                </dd>
            </dl>
            <dl class="function" id="AD34">
                <dt style="display:none;"></dt>
                <dd class="function_c">
                    <div>
                        <script>
                            (function () {
                                var s = "_" + Math.random().toString(36).slice(2);
                                document.write('<div id="' + s + '"></div>');
                                (window.slotbydup = window.slotbydup || []).push({
                                    id: '5940983',
                                    container: s,
                                    size: '300,100',
                                    display: 'inlay-fix'
                                });
                            })();
                        </script>
                        <div class="clear"></div>
                        <script>
                            (function () {
                                var s = "_" + Math.random().toString(36).slice(2);
                                document.write('<div id="' + s + '"></div>');
                                (window.slotbydup = window.slotbydup || []).push({
                                    id: '5940985',
                                    container: s,
                                    size: '300,100',
                                    display: 'inlay-fix'
                                });
                            })();
                        </script>
                    </div>
                </dd>
            </dl>
            <dl class="function" id="YXZZ">

            </dl>
            <dl class="function" id="AD5">
                <dt style="display:none;"></dt>
                <dd class="function_c">
                    <div>
                        <script>
                            (function () {
                                var s = "_" + Math.random().toString(36).slice(2);
                                document.write('<div id="' + s + '"></div>');
                                (window.slotbydup = window.slotbydup || []).push({
                                    id: '5940988',
                                    container: s,
                                    size: '300,120',
                                    display: 'inlay-fix'
                                });
                            })();
                        </script>
                    </div>
                </dd>
            </dl>
            <dl class="function" id="LuSongSong_hotmonth">
                <dt class="function_t">7天热门</dt>
                <dd class="function_c">
                    <ul>
                        <li><a href="https://lusongsong.com/blog/post/12341.html">百度疑似取消熊掌号小图标</a></li>
                        <li><a href="https://lusongsong.com/reed/12339.html">网站源码项目分享</a></li>
                        <li><a href="https://lusongsong.com/blog/post/12337.html">淘宝卖家投诉微博大v数据造假</a></li>
                        <li><a href="https://lusongsong.com/reed/12335.html">关于劫持：JS劫持手法</a></li>
                        <li><a href="https://lusongsong.com/reed/12331.html">如何通过微博搜索排名引流</a></li>
                        <li><a href="https://lusongsong.com/reed/12327.html">2019年裸辞的都如何了</a></li>
                        <li><a href="https://lusongsong.com/blog/post/12326.html">淘集集因欠商家货款面临“暴雷”</a></li>
                    </ul>
                </dd>
            </dl>
            <dl class="function" id="AD6">
                <dt style="display:none;"></dt>
                <dd class="function_c">
                    <div>
                        <script>
                            (function () {
                                var s = "_" + Math.random().toString(36).slice(2);
                                document.write('<div id="' + s + '"></div>');
                                (window.slotbydup = window.slotbydup || []).push({
                                    id: '5940990',
                                    container: s,
                                    size: '300,120',
                                    display: 'inlay-fix'
                                });
                            })();
                        </script>
                    </div>
                </dd>
            </dl>
            <dl class="function" id="AD7">
                <dt style="display:none;"></dt>
                <dd class="function_c">
                    <div>
                        <script>
                            (function () {
                                var s = "_" + Math.random().toString(36).slice(2);
                                document.write('<div id="' + s + '"></div>');
                                (window.slotbydup = window.slotbydup || []).push({
                                    id: '5940992',
                                    container: s,
                                    size: '300,120',
                                    display: 'inlay-fix'
                                });
                            })();
                        </script>
                    </div>
                </dd>
            </dl>
            <dl class="function" id="kandydigguplog">
                <dt class="function_t">点赞最多</dt>
                <dd class="function_c">
                    <ul>
                        <li><a href="https://lusongsong.com/info/post/1019.html" title="彩票内幕，骗了很多中国人">彩票内幕，骗了很多中国人 <span
                                class="kandyDiggUp">5175</span></a></li>
                        <li><a href="https://lusongsong.com/blog/post/8082.html" title="微信应用号公测将引爆.cx域名抢注潮">微信应用号公测将引爆.cx域名抢注潮
                            <span class="kandyDiggUp">3201</span></a></li>
                        <li><a href="https://lusongsong.com/reed/1145.html" title="揭穿微信朋友圈卖东西月入几万的真相">揭穿微信朋友圈卖东西月入几万的真相
                            <span class="kandyDiggUp">2462</span></a></li>
                        <li><a href="https://lusongsong.com/info/post/913.html" title="揭秘淘宝买衣服潜规则,你们吃亏吃大了!">揭秘淘宝买衣服潜规则,你们吃亏吃大了!
                            <span class="kandyDiggUp">1892</span></a></li>
                        <li><a href="https://lusongsong.com/reed/1253.html" title="微商48种加人方法">微商48种加人方法 <span
                                class="kandyDiggUp">1838</span></a></li>
                        <li><a href="https://lusongsong.com/info/post/853.html" title="快速增加微信好友的十大方法">快速增加微信好友的十大方法
                            <span class="kandyDiggUp">1292</span></a></li>
                    </ul>
                </dd>
            </dl>
            <dl class="function" id="divLinkage">
                <dt class="function_t">友情链接</dt>
                <dd class="function_c">
                    <ul>
                        <li><a href="http://www.xinnet.com/" target="_blank">虚拟主机</a></li>
                        <li><a href="https://xm.admin5.com/" target="_blank">A5创业项目</a></li>
                    </ul>
                </dd>
            </dl>
            <dl class="function" id="divStatistics">
                <dt class="function_t">站点信息</dt>
                <dd class="function_c">
                    <ul>
                        <li>文章总数:12172</li>
                        <li>页面总数:7</li>
                        <li>分类总数:16</li>
                        <li>标签总数:172</li>
                        <li>评论总数:679927</li>
                        <li>浏览总数:129055848</li>
                    </ul>
                </dd>
            </dl>
            <div id="box" class="sjwu1">
                <div id="float" class="div1">
                    <dl class="function" id="divPrevious">
                        <dt class="function_t">最新文章</dt>
                        <dd class="function_c">
                            <ul>
                                <li><a href="https://lusongsong.com/blog/post/12358.html">大数据公司接连被查 爬虫行业面临大整顿</a></li>
                                <li><a href="https://lusongsong.com/info/post/12357.html">IP已经过气了？关于IP的4个误解 </a></li>
                                <li><a href="https://lusongsong.com/yulu/t/12356.html">你适合做什么样的商业?</a></li>
                                <li><a href="https://lusongsong.com/reed/12355.html">掌握今日头条推荐机制，轻松获取高推荐高播放量</a></li>
                                <li><a href="https://lusongsong.com/blog/post/12353.html">网友爆料：加盟行业网站关键词猛降!</a></li>
                                <li><a href="https://lusongsong.com/info/post/12354.html">渔夫和魔鬼</a></li>
                            </ul>
                        </dd>
                    </dl>
                    <dl class="function" id="AD8">
                        <dt style="display:none;"></dt>
                        <dd class="function_c">
                            <div>
                                <script>
                                    (function () {
                                        var s = "_" + Math.random().toString(36).slice(2);
                                        document.write('<div id="' + s + '"></div>');
                                        (window.slotbydup = window.slotbydup || []).push({
                                            id: '2398781',
                                            container: s,
                                            size: '300,250',
                                            display: 'inlay-fix'
                                        });
                                    })();
                                </script>
                            </div>
                        </dd>
                    </dl>
                </div>
            </div>
            <script type="text/javascript">
                //侧栏跟随
                (function () {
                    var oDiv = document.getElementById("float");
                    var H = 0,
                        iE6;
                    var Y = oDiv;
                    while (Y) {
                        H += Y.offsetTop;
                        Y = Y.offsetParent
                    }
                    ;
                    iE6 = window.ActiveXObject && !window.XMLHttpRequest;
                    if (!iE6) {
                        window.onscroll = function () {
                            var s = document.body.scrollTop || document.documentElement.scrollTop;
                            if (s > H) {
                                oDiv.className = "div1 div2";
                                if (iE6) {
                                    oDiv.style.top = (s - H) + "px";
                                }
                            } else {
                                oDiv.className = "div1";
                            }
                        };
                    }
                })();
            </script>
        </div>
    </div>
    <div class="footer"> Copyright © 2009-2019 卢松松博客 版权所有 |
        <a target="_blank" rel="nofollow" href="https://ruanwen.lusongsong.com/contact/">联系我们</a> |
        <a target="_blank"  rel="nofollow" href="http://lusongsong.com/new.html">发展历程</a> |
    </div>
</div>
</body>
</html>