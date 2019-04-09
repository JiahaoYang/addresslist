<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>


<script>
    $(function () {
        $("#confirmDelete").click(function () {
            window.location.href = 'deleteClass?classId=' + $("#deleteClassId").val();
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
                <h4 class="modal-title">确认解散该班级？</h4>
                <input id="deleteClassId" type="hidden" value="">
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                <button id="confirmDelete" class="btn btn-primary" type="button">提交</button>
            </div>
        </div>
    </div>
</div>

<%@include file="../include/nagivator.jsp" %>
<br>
<br>
<h3>我管理的班级</h3>
<a class="btn btn-success" href="addClassPage">新建班级</a>
<table class="table table-hover">
    <c:forEach items="${list}" var="l">
        <tr>
            <td>班级名：${l.clazz.className}</td>
            <td>所属学院：
                <c:if test="${!empty l.clazz.academy}">
                    ${l.clazz.academy}
                </c:if>
            </td>
            <td>管理人：${l.clazz.admin.username}</td>
            <td>所属学校：${l.clazz.school.schoolName}</td>
            <td>
                编辑：
                <a href="editClassPage?classId=${l.clazz.classId}">
                    <span class="glyphicon glyphicon-edit"></span>
                </a>
            </td>
            <td>
                解散：
                <a id="deleteLink">
                    <span class="glyphicon glyphicon-trash" onclick="showDeleteModal(${l.clazz.classId})">
                </span></a>
            </td>
        </tr>
        <tr>
            <td>班级描述：
                <c:if test="${!empty l.clazz.description}">
                    ${l.clazz.description}
                </c:if>
            </td>
            <td></td>
            <td></td>
            <td><a class="btn btn-info" href="listImages?classId=${l.clazz.classId}" role="button">照片墙</a></td>
            <td><a class="btn btn-primary" href="listWords?classId=${l.clazz.classId}" role="button">留言板</a></td>
            <td><a class="btn btn-default" href="listVideos?classId=${l.clazz.classId}" role="button">视频站</a></td>
        </tr>
        <tr>
            <th>姓名</th>
            <th>性别</th>
            <th>生日</th>
            <th>学校</th>
            <th>联系方式</th>
            <th>地址</th>
            <th>个人描述</th>
        </tr>
        <br>
        <br>
        <c:forEach items="${l.users}" var="u">
            <tr>
                <td>${u.username}</td>
                <td>
                    <c:if test="${!empty u.gender}">
                        ${u.gender}
                    </c:if>
                </td>
                <td>
                    <c:if test="${!empty u.birthday}">
                        ${u.birthday}
                    </c:if>
                </td>
                <td>
                    <c:if test="${!empty u.schoolName}">
                        ${u.schoolName}
                    </c:if>
                </td>
                <td>
                    <c:if test="${!empty u.phone}">
                        ${u.phone}
                    </c:if>
                </td>
                <td>
                    <c:if test="${!empty u.address}">
                        ${u.address}
                    </c:if>
                </td>
                <td>
                    <c:if test="${!empty u.description}">
                        ${u.description}
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </c:forEach>
</table>

<%@include file="../include/page.jsp" %>