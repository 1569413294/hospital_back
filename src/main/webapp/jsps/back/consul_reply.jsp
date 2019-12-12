<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/9
  Time: 15:01
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
<div class="layui-card" style="height: 97%;width: 99%;">
    <div class="layui-card-header" style="height: 6%;width: 100%;">
        <a><span style="font-size: 20px">首页</span></a>
        &nbsp;&nbsp;<span style="font-size: 20px">></span>&nbsp;&nbsp;
        <a><span style="font-size: 20px">在线咨询订单管理</span></a>
        &nbsp;&nbsp;<span style="font-size: 20px">></span>&nbsp;&nbsp;
        <a><span style="font-size: 20px">回答</span></a>
    </div>
    <div class="layui-card-body" style="height: 94%;width: 100%;overflow: auto">
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
                        <span style="font-size: 15px;" id="sex">555</span>
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
                        <span style="font-size: 20px;color: #847be3">退款倒计时</span>
                    </div>
                </div>
                <div class="layui-col-xs10">
                    <div class="grid-demo">
                        <span style="font-size: 15px;">555</span>
                    </div>
                </div>
            </div>
            <div class="layui-row">
                <div class="layui-col-xs10">
                    <div class="grid-demo grid-demo-bg1">
                        <hr>
                    </div>
                </div>
            </div>
            <div class="layui-row">
                <div class="layui-col-xs2">
                    <div class="grid-demo grid-demo-bg1">
                        <span style="font-size: 20px;color: #847be3">回答</span>
                    </div>
                </div>
            </div>
            <div class="layui-row">
                <div class="layui-col-xs12">
                    <div class="grid-demo">
                        <textarea name="" id="" cols="100" rows="20" style="border-radius: 50px;background-color: #eeeeee">

                        </textarea>
                    </div>
                </div>
            </div>
            <div class="layui-row">
                <div class="layui-col-xs6">
                    <div class="grid-demo grid-demo-bg1">
                        <button type="button" class="layui-btn layui-btn-normal">提交回答</button>
                    </div>
                </div>
                <div class="layui-col-xs6">
                    <div class="grid-demo">
                        <button type="button" class="layui-btn layui-btn-normal">暂不回答，看下一条</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(function () {
        answered();
    })
    //回答详情回显
    function answered() {
        var url = location.search; //获取url中"?"符后的字串 ?vm_id=2
        var id;
        if(url.indexOf("?") != -1) {
            str = url.substr(1);
            strs = str.split("=");
            id = strs[1];
        }
        if (id){
            $.ajax({
                type : 'post',
                data : {id:id,qf:1},
                url : '${pageContext.request.contextPath }/consul/answered_xq',
                dataType : 'json',
                success : function(data) {
                    if (data) {
                        if (data.sex==2){
                            $("#sex").html("女");
                        }
                        alert("成功！！");
                    } else {
                        alert("失败！！");
                    }
                }
            });
        }
    }
</script>
</html>
