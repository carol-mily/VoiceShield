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
        <form class="layui-form">
            <div class="layui-inline">
                <div class="layui-input-inline">
                    <input type="text" class="layui-input searchVal" placeholder="请输入搜索的用户ID" />
                </div>
                <a class="layui-btn search_btn" data-type="reload">搜索</a>
            </div>
            <div class="layui-inline">
                <a class="layui-btn layui-btn-normal addNews_btn">添加 / 编辑用户噪声</a>
            </div>
        </form>
    </blockquote>
    <table id="clientnoiseList" lay-filter="clientnoiseList"></table>

    <!--操作-->
    <script type="text/html" id="clientnoiseListBar">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-xs" lay-event="edit">下载</a>
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
            elem: '#clientnoiseList',
            url : '${pageContext.request.contextPath}/table/clientnoise.do',
            cellMinWidth : 95,
            page : true,
            height : "full-125",
            limits : [10,15,20,25],
            limit : 10,
            method:'post',
            id : "clientnoiseListTable",
            cols : [[
                {type: "checkbox", fixed:"left", width:50},
                {field:'client_usernoise_ID', title: '用户ID', minWidth:100, align:"center"},
                {field:'client_usernoise_noiseID', title: '用户噪声ID', minWidth:200, align:'center'},
                {field: 'client_usernoise_noisePath', title: '用户噪声路径', align:'center',minWidth:150},
                {title: '操作', minWidth:175, templet:'#clientnoiseListBar',fixed:"right",align:"center"}
            ]]
        });
        function addUser(edit){
            var index = layui.layer.open({
                title : "添加用户噪声",
                type : 2,
                content : "${pageContext.request.contextPath}/clientNoiseAdd",
                success : function(layero, index){
                    var body = layui.layer.getChildFrame('body', index);
                    if(edit){
                        body.find(".client_usernoise_ID").val(edit.client_usernoise_ID);
                        body.find(".client_usernoise_noiseID").val(edit.client_usernoise_noiseID);
                        form.render();
                    }
                    setTimeout(function(){
                        layui.layer.tips('点击此处返回用户噪声列表', '.layui-layer-setwin .layui-layer-close', {
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
        //搜索【此功能需要后台配合，所以暂时没有动态效果演示】
        $(".search_btn").on("click",function(){
            if($(".searchVal").val() != ''){
                table.reload("clientnoiseListTable",{
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
        //列表操作
        table.on('tool(clientnoiseList)', function(obj){
            var layEvent = obj.event,
                data = obj.data;

            if(layEvent === 'edit'){ //下载
                layer.confirm('确定下载选中的噪音？', {icon: 3, title: '提示信息'}, function (index){
                    var xmlResquest = new XMLHttpRequest();
                    var fileaddr = data.client_usernoise_noisePath;
                    //  发起请求
                    xmlResquest.open("POST","${pageContext.request.contextPath}/upload/download?filename="+data.client_usernoise_noisePath, true);
                    // 设置请求头类型
                    xmlResquest.setRequestHeader("Content-type", "application/json");
                    xmlResquest.setRequestHeader("id",data.id);
                    xmlResquest.responseType = "blob";
                    //  返回
                    xmlResquest.onload = function(oEvent) {
                        //alert(this.status);
                        var content = xmlResquest.response;
                        // 组装a标签
                        var elink = document.createElement("a");

                        //获取文件格式,截取文件后缀
                        console.log(fileaddr)
                        var index = fileaddr.lastIndexOf(".");
                        var length  =fileaddr.length;
                        var laterName = fileaddr.substring(index,length);
                        //拼接下载的文件名
                        var newFileName = data.client_usernoise_noiseID+laterName;
                        //设置文件下载路径
                        elink.download = newFileName;
                        elink.style.display = "none";
                        var blob = new Blob([content]);

                        //解决下载不存在文件的问题，根据blob大小判断
                        if(blob.size==0){
                            layer.msg('服务器没找到此文件，请联系管理员!');
                        }else{
                            elink.href = URL.createObjectURL(blob);
                            document.body.appendChild(elink);
                            elink.click();
                            document.body.removeChild(elink);
                        }
                    };
                    xmlResquest.send();
                    layer.close(index);
                })
            }else if(layEvent === 'del'){ //编辑
                addUser(data);
            }else if(layEvent === 'detail'){//查看
                var audioHtml = '<div style="padding:20px;margin:0 auto;"><audio src="'+"${pageContext.request.contextPath}/upload/download?filename="+data.client_usernoise_noisePath
                    +'" width="68px" height="68px" controls></audio></div>';
                //弹出层
                layer.open({
                    type: 1,
                    shade: 0.8,
                    offset: 'auto',
                    area: ['auto','200px'],
                    shadeClose:true,//点击外围关闭弹窗
                    scrollbar: false,//不现实滚动条
                    title: "音频预览", //不显示标题
                    content: audioHtml
                });
            }
        });

    })

</script>
</body>
