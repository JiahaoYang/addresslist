$(function () {

    var $ = jQuery,
        $list = $('#fileList'),
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
        // 文件接收服务端。
        server: 'http://localhost:8080/editUserImage',
        fileNumLimit: '1',  //文件总数量只能选择1个

        // 选择文件的按钮。可选。
        pick: {
            id: '#filePicker',  //选择文件的按钮
            multiple: false,
            label: '点击选择图片'
        },
        // 图片质量，只有type为`image/jpeg`的时候才有效。
        quality: 90,

        //限制传输文件类型，accept可以不写
        accept: {
            title: 'Images',//描述
            extensions: 'gif,jpg,jpeg,png',//类型
            mimeTypes: '.gif,.jpg,.jpeg,.png'//mime类型
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

    // 文件上传过程中创建进度条实时显示。    uploadProgress事件：上传过程中触发，携带上传进度。 file文件对象 percentage传输进度 Nuber类型
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
        alert("上传成功");

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


    $("#username").blur(function () {
        var user = {"username": $("#username").val(), "oldName": $("#oldName").val()};
        $.ajax(
            {
                url: "checkName_",
                type: "post",
                data: user,
                success: function (data) {
                    if (data === "exist") {
                        $("#errorMessage").text("用户名已存在");
                        $("#errorDiv").show();
                        $("#editUserBtn").attr("disabled", true);

                    } else {
                        $("#errorDiv").hide();
                        $("#editUserBtn").attr("disabled", false);
                    }
                }
            }
        )
    });

    $("form.input").keyup(function () {
        $("#errorDiv").hide();
    });

    $("#phone").blur(function () {
        var reg = /^[1][3,4,5,7,8][0-9]{9}$/;
        var phone = $("#phone").val();
        if (phone !== "" && !reg.test(phone)) {
            $("#errorMessage").text("请填写正确的联系方式");
            $("#errorDiv").show();
            $("#registerBtn").attr("disabled", true);
        } else {
            $("#errorDiv").hide();
            $("#registerBtn").attr("disabled", false);
        }
    });

});