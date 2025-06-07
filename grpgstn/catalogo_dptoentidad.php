<?php if (!isset($_SESSION)) session_start();
    // require_once "../php/conexion.php";
    require_once "../conexiones/todoConexion.php";
    $tipo_consulta = $_POST['tipo_operacion'] ;
    $consultaso =new dbconexion();    

    switch ($tipo_consulta) {
        case 'buscar':
            # code...
            $deId = $_POST['deForm_id'];
            $qry = "SELECT * from departamento_entidad where id_departamento=$deId";           
            // print_r ($qry);
             $rs=$consultaso->findAll_By($qry);
            //  print_r ($rs);
            //  exit;
             echo json_encode( $rs );
        break;
        case 'guardar':
            $deN = $_POST['deForm_nombre'];            
             $qry="insert into departamento_entidad (nombre_departamento)values('$deN')";
            //  print_r ($qry);
             $rs=$consultaso->addP($qry);
            //  print_r ($rs);
            //  exit;
             echo json_encode(
                $rs['status']==1 ? $consultaso->getAll_OrderBy('departamento_entidad','id_departamento')
                :
                $rs
             );
            //
        break;
            
        case 'update'://bajo a la bd
            $deId = $_POST['deForm_id'];
            $deN = $_POST['deForm_nombre'];            
             $qry="UPDATE departamento_entidad SET nombre_departamento ='$deN' WHERE id_departamento =$deId ";
            //  print_r ($qry);
             $rs=$consultaso->addP($qry);
            //  print_r ($rs);
            //  exit;
             echo json_encode(
                $rs['status']==1 ? $consultaso->getAll_OrderBy('departamento_entidad','id_departamento')
                :
                $rs
             );
        break;    
        case 'eliminar':
            $id = $_POST['id'];
            $qry="DELETE FROM departamento_entidad WHERE id_departamento = $id";
            $rs=$consultaso->addP($qry);
            //  print_r ($rs);
            //  exit;
             echo json_encode(
                $rs['status']==1 ? $consultaso->getAll_OrderBy('departamento_entidad','id_departamento')
                :
                $rs
             );            
        break;    
        case 'listar':
            # code...listar todos
            echo json_encode(  $consultaso->getAll_OrderBy('departamento_entidad','id_departamento')      );
        break;
    }
    // echo json_encode($consultaso);

?>