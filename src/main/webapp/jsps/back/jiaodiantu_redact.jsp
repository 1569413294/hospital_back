<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/17
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<html>
<head>
    <title>Title</title>
    <style type="text/css">

        .item {
            width: 100px;
            height: 100px;
            float: left;
            position: relative;
            margin: 0px;
        }
        .addImg {
            width: 100px;
            height: 100px;
            position: absolute;
            left: 0;
            top: 0;
            z-index: 2;
            cursor: pointer;
        }
        .preview,.preBlock{
            position: absolute;
            display: block;
            width: 100px;
            height: 100px;
            left: 0;
            top: 0;
        }
        .delete {
            width: 30px;
            position: absolute;
            right: -5px;
            top: -5px;
            cursor: pointer;
            display: none;
        }
        .preBlock img {
            display: block;
            width: 100px;
            height: 100px;
        }
        .upload_input{
            display: block;
            width: 0;
            height: 0;
            -webkit-opacity: 0.0;
            /* Netscape and Older than Firefox 0.9 */
            -moz-opacity: 0.0;
            /* Safari 1.x (pre WebKit!) 老式khtml内核的Safari浏览器*/
            -khtml-opacity: 0.0;
            /* IE9 + etc...modern browsers */
            opacity: .0;
            /* IE 4-9 */
            filter:alpha(opacity=0);
            /*This works in IE 8 & 9 too*/
            -ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
            /*IE4-IE9*/
            filter:progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
        }

    </style>
</head>
<body>

<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-body" style="padding: 15px;">
            <form class="layui-form" action="" lay-filter="component-form-group">
                <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 100px;">  图片标题：</label>
                    <div class="layui-input-block" style="width: 500px;">
                        <input type="text" name="picName"  autocomplete="off"  class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 100px;">  展示顺序：</label>
                    <div class="layui-inline" style="width: 200px;margin-left: 10px;">
                        <input type="text"  name="sequence"  autocomplete="off"  class="layui-input">
                    </div>
                    <div class="layui-inline">
                        <div class="layui-form-mid layui-word-aux">温馨提示：请输入大于零的正整数(不含零)</div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 100px;">上传图片:</label>
                    <div class="layui-inline" style="margin-left: 10px;" >
                        <div class="item" >
                            <%--<img class="icon addImg"   src="/static/images/addImg.png">--%>
                            <input name="url" type="file" class="upload_input" onchange="change(this)">
                            <div class="preBlock">
                                <img  class="preview" onclick="clickImg(this);" id="pic" alt="" name="pic" width="620" height="210">
                            </div>
                            <img class="delete" onclick="deleteImg(this)" src="/static/images/delete.png">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <div class="layui-form-mid layui-word-aux">
                            温馨提示：<br/>
                            1.图片格式可为:png,bmp,jpeg,jpg,gif<br/>
                            2.图片大小不超过100M<br/>
                            3.图片尺寸为750px*300px
                        </div>
                    </div>

                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 100px;">图片链接(可选):</label>
                    <div class="layui-inline">
                        <div class="layui-input-inline" style="width: 300px;margin-left: 10px;">
                            <input type="tel" name="picInfo"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <div class="layui-form-mid layui-word-aux">温馨提示：<br/>
                            请填写完整链接,如:http://www.baidu.com
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>
<br/>
<div  style="padding: 10px;">
    <button  onclick="submitFocusPic()"  class="layui-btn" style="margin-left: 240px;width: 150px;">保存</button>
    <button  class="layui-btn layui-btn-danger" style="width: 150px;" >放弃</button>
</div>

<script>
    layui.config({
        base: '/static/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'form', 'laydate'], function(){
        var $ = layui.$
            ,admin = layui.admin
            ,element = layui.element
            ,layer = layui.layer
            ,form = layui.form;

        form.render(null, 'component-form-group');
    });
    var paras = location.search;			//search获得地址中的参数，内容为'?itemId=12'
    var result = paras.match(/[^\?&]*=[^&]*/g); 	//match是字符串中符合的字段一个一个取出来，result中的值为['login=xx','table=admin']
    paras = {};					//让paras变成没有内容的json对象
    for(var i=0;i<result.length;i++){
        var temp = result[i].split('=');	//split()将一个字符串分解成一个数组,两次遍历result中的值分别为['itemId','xx']
        paras[temp[0]] = temp[1];
    }
    var id = paras.id;     //根据参数名"houseId"，获取参数值

   function showHomeFocusPic(){
       $.post("/homeFocus/getHomeFocusPicById",{id:id},function(data){
           if(data){
               //$("img.addImg").hide();
               $("input[name='picName']").val(data.picName);
               $("input[name='sequence']").val(data.sequence);
               $("input[name='picInfo']").val(data.picInfo);
               $("#pic").attr("src",data.picPath);
           } else{
               layer.msg("查询失败！");
           }
       },"json");
   }
    showHomeFocusPic();
    function submitFocusPic() {
        var flag=false;
        var picName = $("input[name='picName']").val();
        var sequence = $("input[name='sequence']").val();
        var picInfo = $("input[name='picInfo']").val();
        var  rex=/[0-9]\d*$/;
        if(picName.length < 1){
            layer.msg('标题不能为空');
            return flag;
        }else if(!rex.test(sequence)){
            layer.msg('请输入正确的数字');
            return flag;
        }else if(sequence<=0){
            layer.msg('请输入比0大的数字');
            return flag;
        }else{
            flag=true;
        }
        if(flag){
            var formData = new FormData();
            //1.获取图片的数据
            var dataUrl=$("#pic").attr("src");
            //2.把二进制的图片数据转为Blob对象
            var blob = processData(dataUrl);
            formData.append("id",id);
            formData.append("picName",picName);
            formData.append("sequence",sequence);
            formData.append("picInfo",picInfo);
            formData.append("pic",blob);
            layer.confirm('确认保存？', function(){
                layer.msg('正在保存', {icon: 16}, function(){
                    $.ajax({
                        url:"/homeFocus/uploadHomeFocusPic",
                        method: "post",
                        data: formData,
                        processData: false,
                        contentType: false,
                        success: function (data) {
                            if(data.status){
                                layer.msg('保存成功', {icon: 1},function () {
                                    window.location.reload();
                                })
                            }else{
                                alert("上传失败");
                            }
                        },
                        error: function () {
                            console.log('Upload error');
                        }
                    });

                });
            });
        }
    }
    //点击
    var clickImg = function(obj){
        $(obj).parent().parent().find('.upload_input').click();
    }

    //删除
    var deleteImg = function(obj){
        $(obj).parent().find('input').val('');
        $(obj).parent().find('img.preview').attr("src","");
        //IE9以下
        $(obj).parent().find('img.preview').css("filter","");
        $(obj).hide();
        /*$(obj).parent().find('.addImg').show();*/
        showHomeFocusPic()
    }

    //选择图片
    function change(file) {
        //预览
        var pic = $(file).parent().find(".preview");
        //添加按钮
        var addImg = $(file).parent().find(".addImg");
        //删除按钮
        var deleteImg = $(file).parent().find(".delete");

        var ext=file.value.substring(file.value.lastIndexOf(".")+1).toLowerCase();

        // gif在IE浏览器暂时无法显示
        if(ext!='png'&&ext!='jpg'&&ext!='jpeg'){
            if (ext != '') {
                alert("图片的格式必须为png或者jpg或者jpeg格式！");
            }
            return;
        }
        //判断IE版本
        var isIE = navigator.userAgent.match(/MSIE/)!= null,
            isIE6 = navigator.userAgent.match(/MSIE 6.0/)!= null;
        isIE10 = navigator.userAgent.match(/MSIE 10.0/)!= null;
        if(isIE && !isIE10) {
            file.select();
            var reallocalpath = document.selection.createRange().text;
            // IE6浏览器设置img的src为本地路径可以直接显示图片
            if (isIE6) {
                pic.attr("src",reallocalpath);
            }else{
                // 非IE6版本的IE由于安全问题直接设置img的src无法显示本地图片，但是可以通过滤镜来实现
                pic.css("filter","progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src=\"" + reallocalpath + "\")");
                // 设置img的src为base64编码的透明图片 取消显示浏览器默认图片
                pic.attr('src','data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==');
            }
            addImg.hide();
            deleteImg.show();
        }else {
            html5Reader(file,pic,addImg,deleteImg);
        }
    }
    //H5渲染
    function html5Reader(file,pic,addImg,deleteImg){
        var file = file.files[0];
        var reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = function(e){
            pic.attr("src",this.result);
        }
        addImg.hide();
        deleteImg.show();
    }

    /* 使用二进制方式处理dataUrl */
    function processData(dataUrl) {
        var binaryString = window.atob(dataUrl.split(',')[1]);
        var arrayBuffer = new ArrayBuffer(binaryString.length);
        var intArray = new Uint8Array(arrayBuffer);
        for (var i = 0, j = binaryString.length; i < j; i++) {
            intArray[i] = binaryString.charCodeAt(i);
        }

        var data = [intArray],
            blob;

        try {
            blob = new Blob(data);
        } catch (e) {
            window.BlobBuilder = window.BlobBuilder ||
                window.WebKitBlobBuilder ||
                window.MozBlobBuilder ||
                window.MSBlobBuilder;
            if (e.name === 'TypeError' && window.BlobBuilder) {
                var builder = new BlobBuilder();
                builder.append(arrayBuffer);
                blob = builder.getBlob(imgType); // imgType为上传文件类型，即 file.type
            } else {
                console.log('版本过低，不支持上传图片');
            }
        }
        return blob;
    }

</script>
</body>
</html>
