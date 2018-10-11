<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>newPassword</title>
    <link rel="stylesheet" type="text/css" href="../../css/register-login.css">
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap/bootstrap.css">

    <script src="../../js/jquery.min.js"></script>
</head>
<body>
<div class="overlay"></div>
<div id="divMain" class="cent-box register-box">
    <div id="divHeader" class="cent-box-header">
        <h1 class="title">重置密码</h1>
    </div>
    <div class="cont-main clearfix">
        <form class="login form">
            <br/><br/>
            <div class="group">
                <div class="group-ipt row md-3">
                    <label style="color: #000">重置密码问题：</label><input id="question" type="text" name="question" class="group-ipt question" value=" ${user.question}" disabled >
                    <%--<label style="color: #000">答案：</label>--%><input id="answer" name="answer" type="text" class="group-ipt answer" value="" placeholder="请输入问题答案" required >
                    <%--<label style="color: #000">新密码：</label>--%><input id="newPassword" name="newPassword" type="password" class="group-ipt newPassword" value="" onclick="javascript:$('#newpassword').empty();" placeholder="请输入新密码" required >
                    <p id="newpassword" style="color: #bd4147"></p>
                    <%--<label style="color: #000">请再次输入新密码：</label>--%><input id="newPassword1" name="newPassword1" type="password" class="group-ipt newPassword1" value="" onchange="Password()" placeholder="再次输入新密码" required >
                    <p id="Password" style="color: #bd4147"></p>
                </div>
            </div>
            <br/>
            <div class="form-group">
                <input id="back" type="button" onclick="javascrtpt:window.location.href='<%= request.getContextPath()%>/login.jsp'" class="btn btn-success" style="float: left"  value="返  回" />
                <input id="submit" type="button" class="btn btn-success" style="float: right" value="提交"/>
            </div>
        </form>
    </div>
</div>


<script>
    $.ajaxSetup({
        async : false
    });

    function Password(){
        if ($('#newPassword').val() != $("#newPassword1").val()) {
            $('#Password').html("确认密码和密码不一致，请重新输入！");
            $('#newPassword1').focus();
            return false;
        }else{
            $('#Password').empty();
            return true;
        }
    }

    $('#submit').click(function() {
        //问题检查
       if($("#answer").val() != "${user.answer}"){
           alert('问题答案有误!');
           return false;
       }
        if($("#newPassword").val() == ""){
            $("#newpassword").html("密码不能为空");
            return false;
        }
        else{
           var url = "<%=request.getContextPath()%>/update_password.do";
           var newPassword = $("#newPassword").val();
           $.post(url,{'newPassword':newPassword},function(data){
               alert(data);
           });
           window.location.replace("<%= request.getContextPath()%>/login.jsp");
        }
    });
</script>
</body>


</html>
