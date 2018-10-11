//分页展示数据
var page = 10;

//页面title（标题展示）
var title = '<div class="col-lg-3 one createTime">创建时间</div>'+
    '<div class="col-lg-3 one orderOwner">投保人</div>'+
    '<div class="col-lg-3 one carOwner">车主</div>'+
    '<div class="col-lg-3 one detail">订单详情</div>';
$("#title").append(title);

//分页函数

function page_func(data){
    $.each(data, function(idx,obj){
        if(idx<page){
            dateinfo(obj)
        }
    });
    var content=data.length;       //总数
    var pageTotal=Math.ceil(content/page);  //分页数量
    var html='<ul class="pagination" style="margin:0;" id="page2"></ul>';
    $(".page-left").append(html);
    Page({
        num:pageTotal,             //页码数
        startnum:1,
        pagesize:page,             //每页显示的数量
        elem:$('#page2'),       //指定的元素
        callback:function(n){   //回调函数
            pagination(n,data);
        }
    });
}

$.ajax({
    type: "GET",
    url:"order.xml",
    dataType:"xml",
    error: function () {
        alert('获取数据失败');
    },
    success: function(data) {
        /* page_func(data);*/
        /* var name = $.session.getValue("LOGINED_USER");
         var item =e.car.car_list;
         alert(name);
         select(name,item);*/
        alert('获取数据成功');
        $(data).find("order").each(function (i) {
            var orderOwner = $(this).children("orderOwner").text();
            $("#page_info").html(orderOwner);
        })
    }
});



//表单数据
function dateinfo(obj){
    var detail ='<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 page_detail">'+
        '<div class="col-lg-2 col-md-1 col-sm-1 col-xs-1 one">'+obj.orderNo+'</div>'+
        '<div class="col-lg-2 col-md-1 col-sm-1 col-xs-1 one year">'+obj.createTime+'</div>'+
        '<div class="col-lg-2 col-md-1 col-sm-2 col-xs-2 one price">'+obj.carOwner+'</div>'+
        '<div class="col-lg-3 col-md-1 col-sm-2 col-xs-2 one displacement">'+obj.bz+'</div>'+
        '<div class="col-lg-3 col-md-1 col-sm-1 col-xs-1 one numberOfSeats">'+obj.carTaxType+'</div>'+
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