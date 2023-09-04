<?php
    session_start();
    include "connects.php";

    $name = $_POST['name'];
    $dept = $_POST['dept'];
    $date = date('Y-m-d');
    $task = $_POST['task'];
    $task_from = $_SESSION['username'];
    $sql = "INSERT INTO tasks_activities (name, department, task_name, task_date_assigned,task_from) VALUES ('$name', '$dept','$task','$date','$task_from')";
    if ($conn->query($sql) === TRUE) {
    echo '<script>alert("Task info successfully added."); window.location.href = "send_task.php";</script>';
    return;
    } else {
    echo "Error in adding task";
    }

    mysqli_close($conn);
?>