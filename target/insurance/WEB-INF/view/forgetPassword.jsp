<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>forgetPassword</title>
    <link rel="stylesheet" type="text/css" href="../../css/register-login.css">
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap/bootstrap.css">
    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/jquery.easing.1.3.js"></script>

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
                <div class="group-ipt tel">
                    <input id="tel" type="text" name="tel" class="form-control" placeholder="请输入手机号" value="" required >
                </div>
            </div>
            <br/>
            <div class="form-group">
                <input id="back" type="button" onclick="javascrtpt:window.location.href='<%= request.getContextPath()%>/login.jsp'" class="btn btn-success" style="float: left"  value="返  回" />
                <input id="next" type="button" class="btn btn-success" style="float: right" value="下一步"/>
            </div>
        </form>
    </div>
</div>



<script>

    $('#next').click(function() {
        var url = "<%=request.getContextPath()%>/forget_password.do";
        var tel = $("#tel").val();
        $.post(url,{'tel':tel},function(data){
            if(data){
                window.location.replace("<%= request.getContextPath()%>/newPassword/view");
            }
            else if(tel == ""){
                alert("手机号不能为空");
            }
            else{
                alert("该用户不存在");
            }
        });

    })

</script>

</body>


</html>
