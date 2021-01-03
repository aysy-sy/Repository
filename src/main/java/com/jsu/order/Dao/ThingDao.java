package com.jsu.order.Dao;

import com.jsu.order.bean.*;
import com.jsu.order.utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class ThingDao {
    //根据销售量查找
    public static List<Product> schProByOrdenum() throws Exception {
        Connection conn = DBUtils.getConnection();
        PreparedStatement psmt = null;
        ResultSet rs = null;
       List<Product> list = new ArrayList<>();
        String sql = "select * from product ORDER BY orderNum desc";

        try {
            psmt = conn.prepareStatement(sql);
            rs = psmt.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setImages(rs.getString("images"));
                product.setName(rs.getString("name"));
                product.setNum(rs.getInt("num"));
                product.setpurPrice(rs.getFloat("pPrice"));
                product.setsalPrice(rs.getFloat("sPrice"));
                product.setType(rs.getString("type"));
                product.setOrderNum(rs.getInt("orderNum"));
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库的连接
            DBUtils.close(conn,psmt,rs);
        }
        return list;
    }

    public static void addProSalesNum(String proName, int squantity) throws Exception {
        Connection conn = DBUtils.getConnection();
        PreparedStatement psmt = null;
        ResultSet rs = null;
        Product product=new Product();
        //首先查询orderNum
        String sql1="select orderNum from product where name=?";

        String sql3="update product set orderNum=? where name=?";
        try {
            psmt = conn.prepareStatement(sql1);
            psmt.setString(1, product.getName());
            rs = psmt.executeQuery();
            while (rs.next()) {
                product.setOrderNum(rs.getInt("orderNum"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        int pquantity = product.getOrderNum();
        pquantity=pquantity+squantity;//数量相加
        try {
            psmt = conn.prepareStatement(sql3);
            psmt.setInt(1, pquantity);
            psmt.setString(2, proName);
            psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //产品分页
    public List<Product> getProListByPage(int currentPage,int pageSize) throws Exception {

        Integer startRow=(currentPage-1)*pageSize+1;
        StringBuffer sqlRow=new StringBuffer("select * from product ");
        sqlRow.append("limit ").append(startRow).append(",").append(pageSize);
        /*ThingDao thingDao=new ThingDao();*/
        List<Product> prosList=DBUtils.getList(Product.class,sqlRow.toString());
        return prosList;
    }
    //订单分页
    public List<Sales> getSalesListByPage(int currentPage,int pageSize) throws Exception {

        Integer startRow=(currentPage-1)*pageSize+1;
        StringBuffer sqlRow=new StringBuffer("select * from sales ");
        sqlRow.append("limit ").append(startRow).append(",").append(pageSize);
        /*ThingDao thingDao=new ThingDao();*/
        List<Sales> salesList=DBUtils.getList(Sales.class,sqlRow.toString());
        return salesList;
    }
        //查找销售量//按照从高到低排序
    public  static List<Product> salemuch()throws Exception{
        Connection conn = DBUtils.getConnection();
        PreparedStatement psmt = null;
        ResultSet rs = null;
        String sql = "select count(*) from sales group by squantity ";
        String sql1="select sname,sum(squantity) as Allnum from sales group by sname order by Allnum desc";
        List<Product> sales=new LinkedList<>();
        try {
            psmt = conn.prepareStatement(sql1);
            rs = psmt.executeQuery();
            while (rs.next()) {
                Product i=new Product();
                i.setName(rs.getString("sname"));
                i.setOrderNum(rs.getInt("Allnum"));
                sales.add(i);
                System.out.println(i.toString());//收集到名字和销售量
            }
        }catch (Exception e) {
                e.printStackTrace();
        }finally {
            // 关闭数据库的连接
            DBUtils.close(conn, psmt, rs);
        }
        return sales;
    }

    //通过页面查询销售记录
    public static List<Sales> getProSalesByPage(int start, int pageSize) throws Exception {
        // 连接数据库
        Connection conn = DBUtils.getConnection();
        PreparedStatement psmt = null;
        ResultSet rs = null;
        String sql = "select * from sales ";
        /*
         * if (!"".equals(outBoundId) ) { sql = sql + " and outBoundId = '" +
         * outBoundId + "'"; }
         */
        sql += " LIMIT " + start + "," + pageSize;
        List<Sales> salesRecordList = new ArrayList<>();
        try {
            psmt = conn.prepareStatement(sql);
            rs = psmt.executeQuery();
            while (rs.next()) {
                Sales sl = new Sales();
                sl.setSid(rs.getInt("sid"));
                sl.setSname(rs.getString("sname"));
                sl.setSquantity(rs.getInt("squantity"));
                sl.setSdate(rs.getString("sdate"));
                salesRecordList.add(sl);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库的连接
            DBUtils.close(conn, psmt, rs);
        }
        return salesRecordList;
    }

    // 获得当前库产品数量
    public static int getQuantity(String proName) throws Exception {
        Connection conn = DBUtils.getConnection();
        PreparedStatement psmt = null;
        ResultSet rs = null;
        int pquantity = 0;
        String sql = "select num from product where name=?";
        try {
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, proName);
            rs = psmt.executeQuery();
            while (rs.next()) {
                pquantity = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pquantity;
    }
    // 增加产品销售记录//客户下订单
    public static void addProSalesRecord(Sales sales) throws Exception {
        Connection conn = DBUtils.getConnection();
        PreparedStatement psmt = null;
        String sql = "insert into sales(sname,squantity,sdate) values(?,?,?)";
        //寻找相应的产品 增加销售量
        try {
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, sales.getSname());
            psmt.setInt(2, sales.getSquantity());
            psmt.setString(3, sales.getSdate());
            psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        int pquantity = getQuantity(sales.getSname());
        pquantity = pquantity - sales.getSquantity();
        String sql1 = "update product set num=? where name=? ";
        try {
            psmt = conn.prepareStatement(sql1);
            psmt.setInt(1, pquantity);
            psmt.setString(2, sales.getSname());
            psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    //通过编号查询产品信息
    public static Product getProById(int id) throws Exception {
        // 连接数据库
        Connection conn = DBUtils.getConnection();
        PreparedStatement psmt = null;
        ResultSet rs = null;
        String sql = "select * from product where id = ?";
        Product product = new Product();
        try {
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, id);
            rs = psmt.executeQuery();
            while (rs.next()) {
                product.setId(rs.getInt("id"));
                product.setImages(rs.getString("images"));
                product.setName(rs.getString("name"));
                product.setNum(rs.getInt("num"));
                product.setpurPrice(rs.getFloat("pPrice"));
                product.setsalPrice(rs.getFloat("sPrice"));
                product.setType(rs.getString("type"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库的连接
            DBUtils.close(conn,psmt,rs);
        }
        return product;
    }
    //通过名字查询产品信息
    public static Product getProByName(String proName) throws Exception {
        // 连接数据库
        Connection conn = DBUtils.getConnection();
        PreparedStatement psmt = null;
        ResultSet rs = null;
        String sql = "select * from product where name = ?";
        Product product = new Product();
        try {
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, proName);
            rs = psmt.executeQuery();
            while (rs.next()) {
                product.setId(rs.getInt("id"));
                product.setImages(rs.getString("images"));
                product.setName(rs.getString("name"));
                product.setNum(rs.getInt("num"));
                product.setpurPrice(rs.getFloat("pPrice"));
                product.setsalPrice(rs.getFloat("sPrice"));
                product.setType(rs.getString("type"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库的连接
            DBUtils.close(conn,psmt,rs);
        }
        return product;
    }

//通过编号查询订单信息
public static Sales getSaleById(int id) throws Exception {
    // 连接数据库
    Connection conn = DBUtils.getConnection();
    PreparedStatement psmt = null;
    ResultSet rs = null;
    String sql = "select * from sales where sid = ?";
    Sales sales=new Sales();
    try {
        psmt = conn.prepareStatement(sql);
        psmt.setInt(1, id);
        rs = psmt.executeQuery();
        while (rs.next()) {
            sales.setSid(rs.getInt("sid"));
            sales.setSname(rs.getString("sname"));
            sales.setSquantity(rs.getInt("squantity"));
            sales.setSdate(rs.getString("sdate"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // 关闭数据库的连接
        DBUtils.close(conn,psmt,rs);
    }
    return sales;
}

    //修改产品信息
    public static void editPro(Product pro) throws Exception {
        Connection conn = DBUtils.getConnection();
        PreparedStatement psmt = null;

        String sql = "update product set name=?,type=?,pPrice=?,sPrice=?,num=? where id = ?";
        try {
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, pro.getName());
            psmt.setString(2, pro.getType());
            psmt.setFloat(3, pro.getpurPrice());
            psmt.setFloat(4, pro.getsalPrice());
            psmt.setInt(5, pro.getNum());
            psmt.setInt(6, pro.getId());
            psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库的连接
            DBUtils.close(conn,psmt,null);
        }
    }
    //判断账号是否存在
    public static boolean detemineIfAccountExist(String acc) throws Exception {
        Connection conn = DBUtils.getConnection();
        PreparedStatement psmt = null;
        ResultSet rs = null;
        boolean flag = false;
        String sql = "select * from user where Account=? ";
        try {
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, acc);
            rs = psmt.executeQuery();
            while (rs.next()) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }
    // 判断产品是否已经存在
    public static boolean detemineIfProExist(String proName) throws Exception {
        Connection conn = DBUtils.getConnection();
        PreparedStatement psmt = null;
        ResultSet rs = null;
        boolean flag = false;
        String sql = "select * from product where name=? ";
        try {
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, proName);
            rs = psmt.executeQuery();
            while (rs.next()) {
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }
    // 浏览产品信息
    public static List<Product> schPro(String schProName) throws Exception {
        // 连接数据库
        Connection conn = DBUtils.getConnection();
        PreparedStatement psmt = null;
        ResultSet rs = null;
        String sql = "select * from product where 1 = 1";
        if (!"".equals(schProName) && schProName != null) {
            sql = sql + " and name = '" + schProName + "'";
        }
        List<Product> list = new ArrayList<>();
        try {
            psmt = conn.prepareStatement(sql);
            rs = psmt.executeQuery();
            while (rs.next()) {
                Product i = new Product();
                i.setId(rs.getInt("id"));
                i.setName(rs.getString("name"));
                i.setType(rs.getString("type"));
                i.setsalPrice(rs.getFloat("sPrice"));
                i.setpurPrice(rs.getFloat("pPrice"));
                i.setNum(rs.getInt("num"));
                list.add(i);
                System.out.println(i.toString());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库的连接
           DBUtils.close(conn,psmt,rs);
        }
        return list;
    }

    //通过页面查询产品信息
    public static List<Product> getProByPage(String schProName, int start,
                                             int pageSize) throws Exception {
        // 连接数据库
        Connection conn = DBUtils.getConnection();
        PreparedStatement psmt = null;
        ResultSet rs = null;
        String sql = "select * from product where 1 = 1";
        if (!"".equals(schProName) && schProName != null) {
            sql = sql + " and name = '" + schProName + "'";
        }
        sql += " LIMIT " + start + "," + pageSize;
        List<Product> list = new ArrayList<>();
        try {
            psmt = conn.prepareStatement(sql);
            rs = psmt.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setType(rs.getString("type"));
                p.setpurPrice(rs.getFloat("pPrice"));
                p.setsalPrice(rs.getFloat("sPrice"));
                p.setNum(rs.getInt("num"));
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库的连接
           DBUtils.close(conn,psmt,rs);
        }
        return list;
    }

    // 顾客浏览产品信息
    public static List<Product> schProduct1(String schProName) throws Exception {
        // 连接数据库
        Connection conn = DBUtils.getConnection();
        PreparedStatement psmt = null;
        ResultSet rs = null;
        String sql = "select * from product where 1 = 1";
        if (!"".equals(schProName) && schProName != null) {
            sql = sql + " and name = '" + schProName + "'";
        }
        List<Product> list = new ArrayList<>();
        try {
            psmt = conn.prepareStatement(sql);
            rs = psmt.executeQuery();
            while (rs.next()) {
                Product i = new Product();
                i.setId(rs.getInt("id"));
                i.setName(rs.getString("name"));
                i.setType(rs.getString("type"));
                i.setsalPrice(rs.getFloat("sPrice"));
                i.setNum(rs.getInt("num"));
                list.add(i);
                System.out.println(i.toString());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库的连接
           DBUtils.close(conn,psmt,rs);
        }
        return list;
    }
    //删除产品信息
    public static void delPro(int id) throws Exception {
        Connection conn = DBUtils.getConnection();
        PreparedStatement psmt = null;
        String sql = "delete from product where id = ?";
        try {
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, id);
            psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库的连接
           DBUtils.close(conn,psmt,null);
        }
    }
    //查询所有产品信息  AllProduct.jsp
    public static List<Product> schAllProduct() throws Exception{
        Connection conn=DBUtils.getConnection();
        PreparedStatement ps=null;
        ResultSet rs=null;
        String sql="select * from product";
        List<Product> products=new ArrayList<>();
        try{
            ps=conn.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()){
                Product product=new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setType(rs.getString("type"));
                product.setsalPrice(rs.getFloat("sPrice"));
                product.setpurPrice(rs.getFloat("pPrice"));
                product.setImages(rs.getString("images"));
                product.setNum(rs.getInt("num"));
                products.add(product);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
    //通过id查询产品信息    productDetail
    public static Product schAllProductById(int id) throws Exception{
        Connection conn=DBUtils.getConnection();
        PreparedStatement ps=null;
        ResultSet rs=null;
        String sql="select * from product where id =?";
        Product product=new Product();
        try{
            ps=conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs=ps.executeQuery();
            while (rs.next()){
                product.setName(rs.getString("name"));
                product.setType(rs.getString("type"));
                product.setsalPrice(rs.getFloat("sPrice"));
                product.setpurPrice(rs.getFloat("pPrice"));
                product.setImages(rs.getString("images"));
                product.setNum(rs.getInt("num"));
                product.setId(rs.getInt("id"));
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }


    // 添加产品信息
    public static boolean addProduct(Product product) throws Exception {
        Connection conn = DBUtils.getConnection();
        PreparedStatement psmt = null;
        boolean flag = false;
        String flower_name = product.getName();
        
        String sql ="insert into product(name,type,pPrice,sPrice,num)" +
                        "values(?,?,?,?,?)";
        try {
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, product.getName());
            psmt.setString(2, product.getType());
            psmt.setFloat(3, product.getpurPrice());
            psmt.setFloat(4, product.getsalPrice());
            psmt.setInt(5, product.getNum());
            psmt.executeUpdate();
            flag = true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库的连接
           DBUtils.close(conn,psmt,null);
        }
        return flag;
    }
//删除订单
    public static void delSale(int sid) throws Exception {
        Connection conn = DBUtils.getConnection();
        PreparedStatement psmt = null;
        String sql = "delete from sales where sid = ?";
        try {
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, sid);
            psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库的连接
            DBUtils.close(conn,psmt,null);
        }
    }
//编辑订单
    public static void editSale(Sales sales) throws Exception {
        Connection conn = DBUtils.getConnection();
        PreparedStatement psmt = null;
        String sql = "update sales set  sname=?,squantity=? where sid = ?";
        try {
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, sales.getSname());
            psmt.setInt(2,sales.getSquantity());
            psmt.setInt(3,sales.getSid());
            psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库的连接
            DBUtils.close(conn,psmt,null);
        }
    }

    // 查询产品销售记录
    public List<Sales> schProSalesRecord() throws Exception {
        // 连接数据库P
        Connection conn = DBUtils.getConnection();
        PreparedStatement psmt = null;
        ResultSet rs = null;
        String sql = "select * from sales ";

        List<Sales> salesRecordList = new ArrayList<>();
        try {
            psmt = conn.prepareStatement(sql);
            rs = psmt.executeQuery();
            while (rs.next()) {
                Sales sl = new Sales();
                sl.setSid(rs.getInt("sid"));
                sl.setSname(rs.getString("sname"));
                sl.setSquantity(rs.getInt("squantity"));
                sl.setSdate(rs.getString("sdate"));
                salesRecordList.add(sl);
                System.out.println(sl.toString());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库的连接
            DBUtils.close(conn, psmt, rs);
        }
        return salesRecordList;
    }
//将产品保存到收藏夹中
    public boolean saveProductToC(Product product, String account) throws Exception {
        Connection conn = DBUtils.getConnection();
        PreparedStatement psmt = null;
        ResultSet rs = null;
        boolean flag=false;
        String sql = "insert into collection (proId,userName,proName,proType,salPrice,images) values(?,?,?,?,?,?)";
        try {
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, product.getId());
            psmt.setString(2, account);
            psmt.setString(3, product.getName());
            psmt.setString(4,product.getType());
            psmt.setFloat(5, product.getsalPrice());
            psmt.setString(6,product.getImages());
            psmt.executeUpdate();
            flag = true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库的连接
            DBUtils.close(conn,psmt,null);
        }
        return flag;
    }
        //将数据存在shop_car内 购物车
    public boolean saveProductToSC(Product product, String account, int shopNum) throws Exception {
        Connection conn = DBUtils.getConnection();
        PreparedStatement psmt = null;
        ResultSet rs = null;
        boolean flag=false;
        String sql = "insert into shop_car (proId,userName,proName,proType,salPrice,shopNum,images) values(?,?,?,?,?,?,?)";
        try {
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, product.getId());
            psmt.setString(2, account);
            psmt.setString(3, product.getName());
            psmt.setString(4,product.getType());
            psmt.setFloat(5, product.getsalPrice());
            psmt.setInt(6,shopNum);
            psmt.setString(7,product.getImages());
            psmt.executeUpdate();
            flag = true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库的连接
            DBUtils.close(conn,psmt,null);
        }
        return flag;
    }
    //读取收藏夹的内容 根据顾客账号
    public List<Collection> GetCollection(String account) throws Exception {
        Connection conn = DBUtils.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql="select * from collection where userName=?";
        List<Collection> collections=new ArrayList<>();
        try{
            ps=conn.prepareStatement(sql);
            ps.setString(1, account);
            rs=ps.executeQuery();
            while (rs.next()){
                Collection collection=new Collection();
                collection.setProId(rs.getInt("proId"));
                collection.setUserName(rs.getString("userName"));
                collection.setProName(rs.getString("proName"));
                collection.setProType(rs.getString("proType"));
                collection.setProPrice(rs.getFloat("salPrice"));
                collection.setImages(rs.getString("images"));
                collection.setId(rs.getInt("id"));
                collections.add(collection);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return collections;

    }
//获取购物车内容
    public List<ShopCar> GetShopCar(String account) throws Exception {
        Connection conn = DBUtils.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql="select * from shop_car where userName=?";
        List<ShopCar> shopCars=new ArrayList<>();
        try{
            ps=conn.prepareStatement(sql);
            ps.setString(1, account);
            rs=ps.executeQuery();
            while (rs.next()){
                ShopCar shopCar =new ShopCar();
                shopCar.setProId(rs.getInt("proId"));
                shopCar.setUserName(rs.getString("userName"));
                shopCar.setProName(rs.getString("proName"));
                shopCar.setProType(rs.getString("proType"));
                shopCar.setProPrice(rs.getFloat("salPrice"));
                shopCar.setShopNum(rs.getInt("shopNum"));
                shopCar.setImages(rs.getString("images"));
                shopCar.setId(rs.getInt("id"));
                shopCars.add(shopCar);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return shopCars;
    }


}