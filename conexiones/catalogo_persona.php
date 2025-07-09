<?php if (!isset($_SESSION)) session_start();
    // require_once "../php/conexion.php";
    require_once "../conexiones/todoConexion.php";
    $tipo_consulta = $_POST['tipo_operacion'] ;
    $consultaso =new dbconexion();    

    switch ($tipo_consulta) {
        case 'buscar':
            # code...
            $persId = $_POST['persForm_id'];
            $qry = "SELECT * from persona where id_persona=$persId";           
            // print_r ($qry);
             $rs=$consultaso->findAll_By($qry);
            //  print_r ($rs);
            //  exit;
             echo json_encode( $rs );
        break;
        case 'guardar':
            print_r($_POST);
            $persId = $_POST['persForm_id']; 
            $persN = $_POST['persForm_nombre']; 
            $persA = $_POST['persForm_apll']; 
            $persU = $_POST['persForm_uss'];            
            $persC = $_POST['persForm_clv']; 
            $persD = $_POST['persForm_dpto'];  
            $persCr = $_POST['persForm_cargo'];          
             $qry="insert into persona (id_persona,nombre_persona,apellido_persona,departamento_persona,usuario,contrasena,rango)values('$persId','$persN','$persA',$persD,'$persU','$persC',$persCr)";
             print_r ($qry);
             $rs=$consultaso->addP($qry);
             print_r ($rs);
             exit;
             echo json_encode(
                $rs['status']==1 ? $consultaso->getAll_OrderBy('persona','id_persona')
                :
                $rs
             );
            //
        break;
            
        case 'update'://bajo a la bd
            $persId = $_POST['persForm_id'];
            $persN = $_POST['persForm_nombre'];            
            $persR = $_POST['persForm_responsable']; 
            $persD = $_POST['persForm_dcc'];            
            $persT = $_POST['persForm_cell']; 
            $persC = $_POST['persForm_email'];            
            $qry="UPDATE persona SET nombre_persona ='$persN',responsable_persona='$persR',direccion_persona='$persD',telefono_persona='$persT',email_persona='$persC' WHERE id_persona =$persId ";
            //  print_r ($qry);
             $rs=$consultaso->addP($qry);
            //  print_r ($rs);
            //  exit;
             echo json_encode(
                $rs['status']==1 ? $consultaso->getAll_OrderBy('persona','id_persona')
                :
                $rs
             );
        break;    
        case 'eliminar':
            $id = $_POST['id'];
            $qry="DELETE FROM persona WHERE id_persona = $id";
            $rs=$consultaso->addP($qry);
            //  print_r ($rs);
            //  exit;
             echo json_encode(
                $rs['status']==1 ? $consultaso->getAll_OrderBy('persona','id_persona')
                :
                $rs
             );            
        break;    
        case 'listar':
            # code...listar todos
            $persCr = $_POST['persForm_cargo']=!'*'?'':'where rango='.$_POST['persForm_cargo'];
            $qry = 'SELECT * from vw_persona '.$persCr;           
            // print_r ($qry);
            $rs=$consultaso->findAll_By($qry);            
            echo json_encode($rs);
        break;
    }
    // echo json_encode($consultaso);

?>