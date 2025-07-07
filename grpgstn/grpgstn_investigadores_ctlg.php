<?php include_once "../conexiones/header.php"; ?>
<!-- llena ya el div.wrapper esta iniciado-->
    <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <div class="container-fluid">
                     <div class="row py-2">
                        <div class="col col-lg-10 ">                          
                            <div class="row">
                                <div class="col-10">
                                    <div id="FormDiv" class="card shadow mb-5" style="display: none;">
                                        <div id="mensajesDiv" class="error-text"></div>
                                        
                                            <div class="card-header py-2" id="cabezaScc">
                                                Agregar Investigador
                                            </div>
                                            <div class="card-body">
                                                <form id="persForm" name="persForm" method="POST" autocomplete="off">
                                                    <input type="hidden" name="tipo_operacion" value="guardar">
                                                    <input type="hidden" name="persForm_cargo" value="2">
                                                    <div class="name-details">
                                                        <div class="field input">
                                                            <label>Carnet de Identidad de la Persona</label>
                                                            <input type="text" name="persForm_id" placeholder="Nombre" required>
                                                        </div>          
                                                    </div> 
                                                    <div class="resp-details">
                                                        <div class="field input">
                                                            <label>Nombre del Investigador</label>
                                                            <input type="text" name="persForm_nombre" placeholder="Nombre" required>
                                                        </div>
                                                        <div class="field input">
                                                            <label>Apellidos de la Persona</label>
                                                            <input type="text" name="persForm_apll" placeholder="Apellidos" required>
                                                        </div>         
                                                    </div>        
                                                     <div class="correo-details">
                                                        <div class="field input">
                                                            <label>Departamento </label>
                                                            <select name="persForm_dpto" id="persForm_dpto"></select>
                                                        </div>          
                                                    </div>
                                                    <div class="dcc-details">
                                                        <div class="field input">
                                                            <label>Usuario en Sistema</label>
                                                            <input type="text" name="persForm_uss" placeholder="Usuario" required>
                                                        </div>          
                                                    </div> 
                                                    <div class="cell-details">
                                                        <div class="field input">
                                                            <label>Clave de Acceso</label>
                                                            <input type="password" name="persForm_clv" placeholder="######" >
                                                        </div>          
                                                    </div>        
                                                    
                                                    <div class="field button">
                                                        <input id="submitBtn" type="submit" name="submitBtn" value="Agregar">
                                                    </div>
                                                </form>
                                            </div>                                                
                                        </div>                                             
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div id="listde" class="row py-2">
                            <div class="d-flex flex-column" id="content-wrapper">
                                <div id="content">
                                    <div class="container-fluid">
                                        <div class="row mb-3">
                                        <div class="col col-lg-12 col-xl-12">
                                            <!-- tabla de areas -->
                                            <div class="card">
                                                <div class="card-header py-3">
                                                    <div class="row justify-content-between">
                                                        <div class="col col-5" >
                                                                <h3 class=" text-primary m-0 fw-bold">Listado de Investigadores</h3>                                               
                                                        </div>
                                                        <div class="col col-3">
                                                            <button type="button" class="btn btn-dark" onclick="AddInfo();">Adicionar</button>     
                                                        </div>
                                                        <div class="col col-3">
                                                            <button type="button" class="btn btn-primary" onclick="printInfo();">Imprimir</button>     
                                                        </div>
                                                    </div>
                                                    <div class="card-body">
                                                    <!-- row header of table card -->
                                                        <table id="tableCardHead" class="table table-striped">                                               
                                                        </table>
                                                        <!-- row header of table card -->                                            
                                                    </div>                                        
                                                </div>                            
                                            </div>                                    
                                        </div>    <!-- fin tabla de de -->
                                    </div>
                                </div>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
    </div>
    
 <!-- fin ya el div.wrapper esta finalizado-->
</div>
  <script src="../js/jquery-3.7.1.js"></script>  
  <script src="../js/bs-init.js"></script>
  <script src="../js/fncns_menu.js"></script>
  <script src="../bootstrap/js/bootstrap.min.js"></script>
  <script src="../js/my_dataTables.js"></script>
  <script src="../js/fncns_dptoentidad.js"></script>
  <script src="../js/fncns_persona.js"></script>
  <script>
        setMenu('super',4);
        fillSelec_Departamento('persForm_dpto');
        fillTable_Persona('tableCardHead','= 2') //llenar datos  deList               
    </script>
</body>

</html>