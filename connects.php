<?php
//DON'T DELETE. THIS IS THE ORIGINAL.
//localhost
//id20854589_csk
//@ttEndAnc3
//id20854589_attendancesystem

//
//

$DB_HOST = "localhost";
$DB_USER = "root"; 
$DB_PASS = ""; 
$DB_NAME = "attendancesystem";

$conn=mysqli_connect($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME);

if (!$conn) {
    die( "Unable to select database");
}

?>