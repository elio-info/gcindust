<?php if (!isset($_SESSION)) session_start();
    // require_once "../php/conexion.php";
    require_once "../conexiones/todoConexion.php";
    $tipo_consulta = $_POST['tipo_operacion'] ;
    $consultaso =new dbconexion();    

    switch ($tipo_consulta) {
        case 'buscar':
            # code...
            $gcId = $_POST['gcForm_id'];
            $qry = "SELECT * from grados_cientificos where id_gradocientifico=$gcId";           
            // print_r ($qry);
             $rs=$consultaso->findAll_By($qry);
            //  print_r ($rs);
            //  exit;
             echo json_encode(
                $rs
             );
             break;
        case 'guardar':
            $gcN = $_POST['gcForm_nombre'];            
             $qry="insert into grados_cientificos (nombre_gradocientifico)values('$gcN')";
            //  print_r ($qry);
             $rs=$consultaso->addP($qry);
            //  print_r ($rs);
            //  exit;
             echo json_encode(
                $rs['status']==1 ? $consultaso->getAll_OrderBy('grados_cientificos','id_gradocientifico')
                :
                $rs
             );
            //
            break;
            
        case 'update'://bajo a la bd
            $gcId = $_POST['gcForm_id'];
            $gcN = $_POST['gcForm_nombre'];            
             $qry="UPDATE grados_cientificos SET nombre_gradocientifico ='$gcN' WHERE id_gradocientifico =$gcId ";
            //  print_r ($qry);
             $rs=$consultaso->addP($qry);
            //  print_r ($rs);
            //  exit;
             echo json_encode(
                $rs['status']==1 ? $consultaso->getAll_OrderBy('grados_cientificos','id_gradocientifico')
                :
                $rs
             );
            break;    
        case 'eliminar':
            $id = $_POST['id'];
            $qry="DELETE FROM grados_cientificos WHERE id_gradocientifico = $id";
            $rs=$consultaso->addP($qry);
            //  print_r ($rs);
            //  exit;
             echo json_encode(
                $rs['status']==1 ? $consultaso->getAll_OrderBy('grados_cientificos','id_gradocientifico')
                :
                $rs
             );            
            break;    
        case 'listar':
            # code...listar todos
            echo json_encode(
                $consultaso->getAll_OrderBy('grados_cientificos','id_gradocientifico')
                );
            break;
    }
    // echo json_encode($consultaso);

?>