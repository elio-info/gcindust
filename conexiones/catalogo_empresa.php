<?php if (!isset($_SESSION)) session_start();
    // require_once "../php/conexion.php";
    require_once "../conexiones/todoConexion.php";
    $tipo_consulta = $_POST['tipo_operacion'] ;
    $consultaso =new dbconexion();    

    switch ($tipo_consulta) {
        case 'buscar':
            # code...
            $empId = $_POST['empForm_id'];
            $qry = "SELECT * from empresa where id_empresa=$empId";           
            // print_r ($qry);
             $rs=$consultaso->findAll_By($qry);
            //  print_r ($rs);
            //  exit;
             echo json_encode( $rs );
        break;
        case 'guardar':
            $empN = $_POST['empForm_nombre']; 
            $empR = $_POST['empForm_responsable']; 
            $empD = $_POST['empForm_dcc'];            
            $empT = $_POST['empForm_cell']; 
            $empC = $_POST['empForm_email'];            
             $qry="insert into empresa (nombre_empresa,responsable_empresa,direccion_empresa,telefono_empresa,email_empresa)values('$empN','$empR','$empD','$empT','$empC')";
            //  print_r ($qry);
             $rs=$consultaso->addP($qry);
            //  print_r ($rs);
            //  exit;
             echo json_encode(
                $rs['status']==1 ? $consultaso->getAll_OrderBy('empresa','id_empresa')
                :
                $rs
             );
            //
        break;
            
        case 'update'://bajo a la bd
            $empId = $_POST['empForm_id'];
            $empN = $_POST['empForm_nombre'];            
            $empR = $_POST['empForm_responsable']; 
            $empD = $_POST['empForm_dcc'];            
            $empT = $_POST['empForm_cell']; 
            $empC = $_POST['empForm_email'];            
            $qry="UPDATE empresa SET nombre_empresa ='$empN',responsable_empresa='$empR',direccion_empresa='$empD',telefono_empresa='$empT',email_empresa='$empC' WHERE id_empresa =$empId ";
            //  print_r ($qry);
             $rs=$consultaso->addP($qry);
            //  print_r ($rs);
            //  exit;
             echo json_encode(
                $rs['status']==1 ? $consultaso->getAll_OrderBy('empresa','id_empresa')
                :
                $rs
             );
        break;    
        case 'eliminar':
            $id = $_POST['id'];
            $qry="DELETE FROM empresa WHERE id_empresa = $id";
            $rs=$consultaso->addP($qry);
            //  print_r ($rs);
            //  exit;
             echo json_encode(
                $rs['status']==1 ? $consultaso->getAll_OrderBy('empresa','id_empresa')
                :
                $rs
             );            
        break;    
        case 'listar':
            # code...listar todos
            echo json_encode(  $consultaso->getAll_OrderBy('empresa','id_empresa')      );
        break;
    }
    // echo json_encode($consultaso);

?>