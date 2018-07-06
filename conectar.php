<?php 
  $servername="localhost";
  $username="root";
  $password="";
  $database="proyecto";

// Crear la conexión
  
$conn = new mysqli ($servername, $username, $password, $database);
$conn->query("SET NAMES 'utf8'");

// Verificar la conexión 
if($conn->connect_error)
  { die("error de conexión:".$conn->connect_error);
  echo "Error al acceder a la base de datos"; 
  } 
  echo""; 
?>