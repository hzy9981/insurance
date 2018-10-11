<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>userCenter</title>

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
            <div class="col-md-6 probootstrap-animate probootstrap-form form-group">
            <div class="col-md">
                用户名：<input id="username" type="text" name="username" class="form-control" value=" ${user.username}" disabled >
                <br />
                手机号：<input id="tel" name="tel" type="text" class="form-control" value="${user.tel}" disabled >
                <br />
                邮箱：<input id="email" name="email" type="text" class="form-control" value="${user.email}" disabled >
                <br />
                <input id="updatePassword" type="button" onclick="javascrtpt:window.location.href='<%= request.getContextPath()%>/updatePassword/view'" class="btn btn-success" value="修改密码" />
                <%--<input id="userInfo" type="button" onclick="javascrtpt:window.location.href='<%= request.getContextPath()%>/view/updatePassword'" class="btn btn-success" value="完善信息" />--%>
            </div>
            </div>
        </div>
    </div>

</div>

</body>


</html>