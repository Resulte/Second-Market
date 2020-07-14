$(function(){

    $("#reset_password").click(function(){
        $.ajax({
            type: "post",
            url: "",
            data: {
                email: $("#register_email").val(),
                password: $("#register_password").val(),
                password2: $("#register_password2").val(),
                vcode: $("#register_vcode").val()
            }
        }).done(function(){
            window.location.href="logon.html";
        });
    });


});