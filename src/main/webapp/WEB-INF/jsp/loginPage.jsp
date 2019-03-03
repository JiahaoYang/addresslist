<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="include/header.jsp" %>

<script>
    $(function () {
        <c:if test="${!empty msg}">
        $("#errorMessage").text("${msg}");
        $("#errorDiv").show();
        </c:if>
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
                <li><a href="#">登录</a></li>
                <li><a href="registerPage">注册</a></li>
            </ul>
        </div>
    </div>
</nav>

<div style="max-width:400px;margin:100px auto;">

    <div id="errorDiv" style="display:none" class="alert alert-danger alert-dismissable">
        <span id="errorMessage"></span>
    </div>

    <div class="tab-content">

        <div id="loginDiv" class="tab-pane fade in active">
            <div align="center">
                <img src="img/person.jpg">
            </div>
            <form method="post" action="login">
                <br>
                <br>
                <input name="username" class="form-control" placeholder="用户名" required="required">
                <br>
                <input type="password" name="password" class="form-control" placeholder="密码" required="required">

                <br/>
                <br/>
                <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
            </form>
        </div>
    </div>
</div>
