<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>
<%@include file="../include/nagivator.jsp" %>
<br>
<br>

<div style="max-width:400px;margin:100px auto;">

    <div id="errorDiv" style="display:none" class="alert alert-danger alert-dismissable">
        <span id="errorMessage"></span>
    </div>

    <div class="tab-content">

        <div id="registerDiv" class="tab-pane fade in active">
            <h2 align="center">编辑班级信息</h2>
        </div>
        <form method="post" action="editClass">
            <br/>
            <br/>
            <input name="classId" type="hidden" value="${clazz.classId}">
            <input id="className" name="className" class="form-control" value="${clazz.className}" placeholder="班级名称"
                   required="required">
            <br>
            <input name="academy" class="form-control" value="${clazz.academy}" placeholder="所属学院（选填）">
            <br>
            <input  name="schoolName" class="form-control" value="${clazz.school.schoolName}" readonly="readonly">
            <br>
            <input name="description" class="form-control" value="${clazz.description}" placeholder="班级描述（选填）">
            <br/>
            <br/>
            <button class="btn btn-lg btn-primary btn-block " id="registerBtn" type="submit">更新</button>
        </form>
    </div>
</div>
</div>