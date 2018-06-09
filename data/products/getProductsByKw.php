<?php
//data/products/getProductsByKw.php
require_once("../init.php");
$output=[
	"count"=>0,//总数
	"pageSize"=>12,//每页12个
	"pageCount"=>0,//总页数=ceil(count/pageSize)
	"pageNo"=>0,//当前第几页
	"products"=>[]//商品列表
];
@$kw=$_REQUEST["kw"];
@$pno=$_REQUEST["pno"];
if($kw!=null&&$pno!=null){
	$kws=explode(" ",$kw);
	//遍历并替换数组元素为指定格式
	for($i=0;$i<count($kws);$i++){
		$kws[$i]=" title like '%".$kws[$i]."%' ";
	}
	//用and相连
	$where=implode(" and ",$kws);
	$sql="SELECT * FROM ly_laptop where $where";
	$result=mysqli_query($conn,$sql);
	$count=count(mysqli_fetch_all($result,1));
	$pageCount=ceil($count/$output["pageSize"]);
	$output["count"]=$count;
	$output["pageCount"]=$pageCount;
	$sql="SELECT *,pic FROM ly_laptop where $where";
	$sql.=" limit ".$pno*$output["pageSize"].",".$output["pageSize"];
	$output["pageNo"]=$pno;
	$result=mysqli_query($conn,$sql);
	$output["products"]=mysqli_fetch_all($result,1);
}
echo json_encode($output);