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

$.ajax({
    type: "GET",
    url:"../../js/carMassage.json",
    dataType:"json",
    error: function () {
        alert('获取数据失败');
    },
    success: function(e) {
        /*page_func(e.car.car_list);*/

        var name = '${brand}';
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
    var sol = [];
    $(".page_info").empty();
    $.each(item, function(idx,obj){
        var brand = obj.brand;
        if(name == brand){
            sol.push(item[idx]);
        }
    });
    page_func(sol);
    if(sol = []){
        $(".page_info").html('没有搜索到符合条件车型');
    }
}