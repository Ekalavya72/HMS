<?php
    session_start();
    unset($_SESSION['u_id']);
    unset($_SESSION['u_name']);
    session_destroy();

    header("Location: users_logout.php");
    exit;
?>
