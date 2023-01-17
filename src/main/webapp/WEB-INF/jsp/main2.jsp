<%--
  Created by IntelliJ IDEA.
  User: mizhi
  Date: 2020/12/17
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>首页--layui后台管理模板 2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="css/public.css" media="all" />
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_1996563_0azodmi01f9.css" media="all">
</head>
<body class="childrenBody">
<blockquote class="layui-elem-quote layui-bg-green">
    <div id="nowTime"></div>
</blockquote>
<div class="layui-row layui-col-space10 panel_box">
    <div class="panel layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg2">
        <a href="javascript:;" data-url="${pageContext.request.contextPath}/Login">
            <div class="panel_icon layui-bg-black">
                <i class="layui-anim seraph icon-icon10" data-icon="icon-icon10"></i>
            </div>
            <div class="panel_word userAll">
                <span>详情</span>
                <em>用户管理</em>
                <cite class="layui-hide">用户详情</cite>
            </div>
        </a>
    </div>
    <div class="panel layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg2">
        <a href="javascript:;" data-url="${pageContext.request.contextPath}/ClientNoise">
            <div class="panel_icon layui-bg-orange">
                <i class="layui-anim seraph icon-icon10" data-icon="icon-icon10"></i>
            </div>
            <div class="panel_word userAll">
                <span>用户噪声</span>
                <em>噪声管理</em>
                <cite class="layui-hide">用户噪声</cite>
            </div>
        </a>
    </div>
    <div class="panel layui-col-xs12 layui-col-sm6 layui-col-md4 layui-col-lg2">
        <a href="javascript:;">
            <div class="panel_icon layui-bg-blue">
                <i class="layui-anim seraph icon-clock"></i>
            </div>
            <div class="panel_word">
                <span class="loginTime"></span>
                <cite>本次登录时间</cite>
            </div>
        </a>
    </div>
</div>
<blockquote class="layui-elem-quote main_btn">
    <p>voiceshield是一种应用程序级的解决方案，可以保护音频隐私。不需要阻止调用麦克风录制信息就能存在系统的声音掩蔽。</p>
    <p class="layui-red">声音掩蔽是一种防止私密泄漏的音频混淆。声音掩蔽是在这样的假设下设计的：在设备中录制的音频具有较低的质量或信号强度(由于距离较远或窃听设备的失真)，因此在后台产生足够的噪声，以防止窃听者理解语音信息</p>
    <p>同时保持对预期接收方的理解，为了维持对后端相对应用户信息，噪声库等管理和信息收发，</p>
    <p class="layui-blue">PS：我们需要收发加密过的MP3，并且对加密过后的MP3进行去噪处理，并且将去噪后的MP3发送到相对应的。</p>
</blockquote>
<blockquote class="layui-elem-quote layui-quote-nm layui-hide" id="footer">指尖掌控我们的学习</blockquote>
<div class="layui-tab layui-tab-brief" lay-filter="demo">
    <ul class="layui-tab-title">
        <li class="layui-this">通知</li>
        <li>日期</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">

            <div class="layui-carousel" id="test1">
                <div carousel-item>
                    <div><p class="demo-carousel"><img style="width: 100%" src="login/images/main1.jfif"></p></div>
                    <div><p class="demo-carousel"><img style="width: 100%" src="login/images/main2.jpg"></p></div>
                    <div><p class="demo-carousel"><img style="width: 100%" src="login/images/main3.jpg"></p></div>
                    <div><p class="demo-carousel"><img style="width: 100%" src="login/images/main4.jpg"></p></div>
                    <div><p class="demo-carousel"><img style="width: 100%" src="login/images/main5.jfif"></p></div>
                </div>
            </div>
        </div>
        <div class="layui-tab-item">
            <div id="laydateDemo"></div>
        </div>
    </div>
</div>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="js/main1.js"></script>
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
            ,url: '${pageContext.request.contextPath}/upload/audio.do' //改成您自己的上传接口
            ,accept: 'audio'
            ,done: function(res){
                console.log(res.code)
                layer.msg('上传成功');
                //tableIns.reload();
            }
        });
        //底部信息
    });
</script>
</body>
</html>