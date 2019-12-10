<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    pageContext.setAttribute("pct", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<title>首页</title>

<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">


<link rel="stylesheet" href="${pct }/static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pct }/static/zTree/css/zTreeStyle/zTreeStyle.css">
<link rel="stylesheet" href="${pct }/static/bootstrap/css/bootstrap-table.css">
<link rel="stylesheet" href="/static/steps/step.css">

<script src="${pct}/static/bootstrap/js/jquery-2.2.1.min.js"></script>
<script src="${pct}/static/js/jquery-3.3.1.min.js"></script>
<script src="${pct}/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${pct}/static/zTree/jquery.ztree.all.min.js"></script>
<script src="${pct}/static/bootstrap/js/bootstrap-closable-tab.js"></script>
<script src="${pct}/static/bootstrap/js/closable-tab-div.js"></script>
<script src="${pct}/static/bootstrap/js/bootstrap-table.js"></script>
<script src="${pct}/static/bootstrap/js/bootstrap-table-zh-CN.min.js"></script>

<!-- 引入富文本 -->
<script type="text/javascript" src="${pct}/static/ueditor/ueditor.config.js"></script>
<link rel="stylesheet" href="${pct}/static/ueditor/themes/default/css/ueditor.min.css">
<script type="text/javascript" src="${pct}/static/ueditor/umeditor.min.js"></script>