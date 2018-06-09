<?php
$uname=$_REQUEST["uname"];

require("init.php");

$sql="SELECT * FROM xz_user WHERE uname='$uname'";
$result=mysqli_query($conn,$sql);

$row=mysqli_fetch_row($result);  //抓取一行数据
if($row==null){
	echo "用户名可用";
}else{
	echo "用户名已存在";
}
?>