$(function(){

    $("#logon_btn").click(function(){
        $.ajax({
            type: "post",
            url: "",
            data: {
                email: $("#register_email").val(),
                password: $("#register_password").val(),
            }
        }).done(function(){
            window.location.href="after_logon.html";
        });
    });


});