<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>后台管理</title>
    <style>
        body {
            text-align: center;
            margin: 0;
            padding: 0;
            border: 0;
            background: #fdfcf8;
            font-family: PingFangSC-Regular, Verdana, Arial, 微软雅黑, 宋体;
            font-size: 14px;
        }
        div.container {
            margin: 0 auto;
            padding: 0;
            border: 0;
            width: 1239px;
            text-align: left;
            background: #fdfcf8;
        }
        div.logo {
            width: 222px;
            font-size: 400%;
            font-family: algerian,courier;
            line-height: 80%;
            margin-top: 8px;
        }
        div.navLeft {
            float: left;
            margin: 0 0px 0 8px;
            padding: 0;
            border: 0;
            width: 180px;
        }
        div.navLeft h2 {
            font-size: 14px;
            margin: 0;
            padding: 10px 0 5px 10px;
            color: #000;
            display: block;
            border-bottom: 0px solid #ddd;
            font-weight: bold;
            border: 0;
            margin-block-start: 0.83em;
            margin-block-end: 0.83em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
        }
        div.navLeft ul {
            margin: 0;
            padding: 0;
            border: 0;
            padding-inline-start: 20px;
        }
        div.navLeft ul li {
            list-style: none;
            margin: 0;
            padding: 0;
            border: 0;
            display: list-item;
            text-align: -webkit-match-parent;
        }
        div.navLeft ul li a{
            display: block;
            padding: 5px 0 5px 15px;
            font-size: 12px;
            border-bottom: 0px solid #ddd;
            margin: 0;
            border: 0;
        }
        div.navLeft ul li a:link, div.navLeft ul li a:visited {
            text-decoration: none;
            color: #000000;
            background: transparent;
        }
        div.mainContent {
            float: left;
            margin: 0;
            padding: 30px 5px 30px 5px;
            border: 1px solid #bbb2b2;
            min-height: 888px;
            width: 1030px;
            background: transparent;
            word-break: break-all;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="logo">
            LIGG
        </div>
        <div class="navLeft">
            <h2>CSS 基础教程</h2>
            <ul>
                <li class="currentLink"><a href="/css/index.asp">CSS 教程</a></li>
                <li><a href="/css/css_jianjie.asp">CSS 简介</a></li>

            </ul>
            <h2>CSS 样式</h2>
            <ul>
                <li><a href="/css/css_background.asp">CSS 背景</a></li>
                <li><a href="/css/css_text.asp">CSS 文本</a></li>

            </ul>
        </div>
        <div class="mainContent">
点击字的时候，将字变颜色
        </div>
    </div>
    <script src="../../js/jquery.min.js?v=2.1.4"></script>
</body>
</html>