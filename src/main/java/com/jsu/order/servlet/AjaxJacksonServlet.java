package com.jsu.order.servlet;

import com.jsu.order.Dao.ApplicantDao;
import com.jsu.order.Dao.ThingDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns= "/AjaxJacksonServlet")
public class AjaxJacksonServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("checkAccount".equals(action)) {
            try {
                checkAccount (request, response);// 浏览产品
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

         /*   String a=request.getParameter("account");
            String json="{\"msg\",\"true\"}";
        System.out.println(json);
        PrintWriter out=response.getWriter();
            response.getWriter().write(json);*/


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void checkAccount(HttpServletRequest req, HttpServletResponse resp)
            throws Exception {
        String account = req.getParameter("email");
        boolean flag = ThingDao.detemineIfAccountExist(account);
        PrintWriter out = resp.getWriter();
        out.print(flag);
    }
}