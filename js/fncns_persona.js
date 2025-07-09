
let url_pers='../conexiones/catalogo_persona.php'

/**
 * The function `getAllDataFromTablePers` asynchronously retrieves all data from a table
 * named 'Empresa'.
 * @returns The `getAllDataFromTablePers` function is returning the result of the
 * `submitForm` function, which is being awaited. The `submitForm` function is submitting a form with
 * the specified data (`tipo_operacion` set to `'listar'`) to the specified URL (`url_pers`) for the
 * resource `empresa`. The `true
 */
async function getDataFromTablePers(operacion='listar',id_pers='',cargo_pers='*') {   
    const datoso = new FormData();
    datoso.append("tipo_operacion",operacion) ; 
    datoso.append("persForm_id",id_pers) ;
    datoso.append("persForm_cargo",cargo_pers) ;
    return await submitForm(datoso,url_pers,'persona',true) ;     
    }  

    
/** Ok
 * para pintar tablas
 * @param {Object} paramsTableTrName id for the objet <table> to create the list
 */
const fillTable_Persona = async (paramsTableTrName,cargo='*') =>{
    //
    var datapers= (await getDataFromTablePers('listar','',cargo)).data;     
    console.log(datapers);  
   
   if ($('#'+paramsTableTrName+'_wrapper')[0]) {
        // alert('cojelo');
        $('#'+paramsTableTrName).DataTable().destroy();
    }
    $('#'+paramsTableTrName).DataTable({
        columns:[
            { title: 'Nombre Persona',data:'nombre_persona'}, 
            { title: 'Apellidos ',data:'apellido_persona'}, 
            { title: 'Identidad ',data:'id_persona'}, 
            { title: 'Departamento ',data:'nombre_departamento'}, 
            // { title: 'Presupuesto',data:'presupuesto_persona'},
            { title: 'Nivel ',data:'nombre_rango'}, 
            // { title: 'Estado',data:'nombre_estado_persona'},
            { title: 'Acciones',
                data:'id_persona',
                render:function (data) {
                    var botones=`
         <button class="btn btn-dark" onclick="preEditarPers(${data})">Editar</button>
         <button class="btn btn-danger"  onclick="preEliminarPers(${data})">Eliminar</button>`              
          return botones;
                }
        }
        ],
        data: datapers
    })
}

/** Ok
 * Actualizar el select
 * @param {int} dataSelc item selected on arreglos d datos
 * @param {Object} tab_datos objeto <td>
 */
const fillSelec_Persona = async (tab_datos,dataSelc=-1) =>{
    let mydata= (await getDataFromTable_Persona()).data
    
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
               opt_datos.value=item.id_persona;
               opt_datos.text=item.nombre_persona+' '+item.apellido_persona;                       
               if (item.id_persona==dataSelc) {
                opt_datos.selected=true
               }
           doc_tab_datos.appendChild(opt_datos)
       }    
   }
}

/**
 * The function `updateSelectedPers` updates the selected option in a dropdown menu based on the
 * provided data.
 * @param tab_datos - The `tab_datos` parameter is the ID of the HTML select element that you want to
 * update the selected option for.
 * @param dataSelc - The `dataSelc` parameter in the `updateSelectedPers` function represents the
 * value that you want to select in the dropdown list specified by the `tab_datos` parameter. The
 * function loops through the options in the dropdown list and sets the `selected` property to `true`
 * for the
 */
const updateSelectedPers =  (tab_datos,dataSelc) =>{
    let doc_tab_datos = document.getElementById(tab_datos)
       //# code...       
           for(let item of doc_tab_datos){
               item.selected= (item.value==dataSelc)? true : false ;
       }  
}

let persForm_onPage = document.getElementById('persForm');//all forms

/* The `persForm_onPage.addEventListener( 'submit' , async (e) =>{ ... })` code snippet is adding an
event listener to the form with the ID `persForm_onPage`. When the form is submitted, the following
actions are performed: */
persForm_onPage.addEventListener('submit' , async (e) =>{
   e.preventDefault();
    // areaForm_onPage['tipo_operacion']='guardar';

    let pers_data= await submitForm(new FormData (persForm_onPage) ,url_pers);
    persForm_onPage.reset();//clean form
    //ppp.status
    if (pers_data['status']) {
        CloseInfo();       
    } else {
       mostrarMensaje('mensajesDiv','error','No se pudo'); 
    }
})

/**
 * The function `preEliminarEmp` is an asynchronous function that prepares and submits a form to delete
 * a scientific degree entry, displaying a success message and updating the table if the deletion is
 * successful.
 * @param id_persona - The `id_persona` parameter in the `preEliminarEmp` function is
 * the ID of the scientific degree that you want to delete. This function prepares a form data object
 * with the operation type set to "eliminar" (delete) and the ID of the scientific degree to be deleted
 */
const preEliminarPers= async (id_persona) => {
    let delFrm=new FormData();
    delFrm.append('tipo_operacion','eliminar');
    delFrm.append('id',id_persona);
    let elto = await submitForm(delFrm,url_pers);

    if (elto['status']) {
        mostrarMensaje('mensajesDiv','success','Eliminado.');
        fillTablePers('tableCardHead');         
    }
    
}

/**
 * The function `preEditarEmp` is an asynchronous function that retrieves data from a table, updates
 * form fields with the retrieved data, and sets focus on a specific field.
 * @param paramsId - The `paramsId` parameter in the `preEditarEmp` function seems to be used as an
 * identifier for a specific record in a table of Grados Cientificos (Scientific Degrees). It is likely
 * used to retrieve data related to a specific Grado Cientifico for editing purposes
 */
const preEditarPers= async (paramsId) => {
    //buscar 
    let pers_data = (await getDataFromTablePers('buscar',paramsId)).data[0];
    AddInfo();
    // cambio de tipo op
    persForm_onPage['tipo_operacion'].value='update';
    persForm_onPage['persForm_id'].value=paramsId;    
    persForm_onPage['persForm_nombre'].value=pers_data.nombre_persona;  
    persForm_onPage['persForm_resp'].value=pers_data.responsable_persona; 

    fillSelec_Empresa('persForm_emp',pers_data.id_empresa)

    persForm_onPage['persForm_fchsolc'].value=pers_data.dia_solicitud_persona; 
    persForm_onPage['persForm_dinero'].value=pers_data.presupuesto_persona;  
    persForm_onPage['persForm_tiempo'].value=pers_data.tiempo_estimado_persona;
    // persForm_onPage['persForm_tiempo'].value=pers_data.tiempo_estimado_persona;
      
    persForm_onPage['submit'].value='Actualizar';    
    // set foco
    persForm_onPage['persForm_nombre'].focus();
}

