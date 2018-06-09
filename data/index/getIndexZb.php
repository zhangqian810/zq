<?php
//data/index/getIndexZb.php
require_once("../init.php");
$sql="SELECT * FROM `ly_index_zb`";
$result=mysqli_query($conn,$sql);
echo json_encode(mysqli_fetch_all($result,1));

