<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">班级通讯录</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="listByUser">我加入的班级</a></li>
                <li><a href="listByAdmin">我管理的班级</a></li>
                <li><a href="#contact">浏览</a></li>
            </ul>
            <ul class="pull-right nav navbar-nav">
                <li>
                    <a href="user?userId=${pageContext.session.getAttribute("user").userId}">
                        ${pageContext.session.getAttribute("user").username}
                    </a></li>
                <li>
                    <a href="settings?userId=${pageContext.session.getAttribute("user").userId}" class="glyphicon glyphicon-cog">
                    </a>
                </li>
                <li><a href="logout">退出</a></li>
            </ul>
        </div>
    </div>
</nav>