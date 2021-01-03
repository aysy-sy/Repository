package com.jsu.order.bean;

public class Applicant {
    String userName;
    String Account;
    String passWord;
    String phone;
    String address;
    String identity;
    String newpwd;

    public Applicant() {
    }

    public Applicant(String Account, String passWord, String identity) {
        this.Account = Account;
        this.passWord = passWord;
        this.identity = identity;
    }

    public Applicant(String account, String passWord) {
        Account = account;
        this.passWord = passWord;
    }

    public Applicant(String userName, String Account, String passWord, String phone, String address, String newpwd) {
        this.userName = userName;
        this.Account = Account;
        this.passWord = passWord;
        this.phone = phone;
        this.address = address;
        this.newpwd = newpwd;
    }


    public Applicant(String userName, String Account, String phone, String address, String identity) {
        this.userName = userName;
        this.Account = Account;
        this.phone = phone;
        this.address = address;
        this.identity = identity;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getAccount() {
        return Account;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setAccount(String account) {
        Account = account;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    public String getNewpwd() {
        return newpwd;
    }

    public void setNewpwd(String newpwd) {
        this.newpwd = newpwd;
    }

    public Applicant(String userName, String account, String passWord, String phone, String address, String identity, String newpwd) {
        this.userName = userName;
        Account = account;
        this.passWord = passWord;
        this.phone = phone;
        this.address = address;
        this.identity = identity;
        this.newpwd = newpwd;
    }
}

