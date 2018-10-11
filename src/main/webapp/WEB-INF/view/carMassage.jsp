<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>carMassage</title>

    <link rel="stylesheet" type="text/css" href="../../css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap/bootstrap.css">

    <link rel="stylesheet" href="../../css/animate.css">
    <link rel="stylesheet" href="../../css/select2.css">
    <link rel="stylesheet" href="../../css/helpers.css">
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../css/page.css">
    <link rel="stylesheet" href="../../css/index.css">
    <link rel="stylesheet" href="../../css/filter.css">



</head>
<body>

<jsp:include page="header.jsp" />
<div id="main" class="probootstrap-cover overflow-hidden relative" style="background-image: url('../../images/bg_1.jpg'); " <%--data-stellar-background-ratio="0.5"--%> id="section-home">
    <div class="overlay"></div>
    <div class="container">
        <div class="row align-items-center">
<div class="col-md-12 page">
    <div id="filter">
    </div>

    <%--<input id="demo_value" value="" />--%>
    <div id="title" class="col-md-12 title"><!--title标题展示--></div>
    <div id="detail" class="col-md-12 page_info"><!--详细数据--></div>

        <div class="page-data">
            <div class="page-left"  style="margin-top: 5px;"></div>
        </div>
        <div>
            <input id="last_btn" type="button" onclick="javascrtpt:history.go(-1)" class="btn btn-success" value="返  回" align="right"/>
            <input id="next_btn" type="button" class="btn btn-success" value="下一步" align="right"/>
        </div>

</div>

        </div>
    </div>
</div>
</body>


<script src="../../js/jquery-3.3.1.js"></script>
<script src="../../js/popper.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/jquery.waypoints.min.js"></script>
<script src="../../js/select2.min.js"></script>
<script src="../../js/main.js"></script>

<script src="../../js/pager.js"></script>
<%--<script src="../../js/index.js"></script>--%>
<script src="../../js/filter.js"></script>

<script>
    //加载事件
    var data=[
        {
            "url":"",
            "title": "年款",
            "name":"year",
            "multiple": false,
            "data": [
                {
                    "id":"1",
                    "css":"common",
                    "name":"1",
                    "value": "2017"
                },
                {
                    "id":"2",
                    "css":"common",
                    "name":"2",
                    "value": "2016"
                },
                {
                    "id":"3",
                    "css":"common",
                    "name":"3",
                    "value": "2015"
                }
            ]
        },
        {
            "title": "排量",
            "name":"displacement",
            "multiple": false,
            "data": [
                {
                    "id":"1",
                    "css":"common",
                    "name":"1",
                    "value": "1.5"
                },
                {
                    "id":"2",
                    "css":"common",
                    "name":"2",
                    "value": "1.8"
                },
                {
                    "id":"3",
                    "css":"common",
                    "name":"3",
                    "value": "2.0"
                },
                {
                    "id":"4",
                    "css":"common",
                    "name":"4",
                    "value": "3.0"
                }
            ]
        },
        {
            "title": "变速箱类别",
            "name":"gearbox",
            "multiple": false,
            "data": [
                {
                    "id":"1",
                    "css":"common",
                    "name":"1",
                    "value": "自动变速(AT)"
                },
                {
                    "id":"2",
                    "css":"common",
                    "name":"2",
                    "value": "手动变速(MT)"
                },
                {
                    "id":"3",
                    "css":"common",
                    "name":"3",
                    "value": "CVT"
                },
                {
                    "id":"4",
                    "css":"common",
                    "name":"4",
                    "value": "半自动"
                }
            ]
        }
    ];

    $('#filter').comboboxfilter({
        scope: 'FilterQuery2',
        data:data,
        onChange:function(newValue){
            $('#demo_value').val(newValue);
            var name = newValue;
            if(name==null||name==''){name="${brand_input}"}
            $.getJSON({
                type: "GET",
                url:"../../js/carMassage.json",
                dataType:"json",
                success: function(e) {
                    page_func(e.car.car_list);
                    var item =e.car.car_list;
                    query(name,item);
                }
            });
        }
    });

    function query(name,item){
        var query =[];
        $(".page_info").empty();
        var name1 = name.split(",");
        /*var name1= name.slice(0,4);
        var name2= name.slice(5,9);
        var name3= name.slice(9);*/
        var brand = "${brand_input}";
        $.each(item, function(idx,obj){
            if(name1.length==1){
                if(brand == obj.brand && (name == obj.year||name == obj.displacement||name == obj.gearbox|| name==obj.brand)){
                query.push(item[idx]);
            }}
            if(name1.length==2){
                if(brand == obj.brand && name1[0]== obj.year && name1[1]== obj.displacement){
                    query.push(item[idx]);
                }
                else if(brand == obj.brand && name1[0] == obj.year && name1[1]== obj.gearbox){
                    query.push(item[idx]);
                }
                else if(brand == obj.brand && name1[0] == obj.displacement && name1[1]== obj.gearbox){
                    query.push(item[idx]);
                }
            }
            if(name1.length==3){
                if(brand == obj.brand && name1[0]== obj.year && name1[1]== obj.displacement&& name1[2]== obj.gearbox){
                    query.push(item[idx]);
                }
            }
        });

        if(query.length==0){
            alert("暂无数据！");
            return;
        }
        page_func(query)

    }



    //分页展示数据
    var page = 10;

    //页面title（标题展示）
    var title = '<div class="col-lg-1 one">选择</div>'+
        '<div class="col-lg-1 one brand">品牌</div>'+
        '<div class="col-lg-1 one year">年款</div>'+
        '<div class="col-lg-1 one price">价格</div>'+
        '<div class="col-lg-1 one displacement">排量</div>'+
        '<div class="col-lg-1 one numberOfSeats">座位数</div>'+
        '<div class="col-lg-3 one gearbox">变速箱类别</div>'+
        '<div class="col-lg-3 one model">型号</div>';
    $("#title").append(title);

    //分页函数

    function page_func(carMassage){
        $.each(carMassage, function(idx,obj){
            if(idx<page){
                dateinfo(obj)
            }
        });
        var content=carMassage.length;       //总数
        var pageTotal=Math.ceil(content/page);  //分页数量
        var html='<ul class="pagination" style="margin:0;" id="page2"></ul>';
        $(".page-left").append(html);
        Page({
            num:pageTotal,             //页码数
            startnum:1,
            pagesize:page,             //每页显示的数量
            elem:$('#page2'),       //指定的元素
            callback:function(n){   //回调函数
                pagination(n,carMassage);
            }
        });
    }

    $.getJSON({
        type: "GET",
        url:"../../js/carMassage.json",
        async: false,
        cache:false,
        dataType:"json",
        error: function () {
            alert('获取数据失败');
        },
        success: function(e) {
            var name = "${brand_input}";
            var item =e.car.car_list;
            select(name,item);
        }
    });

    //表单数据
    function dateinfo(obj){
        var detail ='<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 page_detail">'+
            '<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 one">'+
            '<input type="checkbox" name="items" class="car_id" value="'+obj.id+'" id="item">'+
            '</div>'+
            '<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 one" id="brand">'+obj.brand+'</div>'+
            '<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 one" id="year">'+obj.year+'</div>'+
            '<div class="col-lg-1 col-md-1 col-sm-2 col-xs-2 one" id="price">'+obj.price+'</div>'+
            '<div class="col-lg-1 col-md-1 col-sm-2 col-xs-2 one" id="displacement">'+obj.displacement+'</div>'+
            '<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 one" id="numberOfSeats">'+obj.numberOfSeats+'</div>'+
            '<div class="col-lg-3 col-md-3 col-sm-2 col-xs-2 one" id="gearbox">'+obj.gearbox+'</div>'+
            '<div class="col-lg-3 col-md-3 col-sm-2 col-xs-2 one" id="model">'+obj.model+'</div>'+
            '</div>';
        $(".page_info").append(detail);
    }

    //页数控制
    function pagination(num,list){
        $(".page_info").html('');
        $.each(list, function(idx,obj){
            if(idx>=((num-1)*page) && idx<(num*page)){
                dateinfo(obj);
            }
        });
    }

    //筛选条件
    function select(name,item){
        var sol =[];
        /!*$(".page_info").empty();*!/
        $.each(item, function(idx,obj){
            var brand = obj.brand;
            if(name == brand){
                sol.push(item[idx]);
            }
        });
        if(sol == null){
            $(".page_info").html('没有搜索到符合条件车型');}
            else{
            page_func(sol);
        }
    }

    $('#next_btn').click(function() {
        var signs = $("input[name='items']");
        var ids = [];
        $.each(signs,function(key,obj){
            if(obj.checked){
                var id = obj.value;
                ids.push(id);
            }
        });
        //获取选中信息
        if(ids.length == 1 ){
            $.each(ids, function(idx,obj){
                    var brand = $(':checked').parent().next().text();
                    var year = $(':checked').parent().next().next().text();
                    var price = $(':checked').parent().next().next().next().text();
                    var displacement = $(':checked').parent().next().next().next().next().text();
                    var numberOfSeats = $(':checked').parent().next().next().next().next().next().text();
                    var gearbox = $(':checked').parent().next().next().next().next().next().next().text();
                    var model = $(':checked').parent().next().next().next().next().next().next().next().text();
                    var url = "<%=request.getContextPath()%>/carMassageHandin.do";
                    $.ajax({
                        type:"post",
                        url: url,
                        data:{"brand":brand,
                            "year":year,
                            "price":price,
                            "displacement":displacement,
                            "numberOfSeats":numberOfSeats,
                            "gearbox":gearbox,
                            "model":model}
                    });
                    window.location.href="<%= request.getContextPath()%>/order_create/view";

            });
        }

        else if(ids.length == 0){
            alert("请选择车辆信息！");
        }
        else{alert("只能选择一个");}



    });
</script>



</html>
