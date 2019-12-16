<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/12/12 0012
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/add_office.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap-table.css">
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/jquery-2.2.1.min.js"></script>

    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap-table.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap-table-zh-CN.min.js"></script>
    <script>
        var doctor_al;
        //储存医院信息
        var hospital_al;
        $(function () {
            //调用查询所有医院
            doctor_all();

            //回显图片
            $("#uploadImgBtn").click(function () {
                //触发上传图片点击
                $("#file").trigger("click");
                /*
                1、先获取input标签
                2、给input标签绑定change事件
                3、把图片回显
                 */
                //      1、先回去input标签
                var $input = $("#file");
                //      2、给input标签绑定change事件
                $input.on("change", function () {
                    //补充说明：因为我们给input标签设置multiple属性，因此一次可以上传多个文件
                    //获取选择图片的个数
                    var files = this.files;
                    var length = files.length;
                    //3、回显
                    for (var i = 0; i < length; i++) {
                        var fr = new FileReader();
                        fr.onload = function (e) {
                            $("#img_echo").attr("src", this.result);
                            $("#t6").attr("src", this.result);
                        };
                        fr.readAsDataURL(files[i]);//读取文件
                    }
                })
            });
            //添加医生
            $("#add_doctor").click(function () {
                //查询所有医生
                do_all();
                //调用医院信息
                hospital_all();
                //展示职称
                rank_all();
                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/SecHospital/now_hospital",
                    success: function (data) {
                        let str = "<option value='0'>请选择</option>";
                        for (let i = 0; i < data.length; i++) {
                            str += "<option value=" + data[i].id + ">" + data[i].secondDepartmentName + "</option>";
                        }
                        $("#departmentIds").html(str);
                    }
                });
                $("#tableparent").hide();
                $("#add_doctor").hide();
                $("#office_add").show();
            });
            //添加多点医院信息
            $("#add_multipoint").click(function () {
                let count = $(".two select[name='departmentId']").length;
                count = parseInt(count) + 1;
                let str = "<div class=\"multipoint\">\n" +
                    "                                <div class=\"form-group\" >\n" +
                    "                                    <label class=\"col-sm-2 control-label\">所在医院" + count + "</label>\n" +
                    "                                    <div class=\"col-sm-4\">\n" +
                    "                                         <select onchange='hospital_change(this)' name=\"hospitalId\" class=\"form-control\">" + hospital_al + "</select>\n" +
                    "                                    </div>\n" +
                    "                                </div>\n" +
                    "                                <div class=\"form-group\">\n" +
                    "                                    <label class=\"col-sm-2 control-label\">科室" + count + "</label>\n" +
                    "                                    <div class=\"col-sm-4\">\n" +
                    "                                        <select  name='departmentId' id='departmentId" + count + "' class=\"form-control\"></select>\n" +
                    "                                    </div>\n" +
                    "                                </div>\n" +
                    "                                <div class=\"form-group\" style=\"margin-bottom: 30px;margin-left: 28%;\">\n" +
                    "                                    <button type=\"button\"  name=\"delete_ss\" style=\"width: 100px;\" class=\"btn btn-danger\">删除\n" +
                    "                                    </button>\n" +
                    "                                </div>\n" +
                    "                              </div>";
                //如果大于0 说明有多点模块
                if ($(".two .multipoint").length > 0) {
                    //选择最后一个多点模块  进行添加
                    $(".two .multipoint:last").after(str);
                    //给新创建多点执业 绑定点击事件
                } else {
                    $(".two #add_multipoint_pasert").before(str);
                }
                $(".multipoint button[name='delete_ss']").off('click').on("click", function () {
                    delete_di($(this));
                });
                //绑定校验医院和校验科室
                $(".multipoint select[name='departmentId']").off('click').on("change", function () {
                    verify_department($(this));
                })

            });
            //添加多助理信息
            $("#add_doctor_assistant").click(function () {
                let count = $(".three select[name='assistant']").length;
                count = parseInt(count) + 1;

                let str = "   <div class=\"assistant\">\n" +
                    "                                <div class=\"form-group\">\n" +
                    "                                    <label class=\"col-sm-2 control-label\">关联医生助理</label>\n" +
                    "                                    <div class=\"col-sm-4\">\n" +
                    "                                        <select type=\"text\" onchange='verify_assistant(this)' id='assistant" + count + "' name=\"assistant\" class=\"form-control\">" + doctor_al + "</select>\n" +
                    "                                    </div>\n" +
                    "                                    <div class=\"col-sm-2\">\n" +
                    "                                        <button type=\"button\" class=\"btn btn-danger\">删除</button>\n" +
                    "                                    </div>\n" +
                    "                                </div>\n" +
                    "                            </div>";

                //如果大于0 说明有多点模块
                if ($(".three .assistant").length > 0) {
                    //选择最后一个多点模块  进行添加
                    $(".three .assistant:last").after(str);
                    //给新创建多点执业 绑定点击事件
                } else {
                    $("#ber_assistant").after(str);
                }
                //删除多点执业
                $(".assistant button").off("click").on("click", function () {
                    delete_d($(this));
                });
                $(".assistant select[name='assistant']").off("change").on("change", function () {
                    verify_assistant($(this));
                });
            });
            //给是否是医生助理加校验
            $("input[name='assistant']").change(function () {
                if ($(this).val() == "false") {
                    $("#add_doctor_assistant").show();
                    $(".assistant").show();
                } else {
                    $("#add_doctor_assistant").hide();
                    $(".assistant").hide();
                }
            });
        });

        //展示所有医生职称
        function rank_all() {
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/SecRankDic/rank_all",
                success:function (data) {
                    var str = "<option value='0'>请选择</option>";
                    for (let i = 0; i < data.length; i++) {
                        str+="<option value="+data[i].id+">"+data[i].rankName+"</option>"
                    }
                    $("#rank").html(str);
                }
            })
        }
        
        //查询所有医生信息
        function do_all() {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/SecDoctor/doctor_al",
                success: function (data) {
                    doctor_al = "<option value='0'>请选择</option>";
                    if (data != null && data != '') {
                        for (let i = 0; i < data.length; i++) {
                            doctor_al += "<option value=" + data[i].id + ">" + data[i].name + "</option>";
                        }
                    }
                    $("#assistant2").html(doctor_al);
                    $("#assistant1").html(doctor_al)

                }
            })
        }

        //查询所有医院
        function hospital_all() {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/SecDoctor/hospital_all",
                async: false,
                success: function (data) {
                    hospital_al = "<option value='0'>请选择</option>";
                    for (let i = 0; i < data.length; i++) {
                        hospital_al += "<option value=" + data[i].id + ">" + data[i].hospitalName + "</option>";
                    }
                    $("select[name=\"hospitalId\"]").html(hospital_al);
                }
            })
        }

        //查询所有医生信息
        function doctor_all() {
            $("#table").bootstrapTable('destroy');
            $("#table").bootstrapTable({
                url: "${pageContext.request.contextPath}/SecDoctor/doctor_all",
                pagination: true, //开启分页
                pageNumber: 1, //分页起始行,默认第一行
                pageSize: 5, //每页几行
                columns: [
                    {
                        field: 'id',
                        title: '序号',
                        formatter: function (value, row, index) {
                            return index + 1;
                        }
                    },
                    {
                        field: 'name',
                        title: '姓名'
                    },
                    {
                        field: 'tel',
                        title: '手机号'
                    },
                    {
                        field: 'hospitals',
                        title: '医院全称',
                        formatter: function (value, row, index) {
                            let str = "";
                            for (let i = 0; i < value.length; i++) {

                                str += value[i] + "<br/>";
                            }
                            return str;
                        }
                    },
                    {
                        field: 'id',
                        title: '操作',
                        formatter: function (value, row, index) {
                            return "<button type=\"button\" onclick='update_doctor(" + row.id + ")' class=\"btn btn-primary\">编辑</button>"
                        }
                    }

                ]
            });
        }
        //修改医生信息
        function update_doctor(id) {
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/"
            })

        }


        //删除多点
        function delete_di(th) {
            //获取当前要删除的表示数
            let de = $(th).parent().prev().children("label").text();
            //截取最后一位
            de = parseInt(de.charAt(de.length - 1));
            //循环所有多点执业信息
            $("select[name='hospitalId']").each(function () {
                //获取当前标识数
                let dd = $(this).parent().prev().text();
                //截取最后一位
                dd = parseInt(dd.charAt(dd.length - 1));

                if (dd > de) {
                    dd = dd - 1;
                    $(this).parents(".form-group").next().children("label").text("科室" + dd);
                    $(this).parent().prev().text("所在医院" + dd);
                }
            });

            $(th).parent().parent().remove();
        }

        //删除助理
        function delete_d(th) {
            $(th).parents(".assistant").remove();
        }

        //点击下一步 或上一步
        function downs(a, b) {
            if (b == ".four") {
                $("#t1").text($("#form input[name='name']").val());
                $("#t2").text($("#form input[name='assistant']").val() == 0 ? '是' : '否');
                $("#t3").text($("#form input[name='display']").val() == 0 ? '是' : '否');
                $("#t4").text($("#form input[name='secondDepartmentName']").val());
                $("#t5").text($("#form input[name='tel']").val());
                $("#t6").text($("#form input[name='sequence2']").val());
                $("#t7").text($("#form input[name='rank']").val());
                $("#t8").text($(".one    select[name='departmentId'] option:checked").text() == "请选择" ? '无' : $(".one    select[name='departmentId'] option:checked").text());
                $("#t9").text($("#form input[name='visitplaces']").val());
                $("#t10").text($("#form input[name='visitaddress']").val());

                var vi1 = $("#form textarea[name='introduce']").val();
                var vi2 = $("#form textarea[name='adeptat']").val();
                if (vi1.length > 20) {
                    vi1 = vi1.substring(0, 19) + "...";
                }
                $("#t11").text(vi1);
                if (vi2.length > 20) {
                    vi2 = vi2.substring(0, 19) + "...";
                }
                $("#t12").text(vi2);

            }
            $(a).hide();
            $(b).show();
            $('body,html').animate({'scrollTop': 0}, 0);
        }

        //选择医院过后 查询该医院下面对应的科室
        function hospital_change(th) {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/SecHospital/hospital_change",
                data: {"hospitalId": $(th).val()},
                success: function (data) {
                    let str = "<option value='0'>请选择</option>";
                    for (let i = 0; i < data.length; i++) {
                        str += "<option value=" + data[i].id + ">" + data[i].secondDepartmentName + "</option>";
                    }
                    $(th).parents(".form-group").next().children().children("select").html(str);
                }
            });
        }

        //校验医院和 科室 是否在都相同
        function verify_department(th) {
            var id = $(th).attr("id");
            var s1 = $(th).val();
            var s2 = $(th).parents(".form-group").prev().children().children("select").val();
            $("select[name='departmentId']").each(function () {
                let idd = $(this).attr("id");
                if (idd != id) {
                    let ss1 = $(this).val();
                    let ss2 = $(this).parents(".form-group").prev().children().children("select").val();
                    if (ss1 == s1 && s2 == ss2) {
                        alert("不能选择同一个医院和科室");
                        $(th).val("0");
                        return false;
                    }

                }
            })
        }

        //提交医生信息
        function submit_doctor() {
            console.log($("#form").serialize());
            var hos_de = [];
            var zhucc = [];
            //储存多点执业信息
            $(".two select[name='hospitalId']").each(function () {
                let hos = $(this).val();
                let se = $(this).parents(".form-group").next().children().children("select").val();
                if (hos != 0 && se != 0) {
                    hos_de.push(hos + "@" + se);
                }

            });
            //储存助理信息
            $(".three select[name='assistant']").each(function () {
                if ($(this).val() != 0) {
                    zhucc.push($(this).val());
                }
            });
            $(".two select[name='hospitalId']").val("0");
            $(".two select[name='departmentId']").val("0");
            $(".three input[name='assistant']").val("");

            var formobj = document.getElementById("form");
            var formdata = new FormData(formobj);
            formdata.append("file", document.getElementById("file"));
            formdata.append("hos_de", hos_de);
            formdata.append("zhucc", zhucc);
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/SecDoctor/add_doctor",
                data: formdata,
                processData: false,
                contentType: false,
                success: function (data) {
                    alert("添加成功");
                    window.location.reload();
                }
            })

        }

        //校验医生助理 是否重复
        function verify_assistant(th) {
            var id = $(th).attr("id");
            var s1 = $(th).val();
            $("select[name='assistant']").each(function () {
                let idd = $(this).attr("id");
                if (idd != id) {
                    let ss1 = $(this).val();
                    if (ss1 == s1) {
                        alert("不能选择同一个助手");
                        $(th).val("0");
                        return false;
                    }

                }

            })
        }

    </script>
</head>
<body style="overflow-x:hidden;">
<img id="sccc" src="">
<div class="container" style="padding: 0px;margin:0px;width: 100%">
    <div class="row clearfix">

        <div class="col-md-12 column">
            <ul class="breadcrumb">
                <li>
                    <a href="#">首页</a>
                </li>
                <li>
                    <a href="#"> 医生信息管理</a>
                </li>
            </ul>
            <button style="    display: block;
    width: 130px;
    margin-left: 35%;" type="button" id="add_doctor" class="btn btn-success">+&nbsp;&nbsp;添加医生
            </button>

            <div class="row clearfix" id="office_add" style="display: none;margin-right: 0px;">
                <div class="col-md-12 column">
                    <%--form表单--%>
                    <form enctype="multipart/form-data" class="form-horizontal" id="form" role="form">
                        <%--第一页--%>
                        <div class="one">
                            <%--第一页时间线--%>
                            <img src="${pageContext.request.contextPath}/static/images/1.jpg"/>
                            <div class="form-group" style="margin-top: 3%;">
                                <label class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-4">
                                    <input type="text" name="name" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">医生助理</label>
                                <label class="radio-inline" style="margin-left: 2%">
                                    <input type="radio" name="assistant" value="true" checked>是
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="assistant" value="false"> 否
                                </label>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">是否显示</label>
                                <label class="radio-inline" style="margin-left: 2%">
                                    <input type="radio" name="display" value="true" checked> 是
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="display" value="false"> 否
                                </label>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label" STYLE="    margin-left: 9%;
    font-size: 10px;
    color: #ccc;">
                                    温馨提示：选是则医生出现在科室列表内且能被搜索到，选否则不显示在科室列表内，患者无法搜索到此医生
                                </label>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">手机号</label>
                                <div class="col-sm-4">
                                    <input type="text" name="tel" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">医生照片</label>
                                <img width="100" style=";margin-left: 15px" height="100" id="img_echo">
                            </div>
                            <div class="form-group" style="margin-bottom: 30px;margin-left: 17%;">
                                <input type="file" id="file" style="display: none" multiple name="file"/>
                                <button type="button" id="uploadImgBtn" class="btn btn-primary">上传图片
                                </button>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">职称</label>
                                <div class="col-sm-4">
                                    <select name="rank"  class="form-control" id="rank">

                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">所在二级科室</label>
                                <div class="col-sm-4">
                                    <select name="departmentId" id="departmentIds" class="form-control">

                                    </select>
                                </div>
                            </div>
                            <div class="form-group" style="margin-bottom: 30px">
                                <label class="col-sm-2 control-label">出诊地点</label>
                                <div class="col-sm-4">
                                    <input type="text" name="visitplaces" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group" style="margin-bottom: 30px">
                                <label class="col-sm-2 control-label">出诊地址</label>
                                <div class="col-sm-4">
                                    <input type="text" name="visitaddress" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group" style="margin-bottom: 30px">
                                <label class="col-sm-2 control-label">医生介绍</label>
                                <div class="col-sm-4">
                                    <textarea type="text" name="introduce"
                                              class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="form-group" style="margin-bottom: 30px">
                                <label class="col-sm-2 control-label">专业擅长</label>
                                <div class="col-sm-4">
                                    <textarea type="text" name="adeptat"
                                              class="form-control"></textarea>
                                </div>
                            </div>
                            <div class="form-group" style="margin-bottom: 30px;margin-left: 12%;">
                                <button type="button" onclick="downs('.one','.two')" style="margin-left: 10%;"
                                        class="btn btn-primary">
                                    下一步
                                </button>
                                <button type="button" style="margin-left: 10%;" onclick="window.location.reload()"
                                        class="btn btn-default">放弃
                                </button>
                            </div>
                        </div>
                        <%--第二页--%>
                        <div class="two" style="display: none">
                            <img style="margin-bottom: 3%"
                                 src="${pageContext.request.contextPath}/static/images/2.png"/>
                            <%--1--%>
                            <div class="multipoint">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">所在医院1</label>
                                    <div class="col-sm-4">
                                        <select onchange="hospital_change(this)" name="hospitalId" class="form-control">
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">科室1</label>
                                    <div class="col-sm-4">
                                        <select onchange="verify_department(this)" name="departmentId"
                                                id="departmentId1" class="form-control">
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group" style="margin-bottom: 30px;margin-left: 28%;">
                                    <button type="button" onclick="delete_di(this)"
                                            style="width: 100px;"
                                            class="btn btn-danger">删除
                                    </button>
                                </div>
                            </div>
                            <%--2--%>
                            <div class="multipoint">
                                <div class="form-group" style="margin-top: 3%">
                                    <label class="col-sm-2 control-label">所在医院2</label>
                                    <div class="col-sm-4">
                                        <select onchange="hospital_change(this)" name="hospitalId" class="form-control">
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">科室2</label>
                                    <div class="col-sm-4">
                                        <select name="departmentId" onchange="verify_department(this)"
                                                id="departmentId2" class="form-control">
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group" style="margin-bottom: 30px;margin-left: 28%;">
                                    <button type="button"
                                            onclick="delete_di(this)" style="width: 100px;"
                                            class="btn btn-danger">删除
                                    </button>
                                </div>
                            </div>
                            <%--添加多点医院--%>
                            <div class="form-group" id="add_multipoint_pasert"
                                 style="margin-bottom: 30px;margin-left: 17%;">
                                <button type="button" id="add_multipoint" style="margin-left: 10%;"
                                        class="btn btn-success">+&nbsp;&nbsp;
                                    添加多点执业信息
                                </button>
                            </div>

                            <%--下一步 放弃--%>
                            <div class="form-group" style="margin-bottom: 30px">
                                <button type="button" style="margin-left: 10%;" onclick="downs('.two','.one')"
                                        class="btn btn-primary">
                                    上一步
                                </button>
                                <button type="button" style="margin-left: 10%;" onclick="downs('.two','.three')"
                                        class="btn btn-primary">
                                    下一步
                                </button>

                                <button type="button" style="margin-left: 15%;" onclick="window.location.reload()"
                                        class="btn btn-default">放弃
                                </button>
                            </div>
                        </div>
                        <%--第三页--%>
                        <div class="three" style="display: none">
                            <img style="margin-bottom: 3%"
                                 src="${pageContext.request.contextPath}/static/images/3.png"/>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">在线咨询服务</label>
                                <label class="radio-inline" style="margin-left: 2%">
                                    <input type="radio" name="onlineconsultant" value="true" checked>是
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="onlineconsultant" value="false"> 否
                                </label>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">是否收费</label>
                                <label class="radio-inline" style="margin-left: 2%">
                                    <input type="radio" name="ispremium" value="true" checked> 是
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="ispremium" value="false"> 否
                                </label>
                            </div>
                            <div class="form-group" id="ber_assistant" style="margin-bottom: 30px">
                                <label class="col-sm-2 control-label">咨询费用</label>
                                <div class="col-sm-1" style="width: 2px;margin-top: 3px;font-size: 20px;">
                                    ￥
                                </div>
                                <div class="col-sm-4">
                                    <input type="text" name="price" class="form-control"/>
                                </div>
                            </div>

                            <div class="assistant" style="display: none">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">关联医生助理</label>
                                    <div class="col-sm-4">
                                        <select type="text" name="assistant" onchange="verify_assistant(this)"
                                                id="assistant1" class="form-control">
                                        </select>
                                    </div>
                                    <div class="col-sm-2">
                                        <button type="button" onclick="delete_d(this)" class="btn btn-danger">删除
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="assistant" style="display: none">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">关联医生助理</label>
                                    <div class="col-sm-4">
                                        <select type="text" onchange="verify_assistant(this)" name="assistant"
                                                id="assistant2" class="form-control">
                                        </select>
                                    </div>
                                    <div class="col-sm-2">
                                        <button type="button" onclick="delete_d(this)" class="btn btn-danger">删除
                                        </button>
                                    </div>
                                </div>
                            </div>


                            <div class="form-group">
                                <div class="col-sm-2" style="margin-left: 25%">
                                    <button type="button" style="display: none" id="add_doctor_assistant"
                                            class="btn btn-success">+&nbsp;&nbsp;添加医生助理
                                    </button>
                                </div>
                            </div>


                            <%--下一步 放弃--%>
                            <div class="form-group" style="margin-bottom: 30px;">
                                <button type="button" style="margin-left: 10%;" onclick="downs('.three','.two   ')"
                                        class="btn btn-primary">
                                    上一步
                                </button>
                                <button type="button" style="margin-left: 10%;" onclick="downs('.three','.four')"
                                        class="btn btn-primary">下一步
                                </button>
                                <button type="button" onclick="window.location.reload()" style="margin-left: 15%;"
                                        class="btn btn-default">放弃
                                </button>
                            </div>
                        </div>
                        <%--第四页--%>
                        <div class="four" style="display: none">
                            <img style="margin-bottom: 3%"
                                 src="${pageContext.request.contextPath}/static/images/4.png"/>

                            <div style="margin-left: 10%" class="form-group">
                                <h3>基本信息</h3>
                            </div>
                            <table id="table2" style="width: 40%;
    margin-left: 5%;" frame=void class="table">

                                <tbody>
                                <tr>
                                    <td>姓名</td>
                                    <td id="t1">无</td>
                                </tr>
                                <tr>
                                    <td>医生助理</td>
                                    <td id="t2">无</td>
                                </tr>
                                <tr>
                                    <td>是否显示</td>
                                    <td id="t3">无</td>
                                </tr>
                                <tr>
                                    <td>HIS系统医生</td>
                                    <td id="t4">无</td>
                                </tr>

                                <tr>
                                    <td>手机号</td>
                                    <td id="t5">无</td>
                                </tr>
                                <tr>
                                    <td>医生照片</td>
                                    <td><img id="t6" width="100" height="100"></td>
                                </tr>
                                <tr>
                                    <td>职称</td>
                                    <td id="t7">无</td>
                                </tr>

                                <tr>
                                    <td>所在二级科室</td>
                                    <td id="t8">无</td>
                                </tr>

                                <tr>
                                    <td>出诊地点</td>
                                    <td id="t9">无</td>
                                </tr>

                                <tr>
                                    <td>出诊地址</td>
                                    <td id="t10">无</td>
                                </tr>

                                <tr>
                                    <td>医生介绍</td>
                                    <td id="t11"></td>
                                </tr>

                                <tr>
                                    <td>专业擅长</td>
                                    <td id="t12"></td>
                                </tr>
                                </tbody>
                            </table>


                            <%--下一步 放弃--%>
                            <div class="form-group" style="margin-bottom: 30px;">
                                <button type="button" style="margin-left: 10%;" onclick="downs('.four','.three')"
                                        class="btn btn-primary">
                                    上一步
                                </button>
                                <button type="button" style="margin-left: 10%;" onclick="submit_doctor()"
                                        class="btn btn-primary">完成
                                </button>
                                <button type="button" onclick="window.location.reload()" style="margin-left: 15%;"
                                        class="btn btn-default">放弃
                                </button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
<%--table表--%>
<div id="tableparent" style="margin-top: 60px;margin-left: 50px;width: 75%;height: 100px">
    <table id="table"></table>
</div>

<%--底部--%>
<ul class="breadcrumb" style="width:100%;height: 36px;position: fixed;bottom: 0px;margin-bottom: 0px;
text-align: center">
    <li>
        <a href="#">©巢内科技</a>
    </li>
</ul>

</body>
</html>
<style>
    .uploadImgBtn {

        width: 100px;
        height: 100px;
        cursor: pointer;
        position: relative;
        -webkit-background-size: cover;
        background-size: cover;
    }

    .uploadImg {
        position: absolute;
        right: 0;
        top: 0;
        width: 100%;
        height: 100%;
        opacity: 0;
        cursor: pointer;
    }

    .pic {
        width: 100px;
        height: 100px;
    }

    .pic img {
        width: 100%;
        height: 100%;
    }


    .fixed-table-body {
        height: auto;
    }

    .table th, .table td {
        height: 40px;
        text-align: center;
        vertical-align: middle !important;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
    }

    #table2 td {
        border-top: 0px;
    }
</style>