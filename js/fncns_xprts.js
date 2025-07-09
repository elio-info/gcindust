let url_xprt='../conexiones/catalogo_grupoexprt.php';

function Prepare_Quest(params) {
   let poner_conocimiento = document.getElementById('conocimiento');
   poner_conocimiento.innerHTML=``;
   for (let index = 1; index <= 10; index++) {
    let cnc = `<div class="col">
                    <div class="form-check"><input id="enesForm_conocimiento${index}" name="enesForm_conocimiento"class="form-check-input" type="radio" />
                        <label class="form-check-label" for="formCheck-${index}">${index}
                        </label>
                    </div>
                </div>`;
    poner_conocimiento.innerHTML +=cnc;
   }
}

function linkExprt(id_proyecto,id_grupo){
    alert('g:'+id_grupo+', p:'+id_proyecto);
}

async function getAll_Experts(params) {
    let expr=await getDataFromTablePers('listar','','=3')
    return expr;
}

async function getAll_PendientesExperts(params) {
    let expr=await getDataFromTablePers('listar','','=3')
    return expr;
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