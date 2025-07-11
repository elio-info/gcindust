let url_xprt='../conexiones/catalogo_grupoexprt.php';

function Prepare_Quest(idp,nombre_proyecto,idg,nombre_grupo) {
    $('#enq').show();
    document.getElementById('letrero').innerHTML=`<strong>Proyecto: </strong>${nombre_proyecto } <strong>Grupo: </strong>${nombre_grupo }`;
    document.getElementById('id_pry').value=idp;
    document.getElementById('id_grp').value=idg;  
    let mm=document.getElementById('valores');
    mm.innerHTML='';
    for (let index = 1; index <= 10; index++) {
        let element = `<input id="customRadioInline${index}" class="custom-control-input" type="radio" name="customRadioInline" value="${index}" />
                                    <label class="custom-control-label" for="customRadioInline1">
                                        ${index}</label> &nbsp;&nbsp;&nbsp;&nbsp;`; 
        mm.innerHTML+=element;
    } 
}

async function fillTable_EncuestaExp(lugar,id){
    let xprFrm=new FormData();
    xprFrm.append('tipo_operacion','buscarEncExp');
    xprFrm.append('id',id);
    // xprFrm.append('id_x',xprt);
    // xprFrm.append('stt',0);
    let exp = (await submitForm(xprFrm,url_xprt,' listado grupo exprtencuestas xp:'+id)).data.info;
    
    // mostrar listado de expertos para hacer la encuesta
  /*  document.getElementById('id_pry').value=id_p;
    document.getElementById('id_grp').value=id_g;
    document.getElementById('tipo_acc').value='aceptados';
    $('#'+lugar).show();
    
    document.getElementById(lugar+'_ltr').innerHTML=n_g;
   */ let poner=document.getElementById(lugar);
    poner.innerHTML='';
    if (exp.length>0) {
        exp.map((val_exp) =>{ 
        let letrero=''
        if (!parseInt(val_exp.estado_encuesta)) {           
                 letrero=`<li class="list-group-item">
                    <div class="row g-0 align-items-center">
                        <div class="col me-2">
                            <h6 class="mb-0"><strong>Proyecto: </strong>${val_exp.nombre_proyecto }</h6>
                            <h6 class="mb-0"><strong>Grupo: </strong>${val_exp.nombre_grupo }</h6>
                             <a href='#' onclick="Prepare_Quest(${val_exp.id_proyecto},'${val_exp.nombre_proyecto}',${val_exp.id_grupo},'${val_exp.nombre_grupo}')">
                             Hacer encuesta</a>                                   
                        </div>                        
                    </div>
                </li>`;
          
        poner.innerHTML+=letrero;    
        }
       })          
    }
}


async function getAll_Experts(params) {
    let expr=await getDataFromTablePers('listar','','=3')
    return expr;
}

async function getAll_Pendientes_Encuesta(grp='') {
    let xprFrm=new FormData();
    xprFrm.append('tipo_operacion','buscar');
    xprFrm.append('id_g',grp);
    // xprFrm.append('id_x',xprt);
    // xprFrm.append('stt',0);
    let elto = await submitForm(xprFrm,url_xprt,' listado grupo exprt g:'+grp);
    return elto;
}
async function set_Expert_Pendiente_Encuesta(pry,grp,xprt) {
    let xprFrm=new FormData();
    xprFrm.append('tipo_operacion','llenar_lgx');
    xprFrm.append('id_p',pry);
    xprFrm.append('id_g',grp);
    xprFrm.append('id_x',xprt);
    xprFrm.append('stt',0);
    let elto = await submitForm(xprFrm,url_xprt,' listado grupo exprt p:'+pry+ 'g:'+grp+ ' x:'+xprt+ ' s:'+0);

    return elto;
}

let enq=document.getElementById('enq');
enq.addEventListener('submit', async (e)=> {
    e.preventDefault();
    let grp_nm= new FormData (enq);
    // grp_nm.append('tipo_operacion', $('#prygrpFrm_nombre').val());    
    // grp_nm.append('nombre', $('#prygrpFrm_nombre').val());
    // grp_nm.append('id_pry', $('#id_pry').val());
    let grps= await submit_Form(grp_nm ,url_xprt,'add_enc');
    console.log(grps);
    window.location.reload();
})