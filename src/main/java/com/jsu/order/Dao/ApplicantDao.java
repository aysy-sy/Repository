package com.jsu.order.Dao;

import com.jsu.order.bean.Applicant;
import com.jsu.order.utils.DBUtils;

public class ApplicantDao {
    //保存用户信息
    public boolean saveApplicant(Applicant applicant) throws Exception {
        String sql="insert into user(Account,passWord,identity)" +
                "values(?,?,?)";
        return DBUtils.save(sql,applicant.getAccount(),applicant.getPassWord(),applicant.getIdentity());
    }
    //修改客户信息
    public boolean  updatePerson(Applicant applicant) throws Exception {
        String sql="update user set userName=?,phone=?,address=? where Account=?";
        return DBUtils.updatePersonal(sql,applicant.getAccount(),applicant.getUserName(),applicant.getAddress(),applicant.getPhone());
    }
    //修改密码
    public boolean updatePwd(Applicant applicant)throws Exception{
        String sql="update user set passWord=? where Account=?";
        return DBUtils.updatePwd(sql,applicant.getNewpwd(),applicant.getAccount());
    }

    //根据email和password查询用户
    public boolean getApplicantByAccountAndPass(String applicantAccount, String applicantPwd) throws Exception {
        String sql="select Account,passWord,identity from user where Account=? and passWord=? ";
        return DBUtils.CheckLogin(sql,applicantAccount,applicantPwd);
    }
    //根据emai查询用户身份
    public static String getIdentity(String account) throws Exception{
        String sql="select identity from user where Account=?";
        return DBUtils.getIdentity(sql,account);
    }
    //查看是否有重复
    public Integer selectApplicantAccountCount(String applicantAccount) throws Exception {
        String sql="select count(*) from user where Account=?";
        Integer count = DBUtils.getCount(sql,applicantAccount);
        return count;
    }
}
