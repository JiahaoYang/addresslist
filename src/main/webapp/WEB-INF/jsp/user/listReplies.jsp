<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>


<%@include file="../include/nagivator.jsp" %>


<script>
    $(function () {
        $("#confirmDelete").click(function () {
            window.location.href = 'deleteReply?replyId=' + $("#deleteClassId").val();
        })
    });

    function showDeleteModal(classId) {
        $("#deleteClassId").val(classId);
        $("#myModal").modal("show");
    }
</script>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">确认删除该条回复？</h4>
                <input id="deleteClassId" type="hidden" value="">
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                <button id="confirmDelete" class="btn btn-primary" type="button">提交</button>
            </div>
        </div>
    </div>
</div>

<br>
<br>
<h2><a href="listWords?classId=${w.classId}" style='text-decoration:none;'>留言板</a></h2>
<br>
<div class="panel panel-default">

    <!-- Default panel contents -->
    <div class="panel-heading">${w.title}</div>
    <div class="panel-body">
        <p class="lead">${w.user.username}：${w.content}</p>
    </div>
    <br>

    <!-- List group -->
    <ul class="list-group">
        <c:forEach items="${w.replys}" var="r">
            <li class="list-group-item">${r.user.username}：${r.content}
                <c:choose>
                    <c:when test="${w.clazz.adminId.equals(pageContext.session.getAttribute('user').userId)}">
                        <a><span class="glyphicon glyphicon-trash pull-right"
                                 onclick="showDeleteModal(${r.replyId})"></span></a>
                    </c:when>
                    <c:when test="${r.userId.equals(pageContext.session.getAttribute('user').userId)}">
                        <a><span class="glyphicon glyphicon-trash pull-right"
                                 onclick="showDeleteModal(${r.replyId})"></span></a>
                    </c:when>
                </c:choose>
            </li>
            <br>
        </c:forEach>
    </ul>
</div>
<br>
<br>

<div style="max-width:400px;margin:100px auto;">

    <div class="tab-content">

        <div id="registerDiv" class="tab-pane fade in active">
            <h3 align="left">回复</h3>
        </div>
        <form method="post" action="reply?wordsId=${w.wordsId}">
            <textarea name="content" class="form-control" rows="3" required="required"></textarea>
            <br>
            <button class="btn btn-primary btn-block " type="submit">回复</button>
        </form>
    </div>
</div>
