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