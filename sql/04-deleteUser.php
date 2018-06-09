<?php
#1.接收全段传递过来的uid
$uid=$_REQUEST["uid"];
#2.连接数据库
require("init.php");
#3.拼sql语句
$sql="DELETE FROM xz_user WHERE uid='$uid'";
#4.执行sql语句
$result=mysqli_query($conn,$sql);

if($result==false){
	echo "0"; //删除失败！
}else{
	echo "1"; //删除成功
}
?>