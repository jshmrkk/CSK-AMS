<?php
// update_inout.php

// Include the connects.php file
require_once 'connects.php';

$format = "Y-m-d H:i:s";

// Function to calculate hours difference
function calculateHoursDifference($time_in, $time_out) {
    // Convert time strings to timestamps
    $time_in_timestamp = strtotime($time_in);
    $time_out_timestamp = strtotime($time_out);

    // Calculate the difference in seconds
    $seconds_diff = $time_out_timestamp - $time_in_timestamp;

    // Convert the difference to hours
    $hours_diff = ($seconds_diff / 3600) - 1;

    // Apply overtime rules, for example, 1.5x for Sunday
    $dayOfWeek = date('w', $time_in_timestamp); // 0 (Sunday) to 6 (Saturday)
    if ($dayOfWeek === '0') {
        $hours_diff *= 1.5;
    }

    return $hours_diff;
}

function getHoursBetweenTwoTimes($datetime1, $datetime2) {
    // Calculate the time difference
    $interval = $datetime1->diff($datetime2);

    // Get the number of hours from the time difference
    $hours = $interval->h + ($interval->days * 24);

    return $hours;
}

// Check if the form is submitted and the necessary fields are present
if (isset($_POST['name']) && (isset($_POST['time_in']) || isset($_POST['time_out'])) && isset($_POST['filter_date'])) {
    // Retrieve the submitted form data
    $name = $_POST['name'];

    // Convert the time_in and time_out values to the desired format (e.g., 'H:i:s')
    $time_in = date('H:i:s', strtotime($_POST['time_in']));
    $time_out = date('H:i:s', strtotime($_POST['time_out']));

    $datetime_in = new DateTime(date('Y-m-d H:i:s', strtotime($_POST['time_in'])));
    $datetime_out = new DateTime(date('Y-m-d H:i:s', strtotime($_POST['time_out'])));

    // Extract the date from the filter_date value
    $date = $_POST['filter_date']; // Assuming the date format is 'Y-m-d'

    // Generate a unique token
    $token = uniqid() . mt_rand(100000, 999999);

    // Check if the time entry already exists for the specified name and date
    $check_sql = "SELECT * FROM time_in WHERE name = '$name' AND DATE(datetime) = '$date'";
    $check_result = mysqli_query($conn, $check_sql);

    if (mysqli_num_rows($check_result) > 0) {

        $token_query = "SELECT datetime, token FROM time_in WHERE name='$name' ORDER BY datetime DESC LIMIT 1";
        
        $token_result = mysqli_query($conn, $token_query);
        $token_row = mysqli_fetch_assoc($token_result);
        $token_in= ($token_row['token']);

        // Existing time entry found, update the time_out value in the time_out table
        $update_out_sql = "UPDATE time_out SET datetime = '$date $time_out', tasks = 'Manual time in and out', approval = 'Reviewing' WHERE token = '$token_in'";
        $update_out_result = mysqli_query($conn, $update_out_sql);

        // Calculate and update the new hours_diff in the time_out table

        $hours_diff = getHoursBetweenTwoTimes($datetime_in, $datetime_out);
        $update_hours_sql = "UPDATE time_out SET hours = '$hours_diff'  WHERE token = '$token_in'";
        mysqli_query($conn, $update_hours_sql);

        // Update hr_ren and hr_left based on the new hours_diff
        $update_hr_ren_sql = "UPDATE int_info SET hr_ren = hr_ren + $hours_diff WHERE name = '$name'";
        mysqli_query($conn, $update_hr_ren_sql);

        $update_hr_left_sql = "UPDATE int_info SET hr_left = hr_left - $hours_diff WHERE name = '$name'";
        mysqli_query($conn, $update_hr_left_sql);

        // set user as out
        $sqlstat = "UPDATE users SET status='out' WHERE name='$name'";
        mysqli_query($conn, $sqlstat);

        if ($update_out_result) {
            // Time values updated successfully
            echo 'Time values updated successfully.';
        } else {
            // Error occurred while updating time values
            echo 'Error in updating time values: ' . mysqli_error($conn);
        }
    } else {
        // No existing time entry found, insert a new time entry
        // $insert_in_sql = "INSERT INTO time_in (name, datetime, location, photo_loc, token, approval)
        //                  VALUES ('$name', '$date $time_in', 'WFH', 'photo_loc', '$token', 'Approved')";
        
        $sqli = "INSERT INTO time_in (name, datetime, photo_loc, token) VALUES ('$name', '$date $time_in', 'photo_loc', '$token')";

        // set user as in
        $sqlstat = "UPDATE users SET status='in' WHERE name='$name'";


        $insert_in_result = mysqli_query($conn, $sqli);
        $sqlstat_result = mysqli_query($conn, $sqlstat);

        // Insert the time_out value into the time_out table
        $hours_diff = calculateHoursDifference($date . ' ' . $time_in, $date . ' ' . $time_out);

        // $insert_out_sql = "INSERT INTO time_out (name, datetime, approval, token, tasks, overtime, hours)
        //                   VALUES ('$name', '$date $time_out', 'Approved', '$token', 'Manual time/out', 0, '$hours_diff')";

        $insert_out_sql = "INSERT INTO time_out (name, token) VALUES ('$name', '$token')";

        $insert_out_result = mysqli_query($conn, $insert_out_sql);

        // Update hr_ren and hr_left based on the new hours_diff
        $update_hr_ren_sql = "UPDATE int_info SET hr_ren = hr_ren + $hours_diff WHERE name = '$name'";
        mysqli_query($conn, $update_hr_ren_sql);

        $update_hr_left_sql = "UPDATE int_info SET hr_left = hr_left - $hours_diff WHERE name = '$name'";
        mysqli_query($conn, $update_hr_left_sql);

        if ($insert_in_result && $insert_out_result) {
            // Time values inserted successfully
            echo 'Time values inserted successfully.';
        } else {
            // Error occurred while inserting time values
            echo 'Error in inserting time values: ' . mysqli_error($conn);
        }
    }

    // Refresh the page to display the updated/inserted values
    header('Location: manual_inout.php');
    exit();
} else {
    // Invalid form submission
    echo 'Invalid form submission.';
}
?>