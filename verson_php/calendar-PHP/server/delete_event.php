<?php
  require('lib.php');
  $con = new ConectorDB();
  if ($con->initConexion() == "OK") {
    $i = $_POST['id'];
    $sql = "delete from event where event_id = $i";
    if ($con->ejecutarQuery($sql) == true) {
      $data['msg'] = "OK";
      echo json_encode($data);
    }else {
      $data['msg'] = "error";
      echo json_encode($data);
    }
  }else {
    $data['msg'] = "error en la coneccion";
    echo json_encode($data);
  }
  $con->cerrarConeccion();

 ?>
