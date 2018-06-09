<?php
#新建一个03-list.php，将用户表中所有的数据查询出来并以json字符串方式响应给前端.

header("Content-Text:application/json");  //设置响应回来的消息头，告诉人家我的格式是json类型的

require("init.php");

$sql="SELECT * FROM xz_user";
$result=mysqli_query($conn,$sql);

$array=mysqli_fetch_all($result,MYSQLI_ASSOC);
$str=json_encode($array);
echo $str;
?>