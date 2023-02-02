<?php
    require '../dbinc.php';
    session_start();
    $user_email = $_SESSION['user_email'];
    //echo $user_email;
    $sql = "DELETE FROM login WHERE EMAIL = '$user_email'";
    
    mysqli_query($conn,$sql);
    session_destroy();
    header("location:signout.php")
?>  