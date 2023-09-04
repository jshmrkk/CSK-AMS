<?php
    session_start();
    include "connects.php";

    $uniqueId = bin2hex(random_bytes(32));
    $name = $_POST['name'];
    $dept = $_POST['dept'];
    $date = date('Y-m-d');
    $body = $_POST['notif'];
    $sql = "INSERT INTO notifications (name, department, body, date) VALUES ('$name', '$dept','$body','$date')";
    if ($conn->query($sql) === TRUE) {
    echo '<script>alert("Notification info successfully added."); window.location.href = "send_notification.php";</script>';
    return;
    } else {
    echo "Error in adding notification";
    }

    mysqli_close($conn);
?>