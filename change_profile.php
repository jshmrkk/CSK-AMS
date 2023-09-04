<?php
// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve the form data
    $fullName = $_POST["full_name"];
    $address = $_POST["address"];
    $age = $_POST["age"];
    $gender = $_POST["gender"];
    $position = $_POST["position"];
    $department = $_POST["department"];
    $startDate = $_POST["start_date"];

    // Perform the update operation (you need to implement your own logic here)
    // For example, you can update the information in a database

    // Display a success message or perform any other actions
    echo "Information updated successfully!";
}
?>