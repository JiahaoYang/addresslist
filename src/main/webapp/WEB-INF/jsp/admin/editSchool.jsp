<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>
<%@include file="../include/nagivator.jsp" %>
<br>
<br>


<script>
    $(function () {
        $("#schoolName").blur(function () {
            var school = {"schoolName": $("#schoolName").val(), "oldName": $("#oldName").val()};
            $.ajax(
                {
                    url: "checkSchoolName_",
                    type: "post",
                    data: school,
                    success: function (data) {
                        if (data === "exist") {
                            $("#errorMessage").text("该学校名已被注册");
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

<div style="max-width:400px;margin:100px auto;">

    <div id="errorDiv" style="display:none" class="alert alert-danger alert-dismissable">
        <span id="errorMessage"></span>
    </div>

    <div class="tab-content">

        <div id="registerDiv" class="tab-pane fade in active">
            <h2 align="center">修改学校信息</h2>
        </div>
        <form method="post" action="editSchool">
            <br/>
            <br/>
            <input id="oldName" name="oldName" type="hidden" value="${school.schoolName}">
            <input  id="schoolName" name="schoolName" class="form-control"  placeholder="学校名称" required="required" value="${school.schoolName}">
            <br>
            <input name="description" class="form-control"  placeholder="学校描述（选填）" value="${school.description}">
            <br/>
            <input name="adminName" class="form-control" value="${school.admin.username}" readonly="readonly">
            <br>
            <br/>
            <button class="btn btn-lg btn-primary btn-block " id="registerBtn" type="submit">提交</button>
        </form>
    </div>
</div>