<%--
  Created by IntelliJ IDEA.
  User: mizhi
  Date: 2020/11/30
  Time: 8:40
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
<form class="layui-form" method="post" action="http://localhost:8080/test_war_exploded/Client_Login_Controller.EditLogin">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input name="client_login_password" required lay-verify="required" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">ID</label>
            <div class="layui-input-inline">
                <input name="client_login_ID" required lay-verify="email" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <br><br/>
        <div class="layui-inline">
            <div class="layui-input-block">
                <button class="layui-btn" action="Client_Login_Controller.EditLogin" onsubmit="return abc()" lay-filter="">立即提交</button>
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