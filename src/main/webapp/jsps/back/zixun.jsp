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
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/bootstrap-table.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/layuiadmin/layui/css/layui.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/bootstrap-table.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/layuiadmin/layui/layui.js"></script>
</head>
<body>
<div class="layui-card" style="height: 97%;width: 99%;">
    <div class="layui-card-header" style="height: 6%;width: 100%;">
        <a><span style="font-size: 20px;color: #1094fa">首页</span></a>&nbsp;&nbsp;<span style="font-size: 20px">></span>&nbsp;&nbsp;
        <a><span style="font-size: 20px;color: #1094fa">在线咨询订单管理</span></a>
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
                <div class="layui-tab-item layui-show" style="height:500px;height: 100%;overflow: auto">
                    <table id="unanswered_table"></table>
                </div>
                <div class="layui-tab-item" style="height:500px;height: 100%;overflow: auto">
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
            pagination:true,//分页的开关，默认是关闭的
            sidePagination:"client",//client客户端分  server服务器
            pageList:[5,10,20],		 //设置每页几行的下拉框
            pageSize: 10, // 页面数据条数
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
                    align: 'center', // 居中显示
                    formatter: function (value, row, index) {
                        var time = changeDateFormat(value);
                        return time;
                    },
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
                        var status = row.status1;
                        var payMoney = row.payMoney;
                        var str = "";
                        if (status=="5"){
                            str+=payMoney+"";
                        }
                        if (status=="1"){
                            str+=payMoney+"";
                        }
                        return str
                    }
                },{
                    title: "退款倒计时",
                    field: '',
                    formatter: function (value, row, index) {
                        var time=null;
                        var str=0;
                        if (row.status1=="1") {
                           time=changeDateFormat(row.refundStartTime);
                            if (time!=null){
                                str=TimeDown(time);
                                var t=1;
                                //延迟一秒执行自己
                                t=setTimeout(function () {
                                    $("#unanswered_table").bootstrapTable('refresh');
                                }, 10000);
                                if (str==0){
                                    clearTimeout(t);
                                }
                                if (str==0&&row.status1=="1"){
                                    updestatus(row.orderId)
                                }
                            }
                        }
                        return str;
                    },
                    align: 'center' // 居中显示
                },{
                    title: "操作",
                    field: 'id',
                    formatter: function (value, row, index) {
                        var status = row.status1;
                        var str = "";
                        if (status=="5"){
                            str += " <button class='btn btn-primary' type='button' onclick=\"look_unanswered(\'" + row.id + "\')\">查看</button>";
                        }
                        if (status=="1") {
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
            url:"${pageContext.request.contextPath}/consul/answered_all",
            pagination:true,//分页的开关，默认是关闭的
            sidePagination:"client",//client客户端分  server服务器
            pageList:[5,10,20],		 //设置每页几行的下拉框
            pageSize: 10, // 页面数据条数
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
                    formatter: function (value, row, index) {
                        var time = changeDateFormat(value);
                        return time;
                    },
                    align: 'center' // 居中显示
                },{
                    title: "回答时间",
                    field: 'responseTime',
                    formatter: function (value, row, index) {
                        var time = changeDateFormat(value);
                        return time;
                    },
                    align: 'center' // 居中显示
                },{
                    title: "回答医生",
                    field: 'name',
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
                    formatter: function (value, row, index) {
                        var status = row.status1;
                        var payMoney = row.payMoney;
                        var str = "";
                        if (status=="1"){
                            str+=payMoney+"";
                        }
                        if (status=="5"){
                            str+=payMoney+"";
                        }
                        return str
                    },
                    align: 'center' // 居中显示
                },{
                    title: "操作",
                    field: 'id',
                    formatter: function (value, row, index) {
                        var str = "";
                        str += " <button class='btn btn-primary' type='button' onclick=\"look_answered(\'" + row.id + "\')\">查看</button>";
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
    /*查看未回答退款详情*/
    function look_unanswered(id){
        location.href="${pageContext.request.contextPath}/jsps/back/reply_details.jsp?uid="+id+"";
    }
    /*查看已回答详情*/
    function look_answered(id){
        location.href="${pageContext.request.contextPath}/jsps/back/consult_datails.jsp?uid="+id+"";
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
            alert(endDate.getTime()+"mm"+nowDate.getTime())
            return 0; //第二个大
        }
    }

    /*未回答。退款*/
    function updestatus(id) {
        if (id){
            $.ajax({
                type : 'post',
                data : {id:id},
                url : '${pageContext.request.contextPath }/consul/updestatus',
                dataType : 'json',
                success : function(data) {
                    if (data) {
                        unanswered_all();
                    } else {

                    }
                }
            });
        }
    }
    //修改——转换日期格式(时间戳转换为datetime格式)
    function changeDateFormat(cellval) {
        if (cellval != null) {
            var d = new Date(cellval);
            var times=d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds();
            return times;
        } else {
            return cellval;
        }
    }
</script>

</html>
