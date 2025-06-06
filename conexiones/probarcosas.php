<?php
require_once "todoConexion.php";
$uss = $_POST['uss'];
$pss = $_POST['pss'];
$cnx= new dbconexion();
// $sqlp = $cnx->query("SELECT * FROM ussrs");
// $array = $sqlp->fetchAll(PDO::FETCH_ASSOC);

   // print_r($sqlp) ;
   // echo "dfbdfb \n";
   // iterate over array by index and by name
   // echo json_encode($sqlp, JSON_PRETTY_PRINT);

   $qry="SELECT * FROM ussrs WHERE ( uss='$uss' and psswr= sha1('$pss'));";
        echo("<script>console.log(`PHP: " . $qry . "`);</script>");
        $sql = $cnx->query($qry);
      //   print_r($sql);
        if($sql!=null || empty($sql)){
            $user=$sql[0];
            // print_r($user);
            // $_SESSION['persona'] = ['id'=> $user['uss'],'nombre'=> $user['nombre_usuario'],'cargo'=> $user['lvl']];  
            // return $user;
        }else {
            // return
             $user= $sql ;
        }
   print_r($user);

  
