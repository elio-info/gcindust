
let url_pry='../conexiones/catalogo_proyct.php'

/**
 * The function `getAllDataFromTablePry` asynchronously retrieves all data from a table
 * named 'Empresa'.
 * @returns The `getAllDataFromTablePry` function is returning the result of the
 * `submitForm` function, which is being awaited. The `submitForm` function is submitting a form with
 * the specified data (`tipo_operacion` set to `'listar'`) to the specified URL (`url_pry`) for the
 * resource `empresa`. The `true
 */
async function getDataFromTablePry(operacion='listar',id_pry='') {   
    const datoso = new FormData();
    datoso.append("tipo_operacion",operacion) ; 
    datoso.append("pryForm_id",id_pry) ;    
    return await submitForm(datoso,url_pry,'proyecto',true) ;     
    }  

    
/** Ok
 * para pintar tablas
 * @param {Object} paramsTableTrName id for the objet <table> to create the list
 */
const fillTable_Proyecto = async (paramsTableTrName,responsable_proyecto) =>{
    //
    var datapry= (await getDataFromTablePry('buscarPI',responsable_proyecto)).data;     
    console.log(datapry); 
    
    datapry.map(val =>{
        val['hacer']={est:val.id_estado_proyecto,id:val.id_proyecto,prs:val.responsable_proyecto,nm:val.nombre_proyecto};
    })
   
   if ($('#'+paramsTableTrName+'_wrapper')[0]) {
        // alert('cojelo');
        $('#'+paramsTableTrName).DataTable().destroy();
    }
    $('#'+paramsTableTrName).DataTable({
        columns:[
            { title: 'Nombre Proyecto',data:'nombre_proyecto'}, 
            // { title: 'Responsable ',data:'nombre_responsable_proyecto'}, 
            { title: 'Empresa ',data:'nombre_empresa'}, 
            { title: 'Solicitado ',data:'dia_solicitud_proyecto'}, 
            { title: 'Presupuesto',data:'presupuesto_proyecto', render:function (data) {
                var ver=data+' (miles de $)';
                return ver;
            }},
            { title: 'Duracion ',data:'tiempo_estimado_proyecto', render:function (data) {
                var ver=data+' (meses)';
                return ver;
            }}, 
            { title: 'Estado',data:'nombre_estado_proyecto'},
            { title: 'Acciones',
                data:'hacer',
                render:function (data) {
                    var botones=``;
                    switch (parseInt(data.est)) {
                        case 1:
                            botones=`
                                <button class="btn btn-success" onclick="preAprobarPry(${data.id},'${data.prs}')">Aprobar</button>
                                <button class="btn btn-danger"  onclick="preCancelarPry(${data.id},'${data.prs}')">Cancelar</button>`  
                            break;
                        case 3:
                            botones=`
                                <button class="btn btn-warning" onclick="preControlarPry(${data.id},'${data.nm}')">Controlar</button>`  
                            break;
                        default:

                            break;
                    }
                                
          return botones;
                }
        }
        ],
        data: datapry
    })
}

/** Ok
 * Actualizar el select
 * @param {int} dataSelc item selected on arreglos d datos
 * @param {Object} tab_datos objeto <td>
 */
const fillSelec_Proyecto = async (tab_datos,dataSelc=-1) =>{
    let mydata= (await getDataFromTable_Proyecto()).data
    
    let doc_tab_datos = document.getElementById(tab_datos)
    
    // si lleno, lo vacio
    if (doc_tab_datos.options.length>0) doc_tab_datos.options.length = 0;
    // set the first
    let opt_datos = document.createElement('option');
        opt_datos.value = -1;
        opt_datos.text= "----";
        if (-1 === dataSelc) {
                        opt_datos.selected=true
                    }
        doc_tab_datos.appendChild(opt_datos)
    if ( mydata.length>0) {
       //# code...       
           for(let item of mydata){
               let opt_datos = document.createElement('option')
               opt_datos.value=item.id_proyecto;
               opt_datos.text=item.nombre_proyecto;                       
               if (item.id_proyecto==dataSelc) {
                opt_datos.selected=true
               }
           doc_tab_datos.appendChild(opt_datos)
       }    
   }
}

/**
 * The function `updateSelectedPry` updates the selected option in a dropdown menu based on the
 * provided data.
 * @param tab_datos - The `tab_datos` parameter is the ID of the HTML select element that you want to
 * update the selected option for.
 * @param dataSelc - The `dataSelc` parameter in the `updateSelectedPry` function represents the
 * value that you want to select in the dropdown list specified by the `tab_datos` parameter. The
 * function loops through the options in the dropdown list and sets the `selected` property to `true`
 * for the
 */
const updateSelectedPry =  (tab_datos,dataSelc) =>{
    let doc_tab_datos = document.getElementById(tab_datos)
       //# code...       
           for(let item of doc_tab_datos){
               item.selected= (item.value==dataSelc)? true : false ;
       }  
}

let pryForm_onPage = document.getElementById('pryForm');//all forms

/* The `pryForm_onPage.addEventListener( 'submit' , async (e) =>{ ... })` code snippet is adding an
event listener to the form with the ID `pryForm_onPage`. When the form is submitted, the following
actions are performed: */
pryForm_onPage.addEventListener('submit' , async (e) =>{
   e.preventDefault();
    // areaForm_onPage['tipo_operacion']='guardar';

    let pry_data= await submitForm(new FormData (pryForm_onPage) ,url_pry);
    pryForm_onPage.reset();//clean form
    //ppp.status
    if (pry_data['status']) {
        CloseInfo();       
    } else {
       mostrarMensaje('mensajesDiv','error','No se pudo'); 
    }
})

/**
 * The function `preEliminarEmp` is an asynchronous function that prepares and submits a form to delete
 * a scientific degree entry, displaying a success message and updating the table if the deletion is
 * successful.
 * @param id_proyecto - The `id_proyecto` parameter in the `preEliminarEmp` function is
 * the ID of the scientific degree that you want to delete. This function prepares a form data object
 * with the operation type set to "eliminar" (delete) and the ID of the scientific degree to be deleted
 */
const preEliminarPry= async (id_proyecto) => {
    let delFrm=new FormData();
    delFrm.append('tipo_operacion','eliminar');
    delFrm.append('id',id_proyecto);
    let elto = await submitForm(delFrm,url_pry);

    if (elto['status']) {
        mostrarMensaje('mensajesDiv','success','Eliminado.');
        fillTable_Proyecto('tableCardHead');         
    }
    
}
/**
 * The function `preEditarEmp` is an asynchronous function that retrieves data from a table, updates
 * form fields with the retrieved data, and sets focus on a specific field.
 * @param paramsId - The `paramsId` parameter in the `preEditarEmp` function seems to be used as an
 * identifier for a specific record in a table of Grados Cientificos (Scientific Degrees). It is likely
 * used to retrieve data related to a specific Grado Cientifico for editing purposes
 */
const preEditarPry= async (paramsId) => {
    //buscar 
    let pry_data = (await getDataFromTablePry('buscar',paramsId)).data[0];
    AddInfo();
    // cambio de tipo op
    pryForm_onPage['tipo_operacion'].value='update';
    pryForm_onPage['pryForm_id'].value=paramsId;    
    pryForm_onPage['pryForm_nombre'].value=pry_data.nombre_proyecto;  
    pryForm_onPage['pryForm_resp'].value=pry_data.responsable_proyecto; 

    fillSelec_Empresa('pryForm_emp',pry_data.id_empresa)

    pryForm_onPage['pryForm_fchsolc'].value=pry_data.dia_solicitud_proyecto; 
    pryForm_onPage['pryForm_dinero'].value=pry_data.presupuesto_proyecto;  
    pryForm_onPage['pryForm_tiempo'].value=pry_data.tiempo_estimado_proyecto;
    // pryForm_onPage['pryForm_tiempo'].value=pry_data.tiempo_estimado_proyecto;
      
    pryForm_onPage['submit'].value='Actualizar';    
    // set foco
    pryForm_onPage['pryForm_nombre'].focus();
}
const preAprobarPry= async (id_proyecto,resp) => {
    let st2_pry=new FormData();
    st2_pry.append('tipo_operacion','upd_state');
    st2_pry.append('id',id_proyecto);
    st2_pry.append('estado',3);
    let elto = await submitForm(st2_pry,url_pry,'proy_apro');
    if (elto['status']) {
        mostrarMensaje('mensajesDiv','success','Aprobado.');
        fillTable_Proyecto('tableCardHead',resp);         
    }    
}
const preCancelarPry= async (id_proyecto,resp) => {
    let st2_pry=new FormData();
    st2_pry.append('tipo_operacion','upd_state');
    st2_pry.append('id',id_proyecto);
    st2_pry.append('estado',2);
    let elto = await submitForm(st2_pry,url_pry,'proy_apro');
    if (elto['status']) {
        mostrarMensaje('mensajesDiv','success','Cancelado.');
        fillTable_Proyecto('tableCardHead',resp);         
    }    
}
const preControlarPry= async (id_proyecto,nombre_proyecto) => {
    let st2_pry=document['goto_pry'];
    st2_pry.action='grpgstn_proyct_pry.php';
    st2_pry['id_pry'].value=id_proyecto;
    st2_pry['nm_pry'].value=nombre_proyecto;
    st2_pry.submit();
        
}
// ================== grupo  =========================
function showDiv_AddGrupos(params) {
    $('#listagruposDiv').show();
    $('#add_grpsPryDiv').hide();
}

async function getDataFromTable_GrpsPry(operacion='lstr_gp',id_pry='') {   
    const datoso = new FormData();
    datoso.append("tipo_operacion",operacion) ; 
    datoso.append("pryForm_id",id_pry) ;
    return await submitForm(datoso,url_pry,'grp_proyecto',true) ;     
    }  
async function updateTable_GrpsPry(operacion,id_grp,stt) {   
    const datoso = new FormData();
    datoso.append("tipo_operacion",operacion) ; 
    datoso.append("id_grp",id_grp) ;
    datoso.append("stt",stt) ;
    return await submitForm(datoso,url_pry,'grp_proyecto g'+id_grp,true) ;     
    }  

let grp_proyct=document.getElementById('prygrpFrm');


async function fillTable_GrpsPry(params,pry) {
    let data=(await getDataFromTable_GrpsPry('lstr_gp',pry)).data
    let lst=document.getElementById(params);
    lst.innerHTML=``;
    if (data.length>0) {
        data.map((val)=>{//
          lst.innerHTML +=`
          <div class="row">
        <h3>  Nombre del Grupo : ${val.nombre_grupo} </h3>`;
        switch (parseInt (val.estado)) {
            case 0:
                lst.innerHTML += `<a href='#' onclick="llenarPosibles_Expertos('posiblesExpertos',${val.id_proyecto},${val.id_grupo},'${val.nombre_grupo}')"> Llenar con posibles candidatos </a> 
          `;
                break;        
            case 1:
                 lst.innerHTML += `<a href='#' onclick="llenar_Expertos('posiblesExpertos',${val.id_proyecto},${val.id_grupo},'${val.nombre_grupo}')"> Aceptar candidatos</a>
          `;
                break;
        }
    lst.innerHTML +=` </div>`;
         
        })
    } else {
       lst.innerHTML=`No tiene grupos` ;
    }
}
grp_proyct.addEventListener('submit', async (e)=> {
    e.preventDefault();
    let pry=grp_proyct['id_pry'].value;
    let grp_nm= new FormData (grp_proyct);
    // grp_nm.append('tipo_operacion', $('#prygrpFrm_nombre').val());    
    // grp_nm.append('nombre', $('#prygrpFrm_nombre').val());
    // grp_nm.append('id_pry', $('#id_pry').val());
    let grps= await submitForm(grp_nm ,url_pry,'add_grp');
    console.log(grps);
    $('#listagruposDiv').hide();
    $('#add_grpsPryDiv').show();
     fillTable_GrpsPry('list_grpsPry',pry);
}
)
/**
 * llenar con los posibles Expertos
 * @param {*} lugar 
 * @param {*} id_p 
 * @param {*} id_g 
 * @param {*} n_g 
 */
async function llenarPosibles_Expertos(lugar,id_p,id_g,n_g) {
    // mostrar listado de expertos para decidir cual hace la encuesta
    document.getElementById('id_pry').value=id_p;
    document.getElementById('id_grp').value=id_g;
    document.getElementById('tipo_acc').value='posible';
    $('#'+lugar).show();
    let exp= (await getAll_Experts()).data;
    document.getElementById(lugar+'_ltr').innerHTML=n_g;
    let poner=document.getElementById(lugar+'_ul');
    poner.innerHTML='';
    if (exp.length>0) {
        exp.map((val_exp) =>{       
       let posbExp=`<li class="list-group-item">
                    <div class="row g-0 align-items-center">
                        <div class="col me-2">
                            <h6 class="mb-0"><strong>${val_exp.nombre_persona } ${val_exp.apellido_persona} </strong></h6>
                            <span class="text-xs">${val_exp.nombre_departamento}</span>
                        </div>
                        <div class="col-auto">
                            <div class="form-check">
                            <input name="formchkPosibleExp" class="form-check-input" type="checkbox"  value="${val_exp.id_persona}"/>
                            </div>
                        </div>
                    </div>
                </li>` 
        poner.innerHTML+=posbExp;    

       })          
    }
    
}

/**
 * Llenar con los expertos definitivos
 * @param {*} lugar 
 * @param {*} id_p 
 * @param {*} id_g 
 * @param {*} n_g 
 */
async function llenar_Expertos(lugar,id_p,id_g,n_g) {
    // mostrar listado de expertos para decidir cual hace la encuesta
    document.getElementById('id_pry').value=id_p;
    document.getElementById('id_grp').value=id_g;
    document.getElementById('tipo_acc').value='aceptados';
    $('#'+lugar).show();
    let exp= (await getAll_Pendientes_Encuesta(id_g)).data.info;
    document.getElementById(lugar+'_ltr').innerHTML=n_g;
    let poner=document.getElementById(lugar+'_ul');
    poner.innerHTML='';
    if (exp.length>0) {
        exp.map((val_exp) =>{ 
        let letrero=''          ;
        if (val_exp.clasificacion_profesional==null) {
            letrero='No la ha realizado aun';
        } else {
            letrero='La ha realizado aun';
        }
       let posbExp=`<li class="list-group-item">
                    <div class="row g-0 align-items-center">
                        <div class="col me-2">
                            <h6 class="mb-0"><strong>${val_exp.nombre_persona } </strong></h6>
                            <span class="text-xs">${letrero}</span>
                        </div>
                        <div class="col-auto">
                            <div class="form-check">
                            <input name="formchkPosibleExp" class="form-check-input" type="checkbox"  value="${val_exp.id_experto}"/>
                            </div>
                        </div>
                    </div>
                </li>` 
        poner.innerHTML+=posbExp;    

       })          
    }
    
}
let grp_proyct_posibleExp=document.getElementById('llenarPosiblesExprt');

grp_proyct_posibleExp.addEventListener('submit', async (e)=> {
    e.preventDefault();
    let pr=$('#id_pry').val();
    let gp=$('#id_grp').val();
    let ac=$('#tipo_acc').val();
    let checkboxes=document.getElementsByName('formchkPosibleExp'),
        v=null,
        result=null;
    switch (ac) {
        case 'posible':            
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {                    
                    let x=checkboxes[i].value;
                    result = await set_Expert_Pendiente_Encuesta(pr,gp,x) ;
                    console.log(result);                    
                }
            }
            v= await updateTable_GrpsPry('upd_grp_stt',gp,1);
            break;
    
        case 'aceptados':
            result = await set_Expert_Pendiente_Encuesta(pr,gp,x) ;
                    console.log(result);                    
            v= await updateTable_GrpsPry('upd_grp_stt',gp,2);
            break;
    }
    
    fillTable_GrpsPry('list_grpsPry',pr);
    $('#posiblesExpertos').hide();
}
)