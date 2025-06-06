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