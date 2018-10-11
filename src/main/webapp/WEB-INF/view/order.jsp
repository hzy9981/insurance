<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <!-- 购买车险 -->
  <head>

      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

      <title>Order</title>

      <link rel="stylesheet" href="../../css/bootstrap/bootstrap.css">
      <link rel="stylesheet" href="../../css/bootstrap-datepicker.css">
      <link rel="stylesheet" href="../../css/animate.css">
      <link rel="stylesheet" href="../../css/select2.css">

      <link rel="stylesheet" href="../../fonts/ionicons/css/ionicons.min.css">
      <link rel="stylesheet" href="../../css/helpers.css">
      <link rel="stylesheet" href="../../css/style.css">


      <script src="../../js/jquery.min.js"></script>
      <script src="../../js/popper.min.js"></script>
      <script src="../../js/bootstrap.min.js"></script>
      <script src="../../js/bootstrap-datepicker.js"></script>
      <script src="../../js/jquery.waypoints.min.js"></script>
      <script src="../../js/jquery.easing.1.3.js"></script>
      <script src="../../js/select2.min.js"></script>
      <script src="../../js/main.js"></script>

      <script type="text/javascript" src="../../js/platenumber.js"></script>
      <script type="text/javascript" src="../../js/valid.js"></script>
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

              <div id="part1" style="display: block" class="col-md-6 probootstrap-animate probootstrap-form">
                  <div class="form-group">
                      <div class="row mb-3" >
                          <div class="col-md">
                              投保地区：
                              <select id="prov" name="prov" class="js-example-basic-single js-states form-control" onchange="javascript:changeCitySelect(this,document.getElementById('city'));document.getElementById('city').onchange();">
                                  <option value="" selected="selected">--请选择省份--</option>
                              </select>
                              <br /><br />
                              <select id="city" name="city" class="js-example-basic-single js-states form-control" onchange="javascript:changeCodeText(this,document.getElementById('platenumber'));">
                                  <option value="">--请选择城市--</option>
                              </select>

                              <br /><br />
                              车牌：<input id="platenumber" type="text" name="platenumber" class="form-control" value="" placeholder="新车免录车牌" onchange="isPnumber($('#platenumber').val())"/>
                              <p id="ispnumber" style="color: #bd4147;"></p>
                              车主：<input id="car_owner" name="car_owner" type="text" class="form-control" placeholder="输入车主" onclick="javascript:$('#isowner').empty();" value="" required>
                              <p id="isowner" style="color: #bd4147;"></p>
                              <div class="col-md">
                                  <input id="part1_btn" type="submit" value="下一步" class="btn btn-primary btn-block">
                              </div>
                          </div>
                      </div>
                  </div>
              </div>


              <form id="part2" style="display: none" class="col-md-6 probootstrap-animate probootstrap-form">
                  <div class="form-group">
                      <div class="row mb-3">
                          <label for="idNo">车主身份证：</label>
                          <input id="idNo" name="idNo" type="text" class="form-control" placeholder="输入车主身份证" onchange="isIdcard($('#idNo').val())" required>
                          <p id="isId" style="color: #bd4147;"></p>
                          <br />
                      </div>
                      <div class="row mb-3">
                          <label for="frameNo">车架号：</label>
                          <input id="frameNo" name="frameNo" type="text" class="form-control" placeholder="17位数字或字母" onchange="isframeNo($('#frameNo').val())" required>
                          <p id="isFrame" style="color: #bd4147;"></p>
                          <br />
                      </div>
                      <div class="row mb-3">
                          发动机号：<input id="engineNo" name="engineNo" type="text" class="form-control" placeholder="请输入发动机号" required>
                      </div>

                      <div class="row mb-3">
                          <div class="col-md">
                              <div class="form-group">
                                  <label for="chudeng-date">初登日期</label>
                                  <div class="probootstrap-date-wrap">
                                      <span class="icon ion-calendar"></span>
                                      <input type="text" name="chudeng-date" id="chudeng-date" class="form-control" value="">
                                  </div>
                              </div>
                          </div>
                          <div class="col-md">
                              <div class="form-group">
                                  <label for="fazheng-date">发证日期</label>
                                  <div class="probootstrap-date-wrap">
                                      <span class="icon ion-calendar"></span>
                                      <input type="text" name="fazheng-date" id="fazheng-date" class="form-control" value="">
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="row mb-3">
                          <div class="col-md">
                              <div class="form-group">
                                  <label for="shangyexian-date">商业险日期</label>
                                  <div class="probootstrap-date-wrap">
                                      <span class="icon ion-calendar"></span>
                                      <input type="text" name="shangyexian-date" id="shangyexian-date" class="form-control" value="">
                                  </div>
                              </div>
                          </div>
                          <div class="col-md">
                              <div class="form-group">
                                  <label for="jiaoqiangxian-date">交强险日期</label>
                                  <div class="probootstrap-date-wrap">
                                      <span class="icon ion-calendar"></span>
                                      <input type="text" name="jiaoqiangxian-date" id="jiaoqiangxian-date" class="form-control" value="">
                                  </div>
                              </div>
                          </div>
                      </div>
                      <!-- END row -->
                      <div class="row">
                          <div class="col-md">
                              <br/>是否过户车：
                              <label for="transfer_yes" class="mr-5"><input type="radio" id="transfer_yes" name="transfer" value="yes" >  是</label>
                              <label for="transfer_no"><input type="radio"  id="transfer_no" value="no" name="transfer" checked>  否</label>
                          </div>
                          <div id="transfer" style="display: none" class="col-md">
                                  <div class="form-group">
                                      <label for="transfer-date">过户日期</label>
                                      <div class="probootstrap-date-wrap">
                                          <span class="icon ion-calendar"></span>
                                          <input type="text" name="transfer-date" id="transfer-date" class="form-control" value="">
                                      </div>
                                  </div>
                              </div>

                      </div>
                      <br />
                      汽车品牌：<input type="text" name="brand_input" id="brand_input" class="form-control" placeholder="例如：别克" required>
                      <br />
                      <div class="row mb-3">
                          <div class="col-md">
                              <button id="part2_btn1" type="submit" class="btn btn-primary btn-block">上一步</button>
                          </div>

                          <div class="col-md">
                              <a id="part2_btn2" type="submit" class="btn btn-primary btn-block">下一步</a>
                          </div>
                      </div>
                  </div>
              </form>


          </div>
      </div>
  </div>

  <!--省份选择 -->
  <script type="text/javascript">
      createProvSelect(document.getElementById("prov"));
  </script>


  <script type="text/javascript">
      //时间选择
      var datePicker = function() {
          $('#chudeng-date, #fazheng-date,#shangyexian-date,#jiaoqiangxian-date,#transfer-date').datepicker({
              'format': 'm/d/yyyy',
              'autoclose': true
          });
      };
      datePicker();

      <!--过户时间选择 -->
      $('#transfer_yes').click(function() {
          $("#transfer").show();
      });
      $('#transfer_no').click(function() {
          $("#transfer").hide();
      });
  </script>



  <!--进度条变化以及页面切换 -->
  <script>
      $(function() {
          var currentColor = '#3c3';
          var unfinishedColor = '#b9b9b9';
          var finishedColor = '#85e085';

     /*     $("#part1").show();
          $("#part2").hide();*/

          <!--进度条变化-->
          $('#start')
                  .css('background-color', currentColor)
                  .next('span').css('color', currentColor)
                  .parent('div').prev('div.progress-line').css('background-color', unfinishedColor);
          $('#second')
                  .css('background-color', unfinishedColor)
                  .next('span').css('color', unfinishedColor)
                  .parent('div').prev('div.progress-line').css('background-color', unfinishedColor);
          $('#third')
                  .css('background-color', unfinishedColor)
                  .next('span').css('color', unfinishedColor)
                  .parent('div').prev('div.progress-line').css('background-color', unfinishedColor);
          $('#end')
                  .css('background-color', unfinishedColor)
                  .next('span').css('color', unfinishedColor);

          $('#part1_btn').click(function() {
              if($("#car_owner").val() == ""){
                  $("#isowner").html("车主名不能为空");
                  $("#car_owner").focus();
                  return false;
              }

              var pnumber = $("#platenumber").val();
              if(isPnumber(pnumber) && $("#car_owner").val() != ""){
                  $("#part2").show();
                  $("#part1").hide();
                  // document.getElementById("part1").style.display="none";
                  // document.getElementById("part2").style.display="block";
              }


              <!--进度条变化-->
              $('#second')
                  .css('background-color', currentColor)
                  .next('span').css('color', currentColor)
                  .parent('div').prev('div.progress-line').css('background-color', unfinishedColor)

              $('#start')
                  .css('background-color', finishedColor)
                  .next('span').css('color', finishedColor)
                  .parent('div').prev('div.progress-line').css('background-color', currentColor)

              $('#third')
                  .css('background-color', unfinishedColor)
                  .next('span').css('color', unfinishedColor)
                  .parent('div').prev('div.progress-line').css('background-color', unfinishedColor)

              $('#end')
                  .css('background-color', unfinishedColor)
                  .next('span').css('color', unfinishedColor)

          });


          $('#part2_btn1').click(function() {
              $("#part1").show();
              $("#part2").hide();
          });

          $('#part2_btn2').click(function() {

               //不能为空检查
              if ($("#idNo").val() == "") {
                  alert("身份证号不能为空");
                  $("#idNo").focus();
                  return false;
              }
              if ($("#frameNo").val() == "") {
                  alert("车架号不能为空");
                  $("#frameNo").focus();
                  return false;
              }
              if ($("#engineNo").val() == "") {
                alert("发动机号不能为空");
                $("#engineNo").focus();
                  return false;
              }
              if ($("#chudeng-date").val() == "") {
                alert("请输入初登日期");
                $("#chudeng-date").focus();
                return false;
              }
              if ($("#fazheng-date").val() == "") {
                alert("请输入发证日期");
                $("#fazheng-date").focus();
				return false;
              }
              if ($("#shangyexian-date").val() == "") {
                  alert("请输入商业险日期");
                  $("#shangyexian-date").focus();
                  return false;
              }
              if ($("#jiaoqiangxian-date").val() == "") {
                  alert("请输入交强险日期");
                  $("#jiaoqiangxian-date").focus();
                  return false;
              }
              if ($("#brand_input").val() == "") {
                  alert("请输入厂牌型号");
                  $("#brand_input").focus();
                  return false;
              }
              if ($('input[name="transfer"]:checked').val() == "yes"&&$("#transfer-date").val() == "") {
                  alert("请输入过户日期");
                  $("#transfer-date").focus();
                  return false;
              }


              var idNo =$("#idNo").val();
              var frameNo = $("#frameNo").val();

              if(isIdcard(idNo) && isframeNo(frameNo)){
                  var url1 = "<%=request.getContextPath()%>/carOwnerHandin.do";
                  var url2 = "<%=request.getContextPath()%>/carDataHandin.do";
                  var args = $("#part2").serializeArray();
                  var prov = $("#prov").val();
                  var city = $("#city").val();
                  var platenumber = $("#platenumber").val();
                  var car_owner = $("#car_owner").val();

                  $.ajax({
                      type:"post",
                      url: url1,
                      data:{'prov':prov,
                          'city':city,
                          'platenumber':platenumber,
                          'car_owner':car_owner
                      }
                  });

                  $.ajax({
                      type:"post",
                      url: url2,
                      data:args
                  });

                  window.location.href = "<%= request.getContextPath()%>/carMassage/view";
              }
          });


          $('#part4_btn').click(function() {
              $(end)
                  .css('background-color', currentColor)
                  .next('span').css('color', currentColor)

              $('#start')
                  .css('background-color', finishedColor)
                  .next('span').css('color', finishedColor)
                  .parent('div').prev('div.progress-line').css('background-color', finishedColor)

              $('#second')
                  .css('background-color', finishedColor)
                  .next('span').css('color', finishedColor)
                  .parent('div').prev('div.progress-line').css('background-color', finishedColor)

              $('#third')
                  .css('background-color', finishedColor)
                  .next('span').css('color', finishedColor)
                  .parent('div').prev('div.progress-line').css('background-color', currentColor)
          })
      })
  </script>


</body>

</html>