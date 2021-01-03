package com.jsu.order.servlet;

import com.jsu.order.Dao.ApplicantDao;
import com.jsu.order.bean.Applicant;
import com.jsu.order.utils.JudgeCode;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;

@WebServlet(urlPatterns = "/PersonalServlet")
public class PersonalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Cookie[] cookies = request.getCookies();
        String applicantAccount=null;
        String identity=null;
        if(cookies!=null) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("applicantAccount")) {
                    applicantAccount = cookies[i].getValue();
                    /*System.out.println(applicantAccount);*/
                    //测试账号正确性
                }
                if (cookies[i].getName().equals("identity")) {
                    identity = cookies[i].getValue();
                    /*System.out.println(applicantAccount);*/
                    //测试账号正确性
                }
            }
        }

        //获取前台提交的email和密码
        String applicantPwd = request.getParameter("applicantPwd");
        String applicantPwd2=request.getParameter("applicantPwd2");
        String applicantName=request.getParameter("applicantName");
        String applicantAddress=request.getParameter("applicantAddress");
        String applicantPhone=request.getParameter("applicantPhone");

        PrintWriter writer = response.getWriter();


        //保存applicant到数据库
        //插入到数据库中，对数据进行封装
        //Applicant applicant = new Applicant(applicantAccount, applicantPwd, applicantAddress,applicantName);
        //保存applicant到数据库
        ApplicantDao applicantDAO = new ApplicantDao();
        //1.如果Pwd为空，则代表不修改密码，修改其余个人信息
        //String userName, String account, String phone, String address, String identity
        if(applicantPwd==null&&applicantPwd2==null){
            Applicant applicant=new Applicant(applicantName,applicantAccount,applicantPhone,applicantAddress,applicantPhone);
            try {
                applicantDAO.updatePerson(applicant);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else{
            //如果Pwd不为空，则证明需要修改密码，先判断旧密码是否正确，若不正确则重新输入
            boolean flag=false;
            try {
                flag= applicantDAO.getApplicantByAccountAndPass(applicantAccount,applicantPwd);
            } catch (Exception e) {
                e.printStackTrace();
            }
            //密码正确
            if(flag==true){
                //进行修改其余信息
                //(String userName, String Account, String passWord, String phone, String address, String newpwd
                Applicant applicant=new Applicant(applicantName,applicantAccount,applicantPwd,applicantPhone,applicantAddress,applicantPwd2);
                try {
                    applicantDAO.updatePwd(applicant);
                    applicantDAO.updatePerson(applicant);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                writer.write("<script>");
                writer.write("alert('修改成功');");
                if(identity.equals("用户")){
                    writer.write("window.location.href='applicant/product.jsp'");
                    writer.write("</script>");
                    writer.flush();
                    writer.close();
                }else {
                    writer.write("window.location.href='applicant/product-Admin.jsp'");
                    writer.write("</script>");
                    writer.flush();
                    writer.close();
                }

            }else{
                writer.write("<script>");
                writer.write("alert('旧密码输入错误！请重新输入');");
                writer.write("window.location.href='applicant/PersonalCenter.jsp'");
                writer.write("</script>");
                writer.flush();
                writer.close();
            }
        }
        writer.flush();
        writer.close();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request, response);
    }
}
