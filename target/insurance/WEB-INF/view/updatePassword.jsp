<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>updatePassword</title>

    <link rel="stylesheet" href="../../css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="../../css/animate.css">
    <link rel="stylesheet" href="../../css/select2.css">
    <link rel="stylesheet" href="../../css/helpers.css">
    <link rel="stylesheet" href="../../css/style.css">

    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/popper.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <script src="../../js/jquery.waypoints.min.js"></script>
    <script src="../../js/jquery.easing.1.3.js"></script>
    <script src="../../js/select2.min.js"></script>
    <script src="../../js/main.js"></script>

</head>

<body>
<jsp:include page="header.jsp" />
<div id="main" class="probootstrap-cover overflow-hidden relative" style="background-image: url('../../images/bg_1.jpg'); " <%--data-stellar-background-ratio="0.5"--%> id="section-home">
    <div class="overlay"></div>
    <div class="container">
        <div class="row mb-3">
            <div class="col-md-3">
            </div>
            <div class="row align-items-center text-center">
                <%--<div class="col-md">
                    <p class="lead mb-5 probootstrap-animate">修改密码</p>
                </div>--%>
            </div>
            <div class="col-md-6 probootstrap-animate probootstrap-form form-group">
                <div class="col-md">
                    旧密码：<input id="password" name="password" type="password" class="form-control" onclick="javascript:$('#isPassword').empty();" value="" required >
                    <p id="isPassword" style="color: #bd4147"></p>
                    新密码：<input id="newPassword" name="newPassword" type="password" class="form-control" value="" onclick="javascript:$('#newpassword').empty();" required >
                    <p id="newpassword" style="color: #bd4147"></p>
                    请再次输入新密码：<input id="newPassword1" name="newPassword1" type="password" class="form-control" value="" onclick="javascript:$('#Password').empty();" onchange="isPassword()" required >
                    <p id="Password" style="color: #bd4147"></p>
                    <input id="update" type="button" class="btn btn-success" value="提交" />
                    <%--<input id="userInfo" type="button" onclick="javascrtpt:window.location.href='<%= request.getContextPath()%>/view/updatePassword'" class="btn btn-success" value="完善信息" />--%>
                </div>
            </div>
        </div>
    </div>

</div>

<script>
    $.ajaxSetup({
        async : false
    });

    function isPassword(){
        //密码检查
        if ($("#newPassword").val() != $("#newPassword1").val()) {
            $("#Password").html("确认密码和密码不一致，请重新输入！");
            $("#newPassword1").focus();
            return false;
        }
    }

    $('#update').click(function() {
        //密码为空检查
        if ($("#newPassword").val() == "") {
            $("#newpassword").html("密码不能为空");
            $("#newPassword").focus();
            return false;
        }
        var url1="<%=request.getContextPath()%>/checkLogin.do";
        var password=$("#password").val();
        $.post(url1,{'password': password,'username': '${user.username}'},function(data){
            if(!data){
                $("#isPassword").html("旧密码输入错误");
                $("#isPassword").focus();
                return false;
            }
            else {
                var url2 = "<%=request.getContextPath()%>/update_password.do";
                var newPassword = $("#newPassword").val();
                $.post(url2, {'newPassword': newPassword}, function (data) {
                alert(data);
                });
            window.location.href = '<%= request.getContextPath()%>/userCenter/view';
            }
        });
    });
</script>
</body>


</html>