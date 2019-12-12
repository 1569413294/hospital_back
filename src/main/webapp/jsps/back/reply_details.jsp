<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/10
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/static/layuiadmin/layui/css/layui.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/bootstrap-table.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/static/layuiadmin/layui/layui.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/bootstrap-table.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/locale/bootstrap-table-zh-CN.js"></script>
</head>
<style>
    .layui-row{
        margin: 20px;
    }
</style>
<body>
<div class="layui-card" style="height: 97%;width: 97%;border: 10px;">
    <div class="layui-card-header" style="height: 6%;width: 100%;">
        <a><span style="font-size: 20px">首页</span></a>
        &nbsp;&nbsp;<span style="font-size: 20px">></span>&nbsp;&nbsp;
        <a><span style="font-size: 20px">在线咨询订单管理</span></a>
        &nbsp;&nbsp;<span style="font-size: 20px">></span>&nbsp;&nbsp;
        <a><span style="font-size: 20px">在线咨询详情</span></a>
    </div>
    <div class="layui-card-body" style="height: 94%;width: 100%;">
        <div class="layui-container">
            <div class="layui-row">
                <div class="layui-col-xs2">
                    <div class="grid-demo grid-demo-bg1">
                        <span style="font-size: 20px;color: #847be3">订单号</span>
                    </div>
                </div>
                <div class="layui-col-xs10">
                    <div class="grid-demo">
                        <span style="font-size: 15px;">111</span>
                    </div>
                </div>
            </div>
            <div class="layui-row">
                <div class="layui-col-xs2">
                    <div class="grid-demo grid-demo-bg1">
                        <span style="font-size: 20px;color: #847be3">问题标题</span>
                    </div>
                </div>
                <div class="layui-col-xs10">
                    <div class="grid-demo">
                        <span style="font-size: 15px;">555</span>
                    </div>
                </div>
            </div>
            <div class="layui-row">
                <div class="layui-col-xs2">
                    <div class="grid-demo grid-demo-bg1">
                        <span style="font-size: 20px;color: #847be3">性别</span>
                    </div>
                </div>
                <div class="layui-col-xs10">
                    <div class="grid-demo">
                        <span style="font-size: 15px;">555</span>
                    </div>
                </div>
            </div>
            <div class="layui-row">
                <div class="layui-col-xs2">
                    <div class="grid-demo grid-demo-bg1">
                        <span style="font-size: 20px;color: #847be3">病情描述</span>
                    </div>
                </div>
                <div class="layui-col-xs10">
                    <div class="grid-demo">
                        <span style="font-size: 15px;">555</span><br>
                        <span style="font-size: 15px;">555</span><br>
                        <span style="font-size: 15px;">555</span><br>
                        <span style="font-size: 15px;">555</span><br>
                    </div>
                </div>
            </div>
            <div class="layui-row">
                <div class="layui-col-xs2">
                    <div class="grid-demo grid-demo-bg1">
                        <span style="font-size: 20px;color: #847be3">已支付金额</span>
                    </div>
                </div>
                <div class="layui-col-xs10">
                    <div class="grid-demo">
                        <span style="font-size: 15px;">555</span>
                    </div>
                </div>
            </div>
            <div class="layui-row">
                <div class="layui-col-xs2">
                    <div class="grid-demo grid-demo-bg1">
                        <span style="font-size: 20px;color: #847be3">退款金额</span>
                    </div>
                </div>
                <div class="layui-col-xs10">
                    <div class="grid-demo">
                        <span style="font-size: 15px;">555</span>
                    </div>
                </div>
            </div>
            <div class="layui-row">
                <div class="layui-col-xs2">
                    <div class="grid-demo grid-demo-bg1">
                        <span style="font-size: 20px;color: #847be3">退款时间</span>
                    </div>
                </div>
                <div class="layui-col-xs10">
                    <div class="grid-demo">
                        <span style="font-size: 15px;">555</span>
                    </div>
                </div>
            </div>
            <div class="layui-row">
                <div class="layui-col-xs6" style="width: 20%">

                </div>
                <div class="layui-col-xs6">
                    <div class="grid-demo grid-demo-bg1">
                        <button type="button" class="layui-btn layui-btn-normal">下一条</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
