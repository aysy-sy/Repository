package com.jsu.order.servlet;

import com.alibaba.fastjson.JSON;
import com.jsu.order.Dao.ApplicantDao;
import com.jsu.order.Dao.ProductDao;
import com.jsu.order.Dao.ThingDao;
import com.jsu.order.bean.Applicant;
import com.jsu.order.bean.Product;
import com.jsu.order.bean.Sales;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

@WebServlet(urlPatterns ="/ProServlet")
public class ProServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ThingDao proDao = new ThingDao();

    public ProServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        // response.getWriter().append("Served at:
        // ").append(request.getContextPath());
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        // doGet(request, response);
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String action = request.getParameter("action");
        if("schPro".equals(action)) {
            try {
                schPro(request, response);// 浏览产品
            } catch (Exception e) {
                e.printStackTrace();
            }
        }   else if ("schProduct1".equals(action)) {
            try {
                schProduct1(request, response);// 顾客浏览产品
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if ("delPro".equals(action)) {
            try {
                delPro(request, response);// 删除产品
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if ("editPro".equals(action)) {
            try {
                editPro(request, response);// 编辑产品
            } catch (Exception e) {
                e.printStackTrace();
            }/*准备编辑*/
        } else if ("initEditPro".equals(action)) {
            try {
                initEditPro(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if ("addProSalesRecord".equals(action)) {
            try {
                addProSalesRecord(request, response);// 添加产品销售记录
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else if ("delSale".equals(action)) {
            try {
                delSale(request, response);// 删除产品销售记录
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if ("initEditSale".equals(action)) {
            try {
                initEditSale(request, response);// 准备修改产品销售记录
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if ("editSale".equals(action)) {
            try {
                editSale(request, response);// 修改产品销售记录
            } catch (Exception e) {
                e.printStackTrace();
            }
        }  else if ("schProSalesRecord".equals(action)) {
            try {
                schProSalesRecord(request, response);// 查询产品销售记录
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if ("schProSalesRecord2".equals(action)) {
            try {
                schProSalesRecord2(request, response);// 查询产品销售记录//页面直接代码
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        else {
            try {
                checkPro(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
//删除订单
    private void delSale(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String id = req.getParameter("id");
        ThingDao.delSale(Integer.parseInt(id));
        schProSalesRecord2(req, resp);
       /* schProSalesRecord(req, resp);*/
    }
//直接页面查询产品销售记录
    private void schProSalesRecord2(HttpServletRequest request,
                                    HttpServletResponse response) throws Exception {

        int currentPage=1;
        currentPage=Integer.parseInt(request.getParameter("currPage"));
        if(currentPage==0){
            currentPage=1;
        }/*
        request.setAttribute("currPage", currentPage);*/
        response.sendRedirect("applicant/admin_order.jsp?currPage="+currentPage);
       /* RequestDispatcher dispatcher = request.getRequestDispatcher("applicant/admin_order.jsp");
        dispatcher.forward(request, response);*///可以进行跳转 但是没有框架
    }

    //直接页面查询产品
    private void schPro2(HttpServletRequest request,
                                    HttpServletResponse response) throws Exception {
        int currentPage=1;
        currentPage=Integer.parseInt(request.getParameter("currPage"));
        if(currentPage==0){
            currentPage=1;
        }
        response.sendRedirect("applicant/product.jsp?currPage="+currentPage);
    }
    // 查询产品销售记录
    private void schProSalesRecord(HttpServletRequest request,
                                      HttpServletResponse response) throws Exception {
        String currPage = request.getParameter("currPage");
        if (currPage == null) {
            currPage = "1";
        }
        int page = Integer.parseInt(currPage);
        List<Sales> salesRecordList = proDao.schProSalesRecord();
        // 总条数
        int total = salesRecordList.size();
        // 每一页多少条
        int pageSize = 10;
        // 获取总页数
        int totalPage = total % pageSize > 0 ? total / pageSize + 1 : total
                / pageSize;
        if (page > totalPage) {
            page = totalPage;
        }
        if (page < 1) {
            page = 1;
        }
        Applicant user=(Applicant) request.getSession().getAttribute("SESSION_user");
        Cookie[] cookies = request.getCookies();
        String applicantAccount=null;
        if(cookies!=null) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("applicantAccount")) {
                    applicantAccount = cookies[i].getValue();
                }
            }
        }
            //查询用户身份
            ApplicantDao applicantDao=new ApplicantDao();
            Applicant applicant=new Applicant();
            applicantDao.getIdentity(applicantAccount);
        int flag=0;
        if(applicant.getIdentity()=="用户"){
                flag=1;
        }else {
            flag=0;
        }
        // 查询数据的开始索引号
        int start = (page - 1) * pageSize;
        List<Sales> salesRecordList1 = ThingDao.getProSalesByPage(start,
                pageSize);
        request.setAttribute("outList", salesRecordList1);
        request.setAttribute("currPage", page);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("total", total);
        request.setAttribute("totalPage", totalPage);
        if (flag==1){
            request.getRequestDispatcher("applicant/salesRecord.jsp").forward(request,
                    response);
        }else{
            /*response.sendRedirect("applicant/admin_order.jsp");*/
            RequestDispatcher dispatcher = request.getRequestDispatcher("applicant/admin_order.jsp");
            dispatcher.forward(request, response);
        }
    }

    // 添加产品销售记录
    private void addProSalesRecord(HttpServletRequest request,
                                      HttpServletResponse response) throws Exception {
        String ProName = request.getParameter("itemName");//名字
          String num=request.getParameter("orderNum");//数量
        int squantity=Integer.parseInt(num);//数量int值
      /*  int otb = Integer.parseInt(request.getParameter("squantity"));*/
        SimpleDateFormat outDate = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        String otd = outDate.format(new Date());
        Sales sl = new Sales();
        sl.setSname(ProName);
        sl.setSquantity(squantity);
        sl.setSdate(otd);
        ThingDao.addProSalesRecord(sl);
        //同时在product表中查找到对应的产品 进行销量+1
        ThingDao.addProSalesNum(ProName,squantity);
        //回到浏览界面、顾客产品界面
        schProduct1(request, response);
       /* schProSalesRecord(request, response);*/
    }
        //修改订单信息
         private void initEditSale(HttpServletRequest request,
                                 HttpServletResponse response) throws Exception {
            int id = Integer.parseInt(request.getParameter("id"));
            Sales sales=ThingDao.getSaleById(id);
            String SaleId=String.valueOf(sales.getSid());
                /*
                在cookie保存中文时  也同样需要采用URLEncoder对其进行编码   在获取的时候  同样采用URLDecode进行解码
                 */
            Cookie cookie1 = new Cookie("SaleId",SaleId);
            response.addCookie(cookie1);//存储订单编号
      /*  request.setAttribute("item", product);
        request.setAttribute("ProId",ProId );*/
            /*request.setAttribute("item", product);*/
            response.sendRedirect("applicant/editSale.jsp");
       /* RequestDispatcher dispatcher = request.getRequestDispatcher("applicant/editPro.jsp");
        dispatcher.forward(request, response);*/
        }
    // 修改订单
    private void editSale(HttpServletRequest request,
                         HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));

        System.out.println(id);
        String ProName = request.getParameter("itemName");
        int Sid = Integer.parseInt(request.getParameter("sid"));
        int Quantity = Integer.parseInt(request.getParameter("squantity"));//销售量
        Sales sales=new Sales();
        sales.setSid(Sid);
        sales.setSname(ProName);
       sales.setSquantity(Quantity);

        ThingDao.editSale(sales);
        schProSalesRecord(request, response);
    }
    // 准备修改产品信息
    private void initEditPro(HttpServletRequest request,
                                HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product =ThingDao.getProById(id);
        String ProId=String.valueOf(product.getId());
                /*
                在cookie保存中文时  也同样需要采用URLEncoder对其进行编码   在获取的时候  同样采用URLDecode进行解码
                 */
        Cookie cookie1 = new Cookie("ProId",ProId);
        response.addCookie(cookie1);//存储物品id值
      /*  request.setAttribute("item", product);
        request.setAttribute("ProId",ProId );*/
        /*request.setAttribute("item", product);*/
        response.sendRedirect("applicant/editPro.jsp");
       /* RequestDispatcher dispatcher = request.getRequestDispatcher("applicant/editPro.jsp");
        dispatcher.forward(request, response);*/
    }

    // 修改产品
    private void editPro(HttpServletRequest request,
                            HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        String ProName = request.getParameter("itemName");
        String ProType = request.getParameter("itemType");
        float ProPPrice = Float.parseFloat(request.getParameter("pPrice"));
        float ProSPrice = Float.parseFloat(request.getParameter("sPrice"));
        int Quantity = Integer.parseInt(request.getParameter("number"));
        Product pro = new Product();
        pro.setId(id);
        pro.setName(ProName);
        pro.setType(ProType);
        pro.setpurPrice(ProPPrice);
        pro.setsalPrice(ProSPrice);
        pro.setNum(Quantity);
        ThingDao.editPro(pro);
        schPro2(request, response);
    }
    // 判断产品是否已经存在
    public void checkPro(HttpServletRequest req, HttpServletResponse resp)
            throws Exception {
        String ProName = req.getParameter("itemName");
        boolean flag = ThingDao.detemineIfProExist(ProName);
        PrintWriter out = resp.getWriter();
        out.print(flag);
    }

    // 查找产品
    public void schPro(HttpServletRequest req, HttpServletResponse resp)
            throws Exception {
        String schProName = req.getParameter("schItemName");
        String currPage = req.getParameter("currPage");
        if (currPage == null) {
            currPage = "1";
        }
        int page = Integer.parseInt(currPage);
        List<Product> list = ThingDao.schPro(schProName);
        // 总条数
        int total = list.size();
        // 每一页多少条
        int pageSize = 10;
        // 获取总页数
        int totalPage = total % pageSize > 0 ? total / pageSize + 1 : total
                / pageSize;
        if (page > totalPage) {
            page = totalPage;
        }
        if (page < 1) {
            page = 1;
        }
        // 查询数据的开始索引号
        int start = (page - 1) * pageSize;
        List<Product> flowerList=ThingDao.getProByPage(schProName,start,pageSize);

        req.setAttribute("flowerList", flowerList);
        req.setAttribute("currPage", page);
        req.setAttribute("pageSize", pageSize);
        req.setAttribute("total", total);
        req.setAttribute("totalPage", totalPage);
       /* resp.sendRedirect("applicant/product.jsp");*/
       RequestDispatcher dispatcher = req.getRequestDispatcher("applicant/product.jsp");
        dispatcher.forward(req, resp);
    }

    // 顾客浏览产品
    public void schProduct1(HttpServletRequest req, HttpServletResponse resp)
            throws Exception {
        String schProName = req.getParameter("schItemName");
        String currPage = req.getParameter("currPage");
        if (currPage == null) {
            currPage = "1";
        }
        int page = Integer.parseInt(currPage);
        List<Product> list = ThingDao.schProduct1(schProName);
        // 总条数
        int total = list.size();
        // 每一页多少条
        int pageSize = 10;
        // 获取总页数

        int totalPage = total % pageSize > 0 ? total / pageSize + 1 : total
                / pageSize;
        if (page > totalPage) {
            page = totalPage;
        }
        if (page < 1) {
            page = 1;
        }
        // 查询数据的开始索引号
        int start = (page - 1) * pageSize;
        List<Product> ProList = ThingDao.getProByPage(schProName,
                start, pageSize);
        req.setAttribute("prolist", ProList);
        req.setAttribute("currPage", page);
        req.setAttribute("pageSize", pageSize);
        req.setAttribute("total", total);
        req.setAttribute("totalPage", totalPage);
        RequestDispatcher dispatcher = req.getRequestDispatcher("applicant/cus_product.jsp");
        dispatcher.forward(req, resp);
        /*req.getRequestDispatcher("../cus_product.jsp").forward(req, resp);*/
    }

    // 删除产品
    public void delPro(HttpServletRequest req, HttpServletResponse resp)
            throws Exception {
        String id = req.getParameter("id");
        ThingDao.delPro(Integer.parseInt(id));
        schPro2(req, resp);
    }

}

