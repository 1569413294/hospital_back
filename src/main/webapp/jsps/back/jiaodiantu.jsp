<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/16
  Time: 8:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<html>
<head>
    <title>首页焦点图</title>
    <style>
        .layui-table-cell{
            height:100px;
            line-height: 100px;
        }
    </style>
</head>
<body>
<div class="layui-card">
    <div class="layui-card-header">
         <span class="layui-breadcrumb" lay-separator=" > " lay-filter="breadcrumb">
              <a href="javascript:;">首页</a>
              <a href="javascript:;">首页焦点图管理</a>
         </span>
    </div>
    <div class="layui-card-body">
        <div>
            <button  class="layui-btn" id="addArticle" data-type="addArticle"><i class="layui-icon">&#xe654;</i>添加焦点图</button>
        </div>
        <table  class="layui-hide" id="focusImgList"></table>
    </div>

</div>

<script>
    layui.config({
        base: '/static/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index'], function(){
        var $ = layui.$
            ,admin = layui.admin
            ,element = layui.element;

        element.render('nav', 'component-nav');
        element.render('nav', 'component-nav-active');

        element.on('nav(component-nav-active)', function(elem){
            layer.msg(elem.text());
        });

        var active = {
            addArticle: function(){
                layer.open({
                    type: 2
                    ,content: '/jsps/back/jiaodiantu_add.jsp'
                    ,title:'首页&nbsp;&nbsp;>&nbsp;&nbsp;首页焦点图管理&nbsp;&nbsp;>&nbsp;&nbsp;编辑焦点图'
                    ,shadeClose: false
                    ,area: admin.screen() < 2 ? ['100%', '100%'] : ['780px', '540px']
                    ,maxmin: true
                    ,end:function () {
                        window.location.reload();
                    }
                });
            }

        }
        /* $('#delBtn').on('click', function(){*/
        $(document).on('click','#addArticle',function(){
            var type = $(this).data('type');
            active[type] && active[type].call(this);
        });

    });
    layui.use('table', function(){
        loadData();
    });
    function loadData() {
        var   table = layui.table;
        table.render({
            elem: '#focusImgList',
            url : '/homeFocus/getHomeFocus',
            cellMinWidth : 95,
            page : true,
            limits : [2,3,4,5],
            limit : 5,
            cols : [[
                {type: "checkbox", fixed:"left", width:50},
                {field:'sequence', title: '展示顺序',align:"center", width:130, sort: true, fixed: true},
                {field: 'picName', title: '焦点图标题', minWidth:125, align:"center"},
                {field: 'picPath', title: '文章对应栏目',minWidth:150,  align:'center',templet:function(d){

                            return "<img height='100' width='100' src="+d.picPath+" class='picImg'/>";

                    }},
                {title: '操作', align:"center",templet:function(d){
                        return " <div class=\"layui-btn-group\">\n" +
                            "                <button  class=\"layui-btn \" onclick='redactFocusPic("+d.id+")'>编辑</button>" +
                            "                <button  class=\"layui-btn\" onclick='deldata("+d.id+")' >删除</button>\n" +
                            "              </div>";
                    }
                }
            ]]
        });
    }
    function redactFocusPic(id) {
            layer.open({
                type: 2
                ,content: '/jsps/back/jiaodiantu_redact.jsp?id='+id
                ,title:'首页&nbsp;&nbsp;>&nbsp;&nbsp;首页焦点图管理&nbsp;&nbsp;>&nbsp;&nbsp;编辑焦点图'
                ,shadeClose: false
                ,area: ['780px', '540px']
                ,maxmin: true
                ,end:function () {
                    window.location.reload();
                }
            });
    }

    function deldata(id) {
        $.post("/homeFocus/delHomeFocusPic",{id:id},function(data){
            if(data){
                layer.msg("删除成功！");
                loadData();
            } else{
                layer.msg("删除失败！");
            }
        },"json");
    }

</script>

</body>
</html>
