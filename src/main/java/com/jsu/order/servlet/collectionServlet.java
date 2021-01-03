package com.jsu.order.servlet;

import com.jsu.order.Dao.ThingDao;
import com.jsu.order.bean.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/collectionServlet")
public class collectionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //获取前台提交的产品编号 。根据 编号搜索产品  保存到收藏夹中
        //同时获取用户账号
        String num=request.getParameter("id");
       // String shoppingNum=request.getParameter("shoppingnum");
        int id=Integer.parseInt(num);
       // int shopNum=Integer.parseInt(shoppingNum);
        ThingDao thingDao=new ThingDao();
        Product product=new Product();
        product.setId(id);
        Cookie[] cookies = request.getCookies();
        String applicantAccount=null;
        if(cookies!=null) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("applicantAccount")) {
                    applicantAccount = cookies[i].getValue();

                }
            }
            //通过id搜索产品 //保存到数据库中的收藏夹 内
            try {
                boolean flag=false;
                product = thingDao.schAllProductById(id);
                flag= thingDao.saveProductToC(product, applicantAccount);
                if(flag==true){
                    response.sendRedirect("applicant/AllProduct.jsp");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }



        }
    }
}
