<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<!-- 购买车险 -->
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Order</title>

    <link rel="stylesheet" href="../../css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="../../css/animate.css">
    <link rel="stylesheet" href="../../css/select2.css">

    <link rel="stylesheet" href="../../fonts/ionicons/css/ionicons.min.css">
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
        <div class="row align-items-center">
            <div style="width:80%; margin:0 auto;">
                <ol class="progress-wrap">
                    <li class="progress-one">
                        <div class="progress-line"></div>
                        <div class="progress-content">
                            <span class="progress-number" id="start">1</span>
                            <span class="progress-text">选择报价地区</span>
                        </div>
                    </li>
                    <li class="progress-two">
                        <div class="progress-line"></div>
                        <div class="progress-content">
                            <span class="progress-number" id="second">2</span>
                            <span class="progress-text">填写车辆信息</span>
                        </div>
                    </li>
                    <li class="progress-third">
                        <div class="progress-line"></div>
                        <div class="progress-content">
                            <span class="progress-number" id="third">3</span>
                            <span class="progress-text">制定方案</span>
                        </div>
                    </li>
                    <li class="progress-end">
                        <div class="progress-content">
                            <span class="progress-number" id="end">4</span>
                            <span class="progress-text">订单生成</span>
                        </div>
                    </li>
                </ol>
            </div>

            <div class="col-md-3">
            </div>
            <form id="order_create" class="col-md-6 probootstrap-animate probootstrap-form">
                <h3 class="form-title">车辆保险选择</h3>
                <div class="col-sm-9 col-md-9">
                    <h5>交强险</h5>
                    <div class="form-group">
                        <label for="BZ">交强险</label>
                        <input id="BZ" name="BZ" type="text" class="form-control required" onfocus='if($(this).val()==""){$(this).val("122000");}'/>
                    </div>
                    <div class="form-group">
                        <label for="carTaxType">车船税缴纳类型</label>
                        <select id="carTaxType" name="carTaxType" class="form-control" title="车船税缴纳类型">
                            <option value ="1">减税</option>
                            <option value ="2">免税</option>
                            <option value ="3">正常纳税</option>
                            <option value ="4">拒缴</option>
                            <option value ="5">已完税</option>
                        </select>
                    </div>
                    <h5>商业险：基本险</h5>
                    <div class="form-group">
                        <label for="A">车损险</label>
                        <input id="A" name="A" type="text" class="form-control required" onfocus='if($(this).val()==""){$(this).val("95080.8");}'/>
                        <input type="checkbox" onclick='if($(this).prop("checked")){$("#A").val("0");}else{$("#A").val("95080.8");}'/>不计免赔
                    </div>
                    <div class="form-group">
                        <label for="B">三责险</label>
                        <select  class="form-control"  title="三责险" name="B" id="B">
                            <option value ="50000" selected = "selected">5万</option>
                            <option value ="100000">10万</option>
                            <option value ="150000">15万</option>
                            <option value ="200000">20万</option>
                            <option value ="300000">30万</option>
                            <option value ="500000">50万</option>
                            <option value ="1000000">100万</option>
                            <option value ="2000000">大于100万</option>
                            <option value = "0">不计免赔</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="D11">司机责任险</label>
                        <input id="D11" name="D11" type="text" class="form-control required" onfocus='if($(this).val()==""){$(this).val("10000");}'/>
                        <input type="checkbox" onclick='if($(this).prop("checked")){$("#D11").val("0");}else{$("#D11").val("10000");}'/>不计免赔
                    </div>
                    <div class="form-group">
                        <label for="D12">乘客责任险</label>
                        <div class="row mb-3">
                        <div class="input-group">
                            <input id="D12_single" name="D12_single" type="text" class="form-control required col-sm-3  "/>
                            <span class="input-group-addon">/人</span>
                        </div>
                        <div class="input-group">
                            <input id="D12_count" name="D12_count" type="text" class="form-control required col-sm-3  "/>
                            <span class="input-group-addon">座</span>
                        </div>
                        </div>
                        <input type="checkbox" onclick='if($(this).prop("checked")){$("#D12_single").val("0");$("#D12_count").val("0");}'/>不计免赔
                    </div>
                    <div class="form-group">
                        <label for="G">全车盗抢险</label>
                        <input id="G" name="G" type="text" class="form-control required" />
                        <input type="checkbox" onclick='if($(this).prop("checked")){$("#G").val("0");}'/>不计免赔
                    </div>
                    <h5>商业险：附加险</h5>
                    <div class="form-group">
                        <label for="F">玻璃破碎险</label>
                        <select id="F" name="F" class="form-control" title="玻璃破碎险">
                            <option value ="1">国产玻璃</option>
                            <option value ="2">进口玻璃</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="L">车身划痕险</label>
                        <select id="L" name="L" class="form-control" title="车身划痕险">
                            <option value ="2000">2千</option>
                            <option value ="5000">5千</option>
                            <option value ="10000">1万</option>
                            <option value ="20000">2万</option>
                            <option value = "0">不计免赔</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>发动机损失险</label>
                        <input id="X1" name="X1" type="text" class="form-control required" />
                        <input type="checkbox" onclick='if($(this).prop("checked")){$("#X1").val("0");}'/>不计免赔
                    </div>
                    <div class="form-group">
                        <label>自燃损失险</label>
                        <input id="Z" name="Z" type="text" class="form-control required" />
                        <input type="checkbox" onclick='if($(this).prop("checked")){$("#Z").val("0");}'/>不计免赔
                    </div>
                    <div class="form-group">
                        <label>专修厂特约</label>
                        <input id="J1" name="J1" type="text" class="form-control required" />
                        <input type="checkbox" onclick='if($(this).prop("checked")){$("#J1").val("0");}'/>不计免赔
                    </div>
                    <div class="form-group">
                        <label>第三方特约险</label>
                        <input id="A1" name="A1" type="text" class="form-control required" />
                        <input type="checkbox" onclick='if($(this).prop("checked")){$("#A1").val("0");}'/>不计免赔
                    </div>
                    <div class="form-group">
                        <input type="button" data-toggle="modal" data-target="#orderModal" class="btn btn-success pull-right" value="订单确认" onclick="orderCreate()"/>
                    </div>
                </div>
        </form>
    </div>
    </div>
</div>



<div class="container">
    <div class="modal fade" id="orderModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">订单确认</h4>
                </div>
                <div class="modal-body" id="myModalBody">
                    <label for="orderowner">用户</label>
                    <input id="orderowner" name="orderowner" type="text" class="form-control required"/>
                    <label for="orderno">订单号</label>
                    <input id="orderno" name="orderno" type="text" class="form-control required"/>
                    <label for="BZamount">交强险</label>
                    <input id="BZamount" name="BZamount" type="text" class="form-control required"/>
                    <label for="SYIAmount">商业险</label>
                    <input id="SYIAmount" name="SYIAmount" type="text" class="form-control required"/>
                    <label for="Amount">总额</label>
                    <input id="Amount" name="Amount" type="text" class="form-control required"/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" id="ordersure" name="ordersure" onclick="ordersure()" class="btn btn-primary">Sure</button>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    function orderCreate(){
        var url = "<%= request.getContextPath()%>/orderCreate.do";
        var args = $("#order_create").serializeArray();
        $.ajax({
            type:"post",
            url:url,
            data:args,
            success:function(data){
                if(data != null){
                    $("#orderowner").val(data.orderOwner);
                    $("#orderno").val(data.orderNo);
                    $("#BZamount").val(data.bz);
                    $("#SYIAmount").val(data.syiAmount);
                    $("#Amount").val(data.amount);
                }else{
                    alert("订单确认失败");
                    $("#myModalBody").html("订单确认失败");
                }
            }
        });
    }


    function ordersure(){
        var url = "<%= request.getContextPath()%>/ordersure.do";
        $.post(url,function(data){
            if(data == "true"){
                alert("订单生成成功");
                window.location.href = "<%= request.getContextPath()%>/myOrder/view";
            }else{
                alert("订单生成失败");
            }
        });
    }

    $(function() {
        var currentColor = '#3c3';
        var unfinishedColor = '#b9b9b9';
        var finishedColor = '#85e085';

        <!--进度条变化-->
        $('#third')
            .css('background-color', currentColor)
            .next('span').css('color', currentColor)
            .parent('div').prev('div.progress-line').css('background-color', unfinishedColor)

        $('#start')
            .css('background-color', finishedColor)
            .next('span').css('color', finishedColor)
            .parent('div').prev('div.progress-line').css('background-color', finishedColor)

        $('#second')
            .css('background-color', finishedColor)
            .next('span').css('color', finishedColor)
            .parent('div').prev('div.progress-line').css('background-color', currentColor)

        $('#end')
            .css('background-color', unfinishedColor)
            .next('span').css('color', unfinishedColor)

    })
</script>
</body>




</html>

