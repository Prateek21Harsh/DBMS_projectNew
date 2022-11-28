<?php

include 'conn.php';

$id=$_POST['id'];
$name=$_POST['name'];
$password=$_POST['password'];
$mobile=$_POST['mobile'];
$age=$_POST['age'];
$deposits=$_POST['deposits'];
$loan=$_POST['loan'];

$conn->query("update mytable set name='".$name."', password='".$password."', mobile='".$mobile."', age='".$age."', deposits='".$deposits."', loan='".$loan."' where id='".$id."'");

?>