$(document).ready(function() {
    getList();



    function getList(){
        var url="http://218.244.129.63:8082/api/advices?advice_type=儿保"
        $.ajax({
            url:url,
            type:"get",
            dataType:"json",
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
            window.location.href="edu_info.html?id="+$(this).attr("thisid")+"&advice_type=child";
        });
    }



    function showMyToast(e,t){
        $(".err span").text(e);
        $(".err").show(100).delay(t).hide(100);
    }
})
