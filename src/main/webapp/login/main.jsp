<%--
  Created by IntelliJ IDEA.
  User: mizhi
  Date: 2020/12/2
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="css/amazeui.min.css" />
    <link rel="stylesheet" href="css/admin.css"/>
    <link rel="stylesheet" href="layui/css/layui.css?t=1605019607598" media="all">
    <style>
        body{margin: 10px;}
        .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
    </style>
</head>
<body>

<div class="admin-content-body">
    <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf">
            <strong class="am-text-primary am-text-lg">后台管理</strong>
        </div>
    </div>
    <hr>
    <ul class="am-avg-sm-2 am-avg-md-4 am-avg-lg-6 am-margin gallery-list">
        <li>
            <a href="Client_message.jsp">
                <img class="am-img-thumbnail am-img-bdrs" src="images/20201101234039.jpg" alt="">
                <div class="gallery-title">用户管理</div>
            </a>
        </li>
        <li>
            <a href="ClientNoice_message.jsp">
                <img class="am-img-thumbnail am-img-bdrs" src="images/AZUL1_PCWallpaper_1920x1080_01_rev.jpg" alt="">
                <div class="gallery-title">噪声管理</div>
            </a>
        </li>
        <li>
            <a href="Login_message.jsp">
                <img class="am-img-thumbnail am-img-bdrs" src="images/AZUL1_PCWallpaper_1920x1080_02_JP.jpg" alt="">
                <div class="gallery-title">用户密码</div>
            </a>
        </li>
        <li>
            <a href="Admit_message.jsp">
                <img class="am-img-thumbnail am-img-bdrs" src="images/AZUL1_PCWallpaper_1920x1080_03_JP.jpg" alt="">
                <div class="gallery-title">管理员管理</div>
            </a>
        </li>
        <li>
            <a href="#">
                <img class="am-img-thumbnail am-img-bdrs" src="images/AZUL1_PCWallpaper_1920x1080_04_rev.jpg" alt="">
                <div class="gallery-title">历史记录</div>
            </a>
        </li>
        <li>
            <a href="Noice_message.jsp">
                <img class="am-img-thumbnail am-img-bdrs" src="images/AZUL1_PCWallpaper_1920x1080_05_rev.jpg" alt="">
                <div class="gallery-title">加密语音库</div>
            </a>
        </li>
    </ul>
</div>
<blockquote class="layui-elem-quote layui-quote-nm layui-hide" id="footer">指尖掌控我们的学习</blockquote>
<div class="layui-tab layui-tab-brief" lay-filter="demo">
    <ul class="layui-tab-title">
        <li class="layui-this">通知</li>
        <li>日期</li>
        <li>上传</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">

            <div class="layui-carousel" id="test1">
                <div carousel-item>
                    <div><p class="demo-carousel"><img style="width: 100%" src="images/main1.jfif"></p></div>
                    <div><p class="demo-carousel"><img style="width: 100%" src="images/main2.jpg"></p></div>
                    <div><p class="demo-carousel"><img style="width: 100%" src="images/main3.jpg"></p></div>
                    <div><p class="demo-carousel"><img style="width: 100%" src="images/main4.jpg"></p></div>
                    <div><p class="demo-carousel"><img style="width: 100%" src="images/main5.jfif"></p></div>
                </div>
            </div>
        </div>
        <div class="layui-tab-item">
            <div id="laydateDemo"></div>
        </div>
        <div class="layui-tab-item">
            <div class="layui-upload-drag" id="uploadDemo">
                <i class="layui-icon"></i>
                <p>点击上传，或将文件拖拽到此处</p>
                <div class="layui-hide" id="uploadDemoView">
                    <hr>
                    <img src="" alt="上传成功后渲染" style="max-width: 100%">
                </div>
            </div>
        </div>
    </div>
</div>
<script src="layui/layui.js?t=1605019607598"></script>
<script>
    layui.config({
        version: '1605019607598' //为了更新 js 缓存，可忽略
    });

    layui.use(['laydate', 'laypage', 'layer', 'carousel', 'upload', 'element', 'slider'], function(){
        var laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,carousel = layui.carousel //轮播
            ,upload = layui.upload //上传

        //向世界问个好
        layer.msg('Hello World');

        //监听Tab切换
        //执行一个轮播实例
        carousel.render({
            elem: '#test1'
            ,width: '100%' //设置容器宽度
            ,height: 200
            ,arrow: 'none' //不显示箭头
            ,anim: 'fade' //切换动画方式
        });

        //将日期直接嵌套在指定容器中
        var dateIns = laydate.render({
            elem: '#laydateDemo'
            ,position: 'static'
            ,calendar: true //是否开启公历重要节日
            ,mark: { //标记重要日子
                '0-10-14': '生日'
                ,'2020-01-18': '小年'
                ,'2020-01-24': '除夕'
                ,'2020-01-25': '春节'
                ,'2020-02-01': '上班'
            }
            ,done: function(value, date, endDate){
                if(date.year == 2017 && date.month == 11 && date.date == 30){
                    dateIns.hint('一不小心就月底了呢');
                }
            }
            ,change: function(value, date, endDate){
                layer.msg(value)
            }
        });

        //上传
        upload.render({
            elem: '#uploadDemo'
            ,url: '' //改成您自己的上传接口
            ,done: function(res){
                layer.msg('上传成功');
                layui.$('#uploadDemoView').removeClass('layui-hide').find('img').attr('src', res.files.file);
                console.log(res)
            }
        });
        //底部信息
        var footerTpl = lay('#footer')[0].innerHTML;
        lay('#footer').html(layui.laytpl(footerTpl).render({}))
            .removeClass('layui-hide');
    });
</script>
</body>
</html>

