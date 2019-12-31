<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/10
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/jsps/common/header.jsp"></jsp:include>

<link rel="stylesheet" href="${pageContext.request.contextPath }/static/layuiadmin/layui/css/layui.css">
<script src="${pageContext.request.contextPath }/static/layuiadmin/layui/layui.all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/layuiadmin/layui/layui.js"></script>



<html>
<head>
    <title>账单查询</title>
</head>
<style>
    .td1{
        width: 150px;
        height: 50px;
        text-align: center;
    }
    .select_orderItem{
        width: 100%;
        padding-left: 10px;
        height: 38px;
        border-color: #e6e6e6;
    }
    td {
        height: 30px;
    }
</style>
<body>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
            首页  >  账单查询
        </h3>
    </div>
    <div class="panel-body">
        <form id="order_form">
            <table align="center">
                <tr>
                    <td class="td1">支付开始时间：</td>
                    <td><input readonly name="payStartTime" id="text1"  placeholder="请输入支付开始时间"  class="layui-input"></td>
                    <td class="td1">退款开始时间：</td>
                    <td><input readonly  name="refundStartTime"  id="text2"   placeholder="请输入退款开始时间"  class="layui-input"></td>
                    <td class="td1"><button onclick="billQuery_onclick()" type="button" class="layui-btn layui-btn-radius layui-btn-normal">查询</button></td>
                </tr>
                <tr>
                    <td class="td1">支付结束时间：</td>
                    <td><input readonly  name="payStartTime2"   id="text3" placeholder="请输入标题"  class="layui-input"></td>
                    <td class="td1">退款结束时间：</td>
                    <td><input readonly  name="refundStartTime2"  id="text4"  placeholder="请输入标题"  class="layui-input"></td>
                </tr>
                <tr>
                    <td class="td1">订单项目：</td>
                    <td>
                        <select name="orderName" lay-verify="required" class="select_orderItem">
                            <option value="">--请选择--</option>
                            <option value="预约挂号">预约挂号</option>
                            <option value="在线咨询">在线咨询</option>
                            <option value="门诊缴费">门诊缴费</option>
                            <option value="就诊卡充值">就诊卡充值</option>
                        </select>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<div style="margin-left:1100px">
    <button onclick="order_excel()" class="layui-btn layui-btn-primary">
        导出excel
    </button>
</div>
<div style="height: 10px;"></div>
<table id="billQuery_table">
</table>
</body>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

//执行一个laydate实例
        laydate.render({
            elem: '#text1'//指定元素，
            //format:'yyyy-MM-dd HH:mm:ss'
        });
        laydate.render({
            elem: '#text2'//指定元素，
            //format:'yyyy-MM-dd HH:mm:ss'
        });
        laydate.render({
            elem: '#text3'//指定元素，
            //format:'yyyy-MM-dd HH:mm:ss'
        });
        laydate.render({
            elem: '#text4'//指定元素，
            //format:'yyyy-MM-dd HH:mm:ss'
        });
    });



    $(function () {
        billQuery_find();
    })
    function billQuery_onclick() {
        billQuery_find();
    }
    function order_excel() {
        $.ajax({
            url:"/reservation/outExecel",
            type:"post",
            dataType:"json",
            data:$("#order_form").serialize(),
            success:function (data) {
                alert(data);
            }
        })
    }
    //查看订单
    function billQuery_find() {
        $('#billQuery_table').bootstrapTable('destroy');
        $("#billQuery_table").bootstrapTable({
            url:"/reservation/find_hisOrder?"+$("#order_form").serialize(),//请求的路径
            pagination:true,//分页的开关，默认是关闭的
            sidePagination:"client",//client客户端分  server服务器
            pageNumber:1,//分页起始行，默认第一行
            pageList:[5,10,15 ,20],//设置每页几行的下拉框
            pageSize:10,
            columns: [//field对应的是entity中的属性  title:列名
                {
                    field: '', // 返回json数据中的name
                    title: '序号',// 表格表头显示文字
                    formatter:function(value,row,index){
                        return index+1
                    }

                }, {
                    field: 'orderName',
                    title: '订单名称'
                }, {
                    field: 'orderNum',
                    title: '订单号'
                }, {
                    field: 'medicalCardNumber',
                    title: '就诊卡号/手机号'
                }, {
                    field: 'payStartTime',
                    title: '支付时间'
                }, {
                    field: 'refundStartTime',
                    title: '退款时间'
                }, {
                    field: 'payMoney',
                    title: '支付金额',
                }, {
                    field: '',
                    title: '退款金额',
                    formatter:function(value,row,index){
                        if(row.status==5){
                            return row.payMoney
                        }
                    }
                }, {
                    field: 'status',
                    title: '订单状态',
                    formatter:function(value,row,index){
                        if(row.status==0){
                            return '未支付'
                        }
                        if(row.status==1){
                            return '已支付'
                        }
                        if(row.status==2){
                            return '未到诊'
                        }
                        if(row.status==3){
                            return '已到诊'
                        }
                        if(row.status==4){
                            return '已取消'
                        }
                        if(row.status==5){
                            return '已退款'
                        }
                    }
                }
            ]
        })
    }
</script>
</html>
