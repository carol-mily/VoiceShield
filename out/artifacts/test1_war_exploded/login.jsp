<%--
  Created by IntelliJ IDEA.
  User: mizhi
  Date: 2020/11/9
  Time: 8:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>voicesheild后台管理</title>
    <link rel="stylesheet" href="login/css/layui.css">
</head>

<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">voicesheild后台管理</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="login/images/1.gif" class="layui-nav-img"> 管理员
                </a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="index.jsp">基本资料</a>
                    </dd>
                    <dd>
                        <a href="index.jsp">安全设置</a>
                    </dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="Sign_out">退了</a>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">后台管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="login/Client_message.jsp" target="right">用户管理</a>
                        </dd>
                        <dd>
                            <a href="login/ClientNoice_message.jsp" target="right">噪声管理</a>
                        </dd>
                        <dd>
                            <a href="login/Login_message.jsp" target="right">用户密码</a>
                        </dd>
                        <dd>
                            <a href="login/Admit_message.jsp" target="right">管理员管理</a>
                        </dd>
                        <dd>
                            <a href="" target="right">历史记录</a>
                        </dd>
                        <dd>
                            <a href="login/Noice_message.jsp" target="right">加密语音库</a>
                        </dd>
                    </dl>

                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:void(0)"  onclick="updatePwd('修改密码',1)">修改密码</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body" style="z-index: 0;">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <iframe src="login/main.jsp" name="right" frameborder="0" width="100%" height="600"></iframe>

        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        底部固定区域
    </div>
</div>

<script type="text/javascript" src="login/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="login/myplugs/js/plugs.js">
</script>
<script type="text/javascript">
    //添加编辑弹出层
    function updatePwd(title, id) {
        $.jq_Panel({
            title: title,
            iframeWidth: 500,
            iframeHeight: 300,
            url: "login/updatePwd.jsp"
        });
    }
</script>
<script src="login/js/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function() {
        var element = layui.element;

    });
</script>
</body>

</html>