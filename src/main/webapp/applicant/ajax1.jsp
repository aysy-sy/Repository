<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<html>
<head>
    <style>
        .tips{
            color:red;
        }
    </style>
    <script type="text/javascript" src="../js/my.js"></script>
    <script type="text/javascript">
        function check_username(){
            //获得ajax对象
            var xhr = getXhr();
            //使用ajax对象发请求
            xhr.open('get',
                'check_username.do?applicantAccount='
                +$F('email'),true);
            xhr.onreadystatechange=function(){
                //只有readyState等于4，才能获得
                //服务器返回的所有数据。
                if(xhr.readyState == 4){
                    //判断服务器返回的数据是否正确
                    if(xhr.status == 200){
                        var txt = xhr.responseText;
                        $('username_msg').innerHTML = txt;
                    }else{
                        $('username_msg').innerHTML = '验证出错';
                    }
                }
            };
            $('username_msg').innerHTML = '正在验证...';
            xhr.send(null);
        }
    </script>
</head>
<body style="font-size:30px;font-style:italic;">
<form action="regist.do" method="post">
    <fieldset>
        <legend>注册</legend>
        用户名:<input id="applicantAccount" name="applicantAccount"
                   onblur="check_username();"/>
        <span class="tips" id="username_msg"></span>
        <br/>
        真实姓名:<input name="name"/><br/>

        <br/>
        <img src="checkcode"
             onclick="this.src='checkcode?' + Math.random();"/><br/>
        <input type="submit" value="提交"/>
    </fieldset>
</form>
</body>
</html>