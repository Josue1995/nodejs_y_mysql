<?php
  require("lib.php");

  $conn = new ConectorDB();
  $n = $_POST['fullname'];
  $c = $_POST['correo'];
  if (isset($_POST['fullname']) && isset($_POST['correo']) && isset($_POST['password']) && isset($_POST['birthday'])) {
    $p = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $fecha = date("Y-m-d", strtotime($_POST['birthday']));
    $sql = "insert into users(name,email,password,birthday) values('$n','$c','$p','$fecha');";
    if ($conn->initConexion() == 'OK') {
      if($conn->ejecutarQuery($sql) == true){
        echo "OK";
      }else {
        echo "error";

      }
    }else {
      echo "Fatal error";
    }
  }else {
    echo "error, algún campo esta vacio";
  }
  $conn->cerrarConeccion();
 ?>
