$(document).ready(function() {
    getNews();



    function getNews(){
        var url="http://218.244.129.63:8082/api/"
        $.ajax({
            url:url,
            type:"post",
            dataType:"json",
            data:{ },
            success:function(data){
                var template=_.template($("#template").html());
                $("body").html(template({data:data}));
                goInfo();

            },
            error:function(e){
                showMyToast("获取信息失败,请刷新",1000);
            }
        })
    }

    function goInfo(){
        $("li").click(function(){
            window.location.href=" ?id="+$(this).attr("thisid");
        });
    }



    function showMyToast(e,t){
        $(".err span").text(e);
        $(".err").show(100).delay(t).hide(100);
    }
})
