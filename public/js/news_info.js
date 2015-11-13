$(document).ready(function() {





    function showMyToast(e,t){
        $(".err span").text(e);
        $(".err").show(100).delay(t).hide(100);
    }
})