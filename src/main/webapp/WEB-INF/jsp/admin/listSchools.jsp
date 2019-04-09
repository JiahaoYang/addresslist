<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>


<%@include file="../include/nagivator.jsp" %>
<br>
<br>
<h3>学校管理</h3>
<a class="btn btn-success" href="addSchoolPage">新建学校</a>
<br>
<br>
<table class="table table-hover">
    <tr>
        <th>学校名</th>
        <th>管理人</th>
        <th>学校描述</th>
        <th>编辑</th>
    </tr>
    <c:forEach items="${schools}" var="s">
        <tr>
            <td>${s.schoolName}</td>
            <td>${s.admin.username}</td>
            <td>
                <c:if test="${!empty s.description}">
                    ${s.description}
                </c:if>
            </td>
            <td>
                <a href="editSchoolPage?schoolId=${s.schoolId}">
                    <span class="glyphicon glyphicon-edit"></span>
                </a>
            </td>
        </tr>
    </c:forEach>
</table>

<%@include file="../include/page.jsp" %>