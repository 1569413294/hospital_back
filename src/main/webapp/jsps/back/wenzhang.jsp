<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/12
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<html>
<head>
    <title>文章管理</title>
</head>
<body>
<div class="layui-card">
    <div class="layui-card-header">
         <span class="layui-breadcrumb" lay-separator=" > " lay-filter="breadcrumb">
              <a href="javascript:;">首页</a>
              <a href="javascript:;">文章内容管理</a>
         </span>
    </div>
</div>

<script>
    layui.config({
        base: '/static/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index'], function(){
        var $ = layui.$
            ,admin = layui.admin
            ,element = layui.element;

        element.render('nav', 'component-nav');
        element.render('nav', 'component-nav-active');

        element.on('nav(component-nav-active)', function(elem){
            layer.msg(elem.text());
        });
    });
</script>
</body>
</html>
