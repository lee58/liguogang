<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>注册</title>
    <meta name="keywords" content="注册页">
    <meta name="description" content="注册">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="../../css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="../../css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="../../css/animate.min.css" rel="stylesheet">
    <link href="../../css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>

</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen   animated fadeInDown">
    <div>
        <div>
            <h1 class="logo-name">LGG</h1>
        </div>
        <h3>欢迎注册</h3>
        <p>创建一个新账户</p>
        <form class="m-t" id="registerForm">
            <div class="form-group">
                <input type="text" id="name" name="name" class="form-control" placeholder="请输入用户名">
            </div>
            <div class="form-group">
                <input type="text" id="email" name="email" class="form-control" placeholder="请输入邮箱">
            </div>
            <div class="form-group">
                <input type="password" id="password" name="password" class="form-control" placeholder="请输入密码">
            </div>
            <div class="form-group">
                <input type="password" id="confirm_password" name="confirm_password" class="form-control" placeholder="请再次输入密码">
            </div>
            <button type="submit" class="btn btn-primary block full-width m-b">注 册</button>
            <p class="text-muted text-center"><small>已经有账户了？</small><a href="login.html">点此登录</a></p>
        </form>
    </div>
</div>
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
            $("#registerForm").validate({
                rules: {
                    name: {
                        required: !0,
                        minlength: 2
                    },
                    password: {
                        required: !0,
                        minlength: 6
                    },
                    confirm_password: {
                        required: !0,
                        minlength: 6,
                        equalTo: "#password"
                    },
                    email: {
                        required: !0,
                        email: !0,
                        remote: {
                            url: "/register/isNotExistUser",     //后台处理程序
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
                    name: {
                        required: e + "请输入您的用户名",
                        minlength: e + "用户名必须两个字符以上"
                    },
                    password: {
                        required: e + "请输入您的密码",
                        minlength: e + "密码必须6个字符以上"
                    },
                    confirm_password: {
                        required: e + "请再次输入密码",
                        minlength: e + "密码必须6个字符以上",
                        equalTo: e + "两次输入的密码不一致"
                    },
                    email: {
                        required: e + "请输入您的E-mail",
                        email: e + "请输入有效的电子邮件",
                        remote: e + "电子邮件已注册，请更换"
                    }
                },
                submitHandler:function(form){
                    var user = {
                        name: $("#name").val(),
                        email: $("#email").val(),
                        password: $("#password").val()
                    }
                    $.post("/register/register", user, function (result) {
                        if (result) {
                            alert("注册成功");
                            // 跳转到登录页
                            window.location.href = "/";
                        }else {
                            alert("注册失败");
                            window.location.reload();
                        }
                    });
                }
            })
        });
</script>
</body>

</html>
