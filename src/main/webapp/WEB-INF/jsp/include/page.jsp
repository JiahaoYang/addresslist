<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<nav aria-label="Page navigation" style="text-align: center">
    <ul class="pagination">
        <%--<li <c:if test="${!page.previous}"> class="disabled" </c:if> >--%>
            <%--<a href="?start=0" aria-label="Previous">--%>
                <%--<span aria-hidden="true">«</span>--%>
            <%--</a>--%>
        <%--</li>--%>

        <%--<li <c:if test="${!page.previous}">class="disabled"</c:if>>--%>
            <%--<a href="?start=${page.start-page.count}" aria-label="Previous">--%>
                <%--<span aria-hidden="true">‹</span>--%>
            <%--</a>--%>
        <%--</li>--%>

        <c:forEach begin="0" end="${page.totalPage-1}" varStatus="status">
            <li <c:if test="${status.index*page.count==page.start}">class="disabled"</c:if>>
                <a
                        href="?start=${status.index*page.count}"
                        <c:if test="${status.index*page.count==page.start}">class="current"</c:if>
                >${status.count}</a>
            </li>

        </c:forEach>

        <%--<li <c:if test="${!page.next}">class="disabled"</c:if>>--%>
            <%--<a href="?start=${page.start+page.count}" aria-label="Next">--%>
                <%--<span aria-hidden="true">›</span>--%>
            <%--</a>--%>
        <%--</li>--%>
        <%--<li <c:if test="${!page.next}">class="disabled"</c:if>>--%>
            <%--<a href="?start=${page.last}" aria-label="Next">--%>
                <%--<span aria-hidden="true">»</span>--%>
            <%--</a>--%>
        <%--</li>--%>
    </ul>
</nav>