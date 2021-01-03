package com.jsu.order.Dao;

import com.jsu.order.bean.Product;
import com.jsu.order.utils.DBUtils;

import java.util.Collection;
import java.util.List;

public class ProductDao {
    //统计产品数量
    public static Integer getProductCount(String sql) {
        //sql="select count(*) from product";
        return DBUtils.getproductCount(sql);
    }
    //查询产品
    public static List<Product> getGoodsList() {
        String sql="select * from product";
        List<Product> goodsList= DBUtils.getList(Product.class,sql);
        return goodsList;
    }
    public static List<Product> getProductListByPage(String sql) {
        //String sql="select COMPANY_ID,COMPANY_NAME,COMPANY_AREA,COMPANY_SIZE,COMPANY_TYPE,COMPANY_BRIEF,COMPANY_STATE,COMPANY_SORT,COMPANY_VIEWNUM,COMPANY_PIC from tb_company";
        List<Product> productsList=DBUtils.getList(Product.class,sql);
        return productsList;
    }
    //添加产品
    public boolean saveProduct(Product product) throws Exception {
        String sql="insert into product(name,price,type,num)"
                +"values(?,?,?,?)";
        //String name, Double price, int num, String type
        return DBUtils.save(sql,product.getName(),product.getpurPrice(),product.getType(),product.getNum());
    }
    //查询单个产品 按ID
    public Product getSinglepro(int Id) {
        String sql="select * from product where id=?";
        return DBUtils.getproById(sql,Id);
    }
    //按名字查询
    public Product getpro(String name){
        String sql="select * from product where name=?";
        return DBUtils.getproByName(sql,name);
    }
    //查询所有产品
    public List<Product> findAll() {
        String sql="select * from product";
        return DBUtils.getAll(sql);
    }

    public List<Product> selectCurrentPageProduct(int currentPage,int pageSize) {
        String sql="select * from product limit ?,?";
        return DBUtils.selectCurrentPagePro(sql,currentPage,pageSize);
    }
}

