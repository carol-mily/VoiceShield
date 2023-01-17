<%--
  Created by IntelliJ IDEA.
  User: mizhi
  Date: 2020/12/16
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>voiceshield后台管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"-->
    <meta http-equiv="Access-Control-Allow-Origin" content="*"-->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"-->
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="images/ico/favicon-20201214090023189.ico">
    <link rel="stylesheet" href="layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="css/index.css" media="all" />
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_1996563_0azodmi01f9.css" media="all">
</head>
<body class="main_body">
<div class="layui-layout layui-layout-admin">
    <!-- 顶部 -->
    <div class="layui-header header">
        <div class="layui-main mag0">
            <a href="#" class="logo">Voiceshield</a>
            <!-- 显示/隐藏菜单 -->
            <a href="javascript:;" class="seraph hideMenu iconfont iconinterface--caidancaidan"></a>
            <!-- 顶级菜单 -->
            <ul class="layui-nav mobileTopLevelMenus" mobile>
                <li class="layui-nav-item" data-menu="contentManagement">
                    <a href="javascript:;"><i class="seraph icon-caidan"></i><cite>layuiCMS</cite></a>
                    <dl class="layui-nav-child">
                        <dd class="layui-this" data-menu="contentManagement"><a href="javascript:;"><i class="layui-icon" data-icon="&#xe63c;">&#xe63c;</i><cite>内容管理</cite></a></dd>
                        <dd data-menu="memberCenter"><a href="javascript:;"><i class="seraph icon-icon10" data-icon="icon-icon10"></i><cite>用户中心</cite></a></dd>
                        <dd data-menu="systemeSttings"><a href="javascript:;"><i class="layui-icon" data-icon="&#xe620;">&#xe620;</i><cite>系统设置</cite></a></dd>
                        <dd data-menu="seraphApi"><a href="javascript:;"><i class="layui-icon" data-icon="&#xe705;">&#xe705;</i><cite>使用文档</cite></a></dd>
                    </dl>
                </li>
            </ul>
            <ul class="layui-nav topLevelMenus" pc>
                <li class="layui-nav-item layui-this" data-menu="contentManagement">
                    <a href="javascript:;"><i class="layui-icon" data-icon="&#xe63c;">&#xe63c;</i><cite>内容管理</cite></a>
                </li>
            </ul>
            <!-- 顶部右侧菜单 -->
            <ul class="layui-nav top_menu">
                <li class="layui-nav-item" pc>
                    <a href="javascript:;" class="clearCache"><i class="layui-icon" data-icon="&#xe640;">&#xe640;</i><cite>清除缓存</cite><span class="layui-badge-dot"></span></a>
                </li>
                <li class="layui-nav-item lockcms" pc>
                    <a href="javascript:;"><i class="seraph icon-lock"></i><cite>锁屏</cite></a>
                </li>
                <li class="layui-nav-item" id="userInfo">
                    <a href="javascript:;"><img src="images/myface.jpg" class="layui-nav-img userAvatar" width="35" height="35"><cite class="adminName">管理人</cite></a>
                    <dl class="layui-nav-child">
                        <!--dd><a href="javascript:;" data-url="page/user/userInfo.html"><i class="seraph icon-ziliao" data-icon="icon-ziliao"></i><cite>个人资料</cite></a></dd-->
                        <dd><a href="javascript:;" data-url="${pageContext.request.contextPath}/updatePwd.do"><i class="seraph icon-xiugai" data-icon="icon-xiugai"></i><cite>修改密码</cite></a></dd>
                        <dd pc><a href="javascript:;" class="functionSetting"><i class="layui-icon">&#xe620;</i><cite>功能设定</cite><span class="layui-badge-dot"></span></a></dd>
                        <dd pc><a href="javascript:;" class="changeSkin"><i class="layui-icon">&#xe61b;</i><cite>更换皮肤</cite></a></dd>
                        <dd><a href="${pageContext.request.contextPath}/signout" class="signOut"><i class="seraph icon-tuichu"></i><cite>退出</cite></a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <!-- 左侧导航 -->
    <div class="layui-side layui-bg-black">
        <div class="user-photo">
            <a class="img" title="我的头像" ><img src="images/myface.jpg" class="userAvatar"></a>
            <p>你好！<span class="userName">管理人</span>, 欢迎登录</p>
        </div>
        <!-- 搜索 -->
        <div class="navBar layui-side-scroll" id="navBar">
            <ul class="layui-nav layui-nav-tree">
                <li class="layui-nav-item layui-this">
                    <a href="javascript:;" data-url="${pageContext.request.contextPath}/Main"><i class="layui-icon" data-icon=""></i><cite>后台首页</cite></a>
                </li>
                <li class="layui-nav-item">
                    <a>
                        <i class="iconfont">&#xe602;</i>
                        <cite>用户管理</cite>
                        <span class="layui-nav-more"></span>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a data-url="${pageContext.request.contextPath}/Client"><i class="iconfont">&#xe6eb;</i><cite>用户列表</cite></a></dd>
                        <dd><a data-url="${pageContext.request.contextPath}/Login"><i class="iconfont">&#xe6e3;</i><cite>用户详情</cite></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a>
                        <i class="iconfont">&#xe613;</i>
                        <cite>噪声管理</cite>
                        <span class="layui-nav-more"></span>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a data-url="${pageContext.request.contextPath}/Noise"><i class="iconfont">&#xe6eb;</i><cite>总噪声库</cite></a></dd>
                        <dd><a data-url="${pageContext.request.contextPath}/ClientNoise"><i class="iconfont">&#xe6e3;</i><cite>用户噪声</cite></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a>
                        <i class="iconfont">&#xe602;</i>
                        <cite>语音管理</cite>
                        <span class="layui-nav-more"></span>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a data-url="${pageContext.request.contextPath}/ReceiveNoiseMessage"><i class="iconfont">&#xe6eb;</i><cite>语音列表</cite></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a data-url="${pageContext.request.contextPath}/Admit"><i class="iconfont">&#xe607;</i><cite>管理人列表</cite></a>
                </li>
                <li class="layui-nav-item">
                    <a data-url="${pageContext.request.contextPath}/history"><i class="iconfont">&#xe60b;</i><cite>登录历史</cite></a>
                </li>
            </ul>
        </div>
    </div>
    <!-- 右侧内容 -->
    <div class="layui-body layui-form">
        <div class="layui-tab mag0" lay-filter="bodyTab" id="top_tabs_box">
            <ul class="layui-tab-title top_tab" id="top_tabs">
                <li class="layui-this" lay-id=""><i class="layui-icon">&#xe68e;</i> <cite>后台首页</cite></li>
            </ul>
            <ul class="layui-nav closeBox">
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon caozuo">&#xe643;</i> 页面操作</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" class="refresh refreshThis"><i class="layui-icon">&#x1002;</i> 刷新当前</a></dd>
                        <dd><a href="javascript:;" class="closePageOther"><i class="seraph icon-prohibit"></i> 关闭其他</a></dd>
                        <dd><a href="javascript:;" class="closePageAll"><i class="seraph icon-guanbi"></i> 关闭全部</a></dd>
                    </dl>
                </li>
            </ul>
            <div class="layui-tab-content clildFrame">
                <div class="layui-tab-item layui-show">
                    <iframe src="${pageContext.request.contextPath}/Main"></iframe>
                </div>
            </div>
        </div>
    </div>
    <!-- 底部 -->
</div>

<!-- 移动导航 -->
<div class="site-tree-mobile"><i class="layui-icon">&#xe602;</i></div>
<div class="site-mobile-shade"></div>

<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/cache1.js"></script>
</body>
</html>
