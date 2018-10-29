<?php
  require('lib.php');
  $con = new ConectorDB();
  $u = $_POST['username'];
  $sql = "select u.password from users u where u.email = '$u'";
  if ($con->initConexion() == "OK") {
    $p = $con->ejecutarQuery($sql);
    if($p->num_rows > 0){
      $row = $p->fetch_assoc();
      $h = $_POST['password'];
      if (password_verify($h,$row['password'])) {
        session_start();
        $_SESSION['user'] = $u;
        echo "OK";
      }else {
        echo "error";
      }
    }
  }else {
    echo "error en la coneccion";
  }
  $con->cerrarConeccion();
 ?>
