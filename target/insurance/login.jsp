<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>用户登录</title>
	<link rel="stylesheet" type="text/css" href="css/register-login.css">
    <script src="js/jquery.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>

</head>
<body>
<div class="overlay"></div>
<div id="divMain" class="cent-box register-box">
	<div id="divHeader" class="cent-box-header">
		<h1 class="title">车险平台用户登录</h1>
		<h2 class="sub-title">欢迎登录车险选购平台</h2>
	</div>
	<div class="cont-main clearfix">
		<div class="index-tab">
			<div class="index-slide-nav">
				<a href="<%= request.getContextPath()%>/login.jsp">登录</a>
                <a href="<%= request.getContextPath()%>/registerBegin.jsp">注册</a>
				<div class="slide-bar"></div>
			</div>
		</div>

		<form class="login form" id="login_form">
			<div class="group">
				<div class="group-ipt username">
					<input type="text" name="username" id="username" class="form-control" placeholder="用户名" onclick="javascript:$('#erro').empty();" onchange="isUsername()" value="" required>
				</div>

				<div class="group-ipt password">
					<input type="password" name="password" id="password" placeholder="登录密码" required>
				</div>
			</div>
			<p id="erro" style="color: #bd4147; font-weight:bold;"></p>

			<br/>
			<input type="button" class="login-btn register-btn" onclick="login()" id="button" value="登录">

		<div class="remember clearfix">
			<label class="remember-me"><span class="icon"><span class="zt"></span></span><input type="checkbox" name="remember-me" id="remember-me" class="remember-mecheck" checked>记住我</label>
			<label class="forgot-password">
				<a href="<%= request.getContextPath()%>/forgetPassword/view">忘记密码？</a>
			</label>
		</div>
		</form>
	</div>
</div>



<script>
	$("#remember-me").click(function(){
		var n = document.getElementById("remember-me").checked;
		if(n){
			$(".zt").show();
		}else{
			$(".zt").hide();
		}
	});

	function isUsername(){

        var url="<%=request.getContextPath()%>/checkUser.do";
        var username = $("#username").val();
        $.post(url,{'username':username},function(data){
            if(data){
                $("#erro").html("用户不存在");
                $("#username").focus();
                return false;
            }else{
                $("#isUser").empty();
            }
        });

    }

    function login() {
        if ($("#username").val() == "") {
            $("#erro").html("用户名不能为空");
            $("#username").focus();
            return false;
        }
        if ($("#password").val() == "") {
            $("#erro").html("密码不能为空");
            $("#password").focus();
            return false;
        }


        else{
        //登录反馈
        var url="<%=request.getContextPath()%>/checkLogin.do";
        var args=$("#login_form").serializeArray();
        $.post(url,args,function(data){
            if(data){
                window.location.replace("<%= request.getContextPath()%>/welcome/view");
            }else{
                $("#erro").html("密码错误");
                $("#password").focus();
                return false;
            }
        });
        }
	}


</script>
</body>
</html>