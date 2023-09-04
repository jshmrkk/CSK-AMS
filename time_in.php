<?php
date_default_timezone_set('Asia/Manila');

session_start();
include "connects.php";

$token = generateToken($conn);

$location = "WFH";
$name = $_SESSION['username'];
$datetime = date('Y-m-d H:i:s');
$photo = "photo_loc";

$check_status = "SELECT status, role FROM users WHERE name='$name'";
$result_status = mysqli_query($conn, $check_status);

if (mysqli_num_rows(($result_status)) > 0) {
    $row_status = mysqli_fetch_assoc($result_status);
    $user_status = ($row_status['status']);
    $role_status = ($row_status['role']);

    if ($user_status === "out") {
        $sqli = "INSERT INTO time_in (name, datetime, location, photo_loc, token) VALUES ('$name', '$datetime', '$location', '$photo', '$token')";
        $sqlo = "INSERT INTO time_out (name, token) VALUES ('$name', '$token')";
        $sqlstat = "UPDATE users SET status='in' WHERE name='$name'";
        if ($conn->query($sqli) === TRUE && $conn->query($sqlo) === TRUE && $conn->query($sqlstat) === TRUE) {
        if ($role_status === "regular") {
            header("Refresh:0; url=reg_inout.php");
            echo "<script>alert('Timed-in successfully');</script>";
        } elseif ($role_status === "admin") {
            header("Refresh:0; url=admin_inout.php");
            echo "<script>alert('Timed-in successfully');</script>";
        }
        } else {
            echo "Error for time in ";
        }
    } elseif ($user_status === "in") {
        if ($role_status === "regular") {
            header("Refresh:0; url=reg_inout.php");
            echo "<script>alert('You are already timed-in! Please time-out first.');</script>";
        } elseif ($role_status === "admin") {
            header("Refresh:0; url=admin_inout.php");
            echo "<script>alert('You are already timed-in! Please time-out first.');</script>";
        }
    }

    mysqli_close($conn);
    exit;
} else {
    echo "Error occurred.";
}

if($role_status === "admin"){
    header('Location: admin_inout.php');
}else{
    header('Location: reg_inout.php');
}

function generateToken($conn) {
    $token = uniqid() . mt_rand(100000, 999999);
    return $token;
}

?>