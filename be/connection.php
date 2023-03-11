<?php

$host = "localhost";
$db_user = "root";
$db_pass = null;
$db_name = "healthcaredb";

$mysqli = new mysqli($host, $db_user, $db_pass, $db_name);
 if(!$mysqli){
    echo "connection failed";
 }else{
    echo "success";
 }
?>