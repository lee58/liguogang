<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title>登录</title>
    <meta name="keywords" content="登录页">
    <meta name="description" content="登录页面">
    <link href="../../css/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="../../css/animate.min.css" rel="stylesheet">
    <link href="../../css/style.min.css" rel="stylesheet">
    <link href="../../css/login.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>
        if(window.top!==window.self){window.top.location=window.location};
    </script>

</head>

<body class="signin">
<div class="signinpanel">
    <div class="row" >
        <div class="col-sm-5" style="margin-top: 90px;margin-left: 490px;">
            <form id="loginForm">
                <input type="text" class="form-control uname" id="email" name="email" placeholder="邮箱" />
                <input type="password" class="form-control pword m-b" id="password" name="password" placeholder="密码" />
                <a href="#">忘记密码了？</a>
                <button class="btn btn-success btn-block">登录</button>
                <span id="emil-password-error" class="help-block m-b-none"></span>
            </form>
        </div>
    </div>
</div>

</body>
<script src="../../js/jquery.min.js?v=2.1.4"></script>
<script src="../../js/plugins/validate/jquery.validate.min.js"></script>
<script src="../../js/plugins/validate/messages_zh.min.js"></script>
<script>
    $.validator.setDefaults({
        highlight: function(e) {
            $(e).closest(".form-group").removeClass("has-success").addClass("has-error")
        },
        success: function(e) {
            e.closest(".form-group").removeClass("has-error").addClass("has-success")
        },
        errorElement: "span",
        errorPlacement: function(e, r) {
            e.appendTo(r.is(":radio") || r.is(":checkbox") ? r.parent().parent().parent() : r.parent())
        },
        errorClass: "help-block m-b-none",
        validClass: "help-block m-b-none"
    });
    $().ready(function() {
        var e = "<i class='fa fa-times-circle'></i> ";
        $("#loginForm").validate({
            rules: {
                name: {
                    required: !0,
                    minlength: 2
                },
                password: {
                    required: !0,
                    minlength: 6
                },
                email: {
                    required: !0,
                    email: !0,
                    remote: {
                        url: "/isExistUser",     //后台处理程序
                        type: "post",               //数据发送方式
                        dataType: "json",           //接受数据格式
                        data: {                     //要传递的数据
                            email: function() {
                                return $("#email").val();
                            }
                        }
                    }
                }
            },
            messages: {
                password: {
                    required: e + "请输入您的密码",
                    minlength: e + "密码必须6个字符以上"
                },
                email: {
                    required: e + "请输入您的E-mail",
                    email: e + "请输入有效的电子邮件",
                    remote: e + "电子邮件未注册"
                }
            },
            submitHandler:function(form){
                var user = {
                    email: $("#email").val(),
                    password: $("#password").val()
                }
                $.post("/login", user, function (result) {
                    if ("success" == result) {
                        // 跳转到首页
                        window.location.href = "/index/main";
                    }else {
                        $("#emil-password-error")
                            .html(e + result)
                            .show();
                    }
                });
            }
        })
    });
</script>

</html>
