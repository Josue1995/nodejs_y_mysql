<?php
  require("lib.php");

  $u = $_POST['user'];
  $con = new ConectorDB();
  $sql = "select u.email from users u where u.email = '$u'";
  if($con->initConexion() == "OK"){
    $email = $con->ejecutarQuery($sql);
    if ($email->num_rows > 0) {
      $row = $email->fetch_assoc();
      if ($row['email'] == $u) {
        echo "OK";
      }else {
        echo "No existe";
      }
    }else {
      echo "No se encontro";
    }
  }else {
    echo "Error en la coneccion";
  }

  $con->cerrarConeccion();
 ?>
