<?php
    
    $servername = "localhost";
    $dbusername = "root";
    $dbpassword = "";
    $dbName = "financial";
    
    $conn = mysqli_connect($servername,$dbusername,$dbpassword,$dbName);

    if(!$conn){
        die("connection failed".mysqli_connect_errno());
    }
    
    
?>