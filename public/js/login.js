$(document).ready(function() {
    $("button").click(function(){
        var mobile = $.trim($("#username").val());
        if (!mobile) {
            showMyToast("请输入手机号");
            return;
        }
        if( !/^(1[3-8][0-9])\d{8}$/.test(mobile)){
            showMyToast("请输入正确的手机号");
            return;
        }
        var password = $.trim($("#password").val());
        if (!password) {
            showMyToast("请输入密码");
            return;
        }
    })

    function showMyToast(e){
        $(".err").show();
        $(".err span").text(e);
    }






})