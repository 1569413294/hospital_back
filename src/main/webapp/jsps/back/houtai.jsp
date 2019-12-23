<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/10
  Time: 15:44
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
    <title>后台管理</title>
    <style>
        h2{
            border-bottom: 1px solid gainsboro;
        }
    </style>


</head>
<body>
<%--<h5>后台管理-首页</h5>
<h3>管理平台</h3>
<h4>首页--后台管理</h4>--%>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3 class="text-info text-left">
                <h5>后台管理-首页</h5>
                <h2>管理平台</h2>
                <h4>首页--后台管理</h4>
            </h3>
            <div class="row clearfix">
                <div class="col-md-6 column">
                    <img alt="140x140" style="width: 150px;height: 150px;" src="${pageContext.request.contextPath}/static/images/yh.jpg" class="img-thumbnail" /> <br/><button type="button" class="btn btn-primary active btn-lg" onclick="javascript:return yh()">用户管理</button>
                </div>
                <div class="col-md-6 column">
                    <img alt="140x140" style="width: 165px;height: 165px" src="${pageContext.request.contextPath}/static/images/yygl.jpg" class="img-thumbnail" /> <br/><button type="button" class="btn active btn-lg btn-primary"onclick="javascript:return yy()">医院管理</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function yh() {
        var msg = "您确定要打开用户管理吗？\n\n请确认！";
        if (confirm(msg)==true){

            window.location.href="houtaiyonghu.jsp";
            return true;
        }else{
            return false;
        }
    }

    function yy() {
        var msg = "您确定要打开医院管理吗？\n\n请确认！";
        if (confirm(msg)==true){

            window.location.href="houtaiyiyuan.jsp";
            return true;
        }else{
            return false;
        }
    }

</script>
</body>
</html>
