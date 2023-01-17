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
    <div class="layui-row">
        <div class="magb15 layui-col-md4 layui-col-xs12">
            <label class="layui-form-label">用户ID</label>
            <div class="layui-input-block">
                <select name="client_usernoise_ID" class="client_usernoise_ID" lay-filter="client_usernoise_ID" id="client_usernoise_ID">
                </select>
            </div>
        </div>
    </div>
    <div class="layui-row">
        <div class="magb15 layui-col-md4 layui-col-xs12">
            <label class="layui-form-label">噪声ID</label>
            <div class="layui-input-block">
                <select name="client_usernoise_noiseID" class="client_usernoise_noiseID" lay-filter="client_usernoise_noiseID" id="client_usernoise_noiseID">
                </select>
            </div>
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
            //弹出loading
            var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
            // 实际使用时的提交信息
            $.post("${pageContext.request.contextPath}/clientnoisechange",{
                client_usernoise_ID : data.field.client_usernoise_ID,  //会员等级
                client_usernoise_noiseID : data.field.client_usernoise_noiseID,
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
        $(document).ready(function (){
            var url="${pageContext.request.contextPath}/table/clientselect";
            $.ajax({
                type:"post",
                url:url,
                success:function(clientList){
                    $("#client_usernoise_ID").html("");
                    $("#client_usernoise_ID").append($("<option value=\"0\">－请选择－</option>"));
                    for (var i = 0; i < clientList.length; i++) {
                        //console.log("<option value=\"" + clientList[i].client_user_Id + "\">" + clientList[i].client_user_Id + "</option>")
                        $("#client_usernoise_ID").append($("<option value=\"" + clientList[i].client_user_Id + "\">" + clientList[i].client_user_Id + "</option>"));
                    }
                    form.render("select");
                }
            })
            var url2 = "${pageContext.request.contextPath}/table/noiseselect";
            $.ajax({
                type: "post",
                url:url2,
                success:function (noiseList){
                    $("#client_usernoise_noiseID").html("");
                    $("#client_usernoise_noiseID").append($("<option value=\"0\">－请选择－</option>"));
                    for (var i = 0; i < noiseList.length; i++) {
                        console.log("<option value=\"" + noiseList[i].gather_noiselibrary_noiseID + "\">" + noiseList[i].gather_noiselibrary_noiseID + "</option>")
                        $("#client_usernoise_noiseID").append($("<option value=\"" + noiseList[i].gather_noiselibrary_noiseID + "\">" + noiseList[i].gather_noiselibrary_noiseID + "</option>"));
                    }
                    form.render("select");
                }
            })
        })
    })
        /*$(document).ready(function (){
        var url="${pageContext.request.contextPath}/table/clientselect"; //访问后台去数据库查询select的选项,此处需填写后台接口路径
        $.ajax({
            type:"post",
            url:url,
            success:function(clientList){
                console.log(clientList)
                var unitObj=document.getElementById("client_usernoise_ID");
                var tempvalue ='';
                if(clientList!=null){ //后台传回来的select选项
                    for(var i=0;i<clientList.length;i++){
                        console.log(clientList[i].client_user_Id)
                        tempvalue =tempvalue+"<option>"+clientList[i].client_user_Id+"</option>"
                        //遍历后台传回的结果，一项项往select中添加option
                        unitObj.options.add(new Option(clientList[i].client_user_Id,clientList[i].client_user_Id));
                    }
                    //$("#client_usernoise_ID").removeChild();
                    //$("#client_usernoise_ID").append(tempvalue);
                }
            },
            error:function(){

            }
        })
    })*/
</script>
</body>
</html>