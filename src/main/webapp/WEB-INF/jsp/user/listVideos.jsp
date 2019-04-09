<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>
<style>
    .webuploader-container {
        position: relative;
    }

    .webuploader-element-invisible {
        position: absolute !important;
        clip: rect(1px 1px 1px 1px); /* IE6, IE7 */
        clip: rect(1px, 1px, 1px, 1px);
    }

    .webuploader-pick {
        position: relative;
        display: inline-block;
        cursor: pointer;
        background: #00b7ee;
        padding: 10px 15px;
        color: #fff;
        text-align: center;
        border-radius: 3px;
        overflow: hidden;
    }

    .webuploader-pick-hover {
        background: #00a2d4;
    }

    .webuploader-pick-disable {
        opacity: 0.6;
        pointer-events: none;
    }

</style>

<script src="${pageContext.request.contextPath}/static/js/webuploader.js"></script>

<script>
    $(function () {
        var $list = $('#fileList'),
            // 优化retina
            ratio = window.devicePixelRatio || 1,
            // 缩略图大小
            thumbnailWidth = 100 * ratio,
            thumbnailHeight = 100 * ratio,
            // Web Uploader实例
            uploader;

        // 初始化Web Uploader
        uploader = WebUploader.create({
            // 自动上传。
            auto: false,
            // swf文件路径
            swf: 'static/js/Uploader.swf',
            // 文件接收服务端。
            server: 'uploadVideo?classId=' + ${classId},
            fileNumLimit: '1',  //文件总数量只能选择1个

            // 选择文件的按钮。可选。
            pick: {
                id: '#filePicker',  //选择文件的按钮
                multiple: false,
                label: '点击选择视频'
            },
            // 图片质量，只有type为`image/jpeg`的时候才有效。
            quality: 90,

            //限制传输文件类型，accept可以不写
            accept: {
                title: 'Videos',//描述
                extensions: 'mp4',
                mimeTypes: '.mp4'
            }
        });


        // 当有文件添加进来的时候，创建img显示缩略图使用
        uploader.on('fileQueued', function (file) {
            var $li = $(
                '<div id="' + file.id + '" class="file-item thumbnail">' +
                '<img>' +
                '<div class="info">' + file.name + '</div>' +
                '</div>'
                ),
                $img = $li.find('img');

            // $list为容器jQuery实例
            $list.empty();
            $list.append($li);

            // 创建缩略图
            // 如果为非图片文件，可以不用调用此方法。
            // thumbnailWidth x thumbnailHeight 为 100 x 100
            uploader.makeThumb(file, function (error, src) {
                if (error) {
                    $img.replaceWith('<span>不能预览</span>');
                    return;
                }
                $img.attr('src', src);
            }, thumbnailWidth, thumbnailHeight);
        });

        //文件上传过程中创建进度条实时显示。    uploadProgress事件：上传过程中触发，携带上传进度。 file文件对象 percentage传输进度 Nuber类型
        uploader.on('uploadProgress', function (file, percentage) {
            var $li = $('#' + file.id),
                $percent = $li.find('.progress span');

            // 避免重复创建
            if (!$percent.length) {
                $percent = $('<p class="progress"><span></span></p>')
                    .appendTo($li)
                    .find('span');
            }

            $percent.css('width', percentage * 100 + '%');
        });

        // 文件上传成功时候触发，给item添加成功class, 用样式标记上传成功。 file：文件对象，response：服务器返回数据
        uploader.on('uploadSuccess', function (file, response) {
            $('#' + file.id).addClass('upload-state-done');
            //console.info(response);
            $("#upInfo").html("<font id='imgPath' color='red'>" + response._raw + "</font>");
            window.location.reload();
        });

        // 文件上传失败                                file:文件对象 ， code：出错代码
        uploader.on('uploadError', function (file, code) {
            var $li = $('#' + file.id),
                $error = $li.find('div.error');

            // 避免重复创建
            if (!$error.length) {
                $error = $('<div class="error"></div>').appendTo($li);
            }

            $error.text('上传失败! ');
        });

        // 不管成功或者失败，文件上传完成时触发。 file： 文件对象
        uploader.on('uploadComplete', function (file) {
            $('#' + file.id).find('.progress').remove();
        });

        // 所有文件上传成功后调用
        uploader.on('uploadFinished', function () {
            //清空队列
            uploader.reset();
        });
        //只允许上传一个，每次文件加入队列前触发
        uploader.on('beforeFileQueued', function () {
            uploader.reset();
            uploader.refresh();
        });

        //绑定提交事件
        $("#btn").click(function () {
            console.log("上传...");
            uploader.upload();   //执行手动提交
        });

    });
</script>


<script>
    $(function () {
        $("#confirmDelete").click(function () {
            window.location.href = 'deleteVideo?videoId=' + $("#deleteImageId").val() + '&classId=' + $("#refClassId").val();
        })
    });

    function showDeleteModal(imageId, classId) {
        $("#deleteImageId").val(imageId);
        $("#refClassId").val(classId);
        $("#myModal").modal("show");
    }
</script>

<style>
    .clearfix li {
        list-style: none;
        float: left;
        width: 33.3%; /*三列图片排列*/
        height: 300px; /*当图片尺寸不一的时候，设置一个高度*/
    }

    li video {
        position: relative;
        width: 100%;
    }

    .clearfix:after {
        position: relative;
        content: '';
        display: block;
        width: 0;
        height: 0;
        visibility: hidden;
        clear: both;
    }
</style>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">确认删除该视频？</h4>
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
    <h1>视频站
        <small>记录美好生活</small>
    </h1>
</div>

<ul class="clearfix">
    <c:forEach items="${videos}" var="v" varStatus="s">
        <li>
            <c:if test="${isAdmin}">
                <button class="btn btn-danger"
                        onclick="showDeleteModal(${v.videoId}, ${v.refClass})">
                    删除
                </button>
            </c:if>
            <video controls="controls" width="320" height="240">
                <source src="${pageContext.request.contextPath}/static/video/class/${v.refClass}/${v.videoId}.${v.suffix}"
                        type='video/mp4'>
            </video>
            <br>
        </li>
    </c:forEach>
</ul>


<c:if test="${isAdmin}">
    <div style="max-width:400px;margin:100px auto;" align="center">
        <br>
        <br>
        <br>
        <h3>上传视频至班级</h3>
        <div>
            <div id="fileList" class="uploader-list"></div>
            <div id="upInfo"></div>
            <div id="filePicker">选择视频</div>
        </div>
        <br>
        <input type="button" id="btn" value="开始上传" class="btn btn-default">
    </div>
</c:if>