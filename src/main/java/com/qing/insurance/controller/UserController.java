package com.qing.insurance.controller;

import com.qing.insurance.pojo.Order;
import com.qing.insurance.pojo.PageBean;
import com.qing.insurance.pojo.xmlOrder;
import com.qing.insurance.pojo.User;
import com.qing.insurance.service.OrderService;
import com.qing.insurance.service.UserService;
import com.qing.insurance.utils.MD5Util;
import org.dom4j.DocumentException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@Controller

//这里用了@SessionAttributes，可以直接把model中的user(也就key)放入其中
//这样保证了session中存在user这个对象
@SessionAttributes("user")

public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;



    //页面访问
    @RequestMapping("/{d1}/view")
    public String showAdmin(@PathVariable String d1) {

        return "view/"+d1;
    }

    @RequestMapping("/checkUser.do")
    @ResponseBody
    public boolean checkUser(HttpServletRequest request){
        String username = request.getParameter("username");
        /*System.out.println(username);*/
        User user = userService.findUser(username);

        return (user == null);
    }

    @RequestMapping("/checkTel.do")
    @ResponseBody
    public boolean checkTel(HttpServletRequest request){
        String tel = request.getParameter("tel");
        /*System.out.println(tel);*/
        User user = userService.findTel(tel);

        return (user == null);
    }


    @RequestMapping("/checkEmail.do")
    @ResponseBody
    public boolean checkEmail(HttpServletRequest request){
        String email = request.getParameter("email");
        /*System.out.println(email);*/
        User user = userService.findEmail(email);

        return (user == null);
    }
    //表单提交过来的路径
    @RequestMapping("/checkLogin.do")
    @ResponseBody
    public boolean checkLogin(Model model,HttpSession session,HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean result= false;
        User user = userService.checkLogin(username, password);
        if(user != null) {
            session.setAttribute("LOGINED_USER", user.getUsername());
            model.addAttribute("user", user);
            result = true;
        }
            return result;
    }


    //注销方法
    @RequestMapping("logout.do")
    public void outLogin( HttpSession session){
        //通过session.invalidata()方法来注销当前的session
        session.invalidate();
    }


    //用户注册
    @RequestMapping("/register.do")
    @ResponseBody
    public void register(User user, HttpServletResponse response,HttpServletRequest request) throws IOException, ParseException {
            userService.register(user);
            response.getWriter().println("注册成功，请登录！");
    }


    @RequestMapping("/carOwnerHandin.do")
    public void carOwnerHandin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String prov = request.getParameter("prov");
        String city = request.getParameter("city");
        String platenumber = request.getParameter("platenumber");
        String car_owner = request.getParameter("car_owner");

        HttpSession session = request.getSession();
        session.setAttribute("car_owner", car_owner);
        session.setAttribute("prov", prov);
        session.setAttribute("city", city);
        session.setAttribute("platenumber", platenumber);

        System.out.println(prov + " "+ city +" " + platenumber +" " + car_owner );
    }

    @RequestMapping("/carDataHandin.do")
    public void carDataHandin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String idNo = request.getParameter("idNo");
        String frameNo = request.getParameter("frameNo");
        String engineNo = request.getParameter("engineNo");
        String chudeng_date = request.getParameter("chudeng-date");
        String fazheng_date = request.getParameter("fazheng-date");
        String shangyexian_date = request.getParameter("shangyexian-date");
        String jiaoqiangxian_date = request.getParameter("jiaoqiangxian-date");
        String transfer_date = request.getParameter("transfer-date");
        String brand_input = request.getParameter("brand_input");

        HttpSession session = request.getSession();

        session.setAttribute("idNo", idNo);
        session.setAttribute("frameNo", frameNo);
        session.setAttribute("engineNo", engineNo);
        session.setAttribute("chudeng_date", chudeng_date);
        session.setAttribute("fazheng_date", fazheng_date);
        session.setAttribute("shangyexian_date", shangyexian_date);
        session.setAttribute("jiaoqiangxian_date", jiaoqiangxian_date);
        session.setAttribute("transfer_date", transfer_date);
        session.setAttribute("brand_input", brand_input);

        System.out.println(idNo+" " + frameNo+" " + engineNo+" " + chudeng_date+" " + fazheng_date
                +" " + shangyexian_date+" " + jiaoqiangxian_date+" " + transfer_date+" "+brand_input);
    }


    @RequestMapping("/carMassageHandin.do")
    public void carMassageHandin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String brand = request.getParameter("brand");
        String year = request.getParameter("year");
        String price = request.getParameter("price");
        String displacement = request.getParameter("displacement");
        String numberOfSeats = request.getParameter("numberOfSeats");
        String gearbox = request.getParameter("gearbox");
        String model = request.getParameter("model");

        HttpSession session = request.getSession();
        session.setAttribute("brand", brand);
        session.setAttribute("year", year);
        session.setAttribute("price", price);
        session.setAttribute("displacement", displacement);
        session.setAttribute("numberOfSeats", numberOfSeats);
        session.setAttribute("gearbox", gearbox);
        session.setAttribute("model", model);

        System.out.println(brand+ " "+year+ " "+price+ " "+displacement+ " "+numberOfSeats+ " "+gearbox+ " "+model);
    }



    @RequestMapping("/orderCreate.do")
    @ResponseBody
    public xmlOrder orderCreate(User user,HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, IOException {
        Double BZ = Double.parseDouble(request.getParameter("BZ"));
        String carTaxTypeStr = request.getParameter("carTaxType");
        String carTaxType = "";
        switch(carTaxTypeStr) {
            case "1":
                carTaxType = "减税";
                break;
            case "2":
                carTaxType = "免税";
                break;
            case "3":
                carTaxType = "正常纳税";
                break;
            case "4":
                carTaxType = "拒缴";
                break;
            case "5":
                carTaxType = "已完税";
                break;
            default:
                break;
        }
        Double A = Double.parseDouble(request.getParameter("A"));
        Double B = Double.parseDouble(request.getParameter("B"));
        Double D11 = Double.parseDouble(request.getParameter("D11"));
        Double D12 = Double.parseDouble(request.getParameter("D12_single")) * Double.parseDouble(request.getParameter("D12_count"));
        Double G = Double.parseDouble(request.getParameter("G"));
        String FStr = request.getParameter("F");
        String F = "";
        switch(FStr) {
            case "1":
                F = "国产玻璃";
                break;
            case "2":
                F = "进口玻璃";
                break;
            default:
                break;
        }
        Double L = Double.parseDouble(request.getParameter("L"));
        Double X1 = Double.parseDouble(request.getParameter("X1"));
        Double Z = Double.parseDouble(request.getParameter("Z"));
        Double J1 = Double.parseDouble(request.getParameter("J1"));
        Double A1 = Double.parseDouble(request.getParameter("A1"));

        Date date = new Date();
        SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(dateFormat.format(date));
        xmlOrder xmlorder = new xmlOrder();
        xmlorder.setCreateTime(dateFormat.format(date));
        xmlorder.setOrderNo(orderService.orderNo());
        session.setAttribute("orderNo", xmlorder.getOrderNo());
        xmlorder.setOrderOwner((String)session.getAttribute("LOGINED_USER"));
        xmlorder.setCarOwner((String)session.getAttribute("car_owner"));
        xmlorder.setA(A);
        xmlorder.setBz(BZ);;
        xmlorder.setB(B);
        xmlorder.setA1(A1);
        xmlorder.setCarTaxType(carTaxType);
        xmlorder.setD11(D11);
        xmlorder.setD12(D12);
        xmlorder.setF(F);
        xmlorder.setG(G);
        xmlorder.setJ1(J1);
        xmlorder.setL(L);
        xmlorder.setX1(X1);
        xmlorder.setZ(Z);
        xmlorder.setSyiAmount(A+B+D11+D12+G+L+X1+Z+J1+A1);
        xmlorder.setAmount(BZ+A+B+D11+D12+G+L+X1+Z+J1+A1);

        System.out.println("用户："+xmlorder.getOrderOwner());
        System.out.println("商业险："+xmlorder.getSyiAmount());
        System.out.println("交强险："+xmlorder.getBz());
        session.setAttribute("xmlorder", xmlorder);

        return xmlorder;
    }

    @RequestMapping("/ordersure.do")
    @ResponseBody
    public String ordersure(HttpSession session) throws Exception{
        xmlOrder xmlorder = (xmlOrder)session.getAttribute("xmlorder");
        orderService.orderXml(xmlorder);

        Order order = new Order();
        order.setOrderNo(xmlorder.getOrderNo());
        order.setUserName((String)session.getAttribute("LOGINED_USER"));
        order.setCarOwner((String)session.getAttribute("car_owner"));
        order.setEnginerNo((String)session.getAttribute("engineNo"));
        order.setOrderCity((String)session.getAttribute("city"));
        order.setFrameNo((String)session.getAttribute("frameNo"));
        order.setLicenceNo((String)session.getAttribute("platenumber"));
        order.setSumPremium(BigDecimal.valueOf(xmlorder.getAmount()));
        order.setBiPremium(BigDecimal.valueOf(xmlorder.getSyiAmount()));
        order.setCiPremium(BigDecimal.valueOf(xmlorder.getBz()));
        orderService.order(order);

        return "true";
    }

    @RequestMapping("/userorder.do")
    @ResponseBody
    public List<xmlOrder> userorder(User user,HttpServletRequest request, HttpServletResponse response,  HttpSession session) throws DocumentException, Exception{
        String username = (String)session.getAttribute("LOGINED_USER");
        List<xmlOrder> orderlist = new ArrayList<xmlOrder>();
        orderlist = orderService.findUserOrders(username);
        Collections.reverse(orderlist);
        int pageNum = Integer.parseInt(request.getParameter("pageNum"));
        int pageSize = 5;
        PageBean pb = orderService.findAllOrderWithPage(pageNum, pageSize, orderlist);
        System.out.println("当前订单页面号为："+pb.getPageNum() + "，每页显示记录" + pb.getPageSize() + "条，一共有" +
                pb.getTotalRecord() +"个订单," + "共" + pb.getTotalPage()+"页");
        session.setAttribute("pageBean", pb);
        List<xmlOrder> orderlistpage = pb.getList();
        session.setAttribute("orderlistpage", orderlistpage);
        for(xmlOrder orderit:orderlistpage) {
            System.out.println(orderit.getOrderNo());
        }
        return orderlistpage;
    }

    @RequestMapping("/userorder1.do")
    @ResponseBody
    public xmlOrder userorder1(HttpServletRequest request, HttpServletResponse response,  HttpSession session) {
        int orderindex = Integer.parseInt(request.getParameter("orderindex"));
        xmlOrder order = new xmlOrder();
        order = ((List<xmlOrder>)session.getAttribute("orderlistpage")).get(orderindex);
        System.out.println("user_order_owner: "+order.getOrderOwner());
        return order;
    }

    //修改密码
    @RequestMapping("/update_password.do")
    @ResponseBody
    public void updatePassword(User user, HttpServletResponse response,HttpServletRequest request) throws IOException {
        String newPassword = request.getParameter("newPassword");
        user.setPassword(MD5Util.MD5EncodeUtf8(newPassword));
        userService.updatePassword(user);
        response.getWriter().println("密码修改成功");
    }

    //忘记密码
    @RequestMapping("/forget_password.do")
    @ResponseBody
    public boolean forgetPassword(Model model, HttpServletResponse response,HttpServletRequest request) throws IOException {
        String tel = request.getParameter("tel");
        User user = userService.forgetPassword(tel);
        if(user != null) {
            model.addAttribute("user", user);
            return true;
        }
        return false;
    }


}

