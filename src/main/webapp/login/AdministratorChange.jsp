<%--
  Created by IntelliJ IDEA.
  User: mizhi
  Date: 2020/11/27
  Time: 15:14
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
<form class="layui-form" method="post" action="http://localhost:8080/test_war_exploded/Admit_Controller.EditUser">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input name="password" required lay-verify="required" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">二次密码</label>
            <div class="layui-input-inline">
                <input name="" required lay-verify="email" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-inline">
                <input name="sex" required lay-verify="required" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">电话号码</label>
            <div class="layui-input-inline">
                <input name="phonenum" required lay-verify="required" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">用户类型</label>
            <div class="layui-input-inline">
                <input name="userType" required lay-verify="required" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input name="username" required lay-verify="required" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>

        <br><br/>
        <div class="layui-inline">
            <div class="layui-input-block">
                <button class="layui-btn" action="Admit_Controller.EditUser" onsubmit="return abc()" lay-filter="">立即提交</button>
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
