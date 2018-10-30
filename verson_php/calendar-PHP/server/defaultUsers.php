<?php
  require("lib.php");

  $conn = new ConectorDB();
  //usuario 1
  $n = "josue alfonso torres";
  $c = "josue12@hotmail.com";
  $pass = "123456";
  $p = password_hash($pass, PASSWORD_DEFAULT);
  $fecha = date("Y-m-d", strtotime("1995-06-09"));
  $sql1 = "insert into users(name,email,password,birthday) values('$n','$c','$p','$fecha');";
  //usuario 2
  $n = "rodrigo mauricio torres";
  $c = "rod12@hotmail.com";
  $pass = "1456";
  $p = password_hash($pass, PASSWORD_DEFAULT);
  $fecha = date("Y-m-d", strtotime("1996-09-27"));
  $sql2 = "insert into users(name,email,password,birthday) values('$n','$c','$p','$fecha');";
  //usuario 3
  $n = "coco torres";
  $c = "coco@hotmail.com";
  $pass = "409595";
  $p = password_hash($pass, PASSWORD_DEFAULT);
  $fecha = date("Y-m-d", strtotime("2014-10-09"));
  $sql3 = "insert into users(name,email,password,birthday) values('$n','$c','$p','$fecha');";

  if ($conn->initConexion() == 'OK') {

      if($conn->ejecutarQuery($sql1) == true){
        echo " Usuario 1 creado";
      }else {
        echo "error";
      }
      if($conn->ejecutarQuery($sql2) == true){
        echo " Usuario 2 creado";
      }else {
        echo "error";
      }
      if($conn->ejecutarQuery($sql3) == true){
        echo " Usuario 3 creado";
      }else {
        echo "error";
      }


  }else {
    echo "Fatal error";
  }

  $conn->cerrarConeccion();
 ?>
