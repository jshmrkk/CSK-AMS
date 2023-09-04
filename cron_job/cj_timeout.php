<?php
$datetime = date('Y-m-d H:i:s');

// set the datetime of no time out
$query = "UPDATE time_out SET datetime='$datetime' WHERE approval='No Time-out'";;
$result = mysqli_query($conn, $query);

// set user as out
$query2 = "UPDATE user SET status='out' WHERE status='in'";
$result2 = mysqli_query($conn, $query2);
?>