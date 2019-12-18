<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/12
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<html>
<head>
    <title>文章管理</title>
    <style>
        .layui-table-cell{
            height:36px;
            line-height: 36px;
        }
    </style>
</head>
<body>
<div class="layui-card">
    <div class="layui-card-header">
         <span class="layui-breadcrumb" lay-separator=" > " lay-filter="breadcrumb">
              <a href="javascript:;">首页</a>
              <a href="javascript:;">文章内容管理</a>
         </span>
    </div>
    <div class="layui-card-body">
        <div>

            <button  class="layui-btn" id="addArticle" data-type="addArticle"><i class="layui-icon">&#xe654;</i>写新文章</button>


            <span style="margin-top: 17px;margin-left: 1150px;margin-bottom: 8px">

                <span>文章搜索：</span>
                <div class="layui-inline">
                    <input class="layui-input" style="width: 240px;" id="sear1" placeholder="请输入文章标题进行模糊查询">
                </div>
                <button class="layui-btn" id="btn">搜索</button>

                <%-- <input type="text" style="height: 27px;width: 220px;" id="sear1" placeholder="请输入文章标题进行模糊查询"/>--%>
            </span>
        </div>
        <table  class="layui-hide" id="wenzhangList"></table>
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
                    ,content: '/jsps/back/wenzhang_add.jsp'
                    ,title:'首页&nbsp;&nbsp;>&nbsp;&nbsp;文章内容管理&nbsp;&nbsp;>&nbsp;&nbsp;文章编辑页'
                    ,shadeClose: false
                    ,area: admin.screen() < 2 ? ['100%', '100%'] : ['810px', '720px']
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
    var kwx='';
    layui.use('table', function(){
        loadData();
    });
    function loadData() {
        var   table = layui.table;
        table.render({
            elem: '#wenzhangList',
            url : '/hospitalArticle/getHospitalArticle?keyWord='+kwx,
            cellMinWidth : 95,
            page : true,
            limits : [2,3,4,5],
            limit : 10,
            cols : [[
                {type: "checkbox", fixed:"left", width:50},
                {field:'id', title: '序号',align:"center", width:80, sort: true, fixed: true},
                {field: 'articleTitle', title: '文章标题', minWidth:175, align:"center"},
                {field: 'articleType', title: '文章对应栏目',minWidth:150,  align:'center',templet:function(d){
                       if(d.articleType=='1'){
                            return "就诊指南";
                       }else if(d.articleType=='2'){
                           return "医院动态";
                       }else if(d.articleType=='4'){
                           return "医院通知";
                       }else{
                           return "无";
                       }
                    }},
                {title: '操作', align:"center",templet:function(d){
                        return " <div class=\"layui-btn-group\">\n" +
                           /* "                <button  class=\"layui-btn \" onclick='redactArticle("+d.id+','+d.articleType+")'>编辑</button>" +*/
                            "                <button  class=\"layui-btn\" onclick='deldata("+d.id+")' >删除</button>\n" +
                            "              </div>";
                    }
                }
            ]]
        });
    }

    $("#btn").click(function(){
        var keyWord=$("#sear1").val();
        kwx=keyWord;
        loadData();
    });


    function redactArticle(id,articleType) {

        layer.open({
            type: 2
            ,content: '/jsps/back/wenzhang_redact.jsp?id='+id+"&articleType="+articleType
            ,title:'首页&nbsp;&nbsp;>&nbsp;&nbsp;文章内容管理&nbsp;&nbsp;>&nbsp;&nbsp;文章编辑页'
            ,shadeClose: false
            ,area: ['810px', '720px']
            ,maxmin: true
            ,end:function () {
                window.location.reload();
            }
        });
    }


    function deldata(id) {
        $.post("/hospitalArticle/delHospitalArticle",{id:id},function(data){

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
