package com.jsu.order.utils;

import java.util.Random;

public class JudgeCode {
    public String  makeCode(){
        String str="QWERTYPADFGHLBNM123456789qwertypadfghjkbnm";
        String SystemCode=null;
        Random random = new Random();
        for (int i = 1; i <= 4; i++) {
            int nextInt = random.nextInt(str.length());
            //获取字符
            char charAt = str.charAt(nextInt);//随机字符
            SystemCode+=charAt;
        }
        return SystemCode;
    }
    public boolean equals(String code,String systemCode) {

        if(code.equals(systemCode)){
            return true;
        }else{
            return false;
        }
        /*if(("admin").equals(loginName) && ("1234").equals(loginPwd)&&validCode.equals(verification)) {
            //如果登录成功，则重定向到/Charles/Main
            response.sendRedirect("/Charles/Main");
        }
        else {
            //如果登录失败，则重定向到/Charles/Login
            response.sendRedirect("/Charles/Login");
        }*/

    }
}
