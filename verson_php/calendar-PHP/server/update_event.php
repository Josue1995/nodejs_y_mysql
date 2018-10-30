<?php
 require('lib.php');
 $con = new ConectorDB();
 $id = $_POST['id'];
 $st = $_POST['start_date'];
 $ed = $_POST['end_date'];
 $sh = $_POST['start_hour'];
 $eh = $_POST['end_hour'];
 if ($con->initConexion() == "OK") {
   $sql = "update event set start = '$st',end = '$ed',start_time ='$sh',end_time ='$eh' where event_id=$id";
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
