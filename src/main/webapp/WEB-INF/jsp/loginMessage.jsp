<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>用户中心--layui后台管理</title>
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
<form class="layui-form">
    <blockquote class="layui-elem-quote quoteBox">
        <form class="layui-form">
            <div class="layui-inline">
                <div class="layui-input-inline">
                    <input type="text" class="layui-input searchVal" placeholder="请输入搜索的用户" />
                </div>
                <a class="layui-btn search_btn" data-type="reload">搜索</a>
            </div>
        </form>
    </blockquote>
    <table id="loginList" lay-filter="loginList"></table>
    <!--操作-->
    <script type="text/html" id="loginListBar">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    </script>
</form>
<script type="text/javascript" src="layui/layui.js"></script>
<script>
    layui.use(['form','layer','table','laytpl'],function(){
        var form = layui.form,
            layer = parent.layer === undefined ? layui.layer : top.layer,
            $ = layui.jquery,
            laytpl = layui.laytpl,
            table = layui.table;

        //用户列表
        var tableIns = table.render({
            elem: '#loginList',
            url : '${pageContext.request.contextPath}/table/client.do',
            cellMinWidth : 95,
            page : true,
            height : "full-125",
            limits : [10,15,20,25],
            limit : 10,
            method:'post',
            id : "loginListTable",
            cols : [[
                {type: "checkbox", fixed:"left", width:50},
                {field:'client_user_Id', title: '用户名', minWidth:100, align:"center"},
                {field:'client_user_name', title: '昵称', minWidth:200, align:'center'},
                {field:'client_user_password', title: '密码', align:'center',minWidth:150},
                {title: '操作', minWidth:175, templet:'#loginListBar',fixed:"right",align:"center"}
            ]]
        });

        //搜索【此功能需要后台配合，所以暂时没有动态效果演示】
        $(".search_btn").on("click",function(){
            if($(".searchVal").val() != ''){
                table.reload("loginListTable",{
                    page: {
                        curr: 1 //重新从第 1 页开始
                    },
                    where: {
                        key: $(".searchVal").val()  //搜索的关键字
                    }
                })
            }else{
                layer.msg("请输入搜索的内容");
            }
        });

        //添加用户
        function addUser(edit){
            var index = layui.layer.open({
                title : "添加用户",
                type : 2,
                content : "${pageContext.request.contextPath}/loginChange",
                success : function(layero, index){
                    var body = layui.layer.getChildFrame('body', index);
                    if(edit){
                        body.find(".client_user_Id").val(edit.client_user_Id);
                        body.find(".client_user_name").val(edit.client_user_name);
                        body.find(".client_user_password").val(edit.client_user_password);
                        //body.find(".phonenum").val(edit.phonenum);
                        form.render();
                    }
                    setTimeout(function(){
                        layui.layer.tips('点击此处返回用户列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    },500)
                }
            })
            layui.layer.full(index);
            window.sessionStorage.setItem("index",index);
            //改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
            $(window).on("resize",function(){
                layui.layer.full(window.sessionStorage.getItem("index"));
            })
        }
        $(".addNews_btn").click(function(){
            addUser();
        })

        //列表操作
        table.on('tool(loginList)', function(obj){
            var layEvent = obj.event,
                data = obj.data;

            if(layEvent === 'edit'){ //编辑
                addUser(data);
            }else if(layEvent === 'detail'){
                layer.msg("密码为："+data.client_user_password);
            }
        });

    })
</script>
</body>
