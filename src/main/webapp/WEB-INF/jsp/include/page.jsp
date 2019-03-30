<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<nav aria-label="Page navigation" style="text-align: center">
    <ul class="pagination">

        <c:forEach begin="0" end="${page.totalPage-1}" varStatus="status">
            <li <c:if test="${status.index*page.count==page.start}">class="disabled"</c:if>>
                <a
                        href="?start=${status.index*page.count}"
                        <c:if test="${status.index*page.count==page.start}">class="current"</c:if>
                >${status.count}</a>
            </li>

        </c:forEach>

    </ul>
</nav>