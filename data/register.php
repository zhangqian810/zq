<?php
header("Content-Type:application/json;charset=utf-8");
/*连接数据库*/
require("init.php");

/***********用户名*************/
@$uname =$_REQUEST["uname"];
if($uname===""||$uname===null){
	die("用户名不能为空");
}
@$upwd =$_REQUEST["upwd"];
if($upwd===""||$upwd===null){
	die("密码不能为空");
}
/***********用户名 密码 验证************/
$reg = '/^[a-zA-Z0-9]{3,9}$/';
$rs = preg_match($reg,$uname);
if(!$rs){
  die('{"code":-1,"msg":"用户名格式不正确"}');
}
$reg = '/^[a-zA-Z0-9]{3,12}$/';
$rs = preg_match($reg,$upwd);
if(!$rs){
  die('{"code":-1,"msg":"密码格式不正确"}');
}

/*********邮箱**********/
@$email =$_REQUEST["email"];
if($email===""||$email===null){
	die("邮箱不能为空");
}
/********电话号码***********/

@$phone =$_REQUEST["phone"];
if($phone===""||$phone===null){
	die("电话号码不能为空");
}
$reg = '/^1[3-8]\d{9}$/';
$rs=preg_match($reg,$phone);
if(!$rs){
	die('{"code":-1,"msg":"电话号码格式不正确"}');
}

@$gender=$_REQUEST["gender"];
if($gender===""||$gender===null){
	die("性别不能为空");
}

/************姓名*************/

@$user_name =$_REQUEST["user_name"];
if($user_name===""||$user_name===null){
	die("姓名不能为空");
}

$sql="select uname from ly_user where uname='$uname'";
$result= mysqli_query($conn,$sql);
$row=mysqli_fetch_row($result);


if($row==null){
	$sql="insert into ly_user values(null,'$uname','$upwd','$email','$phone','$user_name','$gender')";
	$result= mysqli_query($conn,$sql);
	if($result==false){
	   echo '{"code":-1,"msg":"注册失败"}';
	}else{
	   echo '{"code":1,"msg":"注册成功"}';
	}
}else{
	echo '{"code":-2,"msg":"注册失败,用户名已存在！"}';
}
