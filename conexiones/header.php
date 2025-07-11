<?php if (!isset($_SESSION)) session_start();
// print_r($_SESSION);
// echo ('dif tiempo ' . (time() - $_SESSION['persona']['interaccion_inicio']));
if (
    !isset($_SESSION["persona"]) || //eres nadie
    (time() - $_SESSION['persona']['interaccion_inicio']) > $_SESSION['last_activity'] //te pas pasastes del tiempo
    )
        header("Location: ../");//fuera del sistema
    else
        $_SESSION['persona']['interaccion_inicio']= time();
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Sistema de Gestion de Procesos</title>
  <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="../css/sstyle.css">
  <link rel="stylesheet" href="../css/mycss.css">
  <link rel="stylesheet" href="../fonts/fontawesome-all.min.css" />
</head>
<body>
  <div class="page-top">
    <div id="menuTop" class="row"></div>
  </div>
  <div class="page-body">
   <div class="wrapper">