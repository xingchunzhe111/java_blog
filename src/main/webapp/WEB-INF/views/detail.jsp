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
    <title>${article.article_title}</title>
    <link rel="stylesheet" rev="stylesheet" href="https://lusongsong.com/zb_users/theme/LuSongSong/style/style.css" type="text/css" media="all"/>
</head>
<body>
<div id="container">
    <div class="header"><h1 class="logo"><a title="卢松松博客" href="https://lusongsong.com/">卢松松博客</a></h1>
        <ul class="nav">
            <li>
                <a href="/"><span>
                <img alt="返回首页" src="//lusongsong.com/zb_users/theme/LuSongSong/style/icon/home.png"/></span>返回首页</a>
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
            <div class="ads-banner">
                <div class="clear"></div>
            </div>
            <dl class="post-content" id="post-1445">
                <div class="post-title"><h1><a href="javascript:;" rel="bookmark">${article.article_title}</a><span class="QrCodeArt" data-id="${article.id}"></span></h1>
                    <h6>
                        <a href="#comment">
                        <span class="commentViewNums">
                            <nbcache id="nbcache12358"></nbcache>
                        </span>
                        <jsp:useBean id="dateValue" class="java.util.Date"/>
                        <jsp:setProperty name="dateValue" property="time" value="${article.created_at}"/>
                        </a>&nbsp;${article.views_count}人参与 | 时间：<fmt:formatDate value="${dateValue}" pattern="yyyy年MM月dd日 HH:mm"/>
                        <div id="ckepop"></div>
                    </h6>
                </div>
                <div class="clear"></div>
                <dd class="con">
                    ${article.article_content}
                </dd>
            </dl>
            <div class="ads-banner">
            </div>
            <div style="padding-left: 17px; padding-right: 17px;">
            </div>
        </div>
    </div>
    <div class="sidebar">
        <dl class="function" id="baiduZN">
            <dt class="function_t">站内搜索</dt>
            <dd class="function_c">
                <div>
                    <form method="get" target="_blank" action="https://www.baidu.com/baidu">
                        <input type="text" name="word" size="12" id="s">
                        <input type="submit" value="提交" name="btnG" id="searchsubmit">
                        <input name="ie" type="hidden" value="utf-8">
                        <input name="tn" type="hidden" value="bds">
                        <input name="cl" type="hidden" value="3">
                        <input name="ct" type="hidden" value="94749616">
                        <input name="si" type="hidden" value="lusongsong.com">
                    </form>
                </div>
            </dd>
        </dl>
        <div class="ads-banner">
            <div class="clear"></div>
        </div>
        <div class="sidebar-inner">
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
        </div>
    </div>
    <div class="footer"> Copyright © 2009-2019 卢松松博客 版权所有 |
        <a target="_blank" rel="nofollow" href="https://ruanwen.lusongsong.com/contact/">联系我们</a> |
        <a target="_blank" rel="nofollow" href="http://lusongsong.com/new.html">发展历程</a>
    </div>
</div>
</body>
</html>
