<?php
#1.接收前端提交过来的数据
$uname=$_REQUEST["uname"];
$upwd=$_REQUEST["upwd"];
#2.连接数据库
require("init.php");
#3.拼sql语句
$sql="SELECT * FROM xz_user WHERE uname='$uname' and upwd='$upwd' ";
$result=mysqli_query($conn,$sql);
#4.执行sql语句判断结果
if($result==false){
	echo "数据查询失败！";
	echo "请检查sql语句：$sql";
}else{
	$row=mysqli_fetch_row($result);
	if($row==null){
		echo "用户名或密码错误！";
	}else{
		echo "登录成功！";
	}
}
?>