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
<script src="${pct}/static/bootstrap/js/jquery-2.2.1.min.js"></script>
<script src="${pct}/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${pct}/static/bootstrap/js/bootstrap-table.js"></script>
<script src="${pct}/static/bootstrap/js/bootstrap-table-zh-CN.min.js"></script>
<html>
<head>
    <style>
        input,select{
            /* 首先要将input输入框的默认样式去掉*/
            -web-kit-appearance:none;
            -moz-appearance: none;
            /*然后我们加上边框和圆角，并设置input的高度和字体大小和颜色    */
            font-size:1.4em;
            height:2.7em;  /*高度*/
            border-radius:50px;  /*圆角*/
            border:1px solid #c8cccf;/*边框*/
            color:#6a6f77;
            /*然后将input输入框的轮廓去掉：*/
            outline:0;
            /*/宽度*/
            width: 460px;
        }
    </style>
    <title>后台用户管理</title>
    <script>
        $(function () {
            $("#orderDetailTable").bootstrapTable({
                ajax : function (request) {
                    $.ajax({
                        type : "post",
                        url : "${pageContext.request.contextPath}/user/selectUrhdms",
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
                columns: [/*{
                    field: "index",
                    title: "序号",
                    align: "center",
                    width: 8,
                    formatter: function (value, row, index) {
                        //row.index=index;
                        return index + 1;
                    }
                },*/ {
                    field: "id",
                    title: "id",
                    align: "center"
                    /*visible: false*/
                },{
                    field: "hospitalId",
                    title: "医院id",
                    align: "center",
                    visible: false
                },{
                    field: "roleId",
                    title: "角色id",
                    align: "center",
                    visible: false
                },{
                    field: "huId",
                    title: "用户医院关联表",
                    align: "center",
                    visible: false
                },{
                    field: "phont",
                    title: "手机号",
                    align: "center",
                    visible: false
                },{
                    field: "username",
                    title: "用户姓名",
                    align: "center"
                }, {
                    field: "hospitalName",
                    title: "医院全称",
                    align: "center"
                }, {
                    field: "roleName",
                    title: "角色",
                    align: "center"
                }, {
                    field: "disabled",
                    title: "状态码",
                    align: "center",
                    formatter: function (value, row, index) {
                        if (value == "0") {
                            return "无效";
                        }else {
                            return"有效";
                        }

                    }
                }, {
                    field: "caozuo",
                    title: "操作",
                    align: "center",
                    formatter: function (value, row, index) {
                        var str1 = "&nbsp;&nbsp;<button style='width:50px;height: 30px; ' class='btn btn-primary btn-sm' onclick='update(" + JSON.stringify(row)+ ")'>修改</button>";
                        if (row.disabled==0){
                            var str3 = "&nbsp;&nbsp;<button style='width:70px;height: 30px; ' class='btn btn-primary btn-sm' onclick='sheWeiYouXiao(" +JSON.stringify(row)+ ")'>设为有效</button>";
                            return  str1 +str3;
                        }
                        var str3 = "&nbsp;&nbsp;<button style='width:70px;height: 30px; ' class='btn btn-primary btn-sm' onclick='sheWeiYouXiao(" +JSON.stringify(row) + ")'>设为无效</button>";
                        return str1 + str3;

                    }
                }]
            });
        })
        //  //点击 添加时 出发模态框  同时加载 下拉框
            function addu(name,name2) {
            alert(123);
                /*角色*/
                $.ajax({
                    url:"${pageContext.request.contextPath}/secrole/allRole",
                    type:"post",
                    dataType:"json",
                    success:function(data){
                        alert(data)
                        if(data){
                            /*所属医院*/
                            $.ajax({
                                url:"${pageContext.request.contextPath}/SecHospital/allhospital",
                                type:"post",
                                dataType:"json",
                                success:function(data){
                                    if(data){
                                        $("select[name='seleyy']").html("");
                                        var str1=" ";
                                        for(var i=0;i<data.length;i++){
                                            if(data[i].hospitalName==name){
                                                str1+= " <option  selected value=\""+data[i].id+"\">"+data[i].hospitalName+"</option>"

                                            }else  {
                                                str1+= " <option value=\""+data[i].id+"\">"+data[i].hospitalName+"</option>"

                                            }

                                        }
                                        $("select[name='seleyy']").append(str1);

                                    }
                                }
                            });
                            $("select[name='jse']").html("");
                            var str=" ";
                            for(var i=0;i<data.length;i++){
                                /*class="xs"*/
                                if(data[i].roleName==name2){
                                    str+= " <option  selected  value=\""+data[i].id+"\">"+data[i].roleName+"</option>"
                                }else {
                                    str+= " <option value=\""+data[i].id+"\">"+data[i].roleName+"</option>"
                                }
                            }
                            $("select[name='jse']").append(str);
                        }
                    }
                });

            }
        //设为 有效
        function sheWeiYouXiao(row) {
            var id=row.id;
            var disabled=row.disabled;
            $.ajax({
                url:"${pageContext.request.contextPath}/user/updateUserDisabled",
                dataType:"json",
                data:{"id":id,"disabled":disabled},
                type:"post",
                success:function (data) {
                    //刷新
                    $('#orderDetailTable').bootstrapTable('refresh');
                    alert("已设置成功");
                }
            })
        }
        //修改模态框 与 赋值
        function update(row) {
            $("#myModal1").modal("show");
            var name=$("#names1").val(row.username);
            var phone=$("#phone1").val(row.phone);
            var id=$("#id").val(row.id);
            var huId=$("#huId").val(row.huId);
            addu(row.hospitalName,row.roleName);
        // $("#yy option:contains("+row.hospitalName+")").attr("selected", true);
        }

        //修改
        function updateuser() {
            var id =$("#id").val();
            alert(id)
            var username=$("#names1").val()
            alert(username)
            var phone=$("#phone1").val();
            alert(phone)
            var roleId=  $("#js1").val();
            alert("角色id"+roleId)
            var hospitalId=  $("#yy").val();
            alert("医院id"+hospitalId)
            var huId= $("#huId").val();
            alert("用户关联表id"+huId)
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/updateUser",
                    dataType:"json",
                    type:"post",
                    data:{"id":id,"username":username,"phone":phone,"roleId":roleId,"hospitalId":hospitalId,"huId":huId},
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

        //添加管理员(有则修改，无则添加)
        function  adduser(a) {
            var name=$("#names").val()
            var phone=$("#phone").val();
            var juese=  $("select[name='jse']").change().val();
            alert(juese);
            var seleyy=  $("select[name='seleyy']").change().val();
           if(juese!=3){
               $.ajax({
                   url:"${pageContext.request.contextPath}/user/adduser",
                   dataType:"json",
                   type:"post",
                   data:{"roleId":juese,"hospitalId":seleyy,"username":name,"phone":phone},
                   success:function (data) {
                       if (data==true){
                           //刷新
                           $('#orderDetailTable').bootstrapTable('refresh');
                           alert("添加成功");
                           $("#myModal").modal("hide");
                       }
                   }
               })
           }else if(juese==3) {
               //添加医生
               $.ajax({
                   url:"${pageContext.request.contextPath}/SecDoctor/addDoctors",
                   dataType:"json",
                   type:"post",
                   data:{"roleId":juese,"hospitalId":seleyy,"name":name,"phone":phone},
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
                <h4>首页--后台管理--用户管理</h4>
            </h3>
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <!-- 按钮触发模态框 -->
                    <button type="button"  class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" onclick="addu(null,null)">添加用户</button>
                    <!--用户列表-->
                    <table id="orderDetailTable"></table>

                </div>
            </div>
        </div>
    </div>
</div>
<!--添加用户模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加用户模态框</h4>
            </div>
            <div class="modal-body">
                <table>
                    <b>
                        <tr>
                            <td>
                                <span>姓名：</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input style="outline:0;" type="text" id="names" name=""><br/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>手机号：</span>&nbsp;&nbsp;&nbsp;
                                <input style="outline:0;" type="text" id="phone" name="">
                            </td><br/>
                        </tr>
                        <tr>
                            <td>
                                <span>所属医院：</span>
                                <select name="seleyy">
                                    <option value="" >请选择所属医院</option>
                                </select>
                            </td><br/>
                        </tr>
                        <tr>
                            <td>
                                <span>角色：</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <select name="jse"  >
                                    <option value="" >请选择角色</option>
                                </select>
                            </td><br/>
                        </tr>
                    </b>
                </table>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="adduser()" id="tj">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!--添加用户模态框（Modal） -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel1">添加用户模态框</h4>
            </div>
            <div class="modal-body">
                <table>
                    <b>
                        <tr>
                            <td>
                                <input type="hidden" id="id" value="">
                                <input type="hidden" id="huId" value="">
                                <span>姓名：</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input style="outline:0;" type="text" id="names1" name=""><br/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>手机号：</span>&nbsp;&nbsp;&nbsp;
                                <input style="outline:0;" type="text" id="phone1" name="">
                            </td><br/>
                        </tr>
                        <tr>
                            <td>
                                <span>所属医院：</span>
                                <select name="seleyy" id="yy">
                                    <option value="" >请选择所属医院</option>
                                </select>
                            </td><br/>
                        </tr>
                        <tr>
                            <td>
                                <span>角色：</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <select name="jse"  id="js1">
                                    <option value="" >请选择角色</option>
                                </select>
                            </td><br/>
                        </tr>
                    </b>
                </table>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updateuser()" >修改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>
