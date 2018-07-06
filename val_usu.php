<?php
// se valida el numero de cedula para poder validar usuario al inicio de session

include ('conectar.php');

$db_conexion= mysqli_connect($servername, $username, $password, $database) or die ('Ha fallado la conexión: '.mysql_error());

if (!$db_conexion) {
  die('No se ha podido conectar a la base de datos');
}

// se selecciona la base de datos y muestra mensaje de error en caso de no existir
$select=mysqli_select_db($db_conexion, $database) or die("No se pudo seleccionar la base de datos");;
 

$usuario = $_REQUEST["usuario"];   
$pass = $_REQUEST["pass"];



// se ejecuta la consulta para validar que exista el usuario
$result = mysqli_query($db_conexion, "SELECT * FROM usuario WHERE usuario = '$usuario' AND pass = '$pass' AND activo = '1'");


if($row = mysqli_fetch_array($result))
{     

 if($row[1] == $usuario)
 {

  session_start();  

  $_SESSION['usuario'] = $usuario;  

  header("Location:iniciar.php");  
 }
 else
 {
 
  ?>
   <script languaje="javascript">
    alert("Datos Inválidos usu!");
    location.href = "login.php";
   </script>
<?php
            
 }
}
else
{

?>
 <script languaje="javascript">
  alert("Datos Inválidos pass!");
  location.href = "login.php";
 </script>
<?php  
        
}


mysql_free_result($result);


mysql_close();
?>