<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>myOrder</title>

    <style type="text/css">
        table
        {
            border-collapse: collapse;
            margin: 0 auto;
            text-align: center;
        }
        table td, table th
        {
            border: 1px solid #fff;
            color: #666;
            height: 30px;
            text-align: center;
        }
        table thead th
        {
            background-color: #00CA4C;
            width: 100px;
        }
        table tr:nth-child(odd)
        {
            background: #fff;
        }
        table tr:nth-child(even)
        {
            background: #f5f5f5;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap/bootstrap.css">

    <link rel="stylesheet" href="../../css/animate.css">
    <link rel="stylesheet" href="../../css/select2.css">
    <link rel="stylesheet" href="../../css/helpers.css">
    <link rel="stylesheet" href="../../css/style.css">


</head>
<body>

<jsp:include page="header.jsp" />

<div id="main" class="probootstrap-cover overflow-hidden relative" style="background-image: url('../../images/bg_1.jpg'); " <%--data-stellar-background-ratio="0.5"--%> id="section-home">
    <div class="overlay"></div>
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-12">
                <table class="table" id="userorder"></table>
                <div id="orderDetail"></div>
            </div>
        </div>
    </div>
</div>

<script src="../../js/jquery-3.3.1.js"></script>
<script src="../../js/popper.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/jquery.waypoints.min.js"></script>
<script src="../../js/select2.min.js"></script>
<script src="../../js/main.js"></script>

<script>
    $("#userorder").html("<thead><tr><th>创建时间</th><th>订单号</th><th>车主</th><th>查看订单信息</th></tr></thead>");
    UserOrderPage(1);
    //分页订单显示
    function UserOrderPage(pageNum){
        $("#userorder").html("<thead><tr><th>创建时间</th><th>订单号</th><th>车主</th><th>查看订单信息</th></tr></thead>");
        var url2 = "<%= request.getContextPath()%>/userorder.do";
        var pageNumindex = {pageNum:pageNum.toString()};
        $.ajax({
            type:"post",
            url:url2,
            data:pageNumindex,
            success:function(data){
                if(data.length>0){
                    var $tab1 = $("#userorder");
                    var $tbody = $('tbody');
                    $.each(data, function(index, item){
                        var $tr = $('<tr>');
                        $.each(item, function(name, val){
                            if(name == "createTime"||name == "orderNo"||name == "carOwner"){
                                var $td = $('<td>').html(val);
                            }
                            $tr.append($td);
                        });
                        var $td = $('<td>').html("<button onclick='userorderinquiry("+index+")' data-toggle='modal' data-target='#userorderModal'>查看订单信息</button>");
                        $tr.append($td);
                        $tab1.append($tr);
                        $tab1.append($tbody);
                    });
                }else{
                    alert("没有订单信息");
                }
            }
        });

        var url = "<%= request.getContextPath()%>/orderDetail/view";
        $.post(url, function(data){
            $("#orderDetail").html(data);
        });
    }

    //查询订单信息
    function userorderinquiry(index){
        var url = "<%= request.getContextPath()%>/userorder1.do";
        var orderindex = {orderindex:index.toString()};
        $.ajax({
            type:"post",
            url:url,
            data:orderindex,
            success:function(data){
                if(data != null){
                    $("#createTime").val(data.createTime);
                    $("#userorderowner").val(data.orderOwner);
                    $("#userorderno").val(data.orderNo);
                    $("#carOwner").val(data.carOwner);
                    $("#userbz").val(data.bz);
                    $("#usercarTaxType").val(data.carTaxType);
                    $("#userA").val(data.a);
                    $("#userB").val(data.b);
                    $("#userD11").val(data.d11);
                    $("#userD12").val(data.d12);
                    $("#userG").val(data.g);
                    $("#userF").val(data.f);
                    $("#userL").val(data.l);
                    $("#userX1").val(data.x1);
                    $("#userZ").val(data.z);
                    $("#userJ1").val(data.j1);
                    $("#userA1").val(data.a1);
                    $("#usersYIAmount").val(data.syiAmount);
                    $("#userAmount").val(data.amount);
                }else{
                    $("#userorderModalBody").html("没有对应的订单信息");
                }
            }
        });
    }
</script>
</body>
</html>