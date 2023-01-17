<%--
  Created by IntelliJ IDEA.
  User: mizhi
  Date: 2020/12/18
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>文章列表--layui后台管理模板 2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="css/public.css" media="all" />
</head>
<body class="childrenBody">
<form class="layui-form" style="width:80%;">
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input username" lay-verify="required" placeholder="请输入登录名">
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input type="password" class="layui-input password" lay-verify="required" placeholder="请输入密码">
        </div>
    </div>
    <div class="layui-row">
        <div class="magb15 layui-col-md4 layui-col-xs12">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block sex">
                <input type="radio" name="sex" value="1" title="男" checked>
                <input type="radio" name="sex" value="2" title="女">
                <input type="radio" name="sex" value="3" title="保密">
            </div>
        </div>
        <div class="magb15 layui-col-md4 layui-col-xs12">
            <label class="layui-form-label">管理人身份</label>
            <div class="layui-input-block">
                <select name="userType" class="userType" lay-filter="userType">
                    <option value="1">超级管理员</option>
                    <option value="2">普通管理员</option>
                </select>
            </div>
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">电话</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input phonenum" lay-verify="required" placeholder="请输入电话号码">
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入用户备注" class="layui-textarea userDesc"></textarea>
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-sm" lay-submit="" lay-filter="addUser">立即添加</button>
            <button type="reset" class="layui-btn layui-btn-sm layui-btn-primary">取消</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="layui/layui.js"></script>
<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
<script >
    layui.use(['form','layer'],function(){
        var form = layui.form
        layer = parent.layer === undefined ? layui.layer : top.layer,
            $ = layui.jquery;

        form.on("submit(addUser)",function(data){
            var flag = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>《》/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？ ]")
            if(flag.test($(".userName").val())||flag.test($(".password").val())||flag.test($(".phonenum").val())){
                top.layer.msg("错误符号");
                console.log('包含错误符')
                return ;
            }
            //弹出loading
            var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
            // 实际使用时的提交信息
            $.post("${pageContext.request.contextPath}/userchange",{
                 username : $(".userName").val(),  //登录名
                 password : $(".password").val(),  //邮箱
                 sex : data.field.sex,  //性别
                 userType : data.field.userType,  //会员等级
                 phonenum : $(".phonenum").val(),    //用户状态
            //     newsTime : submitTime,    //添加时间
            //     userDesc : $(".userDesc").text(),    //用户简介
            },function(res){
                console.log(res);
            })
            setTimeout(function(){
                top.layer.close(index);
                top.layer.msg("用户添加成功！");
                layer.closeAll("iframe");
                //刷新父页面
                parent.location.reload();
            },2000);
            return false;
        })

        //格式化时间
        function filterTime(val){
            if(val < 10){
                return "0" + val;
            }else{
                return val;
            }
        }
        //定时发布
        var time = new Date();
        var submitTime = time.getFullYear()+'-'+filterTime(time.getMonth()+1)+'-'+filterTime(time.getDate())+' '+filterTime(time.getHours())+':'+filterTime(time.getMinutes())+':'+filterTime(time.getSeconds());

    })
</script>
</body>
</html>