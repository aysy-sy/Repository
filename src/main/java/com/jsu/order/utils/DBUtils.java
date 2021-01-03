package com.jsu.order.utils;


import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.alibaba.druid.pool.DruidPooledConnection;
import com.jsu.order.bean.Applicant;
import com.jsu.order.bean.Product;
import com.jsu.order.test.Test;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.logging.log4j.util.PropertiesUtil;

import javax.rmi.PortableRemoteObject;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Date;
import java.util.*;

public class DBUtils {

   public static Connection getConnection() throws Exception{
       Properties properties = new Properties();
       //读取配置文件
       InputStream in = Test.class.getClassLoader().getResourceAsStream("db.properties");
       properties.load(in);
       //2.获取连接池对象
       DataSource dataSource = DruidDataSourceFactory.createDataSource(properties);
       //3.获取连接
       Connection conn = dataSource.getConnection();
       return conn;
   }

    public static Integer getproductCount(String sql) {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        Integer count=null;
        try{
            conn=DBUtils.getConnection();
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                count=rs.getInt(1);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(conn, ps, rs);
        }
        return count;
    }
    public static String getIdentity(String sql,String account){
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        Applicant applicant=new Applicant();
        try{
            conn=DBUtils.getConnection();
            ps=conn.prepareStatement(sql);
            ps.setString(1, account);
            rs = ps.executeQuery();
            while (rs.next()) {
                applicant.setIdentity(rs.getString("identity"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        // 关闭数据库的连接
        close(conn, ps, rs);
    }
        return applicant.getIdentity();
    }

    public static Product getproByName(String sql, String name) {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        Product product=new Product();
        try {
            conn=DBUtils.getConnection();
            ps=conn.prepareStatement(sql);
            ps.setString(1, name);
            rs = ps.executeQuery();
            while (rs.next()) {
                product.setType(rs.getString("type"));
                product.setNum(rs.getInt("num"));
                product.setpurPrice(rs.getFloat("pprice"));
               // product.setName(rs.getString("name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库的连接
            close(conn, ps, rs);
        }
        return product;
    }

    public static List<Product> getAll(String sql) {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        List<Product> productList= new ArrayList<Product>();
        try {
            conn=DBUtils.getConnection();
            ps=conn.prepareStatement(sql);

            rs = ps.executeQuery();
            while (rs.next()) {
                Integer id=rs.getInt("id");
                Product product=new Product();
                product.setId(id);
                product.setType(rs.getString("type"));
                product.setNum(rs.getInt("num"));
                product.setName(rs.getString("name"));
                product.setpurPrice(rs.getFloat("pprice"));
                product.setImages(rs.getString("images"));
                productList.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        // 关闭数据库的连接
        close(conn, ps, rs);
    }
        return productList;
    }

    public static List<Product> selectCurrentPagePro(String sql,int currentPage,int pageSize ) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Product> productList = new ArrayList<Product>();
        try {
            conn = DBUtils.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            int pageNum = (currentPage - 1) * pageSize;
            ps.setInt(1, pageNum);
            ps.setInt(2, pageSize);
            while (rs.next()) {
                Integer id = rs.getInt("id");
                Float pprice = rs.getFloat("pprice");
                String name = rs.getString("name");
                Integer num = rs.getInt("num");
                String type = rs.getString("type");
                String images=rs.getString("images");
//String name, Float price, int num, String type ,String id
                Product product= new Product(name, pprice, num, type,id,images);
                productList.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            // 关闭数据库的连接
            close(conn, ps, rs);
        }
        return productList;

    }

    //通过账号查询用户信息
    public Applicant getapplicantById(String sql,String account,String phone,String address,String username) {
        // 连接数据库
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        Applicant applicant=new Applicant();
        try {
            conn=DBUtils.getConnection();
            ps=conn.prepareStatement(sql);
            ps.setString(1, account);
            rs = ps.executeQuery();
            while (rs.next()) {
                applicant.setPhone(rs.getString("applicantPhone"));
                applicant.setAddress(rs.getString("applicantAddress"));
                applicant.setUserName(rs.getString("applicantName"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库的连接
            close(conn, ps, rs);
        }
        return applicant;
    }
    //查询产品
    public static Product getproById(String sql, int id) {
        // 连接数据库
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        Product product=new Product();
        try {
            conn=DBUtils.getConnection();
            ps=conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                product.setType(rs.getString("type"));
                product.setNum(rs.getInt("num"));
                product.setName(rs.getString("name"));
                product.setpurPrice(rs.getFloat("pprice"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库的连接
            close(conn, ps, rs);
        }
        return product;
    }

    //登录核对账号密码//在修改密码时也可以使用
    public static boolean CheckLogin(String sql, String account, String pwd){
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try{
            conn=DBUtils.getConnection();
            ps=conn.prepareStatement(sql);
            ps.setString(1,account);
            ps.setString(2,pwd);
            rs=ps.executeQuery();
            while(rs.next()){
                close(conn, ps, rs);
                return true;
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    //修改信息
    // "update user(userName,phone,address)" +
    //                "values(?,?,?) where Account=?";已知晓账号getAccount() ,applicant.getUserName(), applicant.getAddress(), applicant.getPhone(),
    public static boolean updatePersonal(String sql, String account, String name, String address, String phone) {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try {
            conn=DBUtils.getConnection();
            ps=conn.prepareStatement(sql);
            ps.setString(1,name);
            ps.setString(2,phone);
            ps.setString(3,address);
            ps.setString(4,account);
            ps.executeUpdate();
            while(rs.next()){
                close(conn, ps, rs);
                return true;
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
   //applicant.getAccount(),applicant.getUserName(),applicant.getAddress(),applicant.getPhone(),applicant.getPassWord());
    public static boolean updatePwd(String sql,String pwd,String account){
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try{
            conn=DBUtils.getConnection();
            ps=conn.prepareStatement(sql);

            ps.setString(1,pwd);
            ps.setString(2,account);
            ps.executeUpdate();
            while(rs.next()){
                close(conn, ps, rs);
                return true;
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    //保存
    public static boolean save(String sql, Object...args) throws Exception {
       Connection conn=null;
        PreparedStatement ps=null;
        Integer count =null;
        try{
            conn= DBUtils.getConnection();
            System.out.println(conn);
            ps=conn.prepareStatement(sql);

            if(args!=null&&args.length>0){
                for(int i=0;i<args.length;i++){
                    ps.setObject(i+1,args[i]);
                }
            }
            count=ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(conn, ps, null);
        }
        return count!=null&&count>0?true:false;
    }

    public static void close(Connection conn, Statement ps, ResultSet rs) {
        if(rs!=null){
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(ps!=null){
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(conn!=null){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    //查询单个用户
    public static <T> T getSingleObj(Class<T> clazz, String sql, Object...args)throws Exception{
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        T bean=null;
        conn= DBUtils.getConnection();
        System.out.println(conn);
        try{
            ps=conn.prepareStatement(sql);
            if(args!=null&&args.length>0){
                for(int i=0;i<args.length;i++){
                    ps.setObject(i+1,args[i]);
                }
            }
            rs=ps.executeQuery();

            //获取结果集元数据
            ResultSetMetaData rsmd=rs.getMetaData();
            //获取当前结果集的列数
            int colnum=rsmd.getColumnCount();

            while(rs.next()){

                Map<String,Object> rowMap=new HashMap<String,Object>();
                for(int i=1;i<=colnum;i++){
                    String columnName=rsmd.getColumnName(i);
                    Object columnValue=rs.getObject(columnName);
                    if(columnValue instanceof java.sql.Date){
                        java.sql.Date date=(java.sql.Date)columnValue;
                        columnValue=new Date(date.getTime());
                    }
                    rowMap.put(columnName,columnValue);
                }
                bean=clazz.newInstance();

                for(Map.Entry<String,Object> entry:rowMap.entrySet()){
                    String propertyName=entry.getKey();
                    Object propertyValue=entry.getValue();
                    BeanUtils.setProperty(bean,propertyName,propertyValue);
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(conn, ps, rs);
        }

        return bean;
    }

    public static Integer getCount(String sql, Object...args)throws Exception {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        Integer count=null;
        conn= DBUtils.getConnection();
        System.out.println(conn);
        try{

            ps=conn.prepareStatement(sql);

            if(args!=null&&args.length>0){
                for(int i=0;i<args.length;i++){
                    ps.setObject(i+1,args[i]);
                }
            }
            rs=ps.executeQuery();
            while(rs.next()){
                count=rs.getInt(1);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(conn, ps, rs);
        }
        return count;
    }


    //更新操作
    public static boolean update(String sql, Object...args)  {

        Connection connection=null;
        PreparedStatement ps=null;
        Integer count=0;
        try{

            connection = DBUtils.getConnection();
            ps = connection.prepareStatement(sql);
            if(args!=null&&args.length>0) {
                for (int i = 0; i < args.length; i++) {
                    //判断当前类型，是不是java.util.Date,转换成java.sql.Date
                    if(args[i] instanceof Date){
                        Date date=(Date) args[i];
                        //转换成java.sql.Date
                        args[i]=new java.sql.Date(date.getTime());
                    }

                    ps.setObject(i + 1,args[i]);
                }
            }
            count = ps.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }finally{
            close(connection, ps, null);
        }
        return count>0?true:false;
    }
    //返回用户集合
    public static <T> List<T> getList(Class<T> clazz, String sql, Object...args){
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        List<T> userList=null;
        try{
            conn= DBUtils.getConnection();
            //  String sql="select id,username,birthday from users where id=? and username=?";
            ps=conn.prepareStatement(sql);

            if(args!=null&&args.length>0){
                for(int i=0;i<args.length;i++){
                    ps.setObject(i+1,args[i]);
                }
            }
            rs=ps.executeQuery();

            //获取结果集元数据
            ResultSetMetaData rsmd=rs.getMetaData();
            //获取当前结果集的列数
            int colnum=rsmd.getColumnCount();
            userList=new ArrayList<T>();
            while(rs.next()){
                Map<String,Object> rowMap=new HashMap<String,Object>();
                for(int i=1;i<=colnum;i++){
                    String columnName=rsmd.getColumnName(i);
                    Object columnValue=rs.getObject(columnName);
                    if(columnValue instanceof java.sql.Date){
                        java.sql.Date date=(java.sql.Date)columnValue;
                        columnValue=new Date(date.getTime());
                    }
                    rowMap.put(columnName,columnValue);
                }
                T bean=clazz.newInstance();

                for(Map.Entry<String,Object> entry:rowMap.entrySet()){
                    String propertyName=entry.getKey();
                    Object propertyValue=entry.getValue();
                    BeanUtils.setProperty(bean,propertyName,propertyValue);
                }
                userList.add(bean);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(conn, ps, rs);
        }
        return userList;
    }


}
