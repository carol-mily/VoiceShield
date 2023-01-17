<%--
  Created by IntelliJ IDEA.
  User: mizhi
  Date: 2020/11/29
  Time: 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
</head>
<body style="text-align:center;padding-bottom: 100px">
<script src="layui/layui.js" charset="utf-8"></script>
<form class="layui-form" method="post" action="http://localhost:8080/test_war_exploded//Client_Controller.EditClient">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">图片路径</label>
            <div class="layui-input-inline">
                <input name="client_user_photo" required lay-verify="required" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">登录状态</label>
            <div class="layui-input-inline">
                <input name="client_user_logState" required lay-verify="email" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">ID</label>
            <div class="layui-input-inline">
                <input name="client_user_Id" required lay-verify="required" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">上次登录时间</label>
            <div class="layui-input-inline">
                <input name="client_user_lastLoginTime" required lay-verify="required" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">用户昵称</label>
            <div class="layui-input-inline">
                <input name="client_user_name" required lay-verify="required" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <br><br/>
        <div class="layui-inline">
            <div class="layui-input-block">
                <button class="layui-btn" action="Client_Controller.EditClient" onsubmit="return abc()" lay-filter="">立即提交</button>
            </div>
        </div>
    </div>
</form>
<script src="layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    function abc() {
        layer.close(open_index);
        window.parent.location.reload();
    }
</script>
</body>
</html>

