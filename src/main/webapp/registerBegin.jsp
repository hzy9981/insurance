<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>用户注册</title>
	<link rel="stylesheet" type="text/css" href="css/register-login.css">
	<script type="text/javascript" src="<c:url value="/js/jquery-3.3.1.js" />" ></script>
	<script type="text/javascript" src="js/valid.js"></script>
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
				<div class="slide-bar slide-bar1"></div>
			</div>
		</div>

		<form class="login form" id="register_form" <%--onsubmit="REGISTER.inputcheck()"--%>>
			<div class="group">
				<div class="group-ipt username">
					<input type="text" name="username" id="username" class="ipt" placeholder="用户名" onclick="javascript:$('#isUser').empty()" onchange="checkUsername()" required>
				</div>
					<p id="isUser" style="color: #bd4147;"></p>

				<div class="group-ipt email">
					<input type="email" name="email" id="email" class="ipt" placeholder="邮箱地址" onclick="javascript:$('#isEmail').empty()" onchange="checkEmail()" required>
				</div>
					<p id="isEmail" style="color: #bd4147;"></p>

				<div class="group-ipt phone">
					<input type="text" name="tel" id="tel" class="ipt" placeholder="手机号" onclick="javascript:$('#isTel').empty()" onchange="checkTel()" required>
				</div>
					<p id="isTel" style="color: #bd4147;"></p>

				<div class="group-ipt password">
					<input type="password" name="password" id="password" class="ipt" placeholder="设置登录密码" onclick="javascript:$('#isPassword').empty()" required>
				</div>
					<p id="isPassword" style="color: #bd4147;"></p>

				<div class="group-ipt password1">
					<input type="password" name="password1" id="password1" class="ipt" placeholder="重复密码" onclick="javascript:$('#isPassword1').empty()" onchange="checkPassword()" required>
				</div>
					<p id="isPassword1" style="color: #bd4147;"></p>

				<div class="group-ipt question">
					<input type="text" name="question" id="question" class="ipt" placeholder="请输入密码提示问题" required>
				</div>
                <p id="isQuestion" style="color: #bd4147;"></p>

				<div class="group-ipt answer">
					<input type="text" name="answer" id="answer" class="ipt" placeholder="请输入密码提示问题答案" required>
				</div>
                <p id="isAnswer" style="color: #bd4147;"></p>

			</div>


		<div class="button">
			<button onclick="REGISTER.reg();" type="button" class="login-btn register-btn" id="button">注册</button>
		</div>

		</form>
	</div>
</div>



<script type="text/javascript">
    $.ajaxSetup({
        async : false
    });

    function checkUsername(){
        var result;
        var url="<%=request.getContextPath()%>/checkUser.do";
        var username = $("#username").val();
        $.post(url,{'username':username},function(data){
            result=data;
            if(data){
                $("#isUser").empty();
            }else{
                $("#isUser").html("该用户名已存在");
                $("#username").focus();
            }
        });
        return result;

        /*var username = $("#username").val();
        $.ajax({
			type:"post",
            url:"<%=request.getContextPath()%>/checkUser.do",
			data:{'username':username},
            async: false,
            success: function(data) {
                result=data;
                if(data){
                    $("#isUser").html("该用户名已存在");
                    $("#username").focus();
                }else{
                    $("#isUser").empty();
                }
            }
		});
        return result;*/
    }

    function checkTel(){

        //手机号验证
        if(!isTel($('#tel').val())){
            $("#isTel").html("手机号格式有误");
            $("#tel").focus();
            return false;
        }
        var result;
        var url="<%=request.getContextPath()%>/checkTel.do";
        var tel = $("#tel").val();
        $.post(url,{'tel':tel},function(data){
            result=data;
            if(data){
                $("#isTel").empty();
            }else{
                $("#isTel").html("该手机号已注册");
                $("#tel").focus();
            }
        });
        return result;
    }

    function checkEmail(){
        var result;
        var url="<%=request.getContextPath()%>/checkEmail.do";
        var email = $("#email").val();
        $.post(url,{'email':email},function(data){
            result=data;
            if(data){
                $("#isEmail").empty();
            }else{
                $("#isEmail").html("该邮箱已注册");
                $("#email").focus();
            }
        });
        return result;
    }
    function checkPassword(){
        //密码检查
        if ($("#password").val() != $("#password1").val()) {
            $("#isPassword1").html("确认密码与密码不一致");
            $("#password1").focus();
            return false;
        }else{return true}
    }

    var REGISTER={
        inputcheck:function() {
            //不能为空检查
            if ($("#username").val() == "") {
                $("#isUser").html("用户名不能为空");
                $("#username").focus();
                return false;
            }
            if ($("#email").val() == "") {
                $("#isEmail").html("邮箱不能为空");
                $("#email").focus();
                return false;
            }
            if ($("#tel").val() == "") {
                $("#isTel").html("手机号不能为空");
                $("#tel").focus();
                return false;
            }
            if ($("#password").val() == "") {
                $("#isPassword").html("密码不能为空");
                $("#password").focus();
                return false;
            }
            if ($("#question").val() == "") {
                $("#isQuestion").html("密保问题不能为空");
                $("#question").focus();
                return false;
            }
            if ($("#answer").val() == "") {
                $("#isAnswer").html("密保答案不能为空");
                $("#answer").focus();
                return false;
            }
            //检查用户是否已经被占用
            return((checkUsername()&&checkTel()&&checkEmail()&&checkPassword()));

        },
        submit:function() {
            var url = "<%=request.getContextPath()%>/register.do";
            var args = $("#register_form").serializeArray();
            $.post(url, args, function (data) {
                alert(data);
            });
        },

        reg:function() {
            if (this.inputcheck()) {
                this.submit();
                window.location.replace("<%= request.getContextPath()%>/login.jsp");
            }else return false;
        }
    };

</script>



</body>
</html>