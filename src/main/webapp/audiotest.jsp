<%--
  Created by IntelliJ IDEA.
  User: mizhi
  Date: 2021/1/4
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>HTML5-Video-Player</title>
    <link rel="stylesheet" href="layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="css/public.css" media="all" />
    <style type="text/css">
        .videoPlayer{
            border: 1px solid #000;
            width: 600px;
        }
        #video{
            margin-top: 0px;
        }
        #videoControls{
            width: 600px;
            margin-top: 0px;
        }
        .show{
            opacity: 1;
        }
        .hide{
            opacity: 0;
        }
        #progressWrap{
            background-color: black;
            height: 25px;
            cursor: pointer;
        }
        #playProgress{
            background-color: red;
            width: 0px;
            height: 25px;
            border-right: 2px solid blue;
        }
        #showProgress{
            font-weight: 600;
            font-size: 20px;
            line-height: 25px;
        }
    </style>
</head>
<body>
<div class="childrenBody">
    <div id="visualizer_wrapper">
        <canvas id="canvas" width="400" height="100"></canvas>
    </div>
    <div class="videoPlayer" id="videoContainer" >
        <!--audio src="audio/10.mp3"  id="video">你的浏览器不支持audio标签</audio-->
        <audio id="video" loop="loop">你的浏览器不支持audio标签</audio>
        <audio id="cnm" loop="loop" hidden>你的浏览器不支持audio标签</audio>
        <div id="videoControls" >
            <div id="progressWrap">
                <div id="playProgress">
                    <span id="showProgress">0</span>
                </div>
            </div>
            <div>
                <button id="playBtn" title="Play"> 播放 </button>
                <button id="fullScreenBtn" title="FullScreen Toggle">起点</button>
            </div>
        </div>
        <div id="totaltime"></div>
        <div id="currentTimeAudio"></div>
    </div>
    <!--table id="jiequ">
        <tr>
            <th>开始时间</th>
            <th>结束时间</th>
            <th>性别</th>
            <th>说话人身份</th>
            <th>声音质量</th>
            <th>删除</th>
        </tr>
    </table-->
</div>
<script>
    function RequestParameter() {
        var url = window.location.search; //获取url中
        var theRequest = new Object();
        if (url.indexOf("?") != -1){
            var str = url.substr(1);
            var strs = str.split("&");
            for(var i = 0; i < strs.length; i++){
                theRequest[strs[i].split("=")[0]]=(strs[i].split("=")[1]);
            }
        }
        return theRequest;
    }
    var video = document.getElementById("video");
    var cnm = document.getElementById("cnm");
    //video.crossOrigin = 'anonymous';
    var result = RequestParameter();
    video.src = "${pageContext.request.contextPath}/upload/download?filename="+result['file'];
    //video.src = "http://47.99.201.254:8080/test1_war_exploded/upload/download?filename="+result['file'];
    cnm.src = "${pageContext.request.contextPath}/upload/download?filename=audio/11.mp3";
    //cnm.src = "http://47.99.201.254:8080/test1_war_exploded/upload/download?filename=audio/8.mp3";
    console.log(result['file'])
    //video.setAttribute("src", "http://47.99.201.254:8080/test1_war_exploded/upload/download?filename="+result['file']);
    (function(window, document){
        // 获取要操作的元素
        var video = document.getElementById("video");
        var context=context = new (window.AudioContext ||
            window.webAudioContext ||
            window.webkitAudioContext)();
        //从元素创建媒体节点
        var media=context.createMediaElementSource(video);
        //创建脚本处理节点
        var processor=context.createScriptProcessor(4096,1,1);
        var videoControls = document.getElementById("videoControls");
        var videoContainer = document.getElementById("videoContainer");
        var controls = document.getElementById("video_controls");
        var playBtn = document.getElementById("playBtn");
        var fullScreenBtn = document.getElementById("fullScreenBtn");
        var progressWrap = document.getElementById("progressWrap");
        var playProgress = document.getElementById("playProgress");
        var fullScreenFlag = false;
        var progressFlag;
        video.oncanplay=function(){
            console.info(video.duration);
            document.getElementById("totaltime").innerHTML = video.duration+"秒";
        }
        // 创建我们的操作对象，我们的所有操作都在这个对象上。
        var videoPlayer = {
            init: function(){
                var that = this;
                video.removeAttribute("controls");
                bindEvent(video, "loadeddata", videoPlayer.initControls);
                videoPlayer.operateControls();
            },
            initControls: function(){
                videoPlayer.showHideControls();
            },
            showHideControls: function(){
                bindEvent(video, "mouseover", showControls);
                bindEvent(videoControls, "mouseover", showControls);
                bindEvent(video, "mouseout", hideControls);
                bindEvent(videoControls, "mouseout", hideControls);
            },
            operateControls: function(){
                bindEvent(playBtn, "click", play);
                bindEvent(video, "click", play);
                bindEvent(fullScreenBtn, "click", fullScreen);
                bindEvent(progressWrap, "mousedown", videoSeek);
            }
        }

        videoPlayer.init();

        // 原生的JavaScript事件绑定函数
        function bindEvent(ele, eventName, func){
            if(window.addEventListener){
                ele.addEventListener(eventName, func);
            }
            else{
                ele.attachEvent('on' + eventName, func);
            }
        }
        // 显示video的控制面板
        function showControls(){
            videoControls.style.opacity = 1;
        }
        // 隐藏video的控制面板
        function hideControls(){
            // 为了让控制面板一直出现，我把videoControls.style.opacity的值改为1
            videoControls.style.opacity = 1;
        }
        // 控制video的播放
        function play(){
            if ( video.paused || video.ended ){
                if ( video.ended ){
                    video.currentTime = 0;
                }
                video.play();
                cnm.play();
                playBtn.innerHTML = "暂停";
                progressFlag = setInterval(getProgress, 60);
            }
            else{
                video.pause();
                cnm.pause();
                playBtn.innerHTML = "播放";
                clearInterval(progressFlag);
            }
        }
        // 控制video是否全屏，额这一部分没有实现好，以后有空我会接着研究一下
        function fullScreen(){
            var jiequ = document.getElementById("jiequ");
            if(fullScreenBtn.innerHTML == '起点'){
                //设置表头
                var thead = document.createElement('tr');
                var thstartTime = document.createElement('td');
                thstartTime.innerHTML = video.currentTime;
                var thendTime = document.createElement('td');
                var thsex = document.createElement('td');
                thsex.innerHTML = '<select><option value ="男人">男人</option><option value ="女人">女人</option></select>';
                var thpeople = document.createElement('td');
                thpeople.innerHTML = '<input type="text"/>'
                var thvoice = document.createElement('td');
                thvoice.innerHTML =  '<select><option value ="好">好</option><option value ="不好">不好</option></select>';
                var btndel = document.createElement('td');
                btndel.innerHTML = '<button>删除</button>'
                var btnevent = btndel.querySelector('button');
                bindEvent(btnevent, "click", delTableItem);
                thead.appendChild(thstartTime);
                thead.appendChild(thendTime);
                thead.appendChild(thsex);
                thead.appendChild(thpeople);
                thead.appendChild(thvoice);
                thead.appendChild(btndel);
                jiequ.appendChild(thead);
                fullScreenBtn.innerHTML = '终点';
            }else{
                jiequ.rows[jiequ.rows.length-1].cells[1].innerHTML = video.currentTime;
                fullScreenBtn.innerHTML = '起点'
            }
        }

        //删除
        function delTableItem(){
            this.parentNode.parentNode.remove();
            var endTime = this.parentNode.parentNode.cells[1].innerHTML;
            console.log(endTime);
            if(endTime == ''){
                fullScreenBtn.innerHTML = '起点';
            }
        }

        // video的播放条
        function getProgress(){
            var percent = video.currentTime / video.duration;
            playProgress.style.width = percent * (progressWrap.offsetWidth) - 2 + "px";
            showProgress.innerHTML = (percent * 100).toFixed(1) + "%";
            document.getElementById("currentTimeAudio").innerHTML = video.currentTime+"秒";
        }
        // 鼠标在播放条上点击时进行捕获并进行处理
        function videoSeek(e){
            if(video.paused || video.ended){
                play();
                enhanceVideoSeek(e);
            }
            else{
                enhanceVideoSeek(e);
            }
        }
        function enhanceVideoSeek(e){
            clearInterval(progressFlag);
            var length = e.pageX - progressWrap.offsetLeft;
            var percent = length / progressWrap.offsetWidth;
            playProgress.style.width = percent * (progressWrap.offsetWidth) - 2 + "px";
            video.currentTime = percent * video.duration;
            progressFlag = setInterval(getProgress, 60);
        }

        //Canvas初始化
        var width=canvas.width,height=canvas.height;
        var g=canvas.getContext("2d");
        g.translate(0.5,height/2+0.5);
        //连接：媒体节点→控制节点→输出源
        media.connect(processor);
        processor.connect(context.destination);
        //控制节点的过程处理
        processor.onaudioprocess=function(e){
            //获取输入和输出的数据缓冲区
            var input=e.inputBuffer.getChannelData(0);
            var output=e.outputBuffer.getChannelData(0);
            //将输入数缓冲复制到输出缓冲上
            for(var i=0;i<input.length;i++)output[i]=input[i];
            //将缓冲区的数据绘制到Canvas上
            g.clearRect(-0.5,-height/2-0.5,width,height);
            g.beginPath();
            for(var i=0;i<width;i++)
                g.lineTo(i,height/2*output[output.length*i/width|0]);
            g.stroke();
        };

    }(this, document))
</script>
</body>
</html>