<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div style="background:rgba(255,255,255,200);width:1000px;margin:100px auto;">
    <div id="page" style="float:right;">
        <ul class="pagination">
            <!-- 构建分页导航 -->共有${sessionScope.pageBean.totalRecord}个订单，共${sessionScope.pageBean.totalPage }页，当前为${sessionScope.pageBean.pageNum}页
            <br/>
            <li><a onclick="UserOrderPage(1)">&laquo;</a></li>
            <%--如果当前页为第一页时，就没有上一页这个超链接显示 --%>
            <c:if test="${sessionScope.pageBean.pageNum ==1}">
                <c:forEach begin="${sessionScope.pageBean.start}" end="${sessionScope.pageBean.end}" step="1" var="i">
                    <c:if test="${sessionScope.pageBean.pageNum == i}">
                        <li class="active"><a>${i}</a></li>
                    </c:if>
                    <c:if test="${sessionScope.pageBean.pageNum != i}">
                        <li><a onclick="UserOrderPage(${i})">${i}</a></li>
                    </c:if>
                </c:forEach>
                <li><a onclick="UserOrderPage(${sessionScope.pageBean.pageNum+1})">下一页</a></li>
            </c:if>
            <%--如果当前页不是第一页也不是最后一页，则有上一页和下一页这个超链接显示 --%>
            <c:if test="${sessionScope.pageBean.pageNum > 1 && sessionScope.pageBean.pageNum < sessionScope.pageBean.totalPage}">
                <li> <a onclick="UserOrderPage(${sessionScope.pageBean.pageNum-1})">上一页</a></li>
                <c:forEach begin="${sessionScope.pageBean.start}" end="${sessionScope.pageBean.end}" step="1" var="i">
                    <c:if test="${sessionScope.pageBean.pageNum == i}">
                        <li class="active"><a>${i}</a></li>
                    </c:if>
                    <c:if test="${sessionScope.pageBean.pageNum != i}">
                        <li> <a onclick="UserOrderPage(${i})">${i}</a></li>
                    </c:if>
                </c:forEach>
                <li> <a onclick="UserOrderPage(${sessionScope.pageBean.pageNum+1})">下一页</a> </li>
            </c:if>
            <%-- 如果当前页是最后一页，则只有上一页这个超链接显示，下一页没有 --%>
            <c:if test="${sessionScope.pageBean.pageNum == sessionScope.pageBean.totalPage}">
                <li><a onclick="UserOrderPage(${sessionScope.pageBean.pageNum-1})">上一页</a></li>
                <c:forEach begin="${sessionScope.pageBean.start}" end="${sessionScope.pageBean.end}" step="1" var="i">
                    <c:if test="${sessionScope.pageBean.pageNum == i}">
                        <li class="active"><a>${i}</a></li>
                    </c:if>
                    <c:if test="${sessionScope.pageBean.pageNum != i}">
                        <li> <a onclick="UserOrderPage(${i})">${i}</a>  </li>
                    </c:if>
                </c:forEach>
            </c:if>
            <%--尾页 --%>
            <li> <a onclick="UserOrderPage(${sessionScope.pageBean.totalPage})">&raquo;</a></li>
        </ul>
    </div>
</div>

<div class="container">
    <div class="modal fade" id="userorderModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">订单详情</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                </div>
                <div class="modal-body" id="userorderModalBody">
                    <label for="createTime">订单创建时间</label>
                    <input id="createTime" name="createTime" type="text" class="form-control disabled"/>
                    <label for="userorderowner">用户</label>
                    <input id="userorderowner" name="userorderowner" type="text" class="form-control disabled"/>
                    <label for="userorderno">订单号</label>
                    <input id="userorderno" name="userorderno" type="text" class="form-control disabled"/>
                    <label for="carOwner">车主</label>
                    <input id="carOwner" name="carOwner" type="text" class="form-control disabled"/>
                    <label for="userbz">交强险</label>
                    <input id="userbz" name="bz" type="text" class="form-control disabled"/>
                    <label for="usercarTaxType">车船税缴纳类型</label>
                    <input id="usercarTaxType" name="usercarTaxType" type="text" class="form-control disabled"/>
                    <label for="userA">车损险</label>
                    <input id="userA" name="userA" type="text" class="form-control disabled"/>
                    <label for="userB">三责险</label>
                    <input id="userB" name="userB" type="text" class="form-control disabled"/>
                    <label for="userD11">司机责任险</label>
                    <input id="userD11" name="userD11" type="text" class="form-control disabled"/>
                    <label for="userD12">乘客责任险</label>
                    <input id="userD12" name="userD12" type="text" class="form-control disabled"/>
                    <label for="userG">全车盗抢险</label>
                    <input id="userG" name="userG" type="text" class="form-control disabled"/>
                    <label for="userF">玻璃破碎险</label>
                    <input id="userF" name="userF" type="text" class="form-control disabled"/>
                    <label for="userL">车身划痕险</label>
                    <input id="userL" name="userL" type="text" class="form-control disabled"/>
                    <label for="userX1">发动机损失险</label>
                    <input id="userX1" name="userX1" type="text" class="form-control disabled"/>
                    <label for="userZ">自燃损失险</label>
                    <input id="userZ" name="userZ" type="text" class="form-control disabled"/>
                    <label for="userJ1">专修厂特约</label>
                    <input id="userJ1" name="userJ1" type="text" class="form-control disabled"/>
                    <label for="userA1">第三方特约险</label>
                    <input id="userA1" name="userA1" type="text" class="form-control disabled"/>
                    <label for="usersYIAmount">商业险总额</label>
                    <input id="usersYIAmount" name="usersYIAmount" type="text" class="form-control disabled"/>
                    <label for="userAmount">总额</label>
                    <input id="userAmount" name="userAmount" type="text" class="form-control disabled"/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>