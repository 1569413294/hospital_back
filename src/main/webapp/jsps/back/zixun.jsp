<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/9
  Time: 13:36
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
<body>
<div class="layui-card" style="height: 97%;width: 99%;">
    <div class="layui-card-header" style="height: 6%;width: 100%;">
        <a><span style="font-size: 20px">首页</span></a>&nbsp;&nbsp;<span style="font-size: 20px">></span>&nbsp;&nbsp;<a><span style="font-size: 20px">在线咨询订单管理</span></a>
    </div>
    <div class="layui-card-body" style="height: 80%;width: 100%;">
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-tab-title">
                <li class="layui-this">
                    未回答
                </li>
                <li>已回答</li>
            </ul>
            <div class="layui-tab-content" style="overflow: auto">
                <div class="layui-tab-item layui-show">
                    <table id="unanswered_table"></table>
                </div>
                <div class="layui-tab-item">
                    <table id="answered_table"></table>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript">

    $(function () {
        unanswered_all();
        answered_all();
    })
    /*未回答*/
    function unanswered_all() {
        $("#unanswered_table").bootstrapTable('destroy');
        $("#unanswered_table").bootstrapTable({ // 对应table标签的id
            url:"${pageContext.request.contextPath}/consul/unanswered_all",
            sidePagination:"client",//client客户端分  server服务器
            pagination: true, // 在表格底部显示分页组件，默认false
            pageList: [5, 10, 15, 20], // 设置页面可以显示的数据条数
            pageSize: 5, // 页面数据条数
            sortName: 'id', // 要排序的字段
            pageNumber: 1, // 首页页码
            columns: [
                {
                    align:'center',
                    field:'id',
                    title:'序号',
                    formatter:function(value,row,index){
                        return index+1
                    }
                },
                {
                    title: "订单号",
                    field: 'orderNum',
                    align: 'center' // 居中显示
                },
                {
                    title: "问题",
                    field: 'questionTitle',
                    align: 'center' // 居中显示
                },
                {
                    title: "提问时间",
                    field: 'createtime',
                    align: 'center' // 居中显示
                },
                {
                    title: "署名医生",
                    field: 'name',
                    align: 'center' // 居中显示
                },
                {
                    title: "已支付金额",
                    field: 'payMoney',
                    align: 'center', // 居中显示
                    formatter:function(value,row,index){
                        var status = row.paymentStatus;
                        var payMoney = row.payMoney;
                        var str = "";
                        if (status=="0"){
                            str+=payMoney+"";
                        }
                        return str
                    }
                },{
                    title: "退款倒计时",
                    field: '',
                    formatter: function (value, row, index) {
                        var str="";
                        if (row.refundStartTime!=null){
                            str=TimeDown(row.refundStartTime);
                            //延迟一秒执行自己
                            setTimeout(function () {
                                $("#unanswered_table").bootstrapTable('refresh');
                            }, 10000)
                        }
                        return str;
                    },
                    align: 'center' // 居中显示
                },{
                    title: "操作",
                    field: 'id',
                    formatter: function (value, row, index) {
                        var status = row.paymentStatus;
                        var str = "";
                        if (status=="2"){
                            str += " <button class='btn btn-primary' type='button' onclick=\"fabu(\'" + row.id + "\')\">查看</button>";
                        }
                        if (status=="0") {
                            str += " <button class='btn btn-primary' type='button' onclick=\"answered(\'" + row.id + "\')\">回答</button>";
                        }
                        return str;
                    },
                    align: 'center' // 居中显示
                }
            ]
        })
    }
    /*已回答*/
    function answered_all() {
        $("#answered_table").bootstrapTable('destroy');
        $("#answered_table").bootstrapTable({ // 对应table标签的id
            url:"${pageContext.request.contextPath}/rent/findErAll",
            sidePagination:"client",//client客户端分  server服务器
            pagination: true, // 在表格底部显示分页组件，默认false
            pageList: [5, 10, 15, 20], // 设置页面可以显示的数据条数
            pageSize: 5, // 页面数据条数
            sortName: 'id', // 要排序的字段
            pageNumber: 1, // 首页页码
            columns: [
                {
                    align:'center',
                    field:'',
                    title:'序号',
                    formatter:function(value,row,index){
                        return index+1
                    }
                },
                {
                    title: "订单号",
                    field: '',
                    align: 'center' // 居中显示
                },
                {
                    title: "问题",
                    field: '',
                    align: 'center' // 居中显示
                },
                {
                    title: "提问时间",
                    field: '',
                    align: 'center' // 居中显示
                },{
                    title: "回答时间",
                    field: '',
                    align: 'center' // 居中显示
                },
                {
                    title: "署名医生",
                    field: '',
                    align: 'center' // 居中显示
                },
                {
                    title: "已支付金额",
                    field: '',
                    align: 'center' // 居中显示
                },{
                    title: "操作",
                    field: 'id',
                    formatter: function (value, row, index) {
                        var status = row.status;
                        var str = "";
                        if(status=="unreleased"){
                            str += " <button class='btn btn-primary' type='button' onclick=\"fabu(\'" + row.id + "\')\">查看</button>";
                        }else {

                        }
                        return str;
                    },
                    align: 'center' // 居中显示
                }
            ]
        })
    }
    /*回答*/
    function answered(id){
        location.href="${pageContext.request.contextPath}/jsps/back/consul_reply.jsp?uid="+id+"";
    }
    layui.use('element', function(){
        $('.site-demo-active').on('click', function(){
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });
    });

    //倒计时
    function TimeDown(endDateStr) {
        //结束时间
        var endDate = new Date(endDateStr);
        //当前时间
        var nowDate = new Date();
        if(endDate.getTime() >= nowDate.getTime()){
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
            return  days + "天" + hours + "：" + minutes + "：" + seconds;
        } else {
            return 0; //第二个大
        }
    }


</script>

</html>
