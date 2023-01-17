<%--
  Created by IntelliJ IDEA.
  User: mizhi
  Date: 2020/12/18
  Time: 14:35
  To change this template use File | Settings | File Templates.
--%>
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

    </blockquote>
    <table id="userList" lay-filter="userList"></table>

    <!--操作-->
    <script type="text/html" id="userListBar">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
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
            elem: '#userList',
            url : '${pageContext.request.contextPath}/table/history.do',
            cellMinWidth : 95,
            page : true,
            height : "full-125",
            limits : [10,15,20,25],
            limit : 10,
            method:'post',
            id : "userListTable",
            cols : [[
                {field:'admin_history_ID', title: '历史编号', minWidth:100, align:"center"},
                {field:'admin_history_name', title: '登录名称', minWidth:200, align:'center'},
                {field:'admin_history_phone', title: '登录电话',  align:'center'},
                {field: 'admin_history_time', title: '最后登录时间', align:'center',minWidth:150},
                {field:'admin_history_IP', title: '登录IP',  align:'center'}
            ]]
        });

        //搜索【此功能需要后台配合，所以暂时没有动态效果演示】
        $(".search_btn").on("click",function(){
            if($(".searchVal").val() != ''){
                table.reload("userListTable",{
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
                content : "${pageContext.request.contextPath}/admitAdd",
                success : function(layero, index){
                    var body = layui.layer.getChildFrame('body', index);
                    if(edit){
                        body.find(".username").val(edit.username);
                        body.find(".password").val(edit.password);
                        body.find(".sex input[value="+edit.sex+"]").prop("checked","checked");  //性别
                        body.find(".userType").val(edit.userType);
                        body.find(".phonenum").val(edit.phonenum);
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

        //批量删除
        $(".delAll_btn").click(function(){
            var checkStatus = table.checkStatus('userListTable'),
                data = checkStatus.data,
                username = [];
            if(data.length > 0) {
                for (var i in data) {
                    username.push(data[i].username);
                }
                console.log(username)
                layer.confirm('确定删除选中的用户？', {icon: 3, title: '提示信息'}, function (index) {
                    /*$.post("${pageContext.request.contextPath}/delete",{
                         username : username   //将需要删除的newsId作为参数传入
                    },function(data){
                    tableIns.reload();
                    layer.close(index);
                    })*/
                    $.ajax({
                        url: "${pageContext.request.contextPath}/userdelete",
                        type: "POST",
                        data: {
                            username : username
                        },
                        traditional: true,//这里设置为true
                        success: function(data) {
                            tableIns.reload();
                            layer.close(index);
                        }
                    });
                })
            }else{
                layer.msg("请选择需要删除的用户");
            }
        })

        //列表操作
        table.on('tool(userList)', function(obj){
            var layEvent = obj.event,
                data = obj.data;

            if(layEvent === 'edit'){ //编辑
                addUser(data);
            }else if(layEvent === 'del'){ //删除
                layer.confirm('确定删除此用户？',{icon:3, title:'提示信息'},function(index){
                    $.post("${pageContext.request.contextPath}/userdelete",{
                        username : data.username  //将需要删除的newsId作为参数传入
                    },function(data){
                        tableIns.reload();
                        layer.close(index);
                    })
                });
            }
        });

    })

</script>
</body>
