
let url_gc='catalogo_grados100tfk.php'

/**
 * The function `getAllDataFromTable_GradosCientificos` asynchronously retrieves all data from a table
 * named 'GradosCientificos'.
 * @returns The `getAllDataFromTable_GradosCientificos` function is returning the result of the
 * `submitForm` function, which is being awaited. The `submitForm` function is submitting a form with
 * the specified data (`tipo_operacion` set to `'listar'`) to the specified URL (`url_gc`) for the
 * resource `grado_cientifico`. The `true
 */
async function getDataFromTable_GradosCientificos(operacion='listar',id_gc='') {   
    const datoso = new FormData();
    datoso.append("tipo_operacion",operacion) ; 
    datoso.append("gcForm_id",id_gc) ;
    return await submitForm(datoso,url_gc,'grado_cientifico',true) ;     
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
 * para pintar tablas
 * @param {int} dataSelc item selected on arreglos d datos
 * @param {Object} tab_datos objeto <td>
 */
const fillSelecArea = async (tab_datos,dataSelc=-1) =>{
    let mydata= (await findAllonTable(url_gc)).data
    
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
               opt_datos.value=item.id_area
               opt_datos.text=item.nombre_area                         
               if (item.id_area==dataSelc) {
                opt_datos.selected=true
               }
           doc_tab_datos.appendChild(opt_datos)
       }    
   }
}

/** Ok
 * para pintar tablas
 * @param {int} dataSelc item selected on arreglos d datos
 * @param {Object} tab_datos objeto <td>
 */
const fillSelecAreaSrv = async (tab_datos,cliente=0) =>{
    let mdata= await findAllonTable(url_gc)
    let mydata= mdata.data
    let doc_tab_datos = document.getElementById(tab_datos)
    
    // si lleno, lo vacio
    if (doc_tab_datos.options.length>0) doc_tab_datos.options.length = 0;
    // set the first
    let opt_datos = document.createElement('option');
        opt_datos.value = -1;
        opt_datos.text= "----";        
        opt_datos.selected=true
        
        doc_tab_datos.appendChild(opt_datos)
    if ( mydata.length>0) {
       //# code...       
           for(let item of mydata){
               let opt_datos = document.createElement('option')
               opt_datos.value=item.id_area
               opt_datos.text=item.nombre_area + '- $'+ (cliente? item.servicio_precioMiembro: servicio_precioCalle)                        
               
           doc_tab_datos.appendChild(opt_datos)
       }    
   }
}

const updateSelectedArea =  (tab_datos,dataSelc) =>{
    let doc_tab_datos = document.getElementById(tab_datos)
       //# code...       
           for(let item of doc_tab_datos){
               item.selected= (item.value==dataSelc)? true : false ;
       }    
  
}

let gcForm_onPage = document.getElementById('gcForm');//all forms

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

