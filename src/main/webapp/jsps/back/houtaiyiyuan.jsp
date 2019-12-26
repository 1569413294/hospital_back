<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/11
  Time: 8:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pct }/static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pct }/static/bootstrap/css/bootstrap-table.css">
<script src="${pageContext.request.contextPath}/static/bootstrap/js/jquery-2.2.1.min.js"></script>
<script src="${pct}/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${pct}/static/bootstrap/js/bootstrap-table.js"></script>
<script src="${pct}/static/bootstrap/js/bootstrap-table-zh-CN.min.js"></script>
<html>
<head>
    <style>
        input{
            /* 首先要将input输入框的默认样式去掉*/
            -web-kit-appearance:none;
            -moz-appearance: none;
            /*然后我们加上边框和圆角，并设置input的高度和字体大小和颜色    */
            font-size:1.2em;
            height:2.5em;  /*高度*/
            border-radius:50px;  /*圆角*/
            border:1px solid #c8cccf;/*边框*/
            color:#6a6f77;
            /*然后将input输入框的轮廓去掉：*/
            outline:0;
            /*/宽度*/
            width: 400px;
        }
    </style>
    <title>后台医院管理</title>
    <script>
        $(function () {
            $("#orderDetailTable").bootstrapTable({
                ajax : function (request) {
                    $.ajax({
                        type : "post",
                        url : "${pageContext.request.contextPath}/SecHospital/allYongHugunLi",
                        contentType: "application/json;charset=utf-8",
                        dataType:"json",
                        data:'',
                        jsonp:'callback',
                        success : function (msg) {
                            if (msg!=null){
                                request.success({
                                    row : msg
                                });
                                $('#orderDetailTable').bootstrapTable('load', msg);
                            } else {

                            }
                        },
                        error:function(){
                            alert("错误");
                        }
                    });
                },
                height: 210,
                striped: true,
                pageNumber: 1,
                pageSize: 11,
                pageList: [5, 10, 15, 20],
                sidePagination: "client",
                columns: [{
                    field: "index",
                    title: "序号",
                    align: "center",
                    width: 8,
                    formatter: function (value, row, index) {
                        //row.index=index;
                        return index + 1;
                    }
                }, {
                    field: "id",
                    title: "id",
                    align: "center"
                    /*visible: false*/
                }, {
                    field: "username",
                    title: "管理员",
                    align: "center"
                }, {
                    field: "hospitalName",
                    title: "医院全称",
                    align: "center"
                }, {
                    field: "hospitalSort",
                    title: "医院简称",
                    align: "center"
                },{
                    field: "count",
                    title: "医生数量",
                    align: "center",
                }, {
                    field: "caozuo",
                    title: "操作",
                    align: "center",
                    formatter: function (value, row, index) {
                        var str1 = "&nbsp;&nbsp;<button style='width:50px;height: 30px; ' class='btn btn-primary btn-sm' onclick='update(" + JSON.stringify(row)+ ")'>修改</button>";
                        return str1;

                    }
                }]
            });
            //医院全称的校验
            $("#hospitalName").blur(function () {
                var hospitalName=$("#hospitalName").val();
                $.ajax({
                    url:"${pageContext.request.contextPath}/SecHospital/selecthospitalName",
                    dataType:"json",
                    data:{"hospitalName":hospitalName},
                    type:"post",
                    success:function (data) {
                        if (data==false){
                            $("#yyqc").text("可行").css("color","green");
                        }else {
                            $("#yyqc").text("已经存在").css("color","red");
                        }
                    }
                })
            })
            //医院简称的校验
            $("#hospitalSort").blur(function () {
                var hospitalSort=$("#hospitalSort").val();
                $.ajax({
                    url:"${pageContext.request.contextPath}/SecHospital/selecthospitalSort",
                    dataType:"json",
                    data:{"hospitalSort":hospitalSort},
                    type:"post",
                    success:function (data) {
                        if (data==false){
                            $("#yyjc").text("可行").css("color","green");
                        }else {
                            $("#yyjc").text("已经存在").css("color","red");
                        }
                    }
                })
            })
        })


        //修改模态框
        function update(row) {
            $("#myModal1").modal("show");
            var hospitalName=  $("#hospitalName1").val(row.hospitalName);
            var hospitalSort=  $("#hospitalSort1").val(row.hospitalSort);
            $("#ids").val(row.id);
        }
        //修改医院
        function xiugai() {
            var hospitalName=  $("#hospitalName1").val();
            var hospitalSort=  $("#hospitalSort1").val();
            var id=$("#ids").val();
            $.ajax({
                url:"${pageContext.request.contextPath}/SecHospital/updateHospital",
                dataType:"json",
                type:"post",
                data:{"hospitalName":hospitalName,"hospitalSort":hospitalSort,"id":id},
                success:function (data) {
                    if (data==true){
                        //刷新
                        $('#orderDetailTable').bootstrapTable('refresh');
                        alert("修改成功");
                        $("#myModal1").modal("hide");
                    }


                }
            })
        }
        //添加医院
        function  addhospital(a) {

            var hospitalName=$("#hospitalName").val();
            alert(hospitalName);
            var hospitalSort=$("#hospitalSort").val();
            alert(hospitalSort);
            $.ajax({
                url:"${pageContext.request.contextPath}/SecHospital/addYiYuanGuanLi",
                dataType:"json",
                type:"post",
                data:{"hospitalName":hospitalName,"hospitalSort":hospitalSort},
                success:function (data) {
                    if (data==true){
                        //刷新
                        $('#orderDetailTable').bootstrapTable('refresh');
                        alert("添加成功");
                        $("#myModal").modal("hide");
                    }
                }
            })
        }

    </script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3 class="text-info text-left">
                <h5>后台管理-首页</h5>
                <h2>管理平台</h2>
                <h4>首页--后台管理--医院管理</h4>
            </h3>
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <!-- 按钮触发模态框 -->
                    <button type="button"  class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">添加医院</button>
                    <button type="button"  class="btn btn-primary btn-lg" >导出医院</button>
                    <!--用户列表-->
                    <table id="orderDetailTable"></table>

                </div>
            </div>
        </div>
    </div>
</div>
<!--添加/修改医院模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加医院模态框</h4>
            </div>
            <div class="modal-body">
                <table>
                    <b>
                        <tr>
                            <td>
                                <span>医院全称：</span>&nbsp;&nbsp;&nbsp;
                                <input style="outline:0;" type="text" id="hospitalName" name="">
                                <span id="yyqc"></span>
                                <br/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>医院简称：</span>&nbsp;&nbsp;&nbsp;
                                <input style="outline:0;" type="text" id="hospitalSort" name="">
                                <span id="yyjc"></span>
                            </td>


                        </tr>

                    </b>
                </table>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="addhospital()" id="tj">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!--添加/修改医院模态框（Modal） -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel1">修改医院模态框</h4>
            </div>
            <div class="modal-body">
                <table>
                    <b>
                        <tr>
                            <td>
                                <input id="ids" type="hidden" value="">
                                <span>医院全称：</span>&nbsp;&nbsp;&nbsp;
                                <input style="outline:0;" type="text" id="hospitalName1" name="">
                                <span id="yyqc1"></span>
                                <br/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>医院简称：</span>&nbsp;&nbsp;&nbsp;
                                <input style="outline:0;" type="text" id="hospitalSort1" name="">
                                <span id="yyjc1"></span>
                            </td>


                        </tr>

                    </b>
                </table>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="xiugai()" id="xg">修改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>
