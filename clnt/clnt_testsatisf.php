<?php include_once "../conexiones/header.php"; ?>
<!-- llena ya el div.wrapper esta iniciado-->
 1' mostrar a mis clientes, las encuestas que no ha respondido Paro.

LISTADO DE ENCUESTAS DE SATISFACCION

 2´ mostrar la encuesta que se forma de la bd y guardar.

 ENCUESTA ESPECIFICA
 
 la elimino de la lista que la vea
 <!-- fin ya el div.wrapper esta finalizado-->
 </div>
  <script src="../js/jquery-3.7.1.js"></script>  
  <script src="../js/bs-init.js"></script>
  <script src="../js/fncns_menu.js"></script>
  <script src="../bootstrap/js/bootstrap.min.js"></script>
  <script src="../js/my_dataTables.js"></script>
  <script src="./fncns_empresa.js"></script>  
  <script src="./fncns_proyct.js"></script>
  <script>
    setMenu('clnt',1);    
    fillTable_EncuestasSatisfacc('tableCardHead',<?php $_POST['id'] ?>) //llenar datos  deListEncuestaSatisf               
    </script>
</body>

</html>