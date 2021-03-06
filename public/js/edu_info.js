$(document).ready(function() {
    getNews()

    function getNews(){

        var url="http://218.244.129.63:8082/api/advices/"+getUrlParam("id");
        $.ajax({
            url:url,
            type:"get",
            dataType:"json",
            success:function(data){
                var template=_.template($("#template").html());
                $("body").html(template({data:data}));
                back();

            },
            error:function(e){
                showMyToast("获取信息失败,请刷新",1000);
            }
        })
    }

    function back(){
        $(".back").click(function(){
            if(getUrlParam("advice_type")=="chronic"){
                window.location.href="edu_chronic_list.html";
            }
            if(getUrlParam("advice_type")=="child"){
                window.location.href="edu_child_list.html";
            }
            if(getUrlParam("advice_type")=="woman"){
                window.location.href="edu_woman_list.html";
            }
            if(getUrlParam("advice_type")=="plan"){
                window.location.href="edu_plan_list.html";
            }
        })
    }

    function getUrlParam(name)//取url参数
    {
        var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg);  //匹配目标参数
        if (r!=null) return unescape(r[2]); return null; //返回参数值
    }


    function showMyToast(e,t){
        $(".err span").text(e);
        $(".err").show(100).delay(t).hide(100);
    }
})