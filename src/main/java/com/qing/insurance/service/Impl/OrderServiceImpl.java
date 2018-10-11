package com.qing.insurance.service.Impl;

import com.qing.insurance.dao.OrderMapper;
import com.qing.insurance.pojo.Order;
import com.qing.insurance.pojo.PageBean;
import com.qing.insurance.pojo.xmlOrder;

import java.io.FileOutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import com.qing.insurance.service.OrderService;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("OrderService")
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;

    public void order(Order order){
        orderMapper.insert(order);
    }

    @Override
    public void orderXml(xmlOrder order) throws Exception {
        String[] strings = {"createTime","orderNo","orderOwner","carOwner",
                "bz","carTaxType","a","b","d11","d12","g","f","l","x1",
                "z","j1","a1","syiAmount","amount"};
        String orderxml = "E:\\bishe\\chengxu\\insurance\\src\\main\\resources\\order.xml";
        SAXReader reader = new SAXReader();
        Document documentorder = reader.read(orderxml);
        List<String> orderGetText = new ArrayList<String>();
        Field[] field = order.getClass().getDeclaredFields(); //获取实体类的所有属性，返回Field数组
        for(int j=0 ; j<field.length ; j++){ //遍历所有属性
            String name = field[j].getName(); //获取属性的名字
            name = name.substring(0,1).toUpperCase()+name.substring(1); //将属性的首字符大写，方便获取get，set方法
            System.out.println("xmlOrder Object attribute name:"+name);
            Method m = order.getClass().getMethod("get"+name);
            String value =  m.invoke(order).toString();
            orderGetText.add(value);
        }
        Element root = documentorder.getRootElement();
        Element orderlist = root.addElement("OrderList");
        for(int i = 0; i < strings.length; i++) {
            Element orderelement = orderlist.addElement(strings[i]);
            orderelement.addText(orderGetText.get(i));
        }

        OutputFormat format = new OutputFormat("    ",true);
        format.setEncoding("UTF-8");
        XMLWriter xmlWriter = new XMLWriter(new FileOutputStream(orderxml),format);
        xmlWriter.write(documentorder);
        xmlWriter.close();

    }



    public String orderNo() {
        StringBuffer sb = new StringBuffer();
        final int maxNum = 36;
        char[] str = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
        Random r = new Random();
        int i; //生成的随机数
        int count = 0; //生成的密码的长度
        while(count < 11){
            //生成随机数，取绝对值，防止生成负数，

            i = Math.abs(r.nextInt(maxNum)); //生成的数最大为36-1

            if (i >= 0 && i < str.length) {
                sb.append(str[i]);
                count ++;
            }
        }
        return sb.toString();
    }


    @Override
    public List<xmlOrder> findUserOrders(String username) throws Exception {
        String xml = "E:\\bishe\\chengxu\\insurance\\src\\main\\resources\\order.xml";
        List<xmlOrder> orderlist = new ArrayList<xmlOrder>();
        SAXReader reader = new SAXReader();
        Document document = reader.read(xml);
        Element root = document.getRootElement();
        List<Element> modellist = root.elements("OrderList");
        for(Element element:modellist) {
            List<Element> model = element.elements("orderOwner");
            for(Element element1:model) {
                if(element1.getText() != null && element1.getText().equals(username)) {
                    xmlOrder order = (xmlOrder) XmlToObj.fromXmlToBean(element, xmlOrder.class);
                    orderlist.add(order);
                }
            }
        }
        return orderlist;
    }

    @Override
    public PageBean<xmlOrder> findAllOrderWithPage(int pageNum, int pageSize, List<xmlOrder> orderlist) {
        int totalrecord = orderlist.size();
        PageBean pb = new PageBean(pageNum, pageSize, totalrecord);
        int startindex = pb.getStartIndex();
        if(totalrecord % pageSize != 0 && pageNum == pb.getEnd()) {
            pb.setList(orderlist.subList(startindex, startindex+(totalrecord % pageSize)));
        }else {
            pb.setList(orderlist.subList(startindex, startindex+pageSize));
        }
        return pb;
    }

}
