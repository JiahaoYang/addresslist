<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>


<%@include file="../include/nagivator.jsp" %>
<br>
<br>
<h3>发现新班级</h3>
<table class="table table-hover">
    <tr>
        <th>班级名</th>
        <th>所属学院</th>
        <th>所属学校</th>
        <th>管理人</th>
        <th>班级描述</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${classes}" var="c">
    <tr>
        <td>${c.clazz.className}</td>
        <td>
            <c:if test="${!empty c.clazz.academy}">
                ${c.clazz.academy}
            </c:if>
        </td>
        <td>${c.clazz.school.schoolName}</td>
        <td>${c.clazz.admin.username}</td>
        <td>
            <c:if test="${!empty c.clazz.description}">
                ${c.clazz.description}
            </c:if>
        </td>
        <td>
            <c:choose>
                <c:when test="${c.join}">已加入</c:when>
                <c:when test="${c.apply}">已申请</c:when>
                <c:when test="${!c.join}">
                    <a href="apply?toUser=${c.clazz.adminId}&refClass=${c.clazz.classId}">
                        <span class="glyphicon glyphicon-user">申请加入</span>
                    </a>
                </c:when>
            </c:choose>
        </td>
    </tr>
    </c:forEach>
</table>

<%@include file="../include/page.jsp" %>