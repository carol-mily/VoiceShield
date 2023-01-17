<%--
  Created by IntelliJ IDEA.
  User: mizhi
  Date: 2020/11/29
  Time: 9:52
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
    搜索用户：
    <div class="layui-inline">
        <input class="layui-input" name="keyword" id="demoReload" autocomplete="off">
    </div>
    <button class="layui-btn" data-type="reload">搜索</button>
</div>
<table class="layui-hide" id="demo" lay-filter="test"></table>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
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
            ,url: 'http://localhost:8080/test_war_exploded/Client_Controller.GetClientList'
            ,cols: [[
                {field:'client_user_Id', title: 'ID', width:'10%', sort: true, fixed: true}
                ,{field:'client_user_photo', title: '照片路径', width:'20%', sort: true}
                ,{field:'client_user_name', title: '昵称', width:'10%', sort: true}
                ,{field:'client_user_lastLoginTime', title: '上一次登录时间', width:'10%'}
                ,{field:'client_user_logState',title:'登录状态',width:'10%'}
                ,{field:'right', title: '操作', width:'40%',toolbar:"#barDemo"}
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
            if(layEvent === 'detail'){
                layer.msg(data.client_user_photo);
            } else if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    $.ajax({
                        type: 'POST',
                        url: 'http://localhost:8080/test_war_exploded/Client_Controller.DeleteClient',//发送请求
                        data: {client_user_Id:data.client_user_Id},
                        dataType : "html",
                        success: function(result) {
                            //var htmlCont = result;//返回的结果页面
                            layer.open({
                                type: 1,//弹出框类型
                                title: '结果',
                                shadeClose: false, //点击遮罩关闭层
                                area : ['20%' , '20%'],
                                shift:1,
                                content: "删除成功",//将结果页面放入layer弹出层中
                                success: function(layero, index){
                                }
                            });
                        }
                    });
                    //向服务端发送删除指令
                });
            } else if(layEvent === 'edit'){
                var name = encodeURIComponent(data.toolName);
                // console.log(data.toolName);
                var open_index=layer.open({
                    type: 2,
                    title: '编辑用户信息',
                    shadeClose: true,
                    shade: 0.8,
                    maxmin: true,
                    area: ['70%', '70%'],
                    content: 'Client_Change.jsp',
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
                    layer.msg('添加');
                    // console.log(data.toolName);
                    var open_index=layer.open({
                        type: 2,
                        title: '新增用户信息',
                        shadeClose: true,
                        shade: 0.8,
                        maxmin: true,
                        area: ['70%', '70%'],
                        content: 'Client_Add.jsp',//设置你要弹出的jsp页面
                        btn:['关闭'],
                        btnAlign: 'c',
                        yes: function(index, layero){
                            //layer.msg("1的回调");
                            layer.close(open_index);
                            window.parent.location.reload();
                        }
                    });
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

