<?php
/*计算公式：（当前页-1）*条数
1.声明变量currentPage，表示当前页数，如果前端没传递过来currentPage的值，name默认为1
2.声明变量pageSize，表示每一页显示的条数，如果前端没有传递pageSize，那么默认为10  */
@$currentPage=$_REQUEST["currentPage"];
if($currentPage==null){
	$currentPage=1;
}
@$pageSize=$_REQUEST["pageSize"];
if($pageSize==null){
	$pageSize=10;
}

#3.根据currentPage和pageSize，来计算当前页显示首条记录的下标，将结果保存在$start中.
$start=($currentPage-1)*$pageSize;
//echo "当前页：$currentPage,每一页显示：$pageSize,首条记录下标：$start";   //测试结果

#4.根据pageSize和$start到数据库中完成数据查询
require("init.php");
$sql="select * from xz_user limit $start,$pageSize";
$result=mysqli_query($conn,$sql);
$array=mysqli_fetch_all($result,MYSQLI_ASSOC);
#echo json_encode($array);

#5.获取xz_user的总记录数，保存在$total(总条数)
$sql="select count(*)  from xz_user";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_row($result);
$total=$row[0];

#6.根据$total和$pageSize,计算总页数保存在$totalPage.(ceil,向上取整)
$totalPage=ceil($total/$pageSize);
//echo "总页数:$totalPage"; 

#7.拼数组响应给前端
$output=["totalPage"=>$totalPage,"data"=>$array];
echo json_encode($output);
?>
