<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/10
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    pageContext.setAttribute("pct", request.getContextPath());
%>
<html>
<head>
    <title>登录页面</title>
    <link type="text/css" rel="stylesheet" href="${pct}/static/css/style.css">
    <script src="${pct}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${pct}/static/js/img_ver.js"></script>

    <style>
        body{
            background:url(/static/images/bj.jpg);
            -moz-background-size:100% 100%;
            background-size:100% 100%
        }
        .bxs-row {
            margin-bottom:12px;
        }
        .logo-box {
            width:404px;
            margin:120px auto;
            border:1px solid #e5e5e5;
            border-radius:4px;
            box-shadow:0 4px 18px rgba(0,0,0,0.2);
            position:relative;
            overflow:hidden;
            height:360px;
        }
        .login {
            position:absolute;
            width:320px;left:0;
            top:0;
            padding: 42px 42px 36px;
            transition:all 0.8s;
        }
        #phone,.btn {
            height: 44px;
            width: 100%;
            padding: 0 10px;
            border: 1px solid #9da3a6;
            background: #fff;
            text-overflow: ellipsis;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -khtml-border-radius: 4px;
            border-radius: 4px;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
            color: #000;
            font-size: 1em;
            font-family: Helvetica,Arial,sans-serif;
            font-weight: 400;
            direction: ltr;
            font-size:13px;
        }
        #messageCode{
            height: 44px;
            width: 60%;
            padding: 0 10px;
            border: 1px solid #9da3a6;
            background: #fff;
            text-overflow: ellipsis;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -khtml-border-radius: 4px;
            border-radius: 4px;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
            color: #000;
            font-size: 1em;
            font-family: Helvetica,Arial,sans-serif;
            font-weight: 400;
            direction: ltr;
            font-size:13px;
        }
        .fsyzm{

            height: 44px;
            width: 37%;
            padding: 0 10px;
            border: 1px solid #9da3a6;
            background-color: #8383D4;
            text-overflow: ellipsis;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            -khtml-border-radius: 4px;
            border-radius: 4px;
            -webkit-box-shadow: none;
            -moz-box-shadow: none;
            box-shadow: none;
            color: #000;
            font-size: 1em;
            font-family: Helvetica,Arial,sans-serif;
            font-weight: 400;
            direction: ltr;
            font-size:13px;

        }
        .submit {
            background-color: #0070ba;
            color:#fff;
            border:1px solid #0070ba;
        }
        .submit:hover {
            background-color:#005ea6;
        }
        .verBox {
            position:absolute;
            width:100%;
            text-align:center;
            left:404px;
            top:0;
            opacity:0;
            transition:all 0.8s;
            padding-top:55px;
        }
        .err {
              margin:12px 0 0;
              line-height:12px;
              height:12px;
              font-size:12px;
              color:red;
          }
        .has-error {
            border:1px solid red;
        }
        .has-success {
            border:1px solid green;
        }
    </style>
</head>
<body >


<div class="logo-box">
    <div class="login" style="">
        <div class="bxs-row" style="text-align:center;">
            <img id="logo" src="${pct}/static/images/logo.jpg" style="width:72px;"><span class="tips" style="color:red;">用户请登录</span>
        </div>
        <div class="bxs-row">
            <input type="text" id="phone" name="phone" placeholder="手机号" value="">
            <p class="err"></p>
        </div>
        <div class="bxs-row">
            <input type="text" id="messageCode" placeholder="验证码">
            <input type="button" class="fsyzm"  value="发送验证码">
            <p class="err"></p>
        </div>
        <div class="bxs-row">
            <input type="checkbox" name="auto_login"> 自动登录<br>
            <input type="button" id="btn" class="submit btn" value="登录">
        </div>
    </div>
    <div class="verBox">
        <div id="imgVer" style="display:inline-block;"></div>
    </div>
</div>
<script>
    imgVer({
        el:'$("#imgVer")',
        width:'260',
        height:'116',
        img:[
            '/static/images/ver.png',
            '/static/images/ver-1.png',
            '/static/images/ver-2.png',
            '/static/images/ver-3.png'
        ],
        success:function () {
            $(".login").css({
                "left":"0",
                "opacity":"1"
            });
            $(".verBox").css({
                "left":"404px",
                "opacity":"0"
            });

            var  phone = $("#phone").val();
            var auto_login = $("input[name='auto_login']").is(":checked");
            $.ajax({
                    type: "post",
                    url: '/user/login',
                    data:{"phone":phone,
                        "auto_login":auto_login
                    },
                    dataType: "json",
                    success: function (data) {
                        if(data){
                            window.location.href="common/index.jsp"
                        } else{
                            $(".tips").html('你是不是忘了手机号了！？？？');
                            $("#logo").attr("src",'/static/images/login-err.png')
                        }
                    },
                    error: function (res, status) {

                    }
                });



        },
        error:function () {
            //alert('错误什么都不执行')
        }
    });
    $(".submit").on('click',function () {
        if($("#phone").val() == '') {
            $(".tips").html('老兄！！你手机号呢！？？？');
            $("#logo").attr("src",'/static/images/null-password.jpg')
        } else if($("#messageCode").val() == '') {

            $(".tips").html('老兄！！你验证码呢！？？？');
            $("#logo").attr("src",'/static/images/null-password.jpg')
        } else  if($("#messageCode").hasClass("has-error")){
            $(".tips").html('老兄！！！验证码错误了！！！');
            $("#logo").attr("src",'/static/images/null-password.jpg')
        }else {
            $(".login").css({
                "left":"-404px",
                "opacity":"0"
            });
            $(".verBox").css({
                "left":"0",
                "opacity":"1"
            })
        }
    })

    $("#phone").blur(function () {
        var phone=$(this).val();
        if(!(/^1[34578]\d{9}$/.test(phone))){
            setError($(this),"手机号码有误，请重填!");
        }else{
            setOk($(this));
        }
    });

    $("#messageCode").blur(function () {
        if($("#phone").hasClass("has-error")){
            alert("请重新填写正确的手机号")
            return;
        }
            var  phone = $("#phone").val();
            var _that=$(this);
             $.ajax({
                 type:"post",
                 url:"/user/doVirifyMessage",
                 data:{
                     "messageCode":$(this).val(),
                     "phone":phone
                 },
                 dataType:"json",
                 error:function(error){
                     setError(_that,"校验失败!");
                 },success:function(data){
                     if(data){
                         setOk(_that);
                     }else{
                         setError(_that,"校验失败!");
                     }
                 }
             });


    });

    //发送短信验证码
    $(".fsyzm").on('click',function () {
        if(!$("#phone").hasClass("has-success")){
            alert("请先输入正确的手机号码！");
            return;
        }
        var phone=$("#phone").val();
        $.ajax({
            type:"post",
            url:"/user/getPhoneMsg",
            data:{"phone":phone},
            dataType:"json",
            error:function(error){
                alert("短信发送失败！");
            },success:function(data){
                if(data){
                    countdownHandler();
                    alert("短信发送成功，请查收！");
                }else{
                    alert("短信发送失败！");
                }
            }
        });
    })
    function countdownHandler() {
        var $button = $(".fsyzm");
        var number = 60;
        var countdown = function(){
            if (number == 0) {
                $button.attr("disabled",false);
                $button.val("发送验证码");
                number = 60;
                return;
            } else {
                $button.attr("disabled",true);
                $button.val(number + "秒 重新发送");
                number--;
            }
            setTimeout(countdown,1000);
        }
        setTimeout(countdown,1000);

    }


    function setOk(obj){
        if(obj.hasClass("has-error")){
            obj.removeClass("has-error");
        }
        obj.addClass("has-success");
        obj.nextAll("p").html("&nbsp;");
    };
    function setError(obj,str){
        if(obj.hasClass("has-success")){
            obj.removeClass("has-success");
        }
        obj.addClass("has-error");
        obj.nextAll("p").html(str);
    };
    var cookieName = 'cookie_juserid';
    $(function () {
        if (document.cookie.length>0){//判断cookie是否存在
            //获取cookie名称加=的索引值
            var c_start = document.cookie.indexOf(cookieName);
            if (c_start!=-1){ //说明这个cookie存在
                //获取cookie名称对应值的开始索引值
                c_start=c_start + cookieName.length+1
                //从c_start位置开始找第一个分号的索引值，也就是cookie名称对应值的结束索引值
                c_end=document.cookie.indexOf(c_start)
                //如果找不到，说明是cookie名称对应值的结束索引值就是cookie的长度
                if (c_end==-1) c_end=document.cookie.length
                //unescape() 函数可对通过 escape() 编码的字符串进行解码
                //获取cookie名称对应的值，并返回
                var cookieValue = unescape(document.cookie.substring(c_start,c_end));
                $.ajax({
                    type:"post",
                    url:"/user/auto_login",
                    data:{
                        "cookieValue":cookieValue
                    },
                    dataType:"json",
                    error:function(error){
                        alert("后台错误！");
                    },success:function(data){
                        if(data){
                            window.location.href="common/index.jsp"
                        }
                        else{
                            window.location.href="/jsps/login.jsp"
                        }
                    }
                });
            }
        }

    })
</script>

</body>
</html>
