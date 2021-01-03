package com.jsu.order.servlet;

import com.jsu.order.Dao.ApplicantDao;
import com.jsu.order.Dao.ProductDao;
import com.jsu.order.Dao.ThingDao;
import com.jsu.order.bean.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/AddProServlet")
public class AddProServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //获取前台提交的产品信息

        String proName = request.getParameter("ProductName");
        String proPrice = request.getParameter("ProductpPrice");
        String prosPrice=request.getParameter("ProductsPrice");
        String proType = request.getParameter("ProductType");
        String proCount = request.getParameter("ProductCount");
        //向表里插入数据
        Float purPrice = Float.parseFloat(proPrice);
        Float salPrice = Float.parseFloat(prosPrice);
        int count = Integer.parseInt(proCount);
        ProductDao productDao = new ProductDao();
        ThingDao thingDao=new ThingDao();


        Product product = new Product(proName,salPrice,purPrice,count, proType);
        boolean flag = false;
        try {
            flag=thingDao.addProduct(product);
           // flag = productDao.saveProduct(product);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (flag == true) {
            PrintWriter writer = response.getWriter();
            writer.write("<script>");
            writer.write("alert('添加成功！');");
            writer.write("window.location.href='applicant/addNew.jsp'");
            writer.write("</script>");
            writer.flush();
            writer.close();
        }else {
            response.sendRedirect("applicant/addNew.jsp");
        }
    }
}
