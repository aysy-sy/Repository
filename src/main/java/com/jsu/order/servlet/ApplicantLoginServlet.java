package com.jsu.order.servlet;

import com.alibaba.fastjson.JSON;
import com.jsu.order.Dao.ApplicantDao;
import com.jsu.order.bean.Applicant;
import com.alibaba.fastjson.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

@WebServlet(urlPatterns = "/ApplicantLoginServlet")
public class ApplicantLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //获取前台提交的email和密码
        String applicantAccount=request.getParameter("applicantAccount");
        String applicantPwd=request.getParameter("applicantPwd");


    //   String requestPath=request.getParameter("requestPath");

        //根据email和password查询申请人
        ApplicantDao applicantDAO=new ApplicantDao();
        boolean flag=false;
        try {
            flag= applicantDAO.getApplicantByAccountAndPass(applicantAccount,applicantPwd);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //判断账号是否正确，错误返回登录页面，不为空，就进入主页面
        if(flag==true){
           // request.getSession().setAttribute("Applicant",applicantAccount);
            Applicant applicant= new Applicant(applicantAccount,applicantPwd);
            String  userStr =null;
            userStr= JSON.toJSONString(applicant);

            Cookie cookie = new Cookie("user", URLEncoder.encode(userStr,"utf-8"));
                /*
                在cookie保存中文时  也同样需要采用URLEncoder对其进行编码   在获取的时候  同样采用URLDecode进行解码
                 */
            Cookie cookie1 = new Cookie("applicantAccount",applicantAccount);
            //查询账号身份进入页面
            String id=null;
            try {
                id=ApplicantDao.getIdentity(applicantAccount);
            } catch (Exception e) {
                e.printStackTrace();
            }
           // cookie.setMaxAge(60*60*24);
            response.addCookie(cookie);
            response.addCookie(cookie1);
            if(id.equals("用户")){
                response.sendRedirect("applicant/cus_index.jsp");
            }else if(id.equals("管理员")){
                response.sendRedirect("applicant/index.jsp");
            }

        }else{
            PrintWriter writer=response.getWriter();
            writer.write("<script>");
            writer.write("alert('用户名或密码错误！');");
            writer.write("window.location.href='applicant/login.jsp'");
            writer.write("</script>");
            writer.flush();
            writer.close();
        }

    }
    public void rememberMe(String rememberMe, String username, String password,
                           HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 代码区域
        if ("true".equals(rememberMe)) {
            Cookie cookie = new Cookie("COOKIE_username", username);
            cookie.setPath("/");
            cookie.setMaxAge(365 * 24 * 60 * 60);
            response.addCookie(cookie);

            cookie = new Cookie("COOKIE_password", password);
            cookie.setPath("/");
            cookie.setMaxAge(365 * 24 * 60 * 60);
            response.addCookie(cookie);
        } else {
            // 清空cookie的已有的用户名和密码
            Cookie[] cookies = request.getCookies();
            if (cookies != null)
                for (Cookie cookie : cookies) {
                    if ("COOKIE_username".equals(cookie.getName())
                            || "COOKIE_password".equals(cookie.getName())) {
                        cookie.setMaxAge(0);
                        cookie.setPath("/");
                        response.addCookie(cookie);
                    }
                }
        }
    }
    }
