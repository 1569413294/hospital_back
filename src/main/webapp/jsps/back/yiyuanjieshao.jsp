<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/14
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<html>
<head>
    <title>医院介绍页</title>
    <style type="text/css">


        .item {
            width: 620px;
            height: 210px;
            position: relative;
            margin-top: 20px;
            margin-bottom: 20px;
            border: 1px solid #F0F0F0;
        }
        .addImg {
            width: 520px;
            height: 210px;
            position: absolute;
            left: 35px;
            top: 0;
            z-index: 2;
            cursor: pointer;
        }
        .preview,.preBlock{
            position: absolute;
            display: block;
            width: 620px;
            height: 210px;
            left: 0;
            top: 0;
        }
        .delete {
            width: 30px;
            position: absolute;
            right: 0px;
            top: 1px;
            cursor: pointer;
            display: none;
        }
        .preBlock img {
            display: block;
            width: 620px;
            height: 210px;
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

        #bom {
            position:fixed;
            left:0px;
            bottom:0;
            _position:absolute;
            z-index: 1000;
            _top:expression(document.documentElement.clientHeight + document.documentElement.scrollTop - this.offsetHeight);
        }

    </style>
</head>
<body>
<script>
    $(function () {
        var hospitalId=${hospitalId};
        $.ajax({
            url:"${pageContext.request.contextPath}/SecHospital/githospitalName",
            type:"post",
            //dataType:"json",
            data:{"hospitalId":hospitalId},
            success:function (data) {
                alert("当前医院"+data);
            },error:function () {
                alert("网络维护中.......")
            }
        })
    })
</script>

<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-body" style="padding: 15px;">
            <form class="layui-form" action="" lay-filter="component-form-group">
                <div class="layui-form-item" hidden="hidden">
                    <label class="layui-form-label">医院名称</label>
                    <div class="layui-input-block">
                        <input type="text" name="hospitalId" lay-verify="title" autocomplete="off" placeholder="${hospitalId}" class="layui-input" value="">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">地址</label>
                    <div class="layui-input-block">
                        <input type="text" name="hospitalAddress" lay-verify="title" autocomplete="off" placeholder="请输入地址" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">电话</label>
                    <div class="layui-input-block">
                        <input type="text" name="hospitalTel" lay-verify="title" autocomplete="off" placeholder="请输入电话" class="layui-input" />
                       <%-- <select name="articleType" lay-filter="aihao">

                        </select>--%>
                    </div>
                </div>


                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">内容</label>
                    <div class="layui-input-block" id="infoList">
                        <div style="margin-top: 20px;margin-bottom: 20px;">
                            <textarea id="articleInfo" name="articleInfo" placeholder="请输入内容" class="layui-textarea" maxlength="300" rows="9" style="width: 620px;height: 210px"></textarea>
                            <i class="layui-icon layui-icon-delete"   style="position:relative;float: left;margin-top: -28px;font-size:30px;color: red"></i>
                            <i style="position:relative;float: left;margin-top: -24px;margin-left: 575px;"><span class="count-change">0</span>/300</i>
                        </div>

                        <div class="item" >
                            <i class="layui-icon layui-icon-delete"    style="margin-top: -32px;font-size:30px;color: red"></i>
                            <img class="icon addImg"  onclick="clickImg(this);" src="/static/images/addImg.png">
                            <input name="url" type="file" class="upload_input" onchange="change(this)">
                            <div class="preBlock">
                                <img  class="preview" alt="" name="pic" width="620" height="210">
                            </div>
                            <img class="delete" onclick="deleteImg(this)" src="/static/images/delete.png">
                        </div>


                    </div>

                    <div style="position:relative;float:left;margin-left:112px;margin-top: 10px;">
                        <button type="button"   class="layui-btn" id="addCharBtn"  ><i class="layui-icon">&#xe654;</i>添加文字</button>
                        <button type="button"  class="layui-btn layui-btn-normal" id="addImgBtn" ><i class="layui-icon">&#xe654;</i>添加图片</button>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>
<br/><br/>
<div id="bom" style="background: #AAAAAA;height: 54px;padding: 10px;" class="col-sm-12">
    <button  onclick="submitArticle()"  class="layui-btn" style="margin-left: 240px;width: 150px;">保存</button>
    <button  class="layui-btn layui-btn-danger" style="width: 150px;" >放弃</button>
</div>
<script>
    layui.config({
        base: '/static/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'form'], function(){
        var $ = layui.$
            ,form = layui.form;


        $.ajax({
            type: "post",
            url: '/hospitalArticle/selectHospitalArticleType',
            data:{
            },
            dataType: "json",
            success: function (data) {
                if(data){
                    for(var i=0;i<data.length;i++){
                        if(data[i].id == '0'){
                            $("select[name='articleType']").append("<option value='"+data[i].id+"' selected='selected'>"+data[i].name+"</option>");
                        }else{
                            $("select[name='articleType']").append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                        }
                    }
                    layui.use('form', function(){
                        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
                        //但是，如果你的HTML是动态生成的，自动渲染就会失效
                        //因此你需要在相应的地方，执行下述方法来手动渲染，跟这类似的还有 element.init();
                        form.render('select');
                    });
                }
            }
        });
        form.render();
    });

//获取文本框的内容以及长度
    $(function () {
        var text = $("textarea[name='articleInfo']").val();
        var len = text.length;
        $("textarea[name='articleInfo']").nextAll().find('span').html(len);
        $('#infoList').on('keyup','textarea',function () {
            var text = $(this).val();
            len = text.length;
            if (len > 300) {
                return false;
            }
            $(this).nextAll().find('span').html(len);
        })
        //添加文本框
        $("#addCharBtn").click(function(){

            $("#infoList").append("   <div style=\"margin-top: 20px;margin-bottom: 20px;\">\n" +
                "\n" +
                "                            <textarea name=\"articleInfo\" placeholder=\"请输入内容\" class=\"layui-textarea\" maxlength=\"300\" rows=\"9\" style=\"width: 620px;height: 210px\"></textarea>\n" +
                "                            <i class=\"layui-icon layui-icon-delete\" onclick=\"deleteLable(this)\" style=\"position:relative;float: left;margin-top: -28px;font-size:30px;color: red\"></i>\n" +
                "                            <i style=\"position:relative;float: left;margin-top: -24px;margin-left: 575px;\"><span class=\"count-change\">0</span>/300</i>\n" +
                "                        </div>\n");
        });

        $("#addImgBtn").click(function(){
            //添加图片框
            $("#infoList").append(" <div class=\"item\" >\n" +
                "                            <i class=\"layui-icon layui-icon-delete\"  onclick=\"deleteLable(this)\"  style=\"margin-top: -32px;font-size:30px;color: red\"></i>\n" +
                "                            <img class=\"icon addImg\"  onclick=\"clickImg(this);\" src=\"/static/images/addImg.png\">\n" +
                "                            <input name=\"url\" type=\"file\" class=\"upload_input\" onchange=\"change(this)\">\n" +
                "                            <div class=\"preBlock\">\n" +
                "                                <img  class=\"preview\" alt=\"\" name=\"pic\" width=\"620\" height=\"210\">\n" +
                "                            </div>\n" +
                "                            <img class=\"delete\" onclick=\"deleteImg(this)\" src=\"/static/images/delete.png\">\n" +
                "                        </div>");
        });
    });

    //点击
    var clickImg = function(obj){
        $(obj).parent().find('.upload_input').click();
    }

    //删除
    var deleteImg = function(obj){
        $(obj).parent().find('input').val('');
        $(obj).parent().find('img.preview').attr("src","");
        //IE9以下
        $(obj).parent().find('img.preview').css("filter","");
        $(obj).hide();
        $(obj).parent().find('.addImg').show();
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

    var articleInfoValue = []; //文本域集合
    var articleInfoIndex = []; //文本域序号集合
    var imgFile = []; //图片集合
    var imgFileIndex = []; //图片序号集合
    function submitArticle(){
        var divList = $("#infoList").children("div");
        $(divList).each(function(){
            var index = $(divList).index(this);
            if($(this).find('textarea').length!=0){
                var div1 = $(this).children("textarea").val();
                if(div1){
                    articleInfoIndex.push(index+1);//将文件流存入数组中
                    articleInfoValue.push(div1)
                }
            }
            if($(this).find('img').length!=0){
                var dataUrl=$(this).find("img[name='pic']").attr("src");//获取图片的数据
                if(dataUrl){
                    imgFileIndex.push(index+1)
                    var blob = processData(dataUrl);//把二进制的图片数据转为Blob对象
                    imgFile.push(blob)
                }

            }
        });

        var hospitalAddress = $("input[name='hospitalAddress']").val();
        var hospitalTel = $("select[name='hospitalTel'] option:selected").val();
        var articleInfo = $("#articleInfo").val();

        if(hospitalAddress.length < 1){
            layer.msg('地址不能为空');
            return;
        }else if(!articleInfo){
            layer.msg('文章内容至少一条');
            return;
        }else{
            var formData = new FormData();
            formData.append("hospitalAddress",hospitalAddress);
            formData.append("hospitalTel",hospitalTel);
            for (var i=0;i<articleInfoIndex.length;i++) {
                formData.append("articleInfoIndex",articleInfoIndex[i]);
            }
            for (var i=0;i<articleInfoValue.length;i++) {
                formData.append("articleInfoValue",articleInfoValue[i]);
            }
            for (var i=0;i<imgFileIndex.length;i++) {
                formData.append("imgFileIndex",imgFileIndex[i]);
            }
            for (var i=0;i<imgFile.length;i++) {
                formData.append("imgFile",imgFile[i]);
            }

            layer.confirm('确认保存？', function(){
                layer.msg('正在保存', {icon: 16}, function(){
                    $.ajax({
                        url:"/SecHospital/addYiYuanJieShao",
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

</script>
</body>
</html>
