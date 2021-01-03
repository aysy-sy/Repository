package com.jsu.order.bean;

public class Collection {
    int proId;//产品编号
    String userName;
    String proName;
    String proType;
    Float proPrice;
    int id;
    String images;

    public Collection() {
    }

    public Collection(int proId, String userName, String proName, String proType, Float proPrice,  int id, String images) {
        this.proId = proId;
        this.userName = userName;
        this.proName = proName;
        this.proType = proType;
        this.proPrice = proPrice;
        this.id = id;
        this.images = images;
    }

    public int getProId() {
        return proId;
    }

    public void setProId(int proId) {
        this.proId = proId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public String getProType() {
        return proType;
    }

    public void setProType(String proType) {
        this.proType = proType;
    }

    public Float getProPrice() {
        return proPrice;
    }

    public void setProPrice(Float proPrice) {
        this.proPrice = proPrice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    @Override
    public String toString() {
        return "Collection{" +
                "proId=" + proId +
                ", userName='" + userName + '\'' +
                ", proName='" + proName + '\'' +
                ", proType='" + proType + '\'' +
                ", proPrice=" + proPrice  +'\''+
                ", id=" + id +'\''+
                ", images='" + images + '\'' +
                '}';
    }
}
