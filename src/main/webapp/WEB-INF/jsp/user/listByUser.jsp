<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>


<%@include file="../include/nagivator.jsp" %>
<br>
<br>
<h3>我加入的班级</h3>
<table class="table table-hover">
    <c:forEach items="${list}" var="l">
        <tr>
            <td>班级名：${l.clazz.className}</td>
            <td>学院：
                <c:if test="${!empty l.clazz.academy}">
                    ${l.clazz.academy}
                </c:if>
            </td>
            <td>管理人：${l.clazz.admin.username}</td>
            <td>学校：${l.clazz.school.schoolName}</td>
        </tr>
        <tr>
            <td>班级描述：
                <c:if test="${!empty l.clazz.description}">
                    ${l.clazz.description}
                </c:if>
            </td>
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