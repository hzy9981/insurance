<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
	<head>

		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<title>Home</title>

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
    <div id="main" class="probootstrap-cover overflow-hidden relative" style="height: 728px; background-image: url('../../images/bg_1.jpg'); " <%--data-stellar-background-ratio="0.5"--%> id="section-home">
      <div class="overlay"></div>
      <div class="container">
        <div class="row align-items-center text-center">
          <div class="col-md">
            <h2 class="heading mb-2 display-4 font-light probootstrap-animate">欢迎来到车险选购平台</h2>
            <p class="lead mb-5 probootstrap-animate">
            </p>
              <a href="<%= request.getContextPath()%>/order/view" target="_blank" role="button" class="btn btn-primary p-3 mr-3 pl-5 pr-5 text-uppercase d-lg-inline d-md-inline d-sm-block d-block mb-3">选购车险</a>
          </div> 
        </div>
      </div>
    
    </div>


	</body>


</html>