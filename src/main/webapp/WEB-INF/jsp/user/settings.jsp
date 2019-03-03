<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>
<script>
    $(function () {

        $("#oldPassword").blur(function () {
            var user = {"username": $("#name").val(), "password": $("#oldPassword").val()};
            $.ajax(
                {
                    url: "checkPassword",
                    type: "post",
                    data: user,
                    success: function (data) {
                        if (data === "wrong") {
                            $("#errorMessage").text("密码错误");
                            $("#errorDiv").show();
                            $("#editPasswordBtn").attr("disabled", true);

                        } else {
                            $("#errorDiv").hide();
                            $("#editPasswordBtn").attr("disabled", false);
                        }
                    }
                }
            )
        });
    });
</script>

<%@include file="../include/nagivator.jsp" %>
<br>
<br>

<div style="max-width:400px;margin:100px auto;">

    <div id="errorDiv" style="display:none" class="alert alert-danger alert-dismissable">
        <span id="errorMessage"></span>
    </div>

    <div class="tab-content">
        <div id="passwordDiv" class="tab-pane fade in active">
            <h2 align="center">修改密码</h2>
        </div>

        <form method="post" action="editPassword">
            <br/>
            <br/>
            <input id="name" name="username" type="hidden" value="${user.username}">
            <input type="password" id="oldPassword" name="oldPassword" class="form-control" placeholder="旧密码" required="required">
            <br>
            <input type="password" name="password" class="form-control" placeholder="新密码" required="required">
            <br/>
            <br/>
            <button class="btn btn-lg btn-primary btn-block " id="editPasswordBtn" type="submit">更新</button>
        </form>
    </div>
</div>
</div>