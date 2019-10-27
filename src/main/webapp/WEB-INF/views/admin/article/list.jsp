<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>文章列表页面</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://libs.baidu.com/jquery/1.11.3/jquery.min.js?v=6.12" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
<a class="btn btn-default logout-dom" href="javascript:" role="button">注销登录</a>
<div class="row" style="margin-top: 150px;">
    <div class="col-md-10 col-md-offset-1">
        <a class="btn btn-default add-article-dom" href="javascript:" role="button">添加</a>
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
                    <td data-id="${list.id}">
                        <a class="btn btn-default edit-article-dom" href="javascript:" role="button">修改</a>
                        <a class="btn btn-danger del-article" href="javascript:" role="button">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加文章</h4>
            </div>
            <div class="modal-body">
                <form class="myFormAdd">
                    <div class="form-group">
                        <label for="article_title_add">文章标题</label>
                        <input type="text" class="form-control" id="article_title_add" placeholder="文章标题" name="article_title">
                    </div>
                    <div class="form-group">
                        <label for="article_desc_add">文章描述</label>
                        <input type="text" class="form-control" id="article_desc_add" placeholder="文章描述" name="article_desc">
                    </div>
                    <div class="form-group">
                        <label for="article_content_add">文章内容</label>
                        <textarea name="article_content" id="article_content_add" cols="30" rows="10" class="form-control"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary do-add-article">提交更改</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModalEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" >修改文章</h4>
            </div>
            <div class="modal-body">
                <form class="myFormEdit">
                    <div class="form-group">
                        <label for="article_title_edit">文章标题</label>
                        <input type="text" class="form-control" id="article_title_edit" placeholder="文章标题" name="article_title">
                    </div>
                    <div class="form-group">
                        <label for="article_desc_edit">文章描述</label>
                        <input type="text" class="form-control" id="article_desc_edit" placeholder="文章描述" name="article_desc">
                    </div>
                    <div class="form-group">
                        <label for="article_content_edit">文章内容</label>
                        <textarea name="article_content" id="article_content_edit" cols="30" rows="10" class="form-control"></textarea>
                    </div>
                    <input type="hidden" name="id" value="0" class="id-edit-dom">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary do-edit-article">提交更改</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(function(){
        var body = $("body");
        $(".add-article-dom").click(function(){
            $('#myModal').modal('show');
        });
        body.on("click",".do-add-article",function(){
            var url  = "/admin/article/add-article";
            var data = $(".myFormAdd").serialize();
            $.post(url,data,function(sta){
                if(sta.code!=0){
                    alert(sta.msg);
                    return false;
                }
                alert("操作成功！");
                window.location.reload();
            },'json');
        });
        $(".edit-article-dom").click(function(){
            var id = $(this).closest("td").data("id");
            var url = "/admin/article/detail";
            var data = {};
            data.id = id;
            $.post(url,data,function(sta){
                if(sta.code!=0){
                    alert(sta.msg);
                    return false;
                }
                $("#article_title_edit").attr("value",sta.data.article.article_title);
                $("#article_desc_edit").attr("value",sta.data.article.article_desc);
                $("#article_content_edit").html(sta.data.article.article_content);
                $(".id-edit-dom").attr("value",id);
                $('#myModalEdit').modal('show');
            },'json');
            console.log(id);
        });
        body.on("click",".do-edit-article",function(){
            var url = "/admin/article/edit-article";
            var data = $(".myFormEdit").serialize();
            $.post(url,data,function(sta){
                if(sta.code!=0){
                    alert(sta.msg);
                    return false;
                }
                alert("操作成功！");
                window.location.reload();
            },'json');
        });
        body.on("click",".del-article",function(){
            var id = $(this).closest("td").data("id");
            var url = "/admin/article/del-article";
            var data = {};
            data.id = id;
            $.post(url,data,function(sta){
                if(sta.code!=0){
                    alert(sta.msg);
                    return false;
                }
                alert("操作成功");
                window.location.reload();
            },'json');
        });
        body.on("click",".logout-dom",function(){
            var url = "/login/logout";
            var data  = {};
            $.post(url,data,function(sta){
                if(sta.code!=0){
                    alert(sta.msg);
                    return false;
                }
                alert("登出成功");
                window.location.href = "/login/index";
                return true;
            },'json');
        });

    })
</script>


</body>
</html>

