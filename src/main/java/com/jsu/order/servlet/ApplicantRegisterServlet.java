package com.jsu.order.servlet;

import com.jsu.order.Dao.ApplicantDao;
import com.jsu.order.bean.Applicant;
import com.jsu.order.utils.JudgeCode;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.SysexMessage;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/ApplicantRegisterServlet")
public class ApplicantRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //获取前台提交的email和密码
        String applicantAccount = request.getParameter("applicantAccount");
        String applicantPwd = request.getParameter("applicantPwd");
        String identity = request.getParameter("identity");
        //保存applicant到数据库
        String code=request.getParameter("applicantCode");
        String SystemCode;
        SystemCode=new JudgeCode().makeCode();
        request.getSession().setAttribute("verifyCode", SystemCode);
        //插入到数据库中，对数据进行封装
        Applicant applicant = new Applicant(applicantAccount, applicantPwd, identity);
        //保存applicant到数据库
        ApplicantDao applicantDAO = new ApplicantDao();
        //判断是否有相同的email
        Integer count = null;
        try {
            count = applicantDAO.selectApplicantAccountCount(applicantAccount);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (count > 0) {
            //数据库中已经有相同的email用户
            //通过response对象给客户端一个错误提示
            PrintWriter writer = response.getWriter();
            writer.write("<script>");
            writer.write("alert('申请注册的email已经被占用！');");
            writer.write("window.location.href='applicant/register.jsp'");
            writer.write("</script>");
            writer.flush();
            writer.close();
        } else {
            //是否注册成功
            boolean flag = true;
            try {
                flag = applicantDAO.saveApplicant(applicant);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (flag) {
                //判断验证码是否正确
                //注册成功就跳转到登录页面  重定向
                response.sendRedirect("/OrderManagementSystem/applicant/login.jsp");
            } else {
                //注册失败就返回注册页面   请求转发
                RequestDispatcher dispatcher = request.getRequestDispatcher("applicant/register.jsp");
                dispatcher.forward(request, response);
            }

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
