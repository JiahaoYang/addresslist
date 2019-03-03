<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="include/header.jsp" %>

<script>
    $(function () {
        $("#registerName").blur(function () {
            var user = {"username": $("#registerName").val()};
            $.ajax(
                {
                    url: "checkName",
                    type: "post",
                    data: user,
                    success: function (data) {
                        if (data === "exist") {
                            $("#errorMessage").text("用户名已存在");
                            $("#errorDiv").show();
                            $("#registerBtn").attr("disabled", true);

                        } else {
                            $("#errorDiv").hide();
                            $("#registerBtn").attr("disabled", false);
                        }
                    }
                }
            )
        });

        $("form.input").keyup(function () {
            $("#errorDiv").hide();
        });

        $("#phone").blur(function () {
            var reg = /^[1][3,4,5,7,8][0-9]{9}$/;
            var phone = $("#phone").val();
            if (phone !== "" && !reg.test(phone)) {
                $("#errorMessage").text("请填写正确的联系方式");
                $("#errorDiv").show();
                $("#registerBtn").attr("disabled", true);
            } else {
                $("#errorDiv").hide();
                $("#registerBtn").attr("disabled", false);
            }
        });

    });
</script>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">班级通讯录</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="pull-right nav navbar-nav">
                <li><a href="loginPage">登录</a></li>
                <li><a href="#">注册</a></li>
            </ul>
        </div>
    </div>
</nav>

<div style="max-width:400px;margin:100px auto;">

    <div id="errorDiv" style="display:none" class="alert alert-danger alert-dismissable">
        <span id="errorMessage"></span>
    </div>

    <div class="tab-content">

        <div id="registerDiv" class="tab-pane fade in active">

            <h2 align="center">立即加入</h2>

            <form method="post" action="register">
                <br/>
                <br/>
                <input id="registerName" name="username" class="form-control" placeholder="用户名" required="required">
                <br>
                <input type="password" name="password" class="form-control" placeholder="密码" required="required"
                       aria-autocomplete="list">
                <br/>
                <input name="schoolName" class="form-control" placeholder="就读高校（选填）">
                <br/>
                <select class="form-control" name="gender">
                    <option value="">性别（选填）</option>
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
                <br>
                <input id="phone" name="phone" class="form-control" placeholder="手机号（选填）">
                <br>
                <input name="address" class="form-control" placeholder="住址（选填）">
                <br/>
                <input type="date" name="birthday" class="form-control" placeholder="生日（选填）">
                <br>
                <textarea name="description" class="form-control" placeholder="个人描述（选填）"></textarea>
                <br>
                <br/>
                <button class="btn btn-lg btn-primary btn-block " id="registerBtn" type="submit">注册</button>
            </form>
        </div>
    </div>
</div>
