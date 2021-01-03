package com.jsu.order.bean;

public class Product {
    String  name;
    Float salPrice;//售价
    Float purPrice;//进价
    int num;
    String type;
    int id;
    String images;
    int orderNum;

    public Product() {
    }

    public Product(String name, Float salPrice, Float purPrice, int num, String type, int id, String images, int orderNum) {
        this.name = name;
        this.salPrice = salPrice;
        this.purPrice = purPrice;
        this.num = num;
        this.type = type;
        this.id = id;
        this.images = images;
        this.orderNum = orderNum;
    }

    public Product(String name, Float salPrice, Float purPrice, int num, String type, int id, String images) {
        this.name = name;
        this.salPrice = salPrice;
        this.purPrice = purPrice;
        this.num = num;
        this.type = type;
        this.id = id;
        this.images = images;
    }

    public Product(String name, Float salPrice, Float purPrice, int num, String type) {
        this.name = name;
        this.salPrice = salPrice;
        this.purPrice = purPrice;
        this.num = num;
        this.type = type;
    }

    public Product(String name, Float purPrice, Integer num, String type, Integer id, String images) {
        this.name = name;
        this.purPrice = purPrice;
        this.num = num;
        this.type = type;
        this.id=id;
        this.images=images;
    }



    public int getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(int orderNum) {
        this.orderNum = orderNum;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public Float  getsalPrice() {
        return salPrice;
    }

    public void setsalPrice(Float  salPrice) {
        this.salPrice = salPrice;
    }

    public Float  getpurPrice() {
        return purPrice;
    }

    public void setpurPrice(Float  purPrice) {
        this.purPrice = purPrice;
    }

    @Override
    public String toString() {
        return "Product{" +
                "name='" + name + '\'' +
                ", salPrice=" + salPrice +
                ", purPrice=" + purPrice +
                ", num=" + num +
                ", type='" + type + '\'' +
                ", id=" + id +
                ", images='" + images + '\'' +
                ", orderNum=" + orderNum +
                '}';
    }
}
