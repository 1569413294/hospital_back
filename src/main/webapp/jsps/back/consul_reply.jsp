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
<div class="layui-card" style="height: 97%;width: 99%;">
    <div class="layui-card-header" style="height: 6%;width: 100%;">
        <a><span style="font-size: 20px;color: #1094fa">首页</span></a>
        &nbsp;&nbsp;<span style="font-size: 20px">></span>&nbsp;&nbsp;
        <a href="${pageContext.request.contextPath}/jsps/back/zixun.jsp"><span style="font-size: 20px;color: #1094fa">在线咨询订单管理</span></a>
        &nbsp;&nbsp;<span style="font-size: 20px;">></span>&nbsp;&nbsp;
        <a><span style="font-size: 20px;color: #1094fa">回答</span></a>
    </div>
    <div class="layui-card-body" style="height: 94%;width: 100%;overflow: auto">
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
            <div class="layui-row">
                <div class="layui-col-xs2">
                    <div class="grid-demo grid-demo-bg1">
                        <span style="font-size: 20px;color: #847be3">退款倒计时</span>
                    </div>
                </div>
                <div class="layui-col-xs10">
                    <div class="grid-demo">
                        <span style="font-size: 15px;" id="refundStartTime"></span>
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
                        <textarea id="response" cols="100" rows="20" style="border-radius: 10px;background-color: #eeeeee"></textarea>
                    </div>
                </div>
            </div>
            <div class="layui-row">
                <div class="layui-col-xs6">
                    <div class="grid-demo grid-demo-bg1">
                        <button type="button" class="layui-btn layui-btn-normal" onclick="answered_tj()">提交回答</button>
                    </div>
                </div>
                <div class="layui-col-xs6">
                    <div class="grid-demo">
                        <button type="button" class="layui-btn layui-btn-normal" onclick="xiayitiao()">暂不回答，看下一条</button>
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
                url : '${pageContext.request.contextPath }/consul/answered_xq',
                dataType : 'json',
                success : function(data) {
                    if (data.id) {
                        $("#id").val(data.id);
                        $("#orderNum").html(data.orderNum);
                        $("#questionTitle").html(data.questionTitle);
                        $("#illnessDescription").html(data.illnessDescription);
                        $("#payMoney").html("￥"+data.payMoney);
                        if (data.refundStartTime!=null){
                            TimeDown('refundStartTime',data.refundStartTime)
                        }else {
                           $("#refundStartTime").hide();
                        }
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

    function TimeDown(id, endDateStr) {
            //结束时间
            var endDate = new Date(endDateStr);
            //当前时间
            var nowDate = new Date();
            if(endDateStr!=null&&endDate.getTime() >= nowDate.getTime()){
            //相差的总秒数
            var totalSeconds = parseInt((endDate - nowDate) / 1000);
            //天数
            var days = Math.floor(totalSeconds / (60 * 60 * 24));
            //取模（余数）
            var modulo = totalSeconds % (60 * 60 * 24);
            //小时数
            var hours = Math.floor(modulo / (60 * 60));
            modulo = modulo % (60 * 60);
            //分钟
            var minutes = Math.floor(modulo / 60);
            //秒
            var seconds = modulo % 60;
            //输出到页面
            document.getElementById(id).innerHTML = days + "天" + hours + "：" + minutes + "：" + seconds;
            //延迟一秒执行自己
            setTimeout(function () {
                TimeDown(id, endDateStr);
            }, 1000)
        }else {
                document.getElementById(id).innerHTML =" ";
            }
    }
    //下一条
    function xiayitiao() {
        var id=$("#id").val();
        answered(id,2);
    }
    //提交回答
    function answered_tj() {
        var response=$("#response").val();
        var id=$("#id").val();
        if(response){
            $.ajax({
                type : 'post',
                data : {id:id,response:response},
                url : '${pageContext.request.contextPath }/consul/answered_hd',
                dataType : 'json',
                success : function(data) {
                    if (data) {
                        $("#response").val("");
                        alert("回答成功！")
                        answered(id,2);
                    } else{
                        alert("失败");
                    }
                }
            });
        }else{
            alert("回答内容为空！")
        }
    }
</script>
</html>
