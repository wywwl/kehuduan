$.fn.scrollTo = function scrollTo(speed) {
    var container, offset, target;
    target = this;
    container = 'html,body';
    offset = $(target).offset().top;
    $(container).animate({
        scrollTop: offset
    }, speed || 1000);
    return this;
};
function randomnum(smin, smax) {
    var Range = smax - smin;
    var Rand = Math.random();
    return (smin + Math.round(Rand * Range));
}

function playzp() {
    if (running) {
        return;
    }
    running = true;
    $.ajax({
        url: "/user/play_big_wheel.htm",
        type: 'GET',
        dataType: 'json',
        cache: false,
        success: function (json) {
            if (json.error == "") {
                runzp(json);
            } else {
                alert(json.error);
            }
        }
    });
}

function runzp(json) {
    var returnobj = json.returnobj;
    var index = json.index;
    var remaind_play_wheel_number = json.remaind_play_wheel_number;

    var angle = 330;
    var message = "";
    var myreturn = new Object;
    if (returnobj != null) {// 有奖
        message = "牛牛恭喜你中奖了,得到";
        var angle0 = [344, 373];
        var angle1 = [226, 256];
        var angle2 = [109, 136];
        switch (index) {
            case 1:// 一等奖
                var r0 = randomnum(angle0[0], angle0[1]);
                angle = r0;
                break;
            case 2:// 二等奖
                var r1 = randomnum(angle1[0], angle1[1]);
                angle = r1;
                break;
            case 3:// 三等奖
                var r2 = randomnum(angle2[0], angle2[1]);
                angle = r2;
                break;
        }
        myreturn.niubi = returnobj.niubi;
        message += myreturn.niubi + "牛币";
    } else {// 没有
        message = "牛牛不要灰心请再接再厉,今天还剩" + remaind_play_wheel_number + "次";
        var angle3 = [17, 103];
        var angle4 = [197, 220];
        var angle5 = [259, 340];
        var r = randomnum(3, 5);
        switch (r) {
            case 3:
                var r3 = randomnum(angle3[0], angle3[1]);
                angle = r3;
                break;
            case 4:
                var r4 = randomnum(angle4[0], angle4[1]);
                angle = r4;
                break;
            case 5:
                var r5 = randomnum(angle5[0], angle5[1]);
                angle = r5;
                break;
        }
        myreturn.niubi = 0;
    }
    myreturn.angle = angle;
    myreturn.message = message;
    $(".rotate-con-zhen").rotate({
        duration: 3000,
        angle: 0,
        animateTo: 1440 + myreturn.angle,
        easing: $.easing.easeOutSine,
        callback: function () {
            alert(myreturn.message);
            var niubi_div = $("#niubi_count");
            var niubi = parseInt(niubi_div.text());
            if (myreturn.niubi > 0) {
                niubi = niubi + myreturn.niubi;
            }
            niubi_div.text(niubi);
            running = false;
        }
    });
    return myreturn;
}

var Zuidaima = {
    initizal: function () {
        Array.prototype.indexOf = function (elem, start) {
            for (var i = (start || 0), j = this.length; i < j; i++) {
                if (this[i] === elem) {
                    return i;
                }
            }
            return -1;
        };

        Array.prototype.contains = function (elem) {
            for (var i = 0; i < this.length; i++) {
                if (this[i] == elem) {
                    return true;
                }
            }
            return false;
        };

        Array.prototype.remove = function (elem) {
            var index = this.indexOf(elem);
            if (index != -1) {
                this.splice(index, 1);
            }
            return this;
        };

        if (typeof nav != "undefined") {
            $(nav).addClass("youarehere");
        }

        if (typeof download_error != "undefined") {
            alert(download_error);
        }

        // $('.datas .data .content img').fancyZoom({scaleImg: true,
        // closeOnClick: true});

        $("#mood_input").focus(function () {
            if ($(this).val() == $(this).attr("data_name")) {
                $(this).val("");
            }
        }).blur(function () {
            if ($(this).val() == "") {
                $(this).val($(this).attr("data_name"));
            }
        });

        $("#mood_publish").click(function () {
            $.ajax({
                url: "/user/weixin/bind_query.htm",
                type: 'GET',
                dataType: 'json',
                cache: false,
                success: function (json) {
                    var msg=json.msg;
                    var code=json.code;
                    if(code==0){//binded
                        $("#mood").submit();
                    }else{//need to bind
                        $("#ajax-modal").html(json.msg).modal('show');
                    }
                }
            });
        });

        $("#mood").submit(
            function () {
                var post_mood = $("#mood_publish");
                if (post_mood.hasClass('disabled')) {
                    return false;
                }
                if ($("#mood_input").val() == "") {
                    post_mood.text("发表").removeClass('disabled');
                    return false;
                }
                if ($("#mood_input").val() == $("#mood_input").attr(
                        "data_name")) {
                    post_mood.text("发表").removeClass('disabled');
                    return false;
                }
                if ($("#mood_input").val().length < 3
                    || $("#mood_input").val().length > 300) {
                    alert("描述在3到300个字之间");
                    editor.focus();
                    post_mood.text("发表").removeClass('disabled');
                    return false;
                }
                post_mood.text("提交中...").addClass('disabled');
                return true;
            });

        $(".project .topic").click(function () {
            $(".project .topic").removeClass("topic_hover");
            $(this).addClass("topic_hover");

            var name = $(this).text();
            var topics = $("#topics");
            topics.val(name);
        });

        $(".post_project").click(function () {
            $(".project").submit();
        });

        $(".select_file a").click(function () {
            $("#file").click();
        });

        $("#file").change(
            function () {
                var filePath = $(this).val();
                var idx = filePath.lastIndexOf("\\");
                if (idx != -1) {
                    filePath = filePath.substring(idx + 1);
                }
                $(".project .select_file_name,.mood .select_file_name")
                    .text("已选择文件：" + filePath);
            });

        $('.datas .data .show_all').click(function () {
            var show_for = $(this).attr("show_for");
            var content_detail = $("#" + show_for);
            var content = $("#" + show_for.replace("detail_", ""));
            if (content_detail.is(":visible")) {
                $(this).find("a").text("显示所有");
                content.show();
                content_detail.hide();
            } else {
                $(this).find("a").text("隐藏所有");
                content.hide();
                content_detail.show();
            }
        });
        $(".answer_delete").click(function () {
            if (confirm("确认删除代码么?")) {
                $("#file_info").remove();
                $("#select_file").show();
            }
        });

        $("#share")
            .submit(
                function () {
                    var create_submit = $("#create_submit");
                    if (create_submit.hasClass('disabled')) {
                        return false;
                    }
                    var title = $("#title");
                    if (title.val().length < 3
                        || title.val().length > 500) {
                        alert("标题在3到500个字之间");
                        title.focus();
                        create_submit.text("发表").removeClass('disabled');
                        return false;
                    }
                    var editor = $("#editor");
                    if (CKEDITOR.instances.editor.getData().length < 3
                        || CKEDITOR.instances.editor.getData().length > 500000) {
                        alert("描述在3到5万个字之间");
                        editor.focus();
                        create_submit.text("发表").removeClass('disabled');
                        return false;
                    }

                    var topics = $("#topics");
                    if (topics.val().length <= 0) {
                        alert("请至少选择1个话题");
                        topics.focus();
                        create_submit.text("发表").removeClass('disabled');
                        return false;
                    }
                    if (!confirm("无项目截图和运行截图审核不过还减牛币，确认提交吗?")) {
                        return false;
                    }
                    create_submit.text("提交中...").addClass('disabled');
                    $(window).unbind('beforeunload');
                    return true;
                });

        $("#question")
            .submit(
                function () {
                    var create_submit = $("#create_submit");
                    if (create_submit.hasClass('disabled')) {
                        return false;
                    }
                    var niubi = $("#niubi");
                    if (niubi.val() != "0" && !parseInt(niubi.val())) {
                        alert("牛币数必须是正整数");
                        niubi.focus();
                        create_submit.text("发表").removeClass('disabled');
                        return false;
                    }
                    if (niubi.val() <= 0) {
                        alert("最少1牛币");
                        niubi.focus();
                        create_submit.text("发表").removeClass('disabled');
                        return false;
                    }
                    var title = $("#title");
                    if (title.val().length < 3
                        || title.val().length > 500) {
                        alert("标题在3到500个字之间");
                        title.focus();
                        create_submit.text("发表").removeClass('disabled');
                        return false;
                    }
                    var editor = $("#editor");
                    if (CKEDITOR.instances.editor.getData().length < 3
                        || CKEDITOR.instances.editor.getData().length > 500000) {
                        alert("描述在3到5万个字之间");
                        editor.focus();
                        create_submit.text("发表").removeClass('disabled');
                        return false;
                    }

                    var topics = $("#topics");
                    if (topics.val().length <= 0) {
                        alert("请至少选择1个话题");
                        topics.focus();
                        create_submit.text("发表").removeClass('disabled');
                        return false;
                    }
                    if (!confirm("求代码，求jar包，求文档不通过还减牛币，确认提交吗?")) {
                        return false;
                    }
                    create_submit.text("提交中...").addClass('disabled');
                    $(window).unbind('beforeunload');
                    return true;
                });

        $("#blog").submit(
            function () {
                var create_submit = $("#create_submit");
                if (create_submit.hasClass('disabled')) {
                    return false;
                }
                var title = $("#title");
                if (title.val().length < 3
                    || title.val().length > 500) {
                    alert("标题在3到500个字之间");
                    title.focus();
                    create_submit.text("发表").removeClass('disabled');
                    return false;
                }
                var editor = $("#editor");
                if (CKEDITOR.instances.editor.getData().length < 3
                    || CKEDITOR.instances.editor.getData().length > 500000) {
                    alert("描述在3到5万个字之间");
                    editor.focus();
                    create_submit.text("发表").removeClass('disabled');
                    return false;
                }
                create_submit.text("提交中...").addClass('disabled');
                $(window).unbind('beforeunload');
                return true;
            });

        $("#explore").submit(function () {
            var content = $("#content");
            if (content.val().length < 3 || content.val().length > 100000) {
                alert("描述在3到5万个字之间");
                content.focus();
                return false;
            }
            return true;
        });

        $("#account").keypress(function (event) {
        }).focus(function (event) {
            if ($(this).val() == $(this).attr("data_name")) {
                $(this).val("");
            }
        });

        $("#password").keypress(function (event) {
            if (event.which != 13) {
                return;
            }
            $("#user .post").click();
        }).focus(function (event) {
            if ($(this).val() == $(this).attr("data_name")) {
                $(this).val("");
            }
        });

        $("#user #login")
            .click(
                function () {
                    if ($("#account").val() == $("#account").attr(
                            "data_name")) {
                        $("#user .error").text("邮箱格式错误").show();
                        $("#account").focus();
                        return;
                    }
                    if ($("#account").val().indexOf("@") == -1) {
                        $("#user .error").text("邮箱格式错误").show();
                        $("#account").focus();
                        return;
                    }
                    if ($("#password").val() == ""
                        || $("#password").val() == $("#password")
                            .attr("data_name")) {
                        $("#user .error").text("密码不能为空").show();
                        $("#password").focus();
                        return;
                    }
                    $("#user").submit();
                });


        $("#user #create").click(
            function () {
                var send_mail = $("#send_mail");
                if (send_mail.hasClass('disabled')) {
                    return false;
                }
                if ($("#name").val() == "" || $("#name").val() == $("#name").attr("data_name")) {
                    $("#user .error").text("用户名不能为空").show();
                    $("#name").focus();
                    send_mail.text("发送验证邮件").removeClass('disabled');
                    return;
                }
                if ($("#email").val() == ""
                    || $("#email").val() == $("#email").attr(
                        "data_name")) {
                    $("#user .error").text("邮箱不能为空").show();
                    $("#email").focus();
                    send_mail.text("发送验证邮件").removeClass('disabled');
                    return;
                }
                if ($("#email").val().indexOf("@") == -1) {
                    $("#user .error").text("邮箱格式错误").show();
                    $("#email").focus();
                    send_mail.text("发送验证邮件").removeClass('disabled');
                    return;
                }
                if ($("#email").val().indexOf("@qq.com") != -1&&$("#email").val().indexOf("www")!=-1) {
                    $("#user .error").text("邮箱格式错误,qq邮箱正确格式：QQ号@qq.com").show();
                    $("#email").focus();
                    send_mail.text("发送验证邮件").removeClass('disabled');
                    return;
                }
                if ($("#password").val() == ""
                    || $("#password").val() == $("#password").attr(
                        "data_name")) {
                    $("#user .error").text("密码不能为空").show();
                    $("#password").focus();
                    send_mail.text("发送验证邮件").removeClass('disabled');
                    return;
                }

                if ($("#password_chk").val() == ""
                    || $("#password_chk").val() == $("#password_chk").attr(
                        "data_name")) {
                    $("#user .error").text("密码确认不能为空").show();
                    $("#password_chk").focus();
                    send_mail.text("发送验证邮件").removeClass('disabled');
                    return;
                }

                if ($("#password_chk").val() != $("#password_chk").val()) {
                    $("#user .error").text("两次输入密码不一致").show();
                    send_mail.text("发送验证邮件").removeClass('disabled');
                    return;
                }

                send_mail.text("提交中...").addClass('disabled');
                $("#user").submit();
            });

        $("#name,#email,#password,#account").keypress(function (event) {
        }).focus(function (event) {
            if ($(this).val() == $(this).attr("data_name")) {
                $(this).val("");
            }
        });

        $("#find").click(
            function () {
                if ($("#email").val() == ""
                    || $("#email").val() == $("#email").attr(
                        "data_name")) {
                    $("#user .error").text("邮箱不能为空").show();
                    $("#email").focus();
                    return;
                }
                $("#user").submit();
            });

        $('.post_comment').click(
            function () {
                var post_comment = $(this);
                var id = $(this).attr("id");
                var ids = id.split("__");
                var commentsId = ids[0];
                var type = ids[1];
                var source_id = ids[2];
                var editor = eval("CKEDITOR.instances.editor_" + type + "_"
                    + source_id);
                if (editor.getData() == "") {
                    alert("请输入评论内容");
                    return;
                }
                var template = $('#comment_template').html();
                if (post_comment.find("a").hasClass('disabled')) {
                    return;
                }
                post_comment.find("a").text("提交中...").addClass('disabled');
                $.ajax({
                    url: "/comment/create.htm",
                    type: 'POST',
                    dataType: 'json',
                    timeout: 5000,
                    cache: false,
                    data: {
                        content: editor.getData(),
                        type: type,
                        source_id: source_id
                    },
                    success: function (json) {
                        if (json.error == "") {
                            var html = Mustache.to_html(template,
                                json.comment).replace(/^\s*/mg, '');
                            $("#" + commentsId + " .datas").append(html);
                            editor.setData("");
                        } else {
                            alert(json.error);
                        }
                        post_comment.find("a").text("评论").removeClass(
                            'disabled');
                    }
                });
            });

        $('.post_comment_no_editor').click(
            function () {
                var post_comment = $(this);
                var type = $(this).attr("type");
                var source_id = $(this).attr("source_id");
                var content = $("#content_" + source_id);
                var comments_content = $("#comments_content_" + source_id);
                if (content.val() == "") {
                    alert("请输入评论内容");
                    return;
                }
                var template = $('#comment_template').html();
                if (post_comment.hasClass('disabled')) {
                    return;
                }
                post_comment.find("a").text("提交中...").addClass('disabled');
                $.ajax({
                    url: "/comment/create.htm",
                    type: 'POST',
                    dataType: 'json',
                    timeout: 5000,
                    cache: false,
                    data: {
                        content: content.val(),
                        type: type,
                        source_id: source_id
                    },
                    success: function (json) {
                        if (json.error == "") {
                            var html = Mustache.to_html(template,
                                json.comment).replace(/^\s*/mg, '');
                            comments_content.append(html);
                            content.val("");
                        } else {
                            alert(json.error);
                        }
                        post_comment.find("a").text("评论").removeClass(
                            'disabled');
                    }
                });
            });

        $('.reply').click(
            function () {
                var content_id = $(this).attr("content_id");
                var editor_id = $(this).attr("editor_id");
                var name = $(this).attr("name");
                eval("var editor=CKEDITOR.instances." + editor_id);
                var content = $("#" + content_id);
                var data = editor.getData();
                editor.setData("回复@" + name + " 说：");
                var ckeid = editor_id.replace("editor_", "");
                $("#cke_editor_" + ckeid).scrollTo(100).focus();
            });

        $(document).on("click", ".reply_no_editor", function () {
            var content_id = $(this).attr("content_id");
            var content = $("#" + content_id);
            var textarea_id = $(this).attr("textarea_id");
            var textarea = $("#" + textarea_id);
            var name = $(this).attr("name");
            var data = textarea.val();
            if(data==""){
                data="@" + name+":";
            }else{
                data+=" @" + name+":";
            }
            textarea.val(data);
            textarea.scrollTo(100).focus();
        });

        $('.datas .data .project_comments_count').click(function () {
            var id = $(this).attr("id").replace("project_comments_count_", "");
            var comment = $("#project_comments_" + id);
            // comment.scrollTo(100).focus();
            if (comment.is(":visible")) {
                comment.hide();
            } else {
                comment.show();
            }
        });
        $(document).on("click", ".datas .comments_list", function () {
            var target_id = $(this).attr("content_id");
            var comments_list = $("#comments_list_" + target_id);
            var comments_content = $("#comments_content_" + target_id);
            var comment_id = $(this).attr("comment_id");
            var type = $(this).attr("type");
            var request = true;
            if (comment_id == 0) {
                if (comments_list.is(":visible")) {
                    comments_list.hide();
                } else {
                    comments_list.show();
                }
                if (comments_content.html() != "") {
                    request = false;
                }
            } else {
                $(this).remove();
            }
            if (request) {
                $.ajax({
                    url: "/comment.htm",
                    type: 'GET',
                    cache: false,
                    data: {
                        type: type,
                        target_id: target_id,
                        comment_id: comment_id
                    },
                    success: function (html) {
                        if (comments_content.html() == "") {
                            comments_content.html(html);
                        } else {
                            comments_content.append(html);
                        }
                    }
                });
            }
        });

        $("#user_name").keypress(function (event) {
        }).focus(function (event) {
            if ($(this).val() == $(this).attr("data_name")) {
                $(this).val("");
            }
        });

        $(".post_message")
            .click(
                function () {
                    var create_submit = $("#create_submit");
                    if (create_submit.hasClass('disabled')) {
                        return false;
                    }
                    var editor = $("#editor");
                    var content="";
                    if(CKEDITOR.instances.editor){
                        content=CKEDITOR.instances.editor.getData();
                    }else{
                        content=editor.val();
                    }
                    if (content.length < 3 || content.length > 100000) {
                        alert("描述在3到5万个字之间");
                        editor.focus();
                        create_submit.text("发送").removeClass('disabled');
                        return;
                    }
                    var account = $("#account").val();
                    if ($(this).hasClass('disabled')) {
                        return;
                    }
                    create_submit.text("提交中...").addClass('disabled');
                    $.ajax({
                        url: "/message/create.htm",
                        dataType: 'json',
                        cache: false,
                        timeout: 5000,
                        data: {
                            content: content,
                            account: account
                        },
                        success: function (json) {
                            if (json.error == "") {
                                window.location.reload();
                            } else {
                                alert(json.error);
                            }
                        },
                        complete: function (XMLHttpRequest, status) { //请求完成后最终执行参数
                            if (status == 'timeout') {//超时,status还有success,error等值的情况
                                alert("发表私信失败，请稍后重试");
                            }
                            create_submit.text("发送").removeClass(
                                'disabled');
                        }
                    });
                });

        $('.collect').click(function () {
            var id = $(this).attr("content_id");
            $.ajax({
                url: "/project/" + id + "/collect/create.htm",
                type: 'GET',
                dataType: 'json',
                cache: false,
                success: function (json) {
                    if (json.error == "") {
                        window.location.reload();
                    } else {
                        alert(json.error);
                    }
                }
            });
        });

        $('.collect_remove').click(function () {
            var id = $(this).attr("content_id");
            $.ajax({
                url: "/project/" + id + "/collect/remove.htm",
                type: 'GET',
                dataType: 'json',
                cache: false,
                success: function (json) {
                    if (json.error == "") {
                        window.location.reload();
                    } else {
                        alert(json.error);
                    }
                }
            });
        });

        $('.remove').click(function () {
            if (!confirm("确认删除么?")) {
                return;
            }
            var id = $(this).attr("content_id");
            $.ajax({
                url: "/project/" + id + "/delete.htm",
                type: 'GET',
                dataType: 'json',
                cache: false,
                success: function (json) {
                    if (json.error == "") {
                        window.location = "/share.htm";
                    } else {
                        alert(json.error);
                    }
                }
            });
        });

        $(".download").click(function () {
            var id = $(this).attr("content_id");
            $.ajax({
                url: "/code/" + id + "/is_downloaded.htm",
                type: 'GET',
                cache: false,
                dataType: 'json',
                success: function (json) {
                    $("#ajax-modal").html(json.msg).modal('show');
                },
                complete: function () {
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                }
            });
        });

        remind = function (uuid, uid) {
            $.ajax({
                url: "/user/reminds.htm?uuid=" + uuid + "&uid=" + uid,
                type: 'GET',
                dataType: 'json',
                cache: false,
                success: function (json) {
                    if (json.error != "") {
                        return;
                    }
                    if (json.remindDescs.length == 0) {
                        return;
                    }
                    $(".remind_count").hide().text("0");
                    var remind_count=0;
                    for(var i=0;i<json.remindDescs.length;i++){
                        var remindDesc=json.remindDescs[i];
                        remind_count+=remindDesc.remind.count;
                        $("#remind_count_"+remindDesc.remind.type).show().text(remindDesc.remind.count);
                    }
                    if(remind_count==0){
                        $("#remind_count").hide().text(remind_count);
                    }else{
                        $("#remind_count").show().text(remind_count);
                    }
                }
            });
        };

        $('.reply_message').click(
            function () {
                var content_id = $(this).attr("content_id");
                var name = $(this).attr("user_name");
                var editor = CKEDITOR.instances.editor;
                var content = $("#" + content_id);
                editor.setData("回复@" + name + " 说：");
                $("#account").val(name);
                $("#cke_editor").scrollTo(100).focus();
            });

        $('.remove_message').click(function () {
            if (!confirm("确认删除么?")) {
                return;
            }
            var id = $(this).attr("content_id");
            $.ajax({
                url: "/post/" + id + "/remove.htm",
                type: 'GET',
                dataType: 'json',
                cache: false,
                success: function (json) {
                    if (json.error == "") {
                        window.location.reload();
                    } else {
                        alert(json.error);
                    }
                }
            });
        });

        $("#update_user").click(function () {
            if ($("#name").val() == $("#name").attr("data_name")) {
                $("#user .error").text("用户名不能为空").show();
                $("#name").focus();
                return;
            }
            $("#user").submit();
        });

        $("#update_avatar").click(function () {
            if ($("#avatarUrl").val() == "") {
                $("#user .error").text("请上传头像").show();
                $("#avatarUrl").focus();
                return;
            }
            $("#user").submit();
        });

        $("#update_password").click(function () {
            if ($("#password").val() == $("#password").attr("data_name")) {
                $("#user .update_error").text("密码不能为空").show();
                $("#password").focus();
                return;
            }
            $("#user").submit();
        });

        $("#update_email").click(function () {
            $("#user").submit();
        });

        $('.follow').click(
            function () {
                var id = $(this).attr("content_id");
                var follow = $(this);
                $.ajax({
                    url: "/user/follow/create.htm",
                    type: 'GET',
                    dataType: 'json',
                    cache: false,
                    data: "uuid=" + id + "",
                    success: function (json) {
                        if (json.error == "") {
                            follow.unbind("click").removeClass("follow")
                                .addClass("follow_remove").text("已关注");
                        } else {
                            alert(json.error);
                        }
                    }
                });
            });

        $('.follow_remove').click(
            function () {
                var id = $(this).attr("content_id");
                var follow_remove = $(this);
                $.ajax({
                    url: "/user/follow/remove.htm",
                    type: 'GET',
                    dataType: 'json',
                    cache: false,
                    data: "uuid=" + id + "",
                    success: function (json) {
                        if (json.error == "") {
                            follow_remove.unbind("click").removeClass(
                                "follow").addClass("follow_remove")
                                .text("关注");
                        } else {
                            alert(json.error);
                        }
                    }
                });
            });

        $(".icon-search").click(function () {
            var e = jQuery.Event("keypress");
            e.keyCode = 13;
            e.which = 13;
            $("#search").trigger(e);
        });

        $("#search").focus(function () {
            if ($(this).val() == $(this).attr("placeholder")) {
                $(this).val("");
            }
        }).blur(function () {
            if ($(this).val() == "") {
                $(this).val($(this).attr("placeholder"));
            }
        }).keypress(function (event) {
            if (event.which != 13) {
                return;
            }
            var key = $("#search").val();
            if (key == "") {
                return;
            }
            if (key == $(this).attr("placeholder")) {
                return;
            }
//			var url = "http://www.baidu.com/s?wd=" + encodeURIComponent(key) + " site:www.zuidaima.com&pn=1&ie=utf-8";
//			window.open(url, "_blank");
            var url = "/share/k" + encodeURIComponent(key) + "-p1-s1.htm";
            window.location.href = url;
        });

        var upload_avatar_file = $('#upload_avatar_file');
        var processInterval = null;

        function process() {
            $.ajax({
                url: "/process.htm",
                type: 'GET',
                dataType: 'html',
                cache: false,
                success: function (html) {
                    if (html == "") {
                        clearInterval(processInterval);
                        return;
                    }
                    $("#bar").css("width", html + "%");
                }
            });
        }

        if (upload_avatar_file.length > 0) {
            new AjaxUpload(upload_avatar_file, {
                action: '/upload.htm',
                name: 'file',
                data: {
                    type: "image",
                    max_size: "20480"
                },
                responseType: "json",
                onSubmit: function (file, ext) {
                    $(".progress").show();
                    processInterval = setInterval(process, 100);
                },
                onComplete: function (file, response) {
                    if (response.error != 0) {
                        alert(response.message);
                        return;
                    }
                    $("#upload_avatar_image").html(
                        "<img src='http://static.zuidaima.com/"
                        + response.url
                        + "' width='48px' height='48px'/>");
                    $("#avatarUrl").val(response.url);
                    clearInterval(processInterval);
                    $(".progress").hide();
                }
            });
        }

        // 页面浮动面板
        $("#floatPanel > .ctrolPanel > a.arrow").eq(0).click(function () {
            $("html,body").animate({
                scrollTop: 0
            }, 800);
            return false;
        });
        $("#floatPanel > .ctrolPanel > a.arrow").eq(1).click(function () {
            $("html,body").animate({
                scrollTop: $(document).height()
            }, 800);
            return false;
        });

        var objPopPanel = $("#floatPanel > .popPanel");
        var w = objPopPanel.outerWidth();

        $("#floatPanel > .ctrolPanel > a.qrcode").bind({
            mouseover: function () {
                objPopPanel.css("width", "0px").show();
                objPopPanel.animate({
                    "width": w + "px"
                }, 800);
                return false;
            },
            mouseout: function () {
                objPopPanel.animate({
                    "width": "0px"
                }, 300);
                return false;
                objPopPanel.css("width", w + "px");
            }
        });

        $("#jar").keypress(function (event) {
            if (event.which != 13) {
                return;
            }
            $("#jar_search").click();
        });

        $("#jar_search").click(function () {
            var jar = $("#jar");
            if (jar.val() == "") {
                alert("请输入jar包");
                return;
            }
            window.location.href = "/jar/search/" + jar.val() + ".htm";
        });

        var timeout;
        $('.profile').hover(function () {
            pos = $(this).offset();
            var content_id = $(this).attr("content_id");
            timeout = setTimeout(function () {
                $('.hovercard_' + content_id).fadeIn().css({
                    'top': pos.top - 20 + 'px', // subtract 20px to account
                    // for padding
                    'left': pos.left - 20 + 'px'
                });
            }, 500);
        }, function () {
            clearTimeout(timeout);
        });

        $('.hovercard').mouseleave(function () {
            $('.hovercard').fadeOut();
        });

        $('#myTab a').click(function (e) {
            e.preventDefault();
            $(this).tab('show');
        });

        $("#post_answer").click(function () {
            if ($(this).hasClass('disabled')) {
                return;
            }
            $(this).text("提交中...").addClass('disabled');
            $("#answer").submit();
        });

        $("#answer")
            .submit(
                function () {
                    var editor = $("#editor");
                    if (CKEDITOR.instances.editor.getData().length < 3
                        || CKEDITOR.instances.editor.getData().length > 100000) {
                        alert("描述在3到5万个字之间");
                        editor.focus();
                        return false;
                    }
                    return true;
                });

        $('.is_perfect').click(function () {
            if (!confirm("确认设为最佳答案么?注意:设置后不可以再设置")) {
                return;
            }
            var id = $(this).attr("content_id");
            $.ajax({
                url: "/answer/" + id + "/is_perfect.htm",
                type: 'GET',
                dataType: 'json',
                cache: false,
                success: function (json) {
                    if (json.error == "") {
                        window.location.reload();
                    } else {
                        alert(json.error);
                    }
                }
            });
        });

        function changeBackgroundColor(obj, color) {
            obj.animate({
                backgroundColor: color
            });
        }

        $('.editabled').click(function () {
            var id = $(this).attr("content_id");
            var answer = $("#" + id);
            var old_bgc = answer.css("background-color");
            $(answer).scrollTo(500).focus();
            changeBackgroundColor(answer, "#FFFF00");
            setTimeout(changeBackgroundColor(answer, old_bgc), 3000);
        });
        $("#topic_nav li").hover(function () {
            $(this).find("ul").slideDown("slow");
        }, function () {
            $(this).find("ul").slideUp("fast");
        });

        $('.like').click(function () {
            var id = $(this).attr("content_id");
            var type = $(this).attr("type");
            $.ajax({
                url: "/event/like-" + type + "/" + id + ".htm",
                type: 'GET',
                dataType: 'json',
                cache: false,
                success: function (json) {
                    if (json.error == "") {
                        var like_count_obj = $("#like_count_" + id);
                        var like_count = 1;
                        if (like_count_obj.text() != "") {
                            like_count = parseInt(like_count_obj.text());
                            like_count++;
                        }
                        like_count_obj.text(" " + like_count);
                    } else {
                        alert(json.error);
                    }
                }
            });
        });

        $('.dislike').click(function () {
            var id = $(this).attr("content_id");
            var type = $(this).attr("type");
            $.ajax({
                url: "/event/dislike-" + type + "/" + id + ".htm",
                type: 'GET',
                dataType: 'json',
                cache: false,
                success: function (json) {
                    if (json.error == "") {
                        var dislike_count_obj = $("#dislike_count_" + id);
                        var dislike_count = 1;
                        if (dislike_count_obj.text() != "") {
                            dislike_count = parseInt(dislike_count_obj.text());
                            dislike_count++;
                        }
                        dislike_count_obj.text(" " + dislike_count);
                    } else {
                        alert(json.error);
                    }
                }
            });
        });

        $(".answer_data").mouseover(function () {
            $(this).find(".is_perfect").show();
        }).mouseout(function () {
            $(this).find(".is_perfect").hide();
        });

        $("#nav_buy").click(function () {
            if ($(this).hasClass('disabled')) {
                return;
            }
            $(this).addClass('disabled');
            $.ajax({
                url: "/user/pay.htm",
                type: 'GET',
                cache: false,
                success: function (html) {
                    $("#ajax-modal").html(html).modal('show');
                },
                complete: function () {
                    $("#nav_buy").removeClass("disabled");
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                }
            });
        });

        $(document).on("click", "#user #login_check", function () {
            var error = $("#user .error");
            error.hide();
            if ($("#account").val() == $("#account").attr("data_name")) {
                error.text("邮箱格式错误").show();
                $("#account").focus();
                $("#user #login_check").removeAttr("disabled");
                return;
            }
            if ($("#account").val().indexOf("@") == -1) {
                error.text("邮箱格式错误").show();
                $("#account").focus();
                $("#user #login_check").removeAttr("disabled");
                return;
            }
            if ($("#password").val() == ""
                || $("#password").val() == $("#password").attr(
                    "data_name")) {
                error.text("密码不能为空").show();
                $("#password").focus();
                $("#user #login_check").removeAttr("disabled");
                return;
            }
            $("#user #login_check").attr("disabled", "disabled");
            $.ajax({
                url: "/user/login_check.htm",
                type: 'POST',
                dataType: 'json',
                data: {
                    account: $("#account").val(),
                    password: $("#password").val(),
                },
                cache: false,
                success: function (json) {
                    $("#user #login_check").removeAttr("disabled");
                    if (json.code == 0) {
                        window.location.reload(true);
                    } else {
                        error.text(json.msg).show();
                    }
                }
            });
        });

        $(".reward").click(function () {
            var id = $(this).attr("content_id");
            $.ajax({
                url: "/project/" + id + "/reward.htm",
                type: 'GET',
                cache: false,
                dataType: 'json',
                success: function (json) {
                    $("#ajax-modal").html(json.msg).modal('show');
                },
                complete: function () {
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                }
            });
        });

        $(".reward_code").click(function(){
            $('.reward').trigger("click");
        });

        $(".download_code").click(function(){
            $('.download').trigger("click");
        });

        $('.activity a').click(function () {
            var error = $('#course .error');
            error.hide();
            var content_id = $(this).attr('content_id');
            $('#course #join').attr('disabled', 'disabled');
            $.ajax({
                url: '/activity/' + content_id + '/join.htm',
                type: 'POST',
                dataType: 'json',
                cache: false,
                success: function (json) {
                    $('#ajax-modal').html(json.msg).modal('show');
                }
            });
        });

        bind_weixin_query=function () {
            $.ajax({
                url: '/user/weixin/bind_query.htm',
                type: 'GET',
                dataType: 'json',
                cache: false,
                success: function (json) {
                    var msg = json.msg;
                    var code = json.code;
                    if (code == 0) {
                        $('#ajax-modal').modal('hide');
                        $('#mood').submit();
                        window.location.reload(true);
                    }
                }
            });
        }
    }
}