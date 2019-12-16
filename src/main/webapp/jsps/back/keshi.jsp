<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/12/10 0010
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/add_office.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap-table.css">
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/jquery-2.2.1.min.js"></script>

    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap-table.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap-table-zh-CN.min.js"></script>

    <script>
        $(function () {
            //调用查询科室方法
            office_all();
            //给所有表单元素添加聚焦时间 用于关闭样式
            $("#form input,textarea").focus(function () {
                //去除边框样式
                $(this).css("border-color", "");
                $(this).parent().next().children("span").text("");
            });
            //点击放弃 跳转到首页
            $("#abandon").click(function () {
                $("#add_one_department").css("display", "");
                $("#office_add").hide();
                $("#tableparent").show();
            });
            //给保存绑定点击事件
            $("#save").click(function () {
                is_one_two = 1;
                is_all();
            });

            //继续添加二级科室
            $("#continue_department").click(function () {
                is_one_two = 2;
                is_all();
            })
        });
        var is_one_two = 1;

        //展示科室信息
        function office_all() {
            $("#table").bootstrapTable('destroy');
            $("#table").bootstrapTable({
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
                        field: 'departmentName',
                        title: '一级科室'
                    },
                    {
                        field: 'secondDepartmentName',
                        title: '二级科室'
                    },
                    {
                        field: 'count',
                        title: '医生数量'
                    },
                    {
                        field: 'id',
                        title: '操作',
                        formatter: function (value, row, index) {
                            return "<button type=\"button\" onclick='update_and_add(" + JSON.stringify(row) + ")' class=\"btn btn-primary\">编辑</button>"
                        }
                    }

                ]
            });
            //查询所有科室信息
            $.ajax({
                url: "${pageContext.request.contextPath}/SecFirstDepartment/office_all",
                type: "post",
                success: function (data) {
                    //如果科室信息不为空 则用table展示
                    if (data != null && data != '') {
                        $("#tableparent").css("display", "");
                        $("#table").bootstrapTable('load', data);
                    }
                }

            });
        }

        //循环判断是否为空
        function is_for(b) {
            $("#form input,textarea").each(function () {
                //如果元素为空
                if ($(this).val().trim() == "" && $(this).attr("name") != "id" && $(this).attr("name") != "sta" && $(this).attr("name") != "firstDepartmentId") {
                    $(this).css("border-color", "red");
                    b = false;
                    return b;
                }
            });
            return b;
        }

        //判断的方法
        function is_all() {
            let sta = $("#form input[name='sta']").val();
            let b = true;
            //如果等于1 代表是添加一级科室页面保存/或者一级页面继续添加二级
            if (sta == 1) {
                //校验表单元素是否为空
                b = is_for(b);
                //如果b为true 说明全部不为空 校验一级科室名称
                if (b) {
                    //调用校验一级科室信息
                    b = jy_departmentName(b);
                    //如果c为ture 代表一级科室没有重复
                    if (b) {
                        //如果is_one_two为2是继续添加二级科室
                        if (is_one_two == 2) {
                            add_two();
                            return;
                        }
                        //1为添加
                        if (is_one_two == 1) {
                            add_office();
                        }

                    }
                    return false;
                }
                return false;

            }
            //2为修改信息
            if (sta == 2) {
                //校验表单元素是否为空
                b = is_for(b);
                //如果b为true 说明全部不为空 校验一级科室名称
                if (b) {
                    //调用校验一级科室信息
                    b = jy_two_departmentName(b);
                    //如果c为ture 代表一级科室没有重复
                    if (b) {
                        if (is_one_two == 2) {
                            add_two();
                            return;
                        }
                        add_office();
                    }
                }
            }
            //3代表继续添加二级科室操作
            if (sta == 3) {
                //校验表单元素是否为空
                b = is_for(b);
                //如果b为true 说明全部不为空 校验一级科室名称
                if (b) {
                    //调用校验一级科室信息
                    b = jy_two_departmentName(b);
                    //如果c为ture 代表一级科室没有重复
                    if (b) {
                        add_two();
                    }
                }
            }
        }

        //添加二级科室信息
        function add_two() {
            //如果全部不为空 进行添加
            let dname = $("#form input[name='departmentName']").val();
            let ds = $("#form input[name='sequence']").val();
            //调用添加方法
            $.ajax({
                type: 'post',
                url: "${pageContext.request.contextPath}/SecFirstDepartment/add_office",
                data: $("#form").serialize(),
                success: function (data) {
                    if (data > 0) {
                        $("#form input,textarea").val("");
                        $("#form input[name='firstDepartmentId']").val(data);
                        $("#form input[name='sta']").val(3);
                        $("#form input[name='departmentName']").val(dname).attr('disabled', 'disabled');
                        $("#form input[name='sequence']").val(ds).attr('disabled', 'disabled');
                        if (is_one_two == 1) {
                            alert("保存成功");
                            window.location.reload();
                            return;
                        }
                        alert("保存成功,请继续添加二级科室");
                        return;
                    }
                    alert("保存失败");
                }
            })
        }

        //点击添加科室 展示出form表单 隐藏科室信息
        function update_and_add(row) {
            $("#form input[name='secondDepartmentName'] ").val("");
            $("#form input[name='sequence2'] ").val("");
            $("#form input[name='secondDepartmentAddress'] ").val("");
            $("#form textarea[name='secondDepartmentCommont'] ").val("");
            $("#form span").text("");
            $("#add_one_department").css("display", "none");
            if (row != null && row != '') {
                $("#office_add").show();
                $("#tableparent").hide();
                $("#form input[name='sta']").val(2);
                $("#form input[name='departmentName']").val(row.departmentName).attr('disabled', 'disabled');
                $("#form input[name='id']").val(row.id2);
                $("#form input[name='firstDepartmentId']").val(row.id);
                $("#form input[name='sequence']").val(row.sequence).attr('disabled', 'disabled');
                $("#form input[name='secondDepartmentName']").val(row.secondDepartmentName);
                $("#form input[name='sequence2']").val(row.sequence2);
                $("#form input[name='secondDepartmentAddress']").val(row.secondDepartmentAddress);
                $("#form textarea[name='secondDepartmentCommont']").val(row.secondDepartmentCommont);
                return;
            }
            $("#office_add").show();
            $("#tableparent").hide();
            $("#form input[name='departmentName']").val("").removeAttr("disabled");
            $("#form input[name='id']").val("");
            $("#form input[name='sequence']").val("").removeAttr("disabled");

        }

        //添加科室
        function add_office() {
            $.ajax({
                type: 'post',
                url: "${pageContext.request.contextPath}/SecFirstDepartment/add_office",
                data: $("#form").serialize(),
                success: function (data) {
                    if (data) {
                        if (is_one_two == 1) {
                            alert("保存成功");
                            window.location.reload();
                        }
                        return;
                    }
                    alert("保存失败");

                }
            })
        }

        //校验一级科室信息
        function jy_departmentName(b) {
            let result = b;
            let departmentName = $("#form input[name='departmentName']");
            $.ajax({
                type: 'post',
                url: "${pageContext.request.contextPath}/SecFirstDepartment/is_have_departmentName",
                async: false,
                data: {"departmentName": departmentName.val()},
                success: function (data) {
                    //如果大于0 说明已经有同名的了
                    if (data > 0) {
                        //选中父类的下一个兄弟
                        departmentName.parent().next().children("span").text("一级科室名称已经重复").css("color", "red");
                        result = false;
                    } else {
                        result = true;
                    }
                }
            });
            return result;
        }

        //校验二级科室
        function jy_two_departmentName(b) {
            let result = b;
            let secondDepartmentName = $("#form input[name='secondDepartmentName']");
            $.ajax({
                type: 'post',
                url: "${pageContext.request.contextPath}/SecFirstDepartment/is_have_secondDepartmentName",
                async: false,
                data: {"secondDepartmentName": secondDepartmentName.val()},
                success: function (data) {
                    //如果大于0 说明已经有同名的了
                    if (data > 0) {
                        //选中父类的下一个兄弟
                        secondDepartmentName.parent().next().children("span").text("二级科室名称已经重复").css("color", "red");
                        result = false;
                    } else {
                        result = true;
                    }
                }
            });
            return result;
        }
    </script>
</head>
<body style="overflow-x: hidden">

<div class="container" style="padding: 0px;margin:0px;width: 100%">
    <div class="row clearfix">

        <div class="col-md-12 column">

            <ul class="breadcrumb">
                <li>
                    <a href="#">首页</a>
                </li>
                <li>
                    <a href="#">科室信息管理</a>
                </li>
                <li>
                    <a href="#">科室信息</a>
                </li>

            </ul>

            <button style="    display: block;
    width: 130px;
    margin-left: 35%;" type="button" id="add_one_department" onclick="update_and_add(null)" class="btn btn-success">+&nbsp;&nbsp;添加一级科室
            </button>

            <div class="row clearfix" id="office_add" style="display: none;margin-right: 0px;">
                <div class="col-md-12 column">
                    <%--form表单--%>
                    <form class="form-horizontal" id="form" role="form">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">一级科室名称</label>
                            <div class="col-sm-4">
                                <input type="text" name="departmentName" class="form-control"/>
                                <input type="hidden" name="id" class="form-control"/>
                                <input type="hidden" name="firstDepartmentId" class="form-control"/>
                                <input type="hidden" name="sta" value="1" class="form-control"/>
                            </div>
                            <div style="margin-top: 5px">
                                <span></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">一级科室排序</label>
                            <div class="col-sm-4">
                                <input type="text" name="sequence" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">二级科室名称</label>
                            <div class="col-sm-4">
                                <input type="text" name="secondDepartmentName" class="form-control"/>
                            </div>
                            <div style="margin-top: 5px">
                                <span></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">二级科室排序</label>
                            <div class="col-sm-4">
                                <input type="text" name="sequence2" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">二级科室所在楼层</label>
                            <div class="col-sm-4">
                                <input type="text" name="secondDepartmentAddress" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group" style="margin-bottom: 30px">
                            <label class="col-sm-2 control-label">二级科室介绍</label>
                            <div class="col-sm-4">
                                <textarea type="text" name="secondDepartmentCommont" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="form-group" style="margin-bottom: 30px">
                            <button id="save" type="button" style="margin-left: 10%;" class="btn btn-primary">保存
                            </button>
                            <button type="button" style="margin-left: 10%;" id="continue_department"
                                    class="btn btn-primary">继续添加二级科室
                            </button>
                            <button type="button" style="margin-left: 10%;" id="abandon" class="btn btn-default">放弃
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<%--table表--%>
<div id="tableparent" style="display: none;margin-top: 60px;margin-left: 50px;width: 75%;height: 100px">
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

</style>
