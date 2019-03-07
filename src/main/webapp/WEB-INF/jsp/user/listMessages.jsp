<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>

<style>
    .btn {
        margin-top: 45px;
    }
</style>


<script>
    $(function () {
        $("#confirmDelete").click(function () {
            window.location.href = 'deleteMessage?messageId=' + $("#deleteMessageId").val();
        })
    });

    function showDeleteModal(messageId) {
        $("#deleteMessageId").val(messageId);
        $("#myModal").modal("show");
    }
</script>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">确认删除该条信息？</h4>
                <input id="deleteMessageId" type="hidden" value="">
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                <button id="confirmDelete" class="btn btn-primary" type="button">确定</button>
            </div>
        </div>
    </div>
</div>

<%@include file="../include/nagivator.jsp" %>
<br>
<br>
<h3>通知</h3>
<br>
<br>
<c:forEach items="${messages}" var="m">
    <div class="col-md-8">
        <c:choose>

            <c:when test="${m.message.equals('申请')}">
                <div class="panel panel-primary">
                    <div class="panel-heading">申请</div>
                    <div class="panel-body">
                            ${m.fromUsername}申请加入${m.refClassName}
                        <div class="pull-right">
                            <a href="approve?messageId=${m.messageId}">
                                <span class="glyphicon glyphicon-ok">同意</span>
                            </a>
                            <a href="reject?messageId=${m.messageId}">
                                <span class="glyphicon glyphicon-remove">拒绝</span>
                            </a>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:when test="${m.message.equals('同意')}">
                <div class="panel panel-success">
                    <div class="panel-heading">同意</div>
                    <div class="panel-body">
                            ${m.fromUsername}同意了你加入${m.refClassName}的请求
                    </div>
                </div>
            </c:when>
            <c:when test="${m.message.equals('拒绝')}">
                <div class="panel panel-danger">
                    <div class="panel-heading">拒绝</div>
                    <div class="panel-body">
                            ${m.fromUsername}拒绝了你加入${m.refClassName}的请求
                    </div>
                </div>
            </c:when>
            <c:when test="${m.message.equals('退出')}">
                <div class="panel panel-warning">
                    <div class="panel-heading">退出</div>
                    <div class="panel-body">
                            ${m.fromUsername}退出了${m.refClassName}
                    </div>
                </div>
            </c:when>

        </c:choose>
    </div>
    <div class="col-md-2">
        <a id="deleteLink" class="btn btn-default btn-lg " onclick="showDeleteModal(${m.messageId})">删除</a>
    </div>
    <br>
    <br>
</c:forEach>
