<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/10
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/jsps/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/layuiadmin/layui/css/layui.css">
<script src="${pageContext.request.contextPath }/static/layuiadmin/layui/layui.all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/layuiadmin/layui/layui.js"></script>
<html>
<head>
    <title>预约挂号订单管理</title>
</head>
<body>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
            首页  >  预约挂号订单管理
        </h3>
    </div>
    <div class="panel-body">
        <div style="height: 500px">
            <table id="appointment_register_table" >

            </table>
        </div>

    </div>
</div>
</body>
<script>
    $(function () {
        billQuery_find();
    })
    //查看订单
    function billQuery_find() {
        $('#appointment_register_table').bootstrapTable('destroy');
        $("#appointment_register_table").bootstrapTable({
            url:"/reservation/find_reservation",//请求的路径
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
                    field: 'patientName',
                    title: '就诊人'
                }, {
                    field: 'patientMedicalcardnumber',
                    title: '就诊卡号'
                }, {
                    field: 'orderNum',
                    title: '订单号'
                }, {
                    field: 'patientTel',
                    title: '手机号'
                }, {
                    field: '',
                    title: '挂号时间',
                    formatter:function(value,row,index){
                        return row.appointmentTime+row.timeframe
                    }
                }, {
                    field: 'doctorName',
                    title: '医生',
                }, {
                    field: 'payMoney',
                    title: '金额',
                }, {
                    field: 'orderStatus',
                    title: '订单状态',
                }, {
                    field: '',
                    title: '订单操作',
                    formatter: function (value, row,index) {
                        var str="";
                        str+="<button onclick='picture_find("+row.id+")' title='查看' class='layui-btn layui-btn-normal'>审核</button>"
                        return str

                    }
                }
            ]
        })
    }
</script>
</html>
