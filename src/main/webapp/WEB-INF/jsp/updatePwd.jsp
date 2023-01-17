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
<form class="layui-form" style="width:80%;padding-bottom: 50px">
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">修改指令</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input username" lay-verify="required" placeholder="请输入修改指令">
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">新密码</label>
        <div class="layui-input-block">
            <input type="password" class="layui-input password" lay-verify="required" placeholder="请输入新密码">
        </div>
    </div>
    <div class="layui-form-item layui-row layui-col-xs12">
        <label class="layui-form-label">请二次输入新密码</label>
        <div class="layui-input-block">
            <input type="password" class="layui-input password1" lay-verify="required" placeholder="请输入新密码">
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
            var find1 = $(".password").val()
            var find2 = $(".password1").val()
            var o = $(".username").val()
            if(o != "123456"){
                top.layer.msg("修改指令出错");
                return
            }
            if(find1 != find2){
                top.layer.msg("第一次第二次不相同");
                return
            }
            var flag = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>《》/?~！@#￥……&*（）——|{}【】‘；：”“'。，、？ ]")
            if(flag.test(find1)){
                top.layer.msg("错误符号");
                console.log('包含错误符')
                return ;
            }
            //弹出loading
            var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
            // 实际使用时的提交信息
            if(find1 === find2)
            $.post("${pageContext.request.contextPath}/changepw",{
                password : $(".password").val(),  //邮箱
            },function(res){
                console.log(res);
            })
            setTimeout(function(){
                top.layer.close(index);
                top.layer.msg("用户修改成功！");
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