<?php
//data/products/getProductById.php
require_once("../init.php");
@$lid=$_REQUEST["lid"];
@$pid=$_REQUEST["pid"];
if($lid!=null){
	$sql="SELECT * FROM ly_laptop WHERE lid=$lid";
	$result=mysqli_query($conn,$sql);
	$output=mysqli_fetch_all($result,1);
}
echo json_encode($output);