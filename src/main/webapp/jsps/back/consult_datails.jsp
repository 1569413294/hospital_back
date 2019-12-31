<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/10
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%--图片放大css--%>
    <link href="${pageContext.request.contextPath}/static/tu_fangda/css/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/tu_fangda/css/style.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/tu_fangda/dist/zoomify.css" rel="stylesheet" />

    <link href="${pageContext.request.contextPath}/static/layuiadmin/layui/css/layui.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/bootstrap-table.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.js"></script>
    <%--图片放大js--%>
    <script src="${pageContext.request.contextPath}/static/tu_fangda/dist/zoomify.js"></script>
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
<div class="layui-card" style="height: 97%;width: 99%;border: 10px;">
    <div class="layui-card-header" style="height: 6%;width: 100%;">
        <a><span style="font-size: 20px;color: #1094fa">首页</span></a>
        &nbsp;&nbsp;<span style="font-size: 20px">></span>&nbsp;&nbsp;
        <a href="${pageContext.request.contextPath}/jsps/back/zixun.jsp"><span style="font-size: 20px;color: #1094fa">咨询管理</span></a>
        &nbsp;&nbsp;<span style="font-size: 20px">></span>&nbsp;&nbsp;
        <a><span style="font-size: 20px;color: #1094fa">咨询详情</span></a>
    </div>
    <div class="layui-card-body" style="height: 94%;width: 100%;">
        <div class="layui-container">
            <div class="layui-row">
                <div class="layui-col-xs2">
                    <div class="grid-demo grid-demo-bg1">
                        <span style="font-size: 20px;color: #847be3">订单号</span>
                        <input type="hidden" id="id" value="">
                    </div>
                </div>
                <div class="layui-col-xs10">
                    <div class="grid-demo">
                        <span style="font-size: 15px;" id="orderNum"></span>
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
                        <span style="font-size: 15px;" id="questionTitle"></span>
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
                        <span style="font-size: 15px;" id="sex"></span>
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
                        <span style="font-size: 15px;width:400px; display:block;white-space:pre-wrap;" id="illnessDescription"></span>
                        <div class="row">
                            <div class="example col-xs-3 col-md-3">
                                <p><img src="${pageContext.request.contextPath}/static/image/4.jpg" class="img-rounded" alt=""></p>
                            </div>
                            <div class="example col-xs-3 col-md-3">
                                <p><img src="${pageContext.request.contextPath}/static/image/5.jpg" class="img-rounded" alt=""></p>
                            </div>
                            <div class="example col-xs-3 col-md-3">
                                <p><img src="${pageContext.request.contextPath}/static/image/6.jpg" class="img-rounded" alt=""></p>
                            </div>
                            <div class="example col-xs-3 col-md-3">
                                <p><img src="${pageContext.request.contextPath}/static/image/7.jpg" class="img-rounded" alt=""></p>
                            </div>
                        </div>
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
                        <span style="font-size: 15px;" id="payMoney"></span>
                    </div>
                </div>
            </div>
            <div class="layui-row" id="payWay_show">
                <div class="layui-col-xs2">
                    <div class="grid-demo grid-demo-bg1">
                        <span style="font-size: 20px;color: #847be3">支付方式</span>
                    </div>
                </div>
                <div class="layui-col-xs10">
                    <div class="grid-demo">
                        <span style="font-size: 15px;" id="payWay"></span>
                    </div>
                </div>
            </div>
            <div class="layui-row">
                <div class="layui-col-xs2">
                    <div class="grid-demo grid-demo-bg1">
                        <span style="font-size: 20px;color: #847be3">回答医生</span>
                    </div>
                </div>
                <div class="layui-col-xs10">
                    <div class="grid-demo">
                        <span style="font-size: 15px;" id="name1"></span>
                    </div>
                </div>
            </div>
            <div class="layui-row">
                <div class="layui-col-xs2">
                    <div class="grid-demo grid-demo-bg1">
                        <span style="font-size: 20px;color: #847be3">署名医生</span>
                    </div>
                </div>
                <div class="layui-col-xs10">
                    <div class="grid-demo">
                        <span style="font-size: 15px;" id="name"></span>
                    </div>
                </div>
            </div>
            <div class="layui-row">
                <div class="layui-col-xs2">
                    <div class="grid-demo grid-demo-bg1">
                        <span style="font-size: 20px;color: #847be3">回答</span>
                    </div>
                </div>
                <div class="layui-col-xs10">
                    <div class="grid-demo">
                        <span style="font-size: 15px;" id="response"></span>
                    </div>
                </div>
            </div>
            <div class="layui-row">
                <div class="layui-col-xs6" style="width: 20%">

                </div>
                <div class="layui-col-xs6">
                    <div class="grid-demo grid-demo-bg1">
                        <button type="button" class="layui-btn layui-btn-normal" onclick="xiayitiao()">下一条</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(function () {
        var url = location.search; //获取url中"?"符后的字串 ?vm_id=2
        var id;
        if(url.indexOf("?") != -1) {
            str = url.substr(1);
            strs = str.split("=");
            id = strs[1];
        }
        answered(id,1);
    })
    //图片放大
    $('.example img').zoomify();
    //回答详情回显
    function answered(id,qf) {
        if (id){
            $.ajax({
                type : 'post',
                data : {id:id,qf:qf},
                url : '${pageContext.request.contextPath }/consul/yi_answered_xq',
                dataType : 'json',
                success : function(data) {
                    if (data.id) {
                        $("#id").val(data.id);
                        $("#orderNum").html(data.orderNum);
                        $("#questionTitle").html(data.questionTitle);
                        $("#illnessDescription").html(data.illnessDescription);
                        $("#payMoney").html("￥"+data.payMoney);
                        if (data.payMoney==null||data.payMoney==""||data.payMoney==0) {
                            $("#payWay_show").hide();
                        }else{
                            $("#payWay").html(data.payWay);
                        }
                        $("#name1").html(data.name1);
                        $("#name").html(data.name);
                        $("#response").html(data.response);

                        if (data.sex==2){
                            $("#sex").html("女");
                        }else if (data.sex==1) {
                            $("#sex").html("男");
                        }
                    } else {
                        alert("没有下一条了！！");
                    }
                }
            });
        }
    }

    //下一条
    function xiayitiao() {
        var id=$("#id").val();
        answered(id,2);
    }

</script>
</html>

