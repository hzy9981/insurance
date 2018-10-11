<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--导航栏-->
<nav class="navbar navbar-expand-lg navbar-dark probootstrap_navbar" id="probootstrap-navbar">
    <div class="container">
        <a class="navbar-brand" href="<%= request.getContextPath()%>/welcome/view">CarInsurance</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#probootstrap-menu" aria-controls="probootstrap-menu" aria-expanded="false" aria-label="Toggle navigation">
            <span><i class="ion-navicon"></i></span>
        </button>
        <div class="collapse navbar-collapse" id="probootstrap-menu">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath()%>/welcome/view">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath()%>/order/view" >购买车险</a></li>
                <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath()%>/myOrder/view" >我的订单</a></li>
                <li class="nav-item"><a class="nav-link" href="<%= request.getContextPath()%>/userCenter/view">个人中心</a></li>
                <li class="nav-item"><a class="nav-link" href="javascript:logout()">退出</a></li>
            </ul>
        </div>
    </div>
</nav>
<!-- END nav -->
<script>
    function logout() {
        $.post('/logout.do');
        location.href = '/login.jsp';
    }
</script>