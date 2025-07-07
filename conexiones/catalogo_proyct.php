<?php if (!isset($_SESSION)) session_start();
    // require_once "../php/conexion.php";
    require_once "../conexiones/todoConexion.php";
    $tipo_consulta = $_POST['tipo_operacion'] ;
    $consultaso =new dbconexion();    

    switch ($tipo_consulta) {
        case 'buscar':
            # code...
            $pryId = $_POST['pryForm_id'];
            $qry = "SELECT * from proyecto where id_proyecto=$pryId";           
            // print_r ($qry);
             $rs=$consultaso->findAll_By($qry);
            //  print_r ($rs);
            //  exit;
             echo json_encode( $rs );
        break;
        case 'guardar':
            $pryN = $_POST['pryForm_nombre']; 
            $pryR = $_POST['pryForm_resp']; 
            $pryE = $_POST['pryForm_emp'];            
            $pryF = $_POST['pryForm_fchsolc']; 
            $pryD = $_POST['pryForm_dinero'];  
            $pryT = $_POST['pryForm_tiempo'];          
             $qry="insert into proyecto (nombre_proyecto,nombre_responsable_proyecto,dia_solicitud_proyecto,presupuesto_proyecto,tiempo_estimado_proyecto,id_empresa,estado_proyecto)values('$pryN','$pryR','$pryF',$pryD,$pryT,$pryE,1)";
            //  print_r ($qry);
             $rs=$consultaso->addP($qry);
            //  print_r ($rs);
            //  exit;
             echo json_encode(
                $rs['status']==1 ? $consultaso->getAll_OrderBy('vw_pry','id_proyecto')
                :
                $rs
             );
            //
        break;
            
        case 'update'://bajo a la bd
            $pryId = $_POST['pryForm_id'];
            $pryN = $_POST['pryForm_nombre'];            
            $pryR = $_POST['pryForm_responsable']; 
            $pryD = $_POST['pryForm_dcc'];            
            $pryT = $_POST['pryForm_cell']; 
            $pryC = $_POST['pryForm_email'];            
            $qry="UPDATE proyecto SET nombre_proyecto ='$pryN',responsable_proyecto='$pryR',direccion_proyecto='$pryD',telefono_proyecto='$pryT',email_proyecto='$pryC' WHERE id_proyecto =$pryId ";
            //  print_r ($qry);
             $rs=$consultaso->addP($qry);
            //  print_r ($rs);
            //  exit;
             echo json_encode(
                $rs['status']==1 ? $consultaso->getAll_OrderBy('vw_pry','id_proyecto')
                :
                $rs
             );
        break;
        case 'upd_state'://bajo a la bd
            $pryId = $_POST['id'];
            $prySt = $_POST['estado'];            
            $qry="UPDATE proyecto SET estado_proyecto =$prySt WHERE id_proyecto =$pryId ";
            //  print_r ($qry);
             $rs=$consultaso->addP($qry);
            //  print_r ($rs);
            //  exit;
             echo json_encode(
                $rs['status']==1 ? $consultaso->getAll_OrderBy('vw_pry','id_proyecto')
                :
                $rs
             );
        break;    
        case 'eliminar':
            $id = $_POST['id'];
            $qry="DELETE FROM proyecto WHERE id_proyecto = $id";
            $rs=$consultaso->addP($qry);
            //  print_r ($rs);
            //  exit;
             echo json_encode(
                $rs['status']==1 ? $consultaso->getAll_OrderBy('proyecto','id_proyecto')
                :
                $rs
             );            
        break;    
        case 'listar':
            # code...listar todos
            echo json_encode(  $consultaso->getAll_OrderBy('vw_pry','id_proyecto')      );
        break;
        // grupos
        case 'add_grp_nm':
            $gpryN = $_POST['prygrpFrm_nombre']; 
            $gpryP = $_POST['id_pry'];
             $qry="insert into grupos_proyecto (nombre_grupo,id_proyecto)values('$gpryN',$gpryP)";
            //  print_r ($qry);
             $rs=$consultaso->addP($qry);
            //  print_r ($rs);
            //  exit;
             echo json_encode(
                $rs['status']==1 ? $consultaso->getAll_OrderBy('grupos_proyecto','id_proyecto')
                :
                $rs
             );
            //
        break;
        case 'lstr_gp':
            # code...listar todos
            echo json_encode(  $consultaso->getAll_OrderBy('vw_grppry','id_proyecto')      );
        break;
    }
    // echo json_encode($consultaso);

?>