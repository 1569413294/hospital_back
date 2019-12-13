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
    <div class="layui-card-body">
        <table id="wenzhangList" lay-filter="wenzhangList"></table>
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

    layui.config({
        base: '/static/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'table'], function(){
        var admin = layui.admin
            ,table = layui.table;

        table.render({
        elem: '#wenzhangList',
        url : '',
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limits : [10,15,20,25],
        limit : 10,
        id : "wenzhangListTable",
        cols : [[
            {type: "checkbox", fixed:"left", width:50},
            {field: 'userName', title: '用户名', minWidth:100, align:"center"},
            {field: 'userEmail', title: '用户邮箱', minWidth:200, align:'center',templet:function(d){
                    return '<a class="layui-blue" href="mailto:'+d.userEmail+'">'+d.userEmail+'</a>';
                }},
            {field: 'userSex', title: '用户性别', align:'center'},
            {field: 'userStatus', title: '用户状态',  align:'center',templet:function(d){
                    return  d.userStatus == '0' ? "正常使用":"<span class='layui-red'>限制使用</span>";
                }},
            {field: 'userGrade', title: '用户等级', align:'center'},
            {field: 'userEndTime', title: '最后登录时间', align:'center',minWidth:150},
            {title: '操作', minWidth:175, templet:'#userListBar',fixed:"right",align:"center"}
        ]]
    });
    });

</script>
</body>
</html>
