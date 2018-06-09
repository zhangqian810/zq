$(function(){
	$("#btn").click(function(){
		$("#btn").click(function(e){
			e.preventDefault();
			// 1.获取用户输入值  用户名 密码
			var uname=$("#uname").val();
			var upwd=$("#upwd").val();
			var email = $("#email").val();
			var user_name = $("#user_name").val();
			var phone = $("#phone").val();
			var gender = $("#gender").val();
			// 2.创建正则表达式验证用户输入 用户名 密码
			var reg =/^[a-z0-9]{3,9}$/i;
			// 3.如果验证出错显示错误信息
			if(!reg.test(uname)){
				alert("用户名格式不正确！");
				return ;
			}
			if(!reg.test(upwd)){
				alert("密码格式不正确！");
				return ;
			}
			var reg = /^1[3-8]\d{9}$/;
			if(!reg.test(phone)){
				alert("手机号格式不正确！");
				return ;
			}
			$.ajax({
				type:"post",
				url:"data/register.php",
				data:{uname:uname,upwd:upwd,email:email,
				phone:phone,user_name:user_name,gender:gender},
				success:function(data){
					if(data.code>0){
						alert("注册成功");
						location.href="login.html";
					}else if(data.code==-1){
						alert("注册失败,请重试");
						location.href="register.html";
					}else{
						alert("用户名已被占用,请重试");
						location.href="register.html";
					}
				}
			});
		});
	});
});
	