
let url_pry='catalogo_pry.php'

/**
 * The function `getAllDataFromTable_pryresa` asynchronously retrieves all data from a table
 * named 'Empresa'.
 * @returns The `getAllDataFromTable_pryresa` function is returning the result of the
 * `submitForm` function, which is being awaited. The `submitForm` function is submitting a form with
 * the specified data (`tipo_operacion` set to `'listar'`) to the specified URL (`url_pry`) for the
 * resource `empresa`. The `true
 */
async function getDataFromTable_pryresa(operacion='listar',id_pry='') {   
    const datoso = new FormData();
    datoso.append("tipo_operacion",operacion) ; 
    datoso.append("pryForm_id",id_pry) ;
    return await submitForm(datoso,url_pry,'proyecto',true) ;     
    }  

    
/** Ok
 * para pintar tablas
 * @param {Object} paramsTableTrName id for the objet <table> to create the list
 */
const fillTable_Proyecto = async (paramsTableTrName) =>{
    //
    var dataemp= (await getDataFromTable_pryresa()).data;     
    console.log(dataemp);  
   
   if ($('#'+paramsTableTrName+'_wrapper')[0]) {
        // alert('cojelo');
        $('#'+paramsTableTrName).DataTable().destroy();
    }
    $('#'+paramsTableTrName).DataTable({
        columns:[
            { title: 'Nombre Empresa',data:'nombre_pryresa'}, 
            { title: 'Director ',data:'responsable_pryresa'}, 
            { title: 'Dcc ',data:'direccion_pryresa'}, 
            { title: 'Telefono ',data:'telefono_pryresa'}, 
            { title: 'Correo',data:'email_pryresa'},
            { title: 'Acciones',
                data:'id_pryresa',
                render:function (data) {
                    var botones=`
         <button class="btn btn-dark" onclick="preEditarPry(${data})">Editar</button>
         <button class="btn btn-danger"  onclick="preEliminarPry(${data})">Eliminar</button>`              
          return botones;
                }
        }
        ],
        data: dataemp
    })
}

/** Ok
 * Actualizar el select
 * @param {int} dataSelc item selected on arreglos d datos
 * @param {Object} tab_datos objeto <td>
 */
const fillSelec_Proyecto = async (tab_datos,dataSelc=-1) =>{
    let mydata= (await getDataFromTable_pryresa()).data
    
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
               opt_datos.value=item.id_pryresa;
               opt_datos.text=item.nombre_pryresa;                       
               if (item.id_area==dataSelc) {
                opt_datos.selected=true
               }
           doc_tab_datos.appendChild(opt_datos)
       }    
   }
}

/**
 * The function `updateSelected_pryresa` updates the selected option in a dropdown menu based on the
 * provided data.
 * @param tab_datos - The `tab_datos` parameter is the ID of the HTML select element that you want to
 * update the selected option for.
 * @param dataSelc - The `dataSelc` parameter in the `updateSelected_pryresa` function represents the
 * value that you want to select in the dropdown list specified by the `tab_datos` parameter. The
 * function loops through the options in the dropdown list and sets the `selected` property to `true`
 * for the
 */
const updateSelected_pryresa =  (tab_datos,dataSelc) =>{
    let doc_tab_datos = document.getElementById(tab_datos)
       //# code...       
           for(let item of doc_tab_datos){
               item.selected= (item.value==dataSelc)? true : false ;
       }  
}

let pryForm_onPage = document.getElementById('pryForm');//all forms

/* The `empForm_onPage.addEventListener( 'submit' , async (e) =>{ ... })` code snippet is adding an
event listener to the form with the ID `empForm_onPage`. When the form is submitted, the following
actions are performed: */
pryForm_onPage.addEventListener('submit' , async (e) =>{
   e.preventDefault();
    // areaForm_onPage['tipo_operacion']='guardar';

    let emp_data= await submitForm(new FormData (empForm_onPage) ,url_pry);
    empForm_onPage.reset();//clean form
    //ppp.status
    if (emp_data['status']) {
        CloseInfo();       
    } else {
       mostrarMensaje('mensajesDiv','error','No se pudo'); 
    }
})

/**
 * The function `preEliminarEmp` is an asynchronous function that prepares and submits a form to delete
 * a scientific degree entry, displaying a success message and updating the table if the deletion is
 * successful.
 * @param id_pryresa - The `id_pryresa` parameter in the `preEliminarEmp` function is
 * the ID of the scientific degree that you want to delete. This function prepares a form data object
 * with the operation type set to "eliminar" (delete) and the ID of the scientific degree to be deleted
 */
const preEliminarPry= async (id_pryresa) => {
    let delFrm=new FormData();
    delFrm.append('tipo_operacion','eliminar');
    delFrm.append('id',id_pryresa);
    let elto = await submitForm(delFrm,url_pry);

    if (elto['status']) {
        mostrarMensaje('mensajesDiv','success','Eliminado.');
        fillTable_pryresa('tableCardHead');         
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
    let emp_data = (await getDataFromTable_pryresa('buscar',paramsId)).data[0];
    AddInfo();
    // cambio de tipo op
    empForm_onPage['tipo_operacion'].value='update';
    empForm_onPage['empForm_id'].value=paramsId;    
    empForm_onPage['empForm_nombre'].value=emp_data.nombre_pryresa;  
    empForm_onPage['empForm_responsable'].value=emp_data.responsable_pryresa; 
    empForm_onPage['empForm_dcc'].value=emp_data.direccion_pryresa; 
    empForm_onPage['empForm_cell'].value=emp_data.telefono_pryresa;  
    empForm_onPage['empForm_email'].value=emp_data.email_pryresa;
     
    empForm_onPage['submit'].value='Actualizar';    
    // set foco
    empForm_onPage['empForm_nombre'].focus();
}

