
let url_gc='catalogo_grados100tfk.php'

/**
 * The function `getAllDataFromTable_GradosCientificos` asynchronously retrieves all data from a table
 * named 'GradosCientificos'.
 * @returns The `getAllDataFromTable_GradosCientificos` function is returning the result of the
 * `submitForm` function, which is being awaited. The `submitForm` function is submitting a form with
 * the specified data (`tipo_operacion` set to `'listar'`) to the specified URL (`url_gc`) for the
 * resource `grado_cientifico`. The `true
 */
async function getDataFromTable_GradosCientificos(root=1,operacion='listar',id_gc='') {   
    let ref=root? '':'../grpgstn/';    
    const datoso = new FormData();
    datoso.append("tipo_operacion",operacion) ; 
    datoso.append("gcForm_id",id_gc) ;
    let valor= await submitForm(datoso,ref+url_gc,'grado_cientifico',true) ;
    return   valor; 
    }  

    
/** Ok
 * para pintar tablas
 * @param {Object} paramsTableTrName id for the objet <table> to create the list
 */
const fillTable_G100 = async (paramsTableTrName) =>{
    //
    var dataGC= (await getDataFromTable_GradosCientificos()).data;     
    console.log(dataGC);  
   
   if ($('#'+paramsTableTrName+'_wrapper')[0]) {
        // alert('cojelo');
        $('#'+paramsTableTrName).DataTable().destroy();
    }
    $('#'+paramsTableTrName).DataTable({
        columns:[
            { title: 'Grado Cient&iacute;fico',data:'nombre_gradocientifico'},
            { title: 'Acciones',
                data:'id_gradocientifico',
                render:function (data) {
                    var botones=`
         <button class="btn btn-dark" onclick="preEditarGC(${data})">Editar</button>
         <button class="btn btn-danger"  onclick="preEliminarGC(${data})">Eliminar</button>`              
          return botones;
                }
        }
        ],
        data: dataGC
    })
}

/** Ok
 * Actualizar el select
 * @param {int} dataSelc item selected on arreglos d datos
 * @param {Object} tab_datos objeto <td>
 */
const fillSelec_G100 = async (root=1,tab_datos,dataSelc=-1) =>{
    let mydata= (await getDataFromTable_GradosCientificos(root)).data
    
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
               opt_datos.value=item.id_gradocientifico;
               opt_datos.text=item.nombre_gradocientifico;                       
               if (item.id_area==dataSelc) {
                opt_datos.selected=true
               }
           doc_tab_datos.appendChild(opt_datos)
       }    
   }
}

/**
 * The function `updateSelected_G100` updates the selected option in a dropdown menu based on the
 * provided data.
 * @param tab_datos - The `tab_datos` parameter is the ID of the HTML select element that you want to
 * update the selected option for.
 * @param dataSelc - The `dataSelc` parameter in the `updateSelected_G100` function represents the
 * value that you want to select in the dropdown list specified by the `tab_datos` parameter. The
 * function loops through the options in the dropdown list and sets the `selected` property to `true`
 * for the
 */
const updateSelected_G100 =  (tab_datos,dataSelc) =>{
    let doc_tab_datos = document.getElementById(tab_datos)
       //# code...       
           for(let item of doc_tab_datos){
               item.selected= (item.value==dataSelc)? true : false ;
       }  
}

let gcForm_onPage = document.getElementById('gcForm');//all forms

/* The `gcForm_onPage.addEventListener( 'submit' , async (e) =>{ ... })` code snippet is adding an
event listener to the form with the ID `gcForm_onPage`. When the form is submitted, the following
actions are performed: */
gcForm_onPage.addEventListener( 'submit' , async (e) =>{
   e.preventDefault();
    // areaForm_onPage['tipo_operacion']='guardar';

    let gc_data= await submitForm(new FormData (gcForm_onPage) ,url_gc);
    gcForm_onPage.reset();//clean form
    //ppp.status
    if (gc_data['status']) {
        CloseInfo();       
    } else {
       mostrarMensaje('mensajesDiv','error','No se pudo'); 
    }
})

/**
 * The function `preEliminarGC` is an asynchronous function that prepares and submits a form to delete
 * a scientific degree entry, displaying a success message and updating the table if the deletion is
 * successful.
 * @param id_gradocientifico - The `id_gradocientifico` parameter in the `preEliminarGC` function is
 * the ID of the scientific degree that you want to delete. This function prepares a form data object
 * with the operation type set to "eliminar" (delete) and the ID of the scientific degree to be deleted
 */
const preEliminarGC= async (id_gradocientifico) => {
    let delFrm=new FormData();
    delFrm.append('tipo_operacion','eliminar');
    delFrm.append('id',id_gradocientifico);
    let elto = await submitForm(delFrm,url_gc);

    if (elto['status']) {
        mostrarMensaje('mensajesDiv','success','Eliminado.');
        fillTable_G100('tableCardHead');         
    }
    
}

/**
 * The function `preEditarGC` is an asynchronous function that retrieves data from a table, updates
 * form fields with the retrieved data, and sets focus on a specific field.
 * @param paramsId - The `paramsId` parameter in the `preEditarGC` function seems to be used as an
 * identifier for a specific record in a table of Grados Cientificos (Scientific Degrees). It is likely
 * used to retrieve data related to a specific Grado Cientifico for editing purposes
 */
const preEditarGC= async (paramsId) => {
    //buscar 
    let gc_data = (await getDataFromTable_GradosCientificos('buscar',paramsId)).data[0];
    AddInfo();
    // cambio de tipo op
    gcForm_onPage['tipo_operacion'].value='update';
    gcForm_onPage['gcForm_id'].value=paramsId;    
    gcForm_onPage['gcForm_nombre'].value=gc_data.nombre_gradocientifico;    
    gcForm_onPage['submit'].value='Actualizar';    
    // set foco
    gcForm_onPage['gcForm_nombre'].focus();
}

