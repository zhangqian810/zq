<?php
#整个项目的初始化文件，用于编写所有其他页面都公用的公共内容
//$conn = mysqli_connect(SAE_MYSQL_HOST_M, SAE_MYSQL_USER, SAE_MYSQL_PASS,  SAE_MYSQL_DB, SAE_MYSQL_PORT);
$conn =mysqli_connect('127.0.0.1','root','','ly_project','3306');
mysqli_query($conn,'SET NAMES UTF8');
