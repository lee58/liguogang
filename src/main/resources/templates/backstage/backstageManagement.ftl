<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>后台管理</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            border: 0;
            background: #fdfcf8;
        }
        div.container {
            margin: 0 auto;
            padding: 0;
            border: 0;
            width: 1239px;
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
            padding: 0;
            border: 0;
            width: 180px;
            background: transparent;
            margin: 20px 0 0 10px;
        }
        div.navLeft h2 {
            font-size: 14px;
            margin: 5px 0;
            padding: 0;
        }
        div.navLeft ul {
            list-style: none;
            margin: 0 5px;
            padding: 0;
            font-size: 14px;
        }
        div.navLeft ul li a {
            text-decoration: none;
            font-size: 12px;
            color: #443b3bd9;
        }
        div.mainContent{
            float: left;
            width: 1019px;
            margin: 20px 5px 10px 5px;
            padding: 0px;
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
                <li class="">
                    <a href="#">CSS 教程</a>
                </li>
                <li>
                    <a href="#">CSS 简介</a>
                </li>

            </ul>
            <h2>CSS 样式</h2>
            <ul>
                <li><a href="#">CSS 背景</a></li>
                <li><a href="#">CSS 文本</a></li>

            </ul>
        </div>
        <div class="mainContent">
点击字的时候，将字变颜色
        </div>
    </div>
    <script src="../../js/jquery.min.js?v=2.1.4"></script>
<script>
    $(function() {
        $("li a").click(function () {
            $("li a.currentLink").removeClass("currentLink").css("color", "#443b3bd9");
            $(this).addClass("currentLink").css("color", "#a417def5");
        });
    });
</script>
</body>
</html>