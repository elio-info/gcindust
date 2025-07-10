<?php include_once "../conexiones/header.php"; ?>
<!-- llena ya el div.wrapper esta iniciado-->
<!-- se muestra el listado de cuestionarios pendientes a responder del experto que se logueo

LISTA DE cuestionarios

mostrar cuestionario seleccionado

<img src="../proy/xprts qstn.jpg" alt="" srcset="">
se pone en espera de respuesta -->
<div class="row">
    <div class="card col-5">
        <div class="card shadow mb-4">
            <div class="card-header py-3" style="display: inline-block;position: relative;">
                <div class="row">
                    <div class="col col-8">
                        <h6 class="text-primary fw-bold m-0">Encuestas</h6>
                    </div>            
                </div>
                <ul id="listaEncuestas" class="list-group list-group-flush">        
                </ul>
            </div>
        </div>
    </div>
</div>

<div id="enq" class="container_my" style="display: none;">
    <div class="screen_base" style=" height: 50em;width: 60em;	">
        <div class="card shadow mb-5">
            <div class="card-header py-3">
                <h3 id="letrero"></h3>
                <p class="text-primary m-0 fw-bold">Encuesta a Especialista</p>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6 col-xl-4">
                        <form id="encuesta" method="post">
                            <input type="hidden" name="tipo_acc" id="tipo_acc" value="add_enc_exp">
                            <input type="hidden" name="id_pry" id="id_pry">
                            <input type="hidden" name="id_grp" id="id_grp">
                            <input type="hidden" name="id_exp" id="<?=$_SESSION['persona']['id'];?>">
                            
                            <div class="mb-3"><label class="form-label" for="enespForm_cargoactual"><strong>Cargo Actual</strong></label><input id="enespForm_cargoactual" class="form-control" type="text" style="height: 37px;width: 250px;" /></div>
                            <div class="mb-3"><label class="form-label" for="enespForm_cargoactual-1"><strong>Años de experiencia en el cargo</strong></label><input id="enespForm_cargoactual_tiempo" class="form-control" type="number" style="height: 37px;width: 80px;" min="1" value="1" /></div>
                                <label class="form-label" for="enespForm_cargoactual"><strong>Calificación profesional</strong></label>
                                <select id="enespForm_cargoactual_clf" name="enespForm_cargoactual_clf" class="form-select">                                
                                </select>
                            <div class="mb-3"></div>
                        </form>
                    </div>
                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <div class="row">
                                    <div class="col"><label class="col-form-label"><span style="color: rgb(51, 51, 51);">1. Marque  el valor que se corresponde con el grado de conocimientos que usted posee en la materia presentada. Considere que la escala que le presentamos es ascendente, es decir, el conocimiento sobre el tema referido va creciendo desde 0 hasta 10.</span></label></div>
                                </div>
                                <fieldset>
   
                                <div id="valores" class="custom-control custom-radio custom-control-inline">
                                    <input id="customRadioInline1" class="custom-control-input" type="radio" name="customRadioInline" />
                                    <label class="custom-control-label" for="customRadioInline1">
                                        1</label>
                                
                                    <input id="customRadioInline2" class="custom-control-input" type="radio" name="customRadioInline" />
                                <label class="custom-control-label" for="customRadioInline2">2</label>
                            </div>
                                </fieldset>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div id="conocimiento" class="row">
                                    <!-- <div class="col">
                                        <div class="form-check"><input id="formCheck-2" class="form-check-input" type="radio" /><label class="form-check-label" for="formCheck-2">Label</label></div>
                                    </div> -->
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col"><label class="col-form-label"><span style="color: rgb(51, 51, 51);">2.- Realice una autovaloración del grado de influencia que cada una de las fuentes que le presentamos a continuación, ha tenido en sus conocimientos y criterios. Para ello marque, según corresponda, en A (alto), M (medio) o B (bajo).</span></label></div>
                        </div>
                        <div class="table-responsive">
                            <table id="autovaloracion" class="table">
                                <thead>
                                    <tr>
                                        <th width="50%" rowspan="2"><br /><strong><span style="color: rgb(51, 51, 51);">Fuentes de argumentación</span></strong></th>
                                        <th colspan="3">Grado de influencia de la fuente</th>
                                    </tr>
                                    <tr>
                                      <th width="10%">A</th>
                                      <th width="10%">M</th>
                                      <th width="10%">B</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                      <td>Análisis teóricos realizados por usted</td>
                                      <td>&nbsp;<input id="enesForm_1A" name="enesForm_1" class="form-check-input" type="radio" /></td>
                                      <td>&nbsp;<input id="enesForm_1M" name="enesForm_1" class="form-check-input" type="radio" /></td>
                                      <td>&nbsp;<input id="enesForm_1B" name="enesForm_1" class="form-check-input" type="radio" /></td>
                                    </tr>
                                    <tr>
                                      <td><div id="u59">
                                        <div id="u59_text">
                                          <p>Su experiencia obtenida</p>
                                        </div>
                                      </div></td>
                                      <td>&nbsp;<input id="enesForm_2A" name="enesForm_2" class="form-check-input" type="radio" /></td>
                                      <td>&nbsp;<input id="enesForm_2M" name="enesForm_2" class="form-check-input" type="radio" /></td>
                                      <td>&nbsp;<input id="enesForm_2B" name="enesForm_2" class="form-check-input" type="radio" /></td>
                                    </tr>
                                    <tr>
                                      <td>Trabajos de autores nacionales</td>
                                      <td>&nbsp;<input id="enesForm_3A" name="enesForm_3" class="form-check-input" type="radio" /></td>
                                      <td>&nbsp;<input id="enesForm_3M" name="enesForm_3" class="form-check-input" type="radio" /></td>
                                      <td>&nbsp;<input id="enesForm_3B" name="enesForm_3" class="form-check-input" type="radio" /></td>
                                    </tr>
                                    <tr>
                                        <td>Trabajos de autores extranjeros</td>
                                        <td>&nbsp;<input id="enesForm_4A" name="enesForm_4" class="form-check-input" type="radio" /></td>
                                        <td>&nbsp;<input id="enesForm_4M" name="enesForm_4" class="form-check-input" type="radio" /></td>
                                        <td>&nbsp;<input id="enesForm_4B" name="enesForm_4" class="form-check-input" type="radio" /></td>
                                    </tr>
                                    <tr>
                                      <td>Su propio conocimiento del estado del problema en el extranjero</td>
                                      <td>&nbsp;<input id="enesForm_5A" name="enesForm_5" class="form-check-input" type="radio" /></td>
                                      <td>&nbsp;<input id="enesForm_5M" name="enesForm_5" class="form-check-input" type="radio" /></td>
                                      <td>&nbsp;<input id="enesForm_5B" name="enesForm_5" class="form-check-input" type="radio" /></td>
                                    </tr>
                                    <tr>
                                        <td>Su intuición</td>
                                        <td>&nbsp;<input id="enesForm_6A" name="enesForm_6" class="form-check-input" type="radio" /></td>
                                        <td>&nbsp;<input id="enesForm_6M" name="enesForm_6" class="form-check-input" type="radio" /></td>
                                        <td>&nbsp;<input id="enesForm_6B" name="enesForm_6" class="form-check-input" type="radio" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div><button class="btn btn-primary btn-sm" type="submit">Guardar</button>
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
  <script src="../js/fncns_grados100tfk.js"></script> 
  <script src="../js/fncns_proyct.js"></script> 
  <script src="../js/fncns_xprts.js"></script>
  <script>
    setMenu('exprt',1,<?=$_SESSION['persona']['cargo'];?>,'<?=$_SESSION['persona']['nombre'];?>');    
    fillSelec_G100(0,'enespForm_cargoactual_clf');
    fillTable_EncuestaExp('listaEncuestas',<?=$_SESSION['persona']['id'];?>) //llenar datos  deList               
    </script>
</body>

</html>