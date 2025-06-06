const url_uss = "../ctlg/catalogo_usuario.php";

// se usara para todo
const formularioUsuario = document.querySelector("#formUsr");//datos
//defino
formularioUsuario.addEventListener('submit', async (e) =>{
    e.preventDefault();
    //const datos = new FormData(document.getElementById('form'));
    const datosu = new FormData(formularioUsuario);    
    let pers=await submitForm(datosu,url_uss,'catalogo_usuario',true);
    
    if (pers.data.length > 0) {
        window.location ='../recep/clientes_Estado2.php';
    } else {
        mostrarMensaje('mensajesDiv','error','No pertenece al GYM');
        formularioUsuario.reset();
    } 
}      
);
/** Ok
 * para pintar tablas
 * @param {Array} data 
 */
const pintar_tabla_resultados = (data) =>{
     let tab_datos = document.querySelector("#tabla_usuario");
     tab_datos.innerHTML = "";
     if ( data.length <1) {
        //# code...
        tab_datos.innerHTML=`
        <tr>
            <td colspan="3"> No hay elementos a mostrar</td>
        </tr>`
        } else {
            indx=1
            let t_datos=``
            for(let item of data){
                t_datos =`
                <tr>
                <th>${indx++ }</th>
                <td>${item.nombre_usuario}</td>
                <td>${item.usuario_sistema}</td>
                <td> Especialista ${item.cargoEsp>0? 'Principal': 'Municipal'}</td>
                <td>${item.objetivos}</td>
                <td class="text-center">
                <button class="btn btn-warning btn-sm" onclick="editar(${item.id_usuario})">Editar</button>`
                if ($('#usuario')[0].value !=item.id_usuario) {
                    t_datos +=`<button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#mensajesModalConfirm" onclick="preEliminar(${item.id_usuario})">Eliminar</button>`
                } 
                t_datos +=`                
                </td>
                </tr>
            `;
            tab_datos.innerHTML+=t_datos
        }
     
    }
}
//ok
const agregar = () =>{
    // form a cero, lo que se ve
    formularioUsuario.reset();
   $("#tipo_operacion").val("guardar")    
    document.querySelector("#formBoton").innerHTML="Agregar";
    // lo que no se ve  
   // $("#formContainer").modal('show');
}

function preEliminar(id) {
    console.log(id);
    $('#id_usuario').val(id);
}

//ok
const eliminar = () =>{
       let result= $("#id_usuario").val()
       console.log(result)
        if (result) {
            var formdata = new FormData();
            formdata.set('tipo_operacion', 'eliminar');
            formdata.set('id', result);
            fetch(url, {
                method: 'post',
                body: formdata
            }).then(data => data.json())
            .then(data => {
                console.log('Success:', data)
                $("#mensajesModalConfirm").modal('hide')
                pintar_tabla_resultados(data);
                mostrarMensaje('ok','Se eliminó')                
            })
            .catch(error => {
                console.error('Error:', error);
                mostrarMensaje('error', error)
            })
        }
}

const editar = (id) => {
    var datos = new FormData();
    datos.append('tipo_operacion','editar');
    datos.append('id',id);
    fetch(url,{
        method:'post',
        body:datos
    })
    .then(data => data.json())
    .then(data => {
        console.log('success', data);
        $("#nombre").val(data[0].nombre_usuario);//nombre
        $('#uss').val(data[0].usuario_sistema);  //usuario  
        $("#uss")[0].disabled='true'            
        $('#grado')[0].checked=parseInt(data[0].cargoEsp);
        if(data[0].id_objetivos)
            asignarObjetivosparaGuardar(data[0].id_objetivos,$('#tobjetivos')[0]['options'])
        document.querySelector("#formBoton").innerHTML="Actualizar";
        $('#tipo_operacion').val("update");
        $('#id_usuario').val(id); 
        $("#formContainer").modal('show');    
    })
    .catch(function (error){
        console.error('error',error);
        mostrarMensaje('error',error)
    }); 
}

const editarb = (id) => {
    var datos = new FormData();
    datos.append('tipo_operacion','editar');
    datos.append('id',id);
    fetch(url,{
        method:'post',
        body:datos
    })
    .then(data => data.json())
    .then(data => {
        console.log('success', data);
        document.querySelector("#nombre").value=data[0].nombre_usuario;//nombre
        $('#uss').val(data[0].usuario_sistema);  //usuario              
        $('#grado').val(data[0].cargoEsp);
        if(data[0].id_objetivos)
            asignarObjetivosparaGuardar(data[0].id_objetivos,$('#tobjetivos')[0]['options'])
        document.querySelector("#formBoton").innerHTML="Actualizar";
        $('#tipo_operacion').val("updat");
        $('#id_usuario').val(id); 
        $("#formContainer").modal('show');    
    })
    .catch(function (error){
        console.error('error',error);
        mostrarMensaje('error',error)
    }); 
}

