$(function(){

	var error_name = false;
	var error_password = false;
	var error_check_password = false;
	var error_number = false;


	$('#username').blur(function() {
		check_user_name();
	});

	$('#password').blur(function() {
		check_pwd();
	});

	$('#password2').blur(function() {
		check_cpwd();
	});

	$('#number').blur(function() {
		check_number();
	});

	// $('#allow').click(function() {
	// 	if($(this).is(':checked'))
	// 	{
	// 		error_check = false;
	// 		$(this).siblings('span').hide();
	// 	}
	// 	else
	// 	{
	// 		error_check = true;
	// 		$(this).siblings('span').html('请勾选同意');
	// 		$(this).siblings('span').show();
	// 	}
	// });


	function check_user_name(){
		var len = $('#username').val().length;
		if(len<2||len>20)
		{
			$('#username').next().html('请输入2-20个字符的用户名')
			$('#username').next().show();
			error_name = true;
		}
		else
		{
			$('#username').next().hide();
			error_name = false;
		}
	}

	function check_pwd(){
		var len = $('#password').val().length;
		if(len<6||len>20)
		{
			$('#password').next().html('密码最少6位，最长20位')
			$('#password').next().show();
			error_password = true;
		}
		else
		{
			$('#password').next().hide();
			error_password = false;
		}
	}


	function check_cpwd(){
		var pass = $('#password').val();
		var cpass = $('#password2').val();

		if(pass!=cpass)
		{
			$('#password2').next().html('两次输入的密码不一致')
			$('#password2').next().show();
			error_check_password = true;
		}
		else
		{
			$('#password2').next().hide();
			error_check_password = false;
		}

	}

	function check_number(){
		var len = $('#number').val().length;
		if(len<6)
		{
			$('#number').next().html('请输入正确的学号');
			$('#number').next().show();
			error_number = true;
		}
		else
		{
			$('#number').next().hide();
			error_number = false;
		}
	}
	// function check_email(){
	// 	var re = /^[a-z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$/;
    //
	// 	if(re.test($('#email').val()))
	// 	{
	// 		$('#email').next().hide();
	// 		error_email = false;
	// 	}
	// 	else
	// 	{
	// 		$('#email').next().html('你输入的邮箱格式不正确')
	// 		$('#email').next().show();
	// 		error_check_password = true;
	// 	}
    //
	// }


	$('#reg_form').submit(function() {
		check_user_name();
		check_pwd();
		check_cpwd();
		// check_email();

		if(error_name == false && error_password == false && error_check_password == false && error_number == false)
		{
			return true;
		}
		else
		{
			return false;
		}

	});

})

// $(function(){
//
//     $("#register_btn").click(function(){
//         $.ajax({
//             type: "post",
//             // type 和method 一样的含义 只是mthod是version1.9添加的，
//             // 所以版本1.9之前的使用type  之后的使用method
//             url: "",
//             data: {
//                 email: $("#register_email").val(),
//                 password: $("#register_password").val(),
//                 password2: $("#register_password2").val(),
//                 vcode: $("#register_vcode").val()
//             }
//         }).done(function(){
//             window.location.href="logon.html";
//         });
//     });
//
//     $("#register_get_vcode").click(function(){
//         $.ajax({
//             type: "post",
//             url: "",
//             data: {
//                 email: $("#register_email").val()
//             }
//         }).done(function(response){
//             console.log(response);
//         });
//     });
//
// });
// -----------------find----------------
// $("#search-button").click(function() {
//     var val = $("#search").val(); // 获取搜索词
//     if (val.length > 0) {
//         console.log(val);
//         $(".nav-1").hide(); 
//         $(".nav-1:contains(" + val + ")").show(); 
//     } else {
//         alert("输入为空");
//     }
// });

// // --------------登录注册------------------
// // API host
// var api_host = 'http://120.77.34.120:8080';
// // API 地址
// var api_urls = {
//     // 获取验证码 API 地址
//     get_verify_code: api_host + '/auth/verifyCode',
//     //注册地址
//     register: api_host + '/auth/register',
//     //登录地址
//     login: api_host + '/auth/login'
// };

// // 发起请求的 button
// var request_btn = null;
// // 120 秒间隔
// var countdown_time = 120;
// // 定时器
// var interval = null;

// $(function () {
//     //设置全局
//     $.ajaxSetup({
//         'async': true,
//         //同步异步处理，默认为true，
//         //默认设置下，所有请求均为异步请求。如果需要发送同步请求，请将此选项设置为 false。
//         'crossDomain': true,
//         //跨域请求
//         'headers': {
//             'content-type': 'application/json'
//         },
//         'processData': false,
//         //默认值: true。默认情况下，通过data选项传递进来的数据，如果是一个对象(技术上讲只要不是字符串)，
//         //都会处理转化成一个查询字符串，以配合默认内容类型 "application/x-www-form-urlencoded"。
//         //如果要发送 DOM 树信息或其它不希望转换的信息，请设置为 false。
//         'beforeSend': function () {
//             request_btn && disabled_btn(request_btn);
//         },
//         // 请求完成后调用，不管 success 还是 error
//         'complete': function () {
//             console.log('ajax: complete');
//             // 重置 is_requesting
// //                reset_is_requesting();
//             // 解锁发起请求的 btn
//             request_btn && enable_btn(request_btn);
//             //防止重复点击
//             // 重置为 null
//             request_btn = null;
//         },
//         // 请求失败时调用
//         'error': function (xhr, textStatus, error) {
//             console.log('ajax: error');
//             console.log('status: ' + xhr.status);
//             console.log('textStatus: ' + textStatus);
//             console.log('error: ' + error);
//             if (xhr.status === 404) {
//                 error_tip('请求 URL 错误');
//             }
//             // 如果是 status 是 4xx，显示登录 modal
//             else if (xhr.status >= 400 && xhr.status < 500) {
//                 error_tip('请先登录');
//                 close_register_modal();
//                 show_login_modal();
//             } else if (xhr.status >= 500) {
//                 error_tip('抱歉，服务器错误');
//             } else {
//                 error_tip('发生未知错误');
//             }
//         }
// });

// // 登录 modal 中的注册按钮
// $('#login_modal_register_btn').on('click', function () {
//     // 关闭登录 modal
//     close_login_modal();
//     // 显示注册 modal
//     show_register_modal();
// });
// // 注册 modal 中的登录按钮
// $('#register_modal_login_btn').on('click', function () {
//     // 关闭注册 modal
//     close_register_modal();
//     // 显示登录 modal
//     show_login_modal();
// });
// //登录modal中的忘记密码
// $('#forget_password_btn').on('click',function(){
//     console.log("重置");
//     close_login_modal();
//     console.log("关登录");
//     show_forget_password();
// });

// // 重置 modal
// var $forget_password = $('forget_password');
// // 登陆 modal
// var $login_modal = $('#login_modal');
// // 注册 modal
// var $register_modal = $('#register_modal');
// // 获取邮箱验证码
// var $get_verify_code_btn = $('#get_verify_code_btn');
// // 点击获取邮箱验证码按钮事件
// $get_verify_code_btn.on('click', on_click_get_verify_code_btn);

// // 登录 input
// var $login_email = $('input[name="login_email"]');
// var $login_password = $('input[name="login_password"]');
// var $login_btn = $('#login_btn');
// // 点击登录按钮
// $login_btn.on('click', on_click_login_btn);
// // 注册 input
// var $register_email = $('input[name="register_email"]');
// var $verify_code = $('input[name="verify_code"]');
// var $register_password = $('input[name="register_password"]');
// var $register_password2 = $('input[name="register_password2"]');
// var $register_btn = $('#register_btn');
// // 点击注册按钮
// $register_btn.on('click', on_click_register_btn); 

// // 读取 token
// var token = get_local_token();
// // 如果 token 不为空
// if (token) {
//     // TODO 显示用户信息
//     return get_user_favorite(token);
//     //获取用户收藏，没写。
// }
// // 弹出登录 modal
// show_login_modal();
// // 从 local storage 获取 token
// function get_local_token() {
//     return localStorage.getItem('token');
// }

// // 更新 local storage 的 token
// function update_local_token(token) {
//     // 删除原来的
//     localStorage.removeItem('token');
//     localStorage.setItem('token', token);
// }

// function show_forget_password(){
//     $forget_password.modal({
//         'backdrop': 'static'
//     });
// }

// // 显示登录 modal
// function show_login_modal() {
//     $login_modal.modal({
//         'backdrop': 'static'
//     });
// }
// // 关闭登录 modal
// function close_login_modal() {
//     $login_modal.modal('hide');
// }
// // 显示注册 modal
// function show_register_modal() {
//     $register_modal.modal({
//         'backdrop': 'static'
//     });
// }
// // 关闭注册 modal
// function close_register_modal() {
//     $register_modal.modal('hide');
// }
// // 错误提示
// function error_tip(msg) {
//     console.log(msg);
//     alert(msg);
// }
// // 点击获取邮箱验证码时
// function on_click_get_verify_code_btn() {
//     // 注册邮箱
//     var email = get_register_email();
//     if (!email) {
//         return;
//     }
//     // 发起请求的 btn
//     request_btn = $(this);
//     // 调用 API
//     $.ajax({
//         'url': api_urls.get_verify_code,
//         'method': 'POST',
//         'data': JSON.stringify({
//             email: email
//         })
//     }).done(function (response) {
//         console.log(response);
//         if (is_success(response)) {
//             // 开始倒计时 120
//             verify_code_countdown();
//             return;
//         }
//         // 失败
//         error_tip(get_error_message(response));
//     });
// }
// // 获取注册邮箱
// function get_register_email() {
//     var email = $register_email.val();
//     // 去掉前后空格
//     email = email.trim();
//     // 是否为空
//     if (email.length === 0) {
//         error_tip('请输入邮箱地址');
//         return false;
//     }
//     if (!is_email(email)) {
//         error_tip('邮箱格式错误');
//         return false;
//     }
//     return email;
// }
// // 标记正在请求
// //        function mark_is_requesting() {
// //            is_requesting = true;
// //        }
// // 标记不是正在请求
// //        function reset_is_requesting() {
// //            is_requesting = false;
// //        }
// // 判断请求是否成功
// function is_success(data) {
//     return data.code === 0;
// }
// // 获取错误 message
// function get_error_message(data) {
//     return data.message || '未知错误';
// }
// // 设置 button 的 disabled => true
// function disabled_btn(btn) {
//     btn.prop('disabled', true);
// }
// // 设置 button 的 disabled => false
// function enable_btn(btn) {
//     btn.prop('disabled', false);
//     //disabled的属性为false，就是设置为可用可编辑的意思。
// }
// // 发送邮箱验证码 120 秒倒计时
// function verify_code_countdown() {
//     console.log('verify_code_countdown');
//     // 锁定 btn
//     disabled_btn($get_verify_code_btn);
//     // 开始定时器
//     interval = setInterval(function () {
//         if (countdown_time < 1) {
//             // 解锁 btn
//             enable_btn($get_verify_code_btn);
//             $get_verify_code_btn.html('获取验证码');
//             clearInterval(interval);
//             return;
//         }
//         $get_verify_code_btn.html((countdown_time--) + ' 秒后重发');
//     }, 1000);
// }
// // 点击注册
// function on_click_register_btn() {
//     // 注册邮箱
//     var email = get_register_email();
//     if (!email) {
//         return;
//     }
//     // 验证码
//     var verify_code = get_verify_code();
//     if (!verify_code) {
//         return;
//     }
//     // 密码
//     var password = get_register_password();
//     if (!password) {
//         return;
//     }
//     // 发起请求的 btn
//     request_btn = $(this);
//     // 调用 API
//     $.ajax({
//         'url': api_urls.register,
//         'method': 'POST',
//         'data': JSON.stringify({
//             email: email,
//             password: password,
//             verifyCode: verify_code
//         })
//     }).done(function (response) {
//         console.log(response);
//         if (is_success(response)) {
//             // TODO 注册成功
//             return;
//         }
//         // 失败
//         error_tip(get_error_message(response));
//     });
// }
// // 获取验证码
// function get_verify_code() {
//     var verify_code = $verify_code.val();
//     // 去掉前后空格
//     verify_code = verify_code.trim();
//     // 是否为空
//     if (verify_code.length === 0) {
//         error_tip('请输入验证码');
//         return false;
//     }
//     return verify_code;
// }
// // 获取注册输入的密码
// function get_register_password() {
//     var password = $register_password.val();
//     password = password.trim();
//     // 是否为空
//     if (password.length === 0) {
//         error_tip('请输入密码');
//         return false;
//     }
//     // 格式是否正确
//     var reg = /^[a-zA-Z0-9]{6,20}$/;
//     if (!reg.test(password)) {
//         error_tip('密码格式错误');
//         return false;
//     }
//     // 两次密码是否一致
//     if (password !== $register_password2.val()) {
//         error_tip('两次密码不一致');
//         return false;
//     }
//     return password;
// }
// // 点击登录
// function on_click_login_btn() {
//     // 邮箱
//     var email = get_login_email();
//     if (!email) {
//         return;
//     }
//     // 密码
//     var password = get_login_password();
//     if (!password) {
//         return;
//     }
//     // 发起请求的 btn
//     request_btn = $(this);
//     // 调用 API
//     $.ajax({
//         'url': api_urls.login,
//         'method': 'POST',
//         'data': JSON.stringify({
//             email: email,
//             password: password
//         })
//     }).done(function (response) {
//         console.log(response);
//         if (is_success(response)) {
//             // NOTICE 因为 alert 后又延迟，这里先释放掉 is_requesting
// //                    reset_is_requesting();
//             login_success(response);
//             return;
//         }
//         // 失败
//         error_tip(get_error_message(response));
//     });
// }
// // 获取登录邮箱
// function get_login_email() {
//     var email = $login_email.val();
//     // 去掉前后空格
//     email = email.trim();
//     // 是否为空
//     if (email.length === 0) {
//         error_tip('请输入邮箱地址');
//         return false;
//     }
//     if (!is_email(email)) {
//         error_tip('邮箱格式错误');
//         return false;
//     }
//     return email;
// }
// // TODO 判断是否是正确的邮箱格式
// function is_email(email) {
//     console.log(email);
//     return true;
// }
// // 获取登录密码
// function get_login_password() {
//     var password = $login_password.val();
//     password = password.trim();
//     // 是否为空
//     if (password.length === 0) {
//         error_tip('请输入密码');
//         return false;
//     }
//     return password;
// }
// // 获取服务器返回的 token
// function get_response_token(response) {
//     if (typeof response.token === 'undefined') {
//         console.log('response.token undefined');
//         return '';
//     }
//     return response.token;
// }
// // 登陆成功
// function login_success(response) {
//     var token = get_response_token(response);
//     if (!token) {
//         error_tip('获取 token 失败');
//         return;
//     }
//     // 保存 token 到 local storage
//     update_local_token(token);
//     // 关闭登录 modal
//     close_login_modal();
//     // TODO 显示用户信息
//     // 获取用户收藏并显示到网页
//     //get_user_favorite(token);
// }

// });
