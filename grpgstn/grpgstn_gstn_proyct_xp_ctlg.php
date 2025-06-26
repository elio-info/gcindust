<?php include_once "../conexiones/header.php"; ?>
<!-- llena ya el div.wrapper esta iniciado-->
 1' seleccionar mis xprt, mostrarndo la lista de personal y decidir a quienes la hago la encuesta. Paro.
 2' muestro lista con avance de proceso y acciones a realizar [enviada,contestada,acept,denegado]
 <img src="../proy/xprts list desicion.jpg" alt="" srcset="">
 3' cerrada la lista
    <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <div class="container-fluid">
                <!-- adicionar proyecto -->
                    <div class="row py-2">
                        <div class="col col-lg-10 ">                          
                            <div class="row">
                                <div class="col-10">
                                    <div id="FormDiv" class="card shadow mb-5" style="display: none;">
                                        <div id="mensajesDiv" class="error-text"></div>
                                            <div class="card-header py-2" id="cabezaScc">
                                                Agregar Proyecto a Controlar
                                            </div>
                                            <div class="card-body">
                                                <form id="pryForm" name="pryForm"method="POST" autocomplete="off">
                                                    <input type="hidden" name="tipo_operacion" value="guardar">
                                                    <input type="hidden" name="pryForm_id" >
                                                    <div class="name-details">
                                                        <div class="field input">
                                                            <label>Nombre del Proyecto</label>
                                                            <input type="text" name="pryForm_nombre" placeholder="Nombre" required>
                                                        </div>          
                                                    </div> 
                                                    <div class="name-details">
                                                        <div class="field input">
                                                            <label>Nombre del Responsable - Proyecto</label>
                                                            <input type="text" name="pryForm_resp" placeholder="Nombre del Responsable" required>
                                                        </div>    
                                                        <div class="field select">
                                                            <label>Empresa del Responsable - Proyecto</label>
                                                            <select name="pryForm_emp" id="pryForm_emp" required>
                                                            </select>                                                            
                                                        </div>      
                                                    </div>        
                                                    <div class="date-details">
                                                        <div class="field date">
                                                            <label for="pryForm_fchsolc">Fecha de Solicitud - Proyecto</label>
                                                            <input type="date" name="pryForm_fchsolc" >
                                                        </div>          
                                                    </div>        
                                                    <div class="number-details">
                                                        <div class="field number">
                                                            <label>Presupuesto - Proyecto</label>
                                                            <input type="number" name="pryForm_dinero" >
                                                        </div>          
                                                    </div>        
                                                    <div class="number-details">
                                                        <div class="field number">
                                                            <label>Tiempo de ejecucion - Proyecto</label>
                                                            <input type="number" name="pryForm_tiempo" >
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
                    <!-- listado de proyectos -->
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
                                                                <p class=" text-primary m-0 fw-bold">Listado de Proyectos</p>                                               
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
  <script src="./fncns_empresa.js"></script>  
  <script src="./fncns_proyct.js"></script>
  <script>
    setMenu('admn',1);
    fillSelec_Empresa('pryForm_emp');
    fillTable_Proyecto('tableCardHead') //llenar datos  deList               
    </script>
</body>

</html>