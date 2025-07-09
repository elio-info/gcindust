<?php if (!isset($_SESSION)) session_start();
    // require_once "../php/conexion.php";
    require_once "../conexiones/todoConexion.php";
    $tipo_consulta = $_POST['tipo_operacion'] ;
    $consultaso =new dbconexion();    

    switch ($tipo_consulta) {
        // nuevo
        case 'llenar_lgx':
            $pry = $_POST['id_p']; 
            $grp = $_POST['id_g']; 
            $xp = $_POST['id_x'];            
            $state = $_POST['stt'];                       
             $qry="insert into listado_grupo_experto (id_proyecto,id_grupo,id_experto,estado)values($pry,$grp,'$xp',$state)";
            //  print_r ($qry);
             $rs=$consultaso->addP($qry);
            //  print_r ($rs);
            //  exit;
             echo json_encode(   $rs );
            //
        break;
        case 'buscar':
            # code...
            $grpId = $_POST['id_grp'];
            $qry = "SELECT * from vw_pry where id_proyecto=$pryId";           
            // print_r ($qry);
             $rs=$consultaso->findAll_By($qry);
            //  print_r ($rs);
            //  exit;
             echo json_encode( $rs );
        break;   
        
        
        
        /*
        case 'lstr_xprt':
            # code...listar todos
            echo json_encode(  $consultaso->getAll_OrderBy('vw_grppry','id_proyecto')      );
        break;
        
        


        case 'buscarPI'://proy de Inv
            # code...
            $pryId = $_POST['pryForm_id'];
            $qry = "SELECT * from vw_pry where responsable_proyecto=$pryId";           
            // print_r ($qry);
             $rs=$consultaso->findAll_By($qry);
            //  print_r ($rs);
            //  exit;
             echo json_encode( $rs );
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
        
        */
    }
    // echo json_encode($consultaso);

?>