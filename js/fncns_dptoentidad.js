
let url_de='catalogo_dptoentidad.php'

/**
 * The function `getAllDataFromTable_DepartamentoEntd` asynchronously retrieves all data from a table
 * named 'DepartamentoEntd'.
 * @returns The `getAllDataFromTable_DepartamentoEntd` function is returning the result of the
 * `submitForm` function, which is being awaited. The `submitForm` function is submitting a form with
 * the specified data (`tipo_operacion` set to `'listar'`) to the specified URL (`url_de`) for the
 * resource `departamento_Entd`. The `true
 */
async function getDataFromTable_DepartamentoEntd(operacion='listar',id_de='') {   
    const datoso = new FormData();
    datoso.append("tipo_operacion",operacion) ; 
    datoso.append("deForm_id",id_de) ;
    return await submitForm(datoso,url_de,'departamento_Entd',true) ;     
    }  

    
/** Ok
 * para pintar tablas
 * @param {Object} paramsTableTrName id for the objet <table> to create the list
 */
const fillTable_Departamento = async (paramsTableTrName) =>{
    //
    var datade= (await getDataFromTable_DepartamentoEntd()).data;     
    console.log(datade);  
   
   if ($('#'+paramsTableTrName+'_wrapper')[0]) {
        // alert('cojelo');
        $('#'+paramsTableTrName).DataTable().destroy();
    }
    $('#'+paramsTableTrName).DataTable({
        columns:[
            { title: 'Nombre Departamento',data:'nombre_departamento'},
            { title: 'Acciones',
                data:'id_departamento',
                render:function (data) {
                    var botones=`
         <button class="btn btn-dark" onclick="preEditarde(${data})">Editar</button>
         <button class="btn btn-danger"  onclick="preEliminarde(${data})">Eliminar</button>`              
          return botones;
                }
        }
        ],
        data: datade
    })
}

/** Ok
 * Actualizar el select
 * @param {int} dataSelc item selected on arreglos d datos
 * @param {Object} tab_datos objeto <td>
 */
const fillSelec_Departamento = async (tab_datos,dataSelc=-1) =>{
    let mydata= (await getDataFromTable_DepartamentoEntd()).data
    
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
               opt_datos.value=item.id_departamento;
               opt_datos.text=item.nombre_departamento;                       
               if (item.id_area==dataSelc) {
                opt_datos.selected=true
               }
           doc_tab_datos.appendChild(opt_datos)
       }    
   }
}

/**
 * The function `updateSelected_Departamento` updates the selected option in a dropdown menu based on the
 * provided data.
 * @param tab_datos - The `tab_datos` parameter is the ID of the HTML select element that you want to
 * update the selected option for.
 * @param dataSelc - The `dataSelc` parameter in the `updateSelected_Departamento` function represents the
 * value that you want to select in the dropdown list specified by the `tab_datos` parameter. The
 * function loops through the options in the dropdown list and sets the `selected` property to `true`
 * for the
 */
const updateSelected_Departamento =  (tab_datos,dataSelc) =>{
    let doc_tab_datos = document.getElementById(tab_datos)
       //# code...       
           for(let item of doc_tab_datos){
               item.selected= (item.value==dataSelc)? true : false ;
       }  
}

let deForm_onPage = document.getElementById('deForm');//all forms

/* The `deForm_onPage.addEventListener( 'submit' , async (e) =>{ ... })` code snippet is adding an
event listener to the form with the ID `deForm_onPage`. When the form is submitted, the following
actions are performed: */
deForm_onPage.addEventListener( 'submit' , async (e) =>{
   e.preventDefault();
    // areaForm_onPage['tipo_operacion']='guardar';

    let de_data= await submitForm(new FormData (deForm_onPage) ,url_de);
    deForm_onPage.reset();//clean form
    //ppp.status
    if (de_data['status']) {
        CloseInfo();       
    } else {
       mostrarMensaje('mensajesDiv','error','No se pudo'); 
    }
})

/**
 * The function `preEliminarde` is an asynchronous function that prepares and submits a form to delete
 * a scientific degree entry, displaying a success message and updating the table if the deletion is
 * successful.
 * @param id_departamento - The `id_departamento` parameter in the `preEliminarde` function is
 * the ID of the scientific degree that you want to delete. This function prepares a form data object
 * with the operation type set to "eliminar" (delete) and the ID of the scientific degree to be deleted
 */
const preEliminarde= async (id_departamento) => {
    let delFrm=new FormData();
    delFrm.append('tipo_operacion','eliminar');
    delFrm.append('id',id_departamento);
    let elto = await submitForm(delFrm,url_de);

    if (elto['status']) {
        mostrarMensaje('mensajesDiv','success','Eliminado.');
        fillTable_Departamento('tableCardHead');         
    }
    
}

/**
 * The function `preEditarde` is an asynchronous function that retrieves data from a table, updates
 * form fields with the retrieved data, and sets focus on a specific field.
 * @param paramsId - The `paramsId` parameter in the `preEditarde` function seems to be used as an
 * identifier for a specific record in a table of Grados Cientificos (Scientific Degrees). It is likely
 * used to retrieve data related to a specific Grado Cientifico for editing purposes
 */
const preEditarde= async (paramsId) => {
    //buscar 
    let de_data = (await getDataFromTable_DepartamentoEntd('buscar',paramsId)).data[0];
    AddInfo();
    // cambio de tipo op
    deForm_onPage['tipo_operacion'].value='update';
    deForm_onPage['deForm_id'].value=paramsId;    
    deForm_onPage['deForm_nombre'].value=de_data.nombre_departamento;    
    deForm_onPage['submit'].value='Actualizar';    
    // set foco
    deForm_onPage['deForm_nombre'].focus();
}

