<?php
  require('lib.php');
  session_start();
  $con = new ConectorDB();
  $u = $_SESSION['user'];
  if(isset($_SESSION['user'])){
    if ($con->initConexion()=="OK") {
      $sql = "select e.event_id,e.title,e.start,e.end,e.allDay,e.start_time,e.end_time from users u inner join event e on u.user_id=e.user_id where u.email='$u'";
      $rows = $con->ejecutarQuery($sql);
      if ($rows->num_rows > 0) {
        $data['msg']="OK";
        while($row = $rows->fetch_assoc()){
          $r[] = $row;
        }
        $data['eventos'] = $r;
        echo json_encode($data);
      }else {
        $data['msg'] = "error";
        echo json_encode($data);
      }
    }else {
      $data['msg'] = "error";
      echo json_encode($data);
    }
  } else {
    $data['msg'] = "error";
    echo json_encode($data);
  }

 ?>
