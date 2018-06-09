<?php
	//功能：完成登录验证
	//1.设置响应头格式为json
	header("Content-Type:application/json;charset=utf-8");
	session_start();
	//2.连接数据库
	//3.设置查询编码为utf8
	require("../init.php");
	//4.获取参数 uname upwd
	@$uname=$_REQUEST["uname"];
	@$upwd=$_REQUEST["upwd"];
	//？5.创建正则表达式验证用户输入 uname  upwd
	$reg='/^[a-zA-Z0-9]{3,9}$/';
	//？6.如果用户输入格式不正确提示错误信息
	$rs=preg_match($reg,$uname);
	if(!$rs){
		die('{"code":-1,"msg":"用户名格式不正确"}');
	}
	$rs=preg_match($reg,$upwd);
	if(!$rs){
		die('{"code":-1,"msg":"密码名格式不正确"}');
	}
	//7.创建sql语句查找该用户身是否存在
	$sql="SELECT uid FROM ly_user WHERE uname='$uname' AND upwd='$upwd' "; //upwd是varchar类型，故加单引号
	$result=mysqli_query($conn,$sql);
	if(mysqli_error($conn)){
		echo mysqli_error($conn);
	}
	//8.发送sql语句并获取返回结果
	$row=mysqli_fetch_row($result);
	//9.输出登录结果
	if($row===null){
		echo '{"code":-1,"msg":"用户名或密码有误，请重试!"}';
	}else{
		echo '{"code":1,"msg":"登录成功,3s后返回首页!"}';
	}

