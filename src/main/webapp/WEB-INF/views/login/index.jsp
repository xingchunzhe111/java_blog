<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>登录页面</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://libs.baidu.com/jquery/1.11.3/jquery.min.js?v=6.12" ></script>
</head>
<body>

<div class="row" style="    margin-top: 150px;">
    <div class="col-md-2 col-md-offset-5">
        <form class="myForm">
            <div class="form-group">
                <label for="exampleInputEmail1">用户名</label>
                <input type="text" class="form-control" id="exampleInputEmail1" placeholder="用户名" name="username">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">密码</label>
                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="密码" name="password">
            </div>
            <button type="submit" class="btn btn-default btn-dom-sub" onclick="return false;">提交</button>
        </form>
    </div>
</div>
<script>
    $(function(){
        $(".btn-dom-sub").click(function(){
            var url = "/login/do-login";
            var data = $(".myForm").serialize();
            $.post(url,data,function(sta){
                if(sta.code!=0){
                    alert(sta.msg);
                    return false;
                }
                window.location.href = sta.data.url;
            },'json');
        })
    })
</script>
</body>
</html>