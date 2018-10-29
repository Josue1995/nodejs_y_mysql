<?php
  require('lib.php');
  session_start();
  $con = new ConectorDB();
  $t = $_POST['titulo'];
  $st = date("Y-m-d", strtotime($_POST['start_date']));
  $a = $_POST['allDay'];
  $ed = date("Y-m-d", strtotime($_POST['end_date']));
  $eh = $_POST['end_hour'];
  $sh = $_POST['start_hour'];
  if ($con->initConexion() == "OK") {
    $email = $_SESSION['user'];
    $sql = "select u.user_id from users u where u.email='$email'";
    $user_id = $con->ejecutarQuery($sql);
    if ($user_id->num_rows > 0) {
      $user = $user_id->fetch_assoc();
      $sql2 = "insert into event(user_id,title,start,end,start_time,end_time,allDay) values($user[user_id],'$t','$st','$ed','$sh','$eh',$a)";
      if ($con->ejecutarQuery($sql2) == true) {
        $data['msg'] = "OK";
        echo json_encode($data);
      }else {
        $data['msg'] = "Error";
        echo json_encode($data);
      }
    }else {
      $data['msg'] = "ocurrió un error";
      echo json_encode($data);
    }
  }else {
    $data['msg'] = "No hay conexion con la base";
    echo json_encode($data);
  }
  $con->cerrarConeccion();
 ?>
