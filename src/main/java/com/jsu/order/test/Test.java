package com.jsu.order.test;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.jsu.order.Dao.ApplicantDao;
import com.jsu.order.Dao.ProductDao;
import com.jsu.order.Dao.ThingDao;
import com.jsu.order.bean.Applicant;
import com.jsu.order.bean.Collection;
import com.jsu.order.bean.Product;
import com.jsu.order.bean.Sales;
import com.jsu.order.utils.DBUtils;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;


public class Test {

    public static void main(String[] args) throws Exception {
          String account = null;
        String password = null;
        ApplicantDao applicantDao=new ApplicantDao();
        account = "123456@qq.com";
        String username="434332@qq.com";
       int  x= applicantDao.selectApplicantAccountCount(username);
        password = "123456";
        String identity = "管理员";
        /*//插入到数据库中，对数据进行封装
         Applicant applicant=new Applicant(account,password,identity);
        //保存applicant到数据库
    String  account=null;
       ApplicantDao applicantDAO=new ApplicantDao();
       applicantDAO.saveApplicant(applicant);
*/  /*ApplicantDao applicantDao=new ApplicantDao();*/
//Applicant applicant=new Applicant(account,password,identity);
   // applicant=applicantDao.getApplicantByAccountAndPass(account,password);
     /*   String account=null;
        ProductDao productDao=new ProductDao();
        productDao.findAll();
        productDao.getGoodsList();
*/
     /*String sql=null;
     int a=20;
        ThingDao thingDao=new ThingDao();
        List<Product> products=new ArrayList<>();
        Product product=new Product();
       products=thingDao.schAllProduct();
       for(int i=0;i<products.size();i++){
           System.out.println(products.get(i).getName());
       }
       System.out.println(".");*/
        /*ThingDao thingDao=new ThingDao();*/
       /* Cookie[] cookies = request.getCookies();
        String applicantAccount=null;
        if(cookies!=null) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("applicantAccount")) {
                    applicantAccount = cookies[i].getValue();
                }
            }
        }*/
    /*int i=1;
        String proName="proName"+String.valueOf(i);
        System.out.println(proName);*/
      /* String applicantAccount="zhangli@qq.com";
        List<Collection> goods1=thingDao.GetCollection(applicantAccount);
        for(int i=0;i<goods1.size();i++){
            System.out.println(goods1.get(i).getProName());
        }*/
    List<Product> product=new LinkedList<>();
      ThingDao thingDao1=new ThingDao();
      /*product =thingDao1.salemuch();*/
        product=ThingDao.schProByOrdenum();
        for(int i=0;i<product.size();i++){
            System.out.println(product.get(i).getName()+product.get(i).getOrderNum());
        }
        int pageSize=5;
     /*   String curp=request.getParameter("currentPage");*/
        int currentPage=0;
       /* if(curp==null){
            currentPage=1;
        }else{
            currentPage=Integer.parseInt(curp);
        }*/
        ThingDao thingDao=new ThingDao();
        List<Sales> sales=thingDao.getSalesListByPage(currentPage,pageSize);
        int totalPage=0;
        List<Sales> us=thingDao.schProSalesRecord();
        totalPage=us.size()%pageSize==0?us.size()/pageSize:us.size()/pageSize+1;
        //6、上一页beforePage
        Integer beforePage=currentPage-1<=0?1:currentPage-1;
        //7、上一页afterPage
        Integer afterPage=currentPage+1>=totalPage?totalPage:currentPage+1;
       /* request.setAttribute("count",us.size());
        request.setAttribute("totalPage",totalPage);
        request.setAttribute("userList",sales);
        request.setAttribute("currPage",currentPage);
        request.setAttribute("beforePage",beforePage);
        request.setAttribute("afterPage",afterPage);*/

}

}
