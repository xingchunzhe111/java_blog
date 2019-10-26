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
    </div>
    <div class="content">
        <div class="nbcontent">
            <div class="postt">
                <div id="noticet">
                    <h3>
                        <li></li>
                    </h3>
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

            <c:if test="${count>0}"  >
                <div class="pagenavi">
                    <c:choose>
                        <c:when test="${page == '1'}">
                            <a href="javascript:;">
                                <span class="page">‹‹</span>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="/search?title=${title}&page=${page-1}">
                                <span class="page">‹‹</span>
                            </a>
                        </c:otherwise>
                    </c:choose>
                    <span class="page now-page">${page}</span>
                    <c:choose>
                        <c:when test="${page < maxPage}">
                            <a href="/search?title=${title}&page=${page+1}">
                                <span class="page">››</span>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:;">
                                <span class="page">››</span>
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:if>

            <div class="ads-banner">
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
                        <div class="clear"></div>
                    </div>
                </dd>
            </dl>
            <dl class="function" id="YXZZ">

            </dl>
            <dl class="function" id="AD5">
                <dt style="display:none;"></dt>
                <dd class="function_c">
                    <div>
                    </div>
                </dd>
            </dl>

            <dl class="function" id="AD6">
                <dt style="display:none;"></dt>
                <dd class="function_c">
                    <div>
                    </div>
                </dd>
            </dl>
            <dl class="function" id="AD7">
                <dt style="display:none;"></dt>
                <dd class="function_c">
                    <div>
                    </div>
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
        </div>
    </div>
    <div class="footer"> Copyright © 2009-2019 卢松松博客 版权所有 |
        <a target="_blank" rel="nofollow" href="https://ruanwen.lusongsong.com/contact/">联系我们</a> |
        <a target="_blank"  rel="nofollow" href="http://lusongsong.com/new.html">发展历程</a> |
    </div>
</div>
</body>
</html>