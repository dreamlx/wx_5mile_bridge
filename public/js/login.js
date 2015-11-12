$(document).ready(function() {
    $("#register").click(function(){
        window.location.href="register.html";
    })

    $("#submit").click(function(){
        var mobile = $.trim($("#username").val());
        if (!mobile) {
            showMyToast("请输入手机号",1000);
            return;
        }
        if( !/^(1[3-8][0-9])\d{8}$/.test(mobile)){
            showMyToast("请输入正确的手机号",1000);
            return;
        }
        var password = $.trim($("#password").val());
        if (!password) {
            showMyToast("请输入密码",1000);
            return;
        }
        var url="http://218.244.129.63:8082/api/sessions"
        $.ajax({
            url:url,
            type:"post",
            dataType:"json",
            data:{"user[cell]":mobile,"user[password]":password,},
            success:function(data){
                putCookie(data);
                showMyToast("登入成功！",2000);

            },
            error:function(e){
                showMyToast("登入失败!用户名或密码错误",2000);
            }
        })
    })


    function putCookie(data){
        $.cookie('id', data.user.id, { expires: 7, path: '/' });
        $.cookie('cell', data.user.cell, { expires: 7, path: '/' });
        $.cookie('name', data.user.name, { expires: 7, path: '/' });
        $.cookie('address', data.user.address, { expires: 7, path: '/' });
        $.cookie('gender', data.user.gender, { expires: 7, path: '/' });
        $.cookie('id_no', data.user.id_no, { expires: 7, path: '/' });
        $.cookie('card_no', data.user.card_no, { expires: 7, path: '/' });
        $.cookie('doctor_id', data.user.doctor_id, { expires: 7, path: '/' });
        $.cookie('token', data.user.token, { expires: 7, path: '/' });
    }

    function showMyToast(e,t){
        $(".err span").text(e);
        $(".err").show(100).delay(t).hide(100);
    }






})