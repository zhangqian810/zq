//js/index.js
//功能：完成登录
// 1.获取登录按钮 #btn
// 2.为按钮绑定点击事件
// 3.阻止事件默认行为 绑定元素 a:button
$("#loing-btn").click(function(e){
	e.preventDefault();
// 4.获取用户输入值  用户名 密码
	 var uname=$("#uname").val();
	 var upwd=$("#upwd").val();
// 5.创建正则表达式验证用户输入 用户名 密码
	var reg =/^[a-z0-9]{3,9}$/i;
// 6.如果验证出错显示错误信息
	 if(!reg.test(uname)){
		alert("用户名格式不正确！");
		return ;
	 }
	 if(!reg.test(upwd)){
		alert("密码格式不正确！");
		return ;
	 }
// 7.发送ajax data/login/login.php
	$.ajax({
		 type:"GET",
		 url:"data/login/login.php",   //请求路径
		 data:{uname:uname,upwd:upwd},  //发送时参数
		 success:function(data){//8.获取返回结果
			 //data  php返回结果 json 字符串->jquery->js object
			 //data ={"code":1,"msg":"登录成功!"}
			 //console.log(data);
			 if(data.code>0){//code>0 登录成功跳转 index.html 页面
				alert(data.msg);
				location.href="index.html";
			 }else{
				alert(data.msg);
				location.href="login.html";
			 }
		 },
		 error:function (){//9.获取返回结果错误 提示错误信息
			 alert("网络故障请检查!");//请求地址错误 404，sql语句错误，json拼接，php语法出错
		 }
	});
});
$(function(){
	$("#loginform>:button").click(function(){
		var $btn=$(this);
		$.ajax({
			type:"post",
			url:"data/users/signin.php",
			data:$btn.parent().serialize(),
			success:function(msg){
				//xxx/login.html?back=http://xxx/products.html?kw=i5
				var i=location.search.indexOf("=");
				location.href=location.search.slice(i+1);
			}
		});
	});
});
