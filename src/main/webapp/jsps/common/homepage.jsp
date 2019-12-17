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
            <div class="layui-card layui-form">
                <div class="layui-card-header">选择医院</div>
                <div class="layui-card-body layui-row layui-col-space10">
                    <div class="layui-col-md6">
                        <input type="hidden" id="hospitalId" value="${hospitalId}">
                        <select  id="hospital" lay-verify="required" lay-filter="changeHospital" lay-search>

                        </select>

                    </div>

                </div>
            </div>



        </div>

    </div>
</div>
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

    $(function () {
        $.ajax({
            type: "post",
            url: '/user/getOfHospital',
            data:{},
            dataType: "json",
            success: function (data) {
                if(data){
                    for(var i=0;i<data.length;i++){
                        var hospitalId = $("#hospitalId").val();
                        if(data[i].id == hospitalId){
                            $("#hospital").append("<option value='"+data[i].id+"' selected='selected'>"+data[i].hospitalName+"</option>");
                        }else{
                            $("#hospital").append("<option value='"+data[i].id+"'>"+data[i].hospitalName+"</option>");
                        }
                    }
                    layui.use('form', function(){
                        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
                        //但是，如果你的HTML是动态生成的，自动渲染就会失效
                        //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
                        form.render('select');
                    });

                }
            },
            error: function (data) {
            }
        });

        layui.use('form', function(){
            var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
           /* $("#hospital").change(function () {
                alert(1)
            })*/
            form.on('select(changeHospital)', function(data){
                $.ajax({
                    type: "post",
                    url: '/user/changeHospital',
                    data:{
                        hospitalId:data.value
                    },
                    dataType: "json",
                    success: function (data) {
                       if(data){
                           window.location.reload();
                       }
                    }
                });
                form.render('select');
            });

        });




    })
</script>
</body>
</html>