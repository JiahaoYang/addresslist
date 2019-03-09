<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>

<style>
    * {
        margin: 0;
        padding: 0;
    }

    html, body {
        background: #eee;
    }

    /*设置场景居中*/
    .wall {
        width: 1000px;
        height: 700px;
        position: fixed;
        top: 50%;
        margin-top: -350px;
        left: 50%;
        margin-left: -500px;
    }

    /*设置图片绝对定位，方便设置放置的位置，并设置所有属性的过渡时间为0.2s*/
    img {
        position: absolute;
        display: block;
        max-width: 300px;
        max-height: 300px;
        padding: 10px 10px 20px;
        background: #fff;
        border: 1px solid #ddd;
        -webkit-transition: 0.2s;
    }

    /*鼠标悬浮时设置大小放大到1.2倍，并摆正，即Z轴方向的旋转角度为0*/
    img:hover {
        -webkit-transform: scale(1.2) rotateZ(0);
        box-shadow: 10px 10px 5px #555;
        z-index: 2;
    }

    /*设置每个照片的位置和旋转角度*/
    .img1 {
        left: 0;
        top: 0;
        -webkit-transform: rotateZ(20deg);
    }

    .img2 {
        left: 280px;
        top: 0;
        -webkit-transform: rotateZ(5deg);
    }

    .img3 {
        left: 470px;
        top: 0;
        -webkit-transform: rotateZ(-10deg);
    }

    .img4 {
        left: 720px;
        top: 0;
        -webkit-transform: rotateZ(25deg);
    }

    .img5 {
        left: 220px;
        top: 200px;
        -webkit-transform: rotateZ(-2deg);
    }

    .img6 {
        left: 830px;
        top: 240px;
        -webkit-transform: rotateZ(-15deg);
    }

    .img7 {
        left: 490px;
        top: 190px;
        -webkit-transform: rotateZ(5deg);
    }

    .img8 {
        left: 80px;
        top: 430px;
        -webkit-transform: rotateZ(-5deg);
    }

    .img9 {
        left: 290px;
        top: 450px;
        -webkit-transform: rotateZ(5deg);
    }

    .img10 {
        left: 510px;
        top: 380px;
        -webkit-transform: rotateZ(-10deg);
    }

    .img11 {
        left: 760px;
        top: 500px;
        -webkit-transform: rotateZ(10deg);
    }

    .img12 {
        left: -100px;
        top: 250px;
        -webkit-transform: rotateZ(-5deg);
    }
</style>
<script>
    $(function () {
        $("#confirmDelete").click(function () {
            window.location.href = 'deleteImage?imageId=' + $("#deleteImageId").val() + '&classId=' + $("#refClassId").val();
        })
    });

    function showDeleteModal(imageId, classId) {
        $("#deleteImageId").val(imageId);
        $("#refClassId").val(classId);
        $("#myModal").modal("show");
    }
</script>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">确认删除该照片？</h4>
                <input id="deleteImageId" type="hidden" value="">
                <input id="refClassId" type="hidden" value="">
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                <button id="confirmDelete" class="btn btn-primary" type="button">确认</button>
            </div>
        </div>
    </div>
</div>

<%@include file="../include/nagivator.jsp" %>
<br>
<br>
<div class="page-header">
    <h1>照片墙
        <small>分享生活，留住感动</small>
    </h1>
</div>


<div class="wall">
    <c:forEach items="${images}" var="image" varStatus="s">
        <img src="${pageContext.request.contextPath}/static/img/class/${image.refClass}/${image.imageId}.${image.suffix}"
             class="img img${s.count}"
        <c:if test="${isAdmin}"> onclick="showDeleteModal(${image.imageId}, ${image.refClass})" </c:if>  >
    </c:forEach>
</div>