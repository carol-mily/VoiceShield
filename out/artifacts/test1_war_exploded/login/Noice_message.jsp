<%--
  Created by IntelliJ IDEA.
  User: mizhi
  Date: 2020/11/30
  Time: 8:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <!--meta name="renderer" content="webkit"-->
    <!--meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"-->
    <!--meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"-->
    <link rel="stylesheet" href="layui/css/layui.css"  media="all">
    <style>
        body{margin: 10px;}
        .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
    </style>
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body style="height:100%;">
<div class="demoTable">
    搜索噪声：
    <div class="layui-inline">
        <input class="layui-input" name="keyword" id="demoReload" autocomplete="off">
    </div>
    <button class="layui-btn" data-type="reload">搜索</button>
</div>
<table class="layui-hide" id="demo" lay-filter="test"></table>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
</script>
<script src="layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    //添加编辑弹出层
    function updatePwd(title, id) {
        $.jq_Panel({
            title: title,
            iframeWidth: 500,
            iframeHeight: 300,
            url: "login/updatePwd.html"
        });
    }
</script>
<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;
        //方法级渲染
        table.render({
            elem: '#demo'
            ,url: 'http://localhost:8080/test_war_exploded/Noice_Controller.GetNoiceList'
            ,cols: [[
                {field:'gather_noiselibrary_noisePath', title: '噪声路径', width:'50%', sort: true, fixed: true}
                ,{field:'gather_noiselibrary_noiseID', title: '噪声ID', width:'50%', sort: true}
            ]]
            ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            ,id: 'testReload'
            ,totalRow: true //开启合计行
            ,page: true
            ,height: 600
        });
        /*table.on('row(test)', function(obj){
            var data = obj.data;

            layer.alert(JSON.stringify(data), {
                title: '当前行数据：'
            });

            //标注选中样式
            obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
        });*/
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据（json格式的键值对）
                ,layEvent = obj.event //获得 lay-event 对应的值（编辑、删除、添加）
                ,editList=[]; //存放获取到的那条json数据中的value值（不放key）
            $.each(data,function(name,value) {//循环遍历json数据
                editList.push(value);//将json数据中的value放入数组中（下面的子窗口显示的时候要用到）
            });
            if(layEvent === 'edit'){
                var name = encodeURIComponent(data.toolName);
                // console.log(data.toolName);
                var open_index=layer.open({
                    type: 2,
                    title: '编辑用户信息',
                    shadeClose: true,
                    shade: 0.8,
                    maxmin: true,
                    area: ['70%', '70%'],
                    content: 'Login_Change.jsp',
                    btn:['关闭'],
                    btnAlign: 'c',
                    yes: function(index, layero){
                        //layer.msg("1的回调");
                        layer.close(open_index);
                        window.parent.location.reload();
                    },
                    success: function(layero, index){
                        var body = layer.getChildFrame('body', index);
                        var iframeWin = window[layero.find('iframe')[0]['name']]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
                        var inputList = body.find("input");//获取到子窗口的所有的input标签
                        for (var i = 0; i < inputList.length; i++ ) {
                            $(inputList[i]).val(editList[i]); //遍历子窗口的input标签，将之前数组中的值一次放入显示
                        }
                    }
                });
            }
        });
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id)
                ,data = checkStatus.data; //获取选中的数据
            switch(obj.event){
                case 'add':
                    break;
                case 'update':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else if(data.length > 1){
                        layer.msg('只能同时编辑一个');
                    } else {
                        layer.alert('编辑 [id]：'+ checkStatus.data[0].id);
                    }
                    break;
                case 'delete':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else {
                        layer.msg('删除');
                    }
                    break;
            };
        });
    });
</script>
</body>
</html>



