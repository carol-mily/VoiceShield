<%--
  Created by IntelliJ IDEA.
  User: mizhi
  Date: 2020/11/1
  Time: 22:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="layui/css/adminLogin.css">
    <link rel="Shortcut Icon" href="images/ico/favicon-20201214090023189.ico" type="image/x-icon" />
    <script type="text/javascript" src="http://pv.sohu.com/cityjson?ie=utf-8"></script>

  </head>
  <body style="background-color: #3b3b3b; background-size:100% 100% ; background-attachment: fixed">
  <div class="login-main">
    <header class="layui-elip">后台登录</header>
    <form class="layui-form-item" name="form1" method="post" action="login.do">
      <div class="line1">
        <input type="text" name="username" style="border-radius: 10px" required  lay-verify="required" placeholder="用户名" autocomplete="off" class="layui-input">
      </div>
      <div class="line1">
        <input type="password" name="password" style="border-radius: 10px" required  lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input">
      </div>
      <div class="line1 login-btn">
        <button type="submit" class="layui-btn" style="border-radius: 10px" name="btn1" value="登录">登录</button>
        <button type="reset" class="layui-btn layui-btn-normal" style="border-radius: 10px" name="btn2" value="重置">重置</button>
      </div>
    </form>
  </div>
  <script src="login/js/layui.js"></script>
  <script type="text/javascript">
    layui.use('form','layer', function () {
      var form = layui.form, $ = layui.jquery,layer =layui.layer;
      console.log(returnCitySN.cip)
      layer.alert('见到你真的很高兴', {icon: 6});
    });
  </script>
  </body>
</html>
