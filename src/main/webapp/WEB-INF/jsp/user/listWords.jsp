<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>


<%@include file="../include/nagivator.jsp" %>


<script>
    $(function () {
        $("#confirmDelete").click(function () {
            window.location.href = 'deleteWords?wordsId=' + $("#deleteClassId").val();
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
                <h4 class="modal-title">确认删除该留言？</h4>
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
<h2>留言板</h2>
<a class="btn btn-success" href="addWordsPage?classId=${classId}">留言</a>
<br>
<br>
<ul class="list-group">
    <c:forEach items="${words}" var="w">
        <li class="list-group-item">
            <h3><a href="listReplies?wordsId=${w.wordsId}" style='text-decoration:none;'>${w.title}</a></h3>
            <h5 style="zoom: 1;     color: #7a7a7a;">
                    ${w.user.username} &nbsp;&nbsp;&nbsp; ${w.leaveTime}
            </h5>
            <p>
                    ${w.content}
                <c:choose>
                    <c:when test="${w.clazz.adminId.equals(pageContext.session.getAttribute('user').userId)}">
                        <a><span class="glyphicon glyphicon-trash pull-right"
                                 onclick="showDeleteModal(${w.wordsId})"></span></a>
                    </c:when>
                    <c:when test="${w.userId.equals(pageContext.session.getAttribute('user').userId)}">
                        <a><span class="glyphicon glyphicon-trash pull-right"
                                 onclick="showDeleteModal(${w.wordsId})"></span></a>
                    </c:when>
                </c:choose>
            </p>
        </li>
        <br>
    </c:forEach>
</ul>