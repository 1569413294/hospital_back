<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/10
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="${pageContext.request.contextPath }/static/js/jquery-3.2.1.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/table/bootstrap-table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap-tab.css">

<script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap-closable-tab.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap/js/closable-tab-div.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap/table/bootstrap-table.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap-table-zh-CN.min.js"></script>


<link rel="stylesheet" href="${pageContext.request.contextPath }/static/layui/css/layui.css">

<script src="${pageContext.request.contextPath }/static/layui/layui.all.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/layui/layui.js"></script>

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
</style>
<body>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
            首页  >  账单查询
        </h3>
    </div>
    <div class="panel-body">
        <form>
            <table align="center">
                <tr>
                    <td class="td1">支付开始时间：</td>
                    <td><input type="text" name="title" required lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input"></td>
                    <td class="td1">退款开始时间：</td>
                    <td><input type="text" name="title" required lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input"></td>
                    <td class="td1"><button class="layui-btn layui-btn-radius layui-btn-normal">查询</button></td>
                </tr>
                <tr>
                    <td class="td1">支付结束时间：</td>
                    <td><input type="text" name="title" required lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input"></td>
                    <td class="td1">退款结束时间：</td>
                    <td><input type="text" name="title" required lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input"></td>
                </tr>
                <tr>
                    <td class="td1">订单项目：</td>
                    <td>
                        <select name="city" lay-verify="required" class="select_orderItem">
                            <option value="">请选择一个城市</option>
                            <option value="010">北京</option>
                            <option value="021">上海</option>
                            <option value="0571">杭州</option>
                        </select>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
  <table id="billQuery_table">
  </table>
</body>
<script>
    $(function () {
        billQuery_find();
    })
    //查看订单
    function billQuery_find() {
        $('#billQuery_table').bootstrapTable('destroy');
        $("#billQuery_table").bootstrapTable({
            //url:"/housing/Housinglibrary_find?housingType="+housingType+"&way="+way+"&userName="+userName,//请求的路径
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
                    field: 'housingName',
                    title: '订单名称'
                }, {
                    field: 'housingType',
                    title: '订单号'
                }, {
                    field: 'address',
                    title: '就诊卡号/手机号'
                }, {
                    field: 'realname',
                    title: '支付时间'
                }, {
                    field: 'phone',
                    title: '退款时间'
                }, {
                    field: 'way',
                    title: '支付金额',
                }, {
                    field: 'way',
                    title: '退款金额',
                }, {
                    field: 'way',
                    title: '订单状态',
                    formatter:function(value,row,index){
                        if(value=='zu'){
                            return '出租'
                        }
                        if(value=='mai'){
                            return '售卖'
                        }
                    }
                }, {
                    field: '',
                    title: '订单操作',
                    formatter: function (value, row,index) {
                        var str="";
                        str+="<button onclick='picture_find("+row.id+")' title='审核' class='layui-btn layui-btn-normal'>审核</button>"
                        return str

                    }
                }
            ]
        })
    }
</script>
</html>
