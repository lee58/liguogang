<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>主页</title>
    <style>
        .left {
            float: left;
            width: 300px;
        }
        .dashed {
            float: left;
            padding-right: 0px;
            height: 600px;
            margin-top: 0px;
            border-right: 1px solid #DDDDDD;
        }
        .right {
            margin-left: 310px;
        }
        .left div {
            margin-top: 10px;
        }
        .icon {
            text-align: center;
            font-weight: bold;
        }
        .topic {
            font-weight: bold;
        }
        ul li {
            cursor: pointer;
        }
    </style>
</head>
<body>

    <div class="left">
        <div class="icon">
            <label>${name!}</label>
        </div>
        <div class="list_item">
            <div id="javaScript">
                <label class="topic">JavaScript</label>
                <ul class="ul_level_one">
                    <li>Function</li>
                    <li>constructor</li>
                </ul>
            </div>
            <div id="java">
                <label class="topic">Java</label>
                <ul class="ul_level_one">
                    <li>
                        设计模式
                        <ul class="ul_level_two">
                            <li value="proxyPattern">代理模式</li>
                        </ul>
                    </li>

                </ul>
            </div>
        </div>
    </div>
    <p class="dashed"></p>
    <div class="right">
        <div id="content">


        </div>
    </div>
<script>
    // 当文档加载完成时，执行这里的代码
    window.onload = function () {
        // 获取所有的li标签
        var lis = document.getElementsByTagName("li");
        for (var i = 0; i < lis.length; i ++) {
            var li = lis[i];
            if (li.addEventListener && li.childElementCount == 0) {
                li.addEventListener("click", showContent);
            }else if (!li.addEventListener && li.childElementCount == 0){
                li.attachEvent("onclick", showContent);
            }
        }

        // 实例化一个XMLHttpRequest对象，在ie5和ie6中模拟XMLHttpRequest()构造函数
        if (window.XMLHttpRequest === undefined) {
            window.XMLHttpRequest = function() {
                try{
                    // 如果可用，则使用ActiveX对象的最新版本
                    return new ActiveXObject("Msxm12.XMLHTTP.6.0");
                }catch (e1) {
                    try {
                        // 否则，回退到较旧的版本
                        return new ActiveXObject("Msxml2.XMLHTTP.3.0");
                    }catch (e2) {
                        // 否则，抛错
                        throw new Error("XMLHttpRequest is not supported");
                    }
                }
            }
        }

    }

    /**
     *
     * @type {XMLHttpRequest}
      一个HTTP请求由4部分组成：
           · HTTP请求方法或“动作”（verb）
           ·正在请求的URL
           ·一个可选的请求头集合
           ，其中可能包括身份验证信息
      一个可选的请求主体服务器返回的HTTP响应包含3部分：
           ·一个数字和文字组成的状态码
           ，用来显示请求的成功和失败
           ·一个响应头集合·响应主体
     */
    function showContent(event) {
        var li_value = event.target.getAttribute("value");
        var url = "/index/getHtmlByValue";
        var data = {"li": li_value};
        get(url, data, function (result) {
            alert(result);
            var contentElement = document.getElementById("content");
            contentElement.append(result);
        });

    }

    /**
     * 发送一个HTTP GET请求以获得指定url内容
     * 当响应成功到达，验证他是否时纯文本
     * 如果是，把他传递给指定的回调函数
     * @param url
     * @param callback
     */
    function getText(url, callback) {
        var request = new XMLHttpRequest();
        request.open("GET", url);
        request.onreadystatechange = function () {
            if (request.readyState === 4 && request.status === 200) {
                var type = request.getResponseHeader("Content-Type");
                if (type.match(/^text/)) {
                    callback(request.responseText);
                }
            }
        }
        request.send(null);
    }

    /**
     * 发起同步的http get请求以获得指定url的内容
     * 返回响应文本，或如果请求不成功或响应不是文本就报错
     * @param url
     */
    function getTextSync(url) {
        var request = new XMLHttpRequest();
        request.open("GET", url, false);
        request.send(null)
        if (request.status !== 200) throw new Error(request.statusText);
        var type = request.getResponseHeader("Content-Type");
        if (!type.match(/^text/)) throw new Error("Expected textual response; got : " + type);
        return request.responseText;
    }

    /**
     * 发起HTTP GET响应以获取指定url的内容
     * 当响应到达时，把它以解析后的XML Document对象、解析后的json对象、或字符串形式传递给回调函数
     * @param url
     * @param callback
     */
    function get(url, data, callback) {
        var request = new XMLHttpRequest();
        request.open("GET", url);
        request.onreadystatechange = function () {
            if (request.readyState === 4 && request.status === 200) {
                var type = request.getResponseHeader("Content-Type");
                if (type.indexOf("xml") !== -1 && request.responseXML) {
                    callback(request.responseXML);
                }else if (type === "application/json") {
                    callback(JSON.parse(request.responseText));
                }else{
                    callback(request.responseText);
                }
            }
        }
        request.send(data);
    }

</script>
</body>
</html>
