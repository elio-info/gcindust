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
                                                Agregar Grado Cientifico
                                            </div>
                                            <div class="card-body">
                                                <form id="deForm" name="deForm"method="POST" autocomplete="off">
                                                    <input type="hidden" name="tipo_operacion" value="guardar">
                                                    <input type="hidden" name="deForm_id" >
                                                    
                                                    <div class="name-details">
                                                        <div class="field input">
                                                            <label>Nombre del Departamento</label>
                                                            <input type="text" name="deForm_nombre" placeholder="Nombre" required>
                                                        </div>          
                                                    </div>        
                                                    <div class="field button">
                                                        <input id="submit" type="submit" name="submit" value="Agregar">
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
                                                                <p class=" text-primary m-0 fw-bold">Listado de Departamentos de la Entidad</p>                                               
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
  <script src="./fncns_dptoentidad.js"></script>

  <script>
    setMenu('admn',2);
    fillTable_Departamento('tableCardHead') //llenar datos  deList               
    </script>
</body>

</html>