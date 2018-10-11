package com.qing.insurance.service;

import com.qing.insurance.pojo.Order;
import com.qing.insurance.pojo.PageBean;
import com.qing.insurance.pojo.xmlOrder;
import java.util.List;


public interface OrderService {

    void orderXml(xmlOrder order) throws Exception;

    void order(Order order);

    String orderNo();

    List<xmlOrder> findUserOrders(String username) throws Exception;

    PageBean<xmlOrder> findAllOrderWithPage(int pageNum, int pageSize, List<xmlOrder> orderlist);

}
