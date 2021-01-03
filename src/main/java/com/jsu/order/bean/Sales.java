package com.jsu.order.bean;

import java.util.Date;

public class Sales {
    private int sid;// 销售编号
    private String sname;// 产品名称
    private int squantity;// 产品数量
    private String sdate;// 产品日期
    public int getSid() {
        return sid;
    }
    public void setSid(int sid) {
        this.sid = sid;
    }
    public int getSquantity() {
        return squantity;
    }
    public void setSquantity(int squantity) {
        this.squantity = squantity;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getSdate() {
        return sdate;
    }

    public void setSdate(String sdate) {
        this.sdate = sdate;
    }

    public Sales() {
    }

    public Sales(int sid, String sname, int squantity, String sdate) {
        this.sid = sid;
        this.sname = sname;
        this.squantity = squantity;
        this.sdate = sdate;
    }

    @Override
    public String toString() {
        return "Sales{" +
                "sid=" + sid +
                ", sname='" + sname + '\'' +
                ", squantity=" + squantity +
                ", sdate='" + sdate + '\'' +
                '}';
    }
}
