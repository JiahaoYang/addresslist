<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>
<script src="js/script.js"></script>
<script>
    $(function () {
        <c:if test="${!empty user.gender}">
        $("#gender").val("${user.gender}");
        </c:if>
    });
</script>

<script>
    $(function () {
        $("#username").blur(function () {
            var user = {"username": $("#username").val(), "oldName": $("#oldName").val()};
            $.ajax(
                {
                    url: "checkName_",
                    type: "post",
                    data: user,
                    success: function (data) {
                        if (data === "exist") {
                            $("#errorMessage").text("该用户名已被注册");
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

        <div id="registerDiv" class="tab-pane fade in active">
            <h2 align="center">编辑资料</h2>
            </div>
            <form method="post" action="editUser">
                <br/>
                <br/>
                <input name="userId" type="hidden" value="${user.userId}">
                <input id="oldName" name="oldName" type="hidden" value="${user.username}">
                <input id="username" name="username" class="form-control" value="${user.username}" placeholder="用户名"
                       required="required">
                <br>
                <input name="schoolName" class="form-control" value="${user.schoolName}" placeholder="就读高校（选填）">
                <br/>
                <select class="form-control" name="gender" id="gender">
                    <option value="">性别（选填）</option>
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
                <br>
                <input id="phone" name="phone" class="form-control" value="${user.phone}" placeholder="手机号（选填）">
                <br>
                <input name="address" class="form-control" value="${user.address}" placeholder="住址（选填）">
                <br/>
                <input type="date" name="birthday" class="form-control" value="${user.birthday}" placeholder="生日（选填）">
                <br>
                <textarea name="description" class="form-control" placeholder="个人描述（选填）">${user.description}</textarea>
                <br>
                <br/>
                <button class="btn btn-lg btn-primary btn-block " id="registerBtn" type="submit">提交</button>
            </form>
        </div>
    </div>
</div>