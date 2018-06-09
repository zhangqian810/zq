<?php
#1.获取前端提交过来的数据
	$uname=$_REQUEST["uname"];
	$upwd=$_REQUEST["upwd"];
	$email=$_REQUEST["email"];
	$phone=$_REQUEST["phone"];
	$user_name=$_REQUEST["user_name"];
	$gender=$_REQUEST["gender"];

#2.连接数据库
	require("init.php");

#3.sql语句
	$sql="INSERT INTO xz_user(uname,upwd,email,phone,user_name,gender) 
	VALUES('$uname','$upwd','$email','$phone','$user_name','$gender') "; 
//可以拿到http://127.0.0.1/phpmyadmin/里sql处检验下是否正确

#4.执行sql并根据结果给出提示
	$result=mysqli_query($conn,$sql);

	if($result==false){
		echo "注册失败！<br>";
		echo "请检查SQL语法：$sql";
	}else{
		echo "注册成功！";
		$uid=mysqli_insert_id($conn);
		echo "新用户在数据库中的编号为：$uid";
	}

#在地址栏运行http://127.0.0.1/AJAX-day21/project/01-register.php?uname=……









?>