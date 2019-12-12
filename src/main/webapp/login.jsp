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
        .phone,.btn {
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
        .messageCode{
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
    </style>
</head>
<body >


<div class="logo-box">
    <div class="login" style="">
        <div class="bxs-row" style="text-align:center;">
            <img id="logo" src="${pct}/static/images/logo.jpg" style="width:72px;"><span class="tips" style="color:red;">用户请登录</span>
        </div>
        <div class="bxs-row">
            <input type="text" class="phone" placeholder="手机号" value="">
            <p class="err err-phone"></p>
        </div>
        <div class="bxs-row">
            <input type="text" class="messageCode" placeholder="验证码">
            <input type="button" class="fsyzm" value="点击获取">
            <p class="err err-messageCode"></p>
        </div>
        <div class="bxs-row">
            <input type="submit" class="submit btn" value="登录">
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
            alert('执行登录函数');
            $(".login").css({
                "left":"0",
                "opacity":"1"
            });
            $(".verBox").css({
                "left":"404px",
                "opacity":"0"
            });
            $(".tips").html('你是不是不知道账号密码！？？？');
            $("#logo").attr("src",'/static/images/login-err.png')
        },
        error:function () {
            //alert('错误什么都不执行')
        }
    });
    $(".submit").on('click',function () {
        if($(".phone").val() == '') {
            $(".tips").html('老兄！！你用户名呢！？？？');
            $("#logo").attr("src",'/static/images/null-password.jpg')
        } else if($(".messageCode").val() == '') {
            $(".tips").html('老兄！！你密码呢！？？？');
            $("#logo").attr("src",'/static/images/null-password.jpg')
        } else {
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
</script>

</body>
</html>
