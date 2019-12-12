<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
<html>
<head>
</head>

<body>

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md6">
            <div class="layui-card layui-form" lay-filter="component-form-element">
                <div class="layui-card-header">选择医院</div>
                <div class="layui-card-body layui-row layui-col-space10">
                    <div class="layui-col-md6">
                        <select name="hospital" lay-verify="required" lay-search>
                            <%--<option value="">带搜索的选择框</option>--%>
                        </select>
                    </div>

                </div>
            </div>



        </div>

    </div>
</div>
<script src="${pct}/static/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '/static/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'form'], function(){
        var $ = layui.$
            ,admin = layui.admin
            ,element = layui.element
            ,form = layui.form;

        form.render(null, 'component-form-element');
        element.render('breadcrumb', 'breadcrumb');

        form.on('submit(component-form-element)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>
</body>
</html>