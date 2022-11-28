<?php

include 'conn.php';

$id=$_POST['id'];
$name=$_POST['name'];
$password=$_POST['password'];
$mobile=$_POST['mobile'];
$age=$_POST['age'];
$deposits=$_POST['deposits'];
$loan=$_POST['loan'];

$conn->query("insert into mytable(id,name,password,mobile,age,deposits,loan) values('".$id."','".$name."','".$password."','".$mobile."','".$age."','".$deposits."','".$loan."')");

?>