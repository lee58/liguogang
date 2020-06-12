<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>主页</title>
    <style>
        body {
            margin: 0px;
            padding: 0px;
        }
        .container {
            margin: 0px;
            width: 100%;

        }
        .head {
            position: fixed;
            border: 1px solid #bbbbbb;
            width: 100%;
            height: 60px;
            background: #fff;
            z-index: 1;
        }
        .logo {
            float: left;
            width: 222px;
            font-size: 400%;
            font-family: algerian,courier;
            line-height: 80%;
            margin-top: 8px;
            margin-left: 66px;
        }
        .search {
            width: 350px;
            line-height: 80%;
            float: left;
            margin-top: 0px;
            height: 100%;
        }
        input#search {
            width: 100%;
            height: 50%;
            margin-top: 6%;
            font-family: cursive;
            font-size: larger;
            border: 1px solid #ccc5c5;
        }
        div.userInfo {
            width: 100px;
            float: left;
            height: 100%;
        }
        div.userInfo span {
            margin-top: 22px;
            height: 100%;
            width: 100%;
            float: right;
        }
        div.settings {
            float: right;
            height: 100%;
            width: 100px;
        }
        #settings {
            float: left;
            cursor: pointer;
            margin-top: 30px;
        }
        div.settings ul {
            list-style-type: none;
            margin: 0;
            padding: 0 32px 0 0;
            float: left;
            width: 77px;
            display: none;
        }
        div.settings ul li a:link,div.settings ul li a:visited
        {
            display: block;
            font-weight: bold;
            color: #FFFFFF;
            background-color: #bebebe;
            width: 77px;
            text-align: left;
            padding: 4px;
            text-decoration: none;
            text-transform: uppercase;
        }
        div.settings ul li a:hover,div.settings ul li a:active
        {
            background-color:#cc0000;
        }
        .main {
            position: absolute;
            margin: 66px 0px 0px 10px;
            word-break: break-all;
        }
        div.userInfo img {
            width: 50px;
            height: 50px;
            border-style: solid dotted dashed double;
            border-radius: 100%;
            margin: 2px 0 1px 80px;
        }

    </style>
</head>
<body>
    <div class="container">
        <div class="head">
            <div class="userInfo">
                <img src="../../img/1.jpeg"/>
            </div>
            <div class="logo">
                <span>LIGG</span>
            </div>
            <div class="search">
                <input type="text" id="search"/>
            </div>
            <div class="settings">
                <span id="settings">
                    设置
                </span>
                <ul>
                    <li><a href="/backstageManagement" target="_blank">后台管理</a></li>
                </ul>
            </div>
        </div>
        <div class="main">
           开发中...
        </div>

    </div>
    <script src="../../js/jquery.min.js?v=2.1.4"></script>
    <script>
        $(function() {

            $("#settings").mouseover(function () {
                showSettings();
            });

        });

        function showSettings() {
           $("div.settings ul").show().mouseout(function () {
               hideSettings();
           });
        }
        function hideSettings() {
            $("div.settings ul").hide();
        }
    </script>
</body>
</html>
