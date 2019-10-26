<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>文章列表页面</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://libs.baidu.com/jquery/1.11.3/jquery.min.js?v=6.12" ></script>
</head>
<body>
<div class="row" style="    margin-top: 150px;">
    <div class="col-md-10 col-md-offset-1">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>标题</th>
                <th>描述</th>
                <th>内容</th>
                <th>添加时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${articleList}" var="list">
                <tr>
                    <th scope="row">${list.id}</th>
                    <td>${list.article_title}</td>
                    <td>${list.article_desc}</td>
                    <td>${list.article_content}</td>
                    <td>${list.created_at}</td>
                    <td>
                        <a class="btn btn-default" href="javascript:" role="button">添加</a>
                        <a class="btn btn-default" href="javascript:" role="button">修改</a>
                        <a class="btn btn-danger" href="javascript:" role="button">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>