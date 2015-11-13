$(document).ready(function() {
    getInfo();



    function example(){
        var abcd={ "theas":{"aa":"asdfg","bb":"ssdf"}};
        var template=_.template($("#template").html());
        $("body").html(template({abcd:abcd}));
    }



    function getInfo(){
        var url="http://218.244.129.63:8082/api/hospitals/current"
        $.ajax({
            url:url,
            type:"get",
            dataType:"json",
            success:function(data){
                var template=_.template($("#template").html());
                $("body").html(template({data:data}));

            },
            error:function(e){
                showMyToast("获取信息失败,请刷新",1000);
            }
        })
    }


    function showMyToast(e,t){
        $(".err span").text(e);
        $(".err").show(100).delay(t).hide(100);
    }
})
