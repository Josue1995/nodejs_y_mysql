<?php
  /**
   *
   */
  class ConectorDB
  {
    private $host = 'localhost';
    private $user = 'her';
    private $password = '';
    private $conexion;
    private $dbname = 'directorio';

    function initConexion(){
      $this->conexion = new mysqli($this->host,$this->user,$this->password,$this->dbname);
      if($this->conexion->connect_error){
        return "Error: ".$this->conexion->connect_error;
      }else{
        return 'OK';
      }
    }

    function ejecutarQuery($q)
    {
      return mysqli_query($this->conexion,$q);
    }

    function cerrarConeccion(){
      $this->conexion->close();
    }

  }


 ?>
