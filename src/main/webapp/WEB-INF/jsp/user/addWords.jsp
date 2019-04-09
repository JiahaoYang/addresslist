<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>
<%@include file="../include/nagivator.jsp" %>
<br>
<br>

<div style="max-width:400px;margin:100px auto;">

    <div class="tab-content">

        <div id="registerDiv" class="tab-pane fade in active">
            <h2 align="center">留言</h2>
        </div>
        <form method="post" action="addWords?classId=${classId}">
            <br/>
            <br/>
            <input name="title" class="form-control" placeholder="主题" required="required">
            <br>
            <textarea name="content" class="form-control" rows="3" required="required" placeholder="内容"></textarea>
            <br/>
            <br/>
            <button class="btn btn-lg btn-primary btn-block " id="registerBtn" type="submit">提交</button>
        </form>
    </div>
</div>