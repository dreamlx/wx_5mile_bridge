$(document).ready(function() {
    getDoctorlist();
    //showCookie();

    $('.btn_box p').bind('click', function() {
        window.location.href="login.html"
    });

    $('.btn_box button').bind('click', function() {
        toPut();
    });

    var doctors=[];

    function getDoctorlist(){
        var url="http://218.244.129.63:8082/api/users/doctors"
        $.ajax({
            url:url,
            dataType: "json",
            type: "get",
            success:function(data){
                for(i=0;i<data.doctors.length;i++){
                    //alert(data.doctors[i][0]+":"+data.doctors[i][1])
                    $("#doctor").append("<option value='"+data.doctors[i][0]+"'>"+data.doctors[i][1]+"</option>")
                    doctors.push({id:data.doctors[i][0],name:data.doctors[i][1]})
                }
                $('.default').dropkick();
            },
            error:function(e){

            }

        })
    }

    function toPut(){
        var mobile = $.trim($(".username").val());
        if (!mobile) {
            showMyToast("请输入手机号",1000);
            return;
        }
        if( !/^(1[3-8][0-9])\d{8}$/.test(mobile)){
            showMyToast("请输入正确的手机号",1000);
            return;
        }
        var password = $.trim($(".password").val());
        if (!password) {
            showMyToast("请输入密码",1000);
            return;
        }
        var conpassword = $.trim($(".confirm-password").val());
        if (!conpassword) {
            showMyToast("请输入确认密码",1000);
            return;
        }
        if(password!=conpassword){
            showMyToast("2次输入密码不一致",1000);
            return;
        }
        var name = $.trim($(".name").val());
        if (!name) {
            showMyToast("请输入姓名",1000);
            return;
        }
        var persionid = $.trim($(".persionid").val());
        if (!persionid) {
            showMyToast("请输入身份证号",1000);
            return;
        }
        var address =$.trim($(".address").val());
        var sex =$.trim($("#dk_container_sex a:first").text());
        var cardid =$.trim($(".cardid").val());
        var doctor =$.trim($("#dk_container_doctor a:first").text());


        for(i=0;i<doctors.length;i++){
            if(doctors[i].name==doctor){
                doctor=doctors[i].id
                break;
            }
        }
        //alert(sex);alert(doctor);
        var url="http://218.244.129.63:8082/api/users"
        $.ajax({
            url:url,
            type:"post",
            dataType:"json",
            data:{
                "user[cell]":mobile,"user[password]":password,"user[password_confirmation]":conpassword,
                "user[name]":name,"user[address]":address,"user[gender]":sex,
                "user[id_no]":persionid,"user[card_no]":cardid,"user[doctor_id]":doctor,
            },
            success:function(data){
                showMyToast("注册成功！",2000);
                window.location.href="login.html";
            },
            error:function(e){
                showMyToast("注册失败！",2000);
            }

        })
    }

    function showCookie(){
        alert($.cookie('id')+$.cookie('cell')+$.cookie('name'))
    }



    function showMyToast(e,t){
        $(".err span").text(e);
        $(".err").show(100).delay(t).hide(100);
    }



})
