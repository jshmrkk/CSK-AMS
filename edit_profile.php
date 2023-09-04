<?php
session_start();

header("Cache-Control: no-cache, no-store, must-revalidate");
header("Pragma: no-cache");
header("Expires: 0");

include 'connects.php';

if(isset($_SESSION['username'])) {
    //do nothing
} else {
    header('Location: default.php');
    exit;
}

$name = $_SESSION['username'];
$position = $_SESSION['position'];

$query_name = "SELECT name FROM int_info";
$result_name = mysqli_query($conn, $query_name);

$query_in = "SELECT name, department, start_date, hr_req, hr_ren, hr_left FROM int_info";
$result_in = mysqli_query($conn, $query_in);

$query_int = "SELECT name FROM int_info";
$result_int = mysqli_query($conn, $query_int);

$query_emp = "SELECT name FROM emp_info";
$result_emp = mysqli_query($conn, $query_emp);
$combinedNames = array();

$query = "SELECT name, department, position, start_date, hr_req, hr_ren, hr_left FROM int_info WHERE name='$name'";
    
    $result = mysqli_query($conn, $query);
    $row = mysqli_fetch_assoc($result);

while ($row1 = mysqli_fetch_assoc($result_int)) {
  $combinedNames[] = $row1['name'];
}

while ($row2 = mysqli_fetch_assoc($result_emp)) {
  $combinedNames[] = $row2['name'];
}

$query_notice = "SELECT name, type, date, remarks FROM notices";
$result_notice = mysqli_query($conn, $query_notice);

$page = 'edit_profile';
$tab = 'reg';
include_once('intern_sidebar.php');


// Initialize variables
$fullname = "";
$startdate = "";
$school = "";
$requiredhours = "";

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
	// Retrieve the form data
	$fullname = $_POST["fullname"];
	$address = $_POST["address"];
	$age = $_POST["age"];
	$gender = $_POST["gender"];
	$position = $_POST["position"];
	$department = $_POST["department"];
	$startdate = $_POST["startdate"];
	$school = isset($_POST["school"]) ? $_POST["school"] : "";
	$required_hours = isset($_POST["required_hours"]) ? $_POST["required_hours"] : "";

	// Connect to the MySQL database
	$servername = "localhost";
	$username = "root";
	$password = "";
	$database = "id20854589_attendancesystem";

	$conn = new mysqli($servername, $username, $password, $database);

	// Check the connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}

	// Insert the form data into the database
	$sql = "INSERT INTO int_info (name, address, age, gender, position, department, start_date, school, hr_req) VALUES ('$fullname', '$address', '$age', '$gender', '$position', '$department', '$startdate', '$school', '$required_hours')";

	if ($conn->query($sql) === TRUE) {
		echo "Form data inserted successfully.";
	} else {
		echo "Error: " . $sql . "<br>" . $conn->error;
	}

	// Close the database connection
	$conn->close();
}
?>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Boxicons -->
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <!-- My CSS -->
    
    <link rel="stylesheet" href="css/intern_edit_profile.css?v=<?php echo time(); ?>">

    <title>AMS | Intern Edit Profile</title>
    <script>
        function formatDate(date) {
            const options = { weekday: 'long', month: 'long', day: 'numeric', year: 'numeric', hour: 'numeric', minute: 'numeric', second: 'numeric' };
            return date.toLocaleDateString(undefined, options);
        }

        function updateTime() {
            var date = new Date();
            var formattedDate = formatDate(date);
            document.getElementById("live-time").textContent = formattedDate;
        }

        setInterval(updateTime, 1000);
    </script>
</head>

<body>
    <!-- SIDEBAR DONT DELETE-->
    <!-- <section id="sidebar">
        <a href="reg_dash.php" class="brand">
            <img src="images/CSK Logo.png" alt="" class="logo">
            <span class="text">Attendance Management System</span>
        </a>
        <ul class="side-menu top">
            <li>
                <a href="reg_dash.php">
                    <i class='bx bxs-dashboard' ></i>
                    <span class="text">Dashboard</span>
                </a>
            </li>
            <li>
                <a href="reg_attendance.php">
                    <i class='bx bxs-calendar-check'></i>
                    <span class="text">Attendance</span>
                </a>
            </li>
            
            <li>
                <a href="redirect_emp_int.php">
                    <i class='bx bxs-calendar-x'></i>
                    <span class="text">Request Leave/Overtime</span>
                </a>
            </li>
            <li class="active">
                <a href="reg_profile.php">
                    <i class='bx bxs-calendar-check'></i>
                    <span class="text">My Profile</span>
                </a>
            </li>
        </ul>
        <ul class="side-menu">
            <li>
                <a href="logout.php" class="logout">
                    <i class='bx bxs-log-out-circle' ></i>
                    <span class="text">Logout</span>
                </a>
            </li>
        </ul>
    </section> -->
    <?php include_once ('intern_sidebar.php'); ?>


    <!-- CONTENT -->
    <section id="content">
        <!-- NAVBAR -->
        <!-- <nav>
            <i class='bx bx-menu' ></i>
            <a href="#" class="profile">
            <i class='bx bxs-user-circle'></i>
            </a>
            <h2><?php echo $_SESSION['username']; ?></h2>
        </nav> -->
<!-- Updated navbar to be uniform to other pages -->
<nav>
			<i class='bx bx-menu' ></i>
			<h2><?php echo $_SESSION['username']; echo " | "; echo "AMS Regular"; echo "<br>";
			echo $row['position']; echo " | "; echo $row['department'];
			?></h2>

			<li>
				<a href="logout.php" class="logout">
					<i class='bx bxs-log-out-circle' ></i>
					<span class="text">Logout</span>
				</a>
			</li>
		</nav>
        <!-- MAIN -->
        <main>
			
            <div class="head-title">
                <div class="left">
                    <h1>Edit Profile</h1>
                </div>
            <!-- <div class="card-listAcc">
                <ul class="box-info">
                    <text>CURRENT DATE AND TIME</text>
                </ul>
            </div>
            <div class="input-box">
                <ul class="box-info">
                    <div class="input-field">
                        <div class="date-time">
                            <h1><span id="live-time"></span></h1>
                        </div>
                    </div>
                </ul> -->
                <!-- Updated date and time -->
                <div class="input-box">
				<ul class="box-info">
					<div class="input-field">
						<div class="date-time">
							<h1>Current Time and Date: <span id="live-time"></span></h1>
						</div>
					</div>
				</ul>
            </div><br>


			<div class="leftcol">
            <!--- Profile Start --->
                <div class="form-des"><div class="form-des2">
                    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>">
                    <label for="fullname">Full Name:</label><br>
                    <input type="text" name="fullname" id="fullname" required><br><br>

                    <label for="address">Present Address:</label><br>
                    <input type="text" name="address" id="address" required><br><br>

                    <label for="age">Age:</label><br>
                    <input type="number" name="age" id="age" required><br><br>

                    <label for="gender">Gender:</label><br>
                    <select name="gender" id="gender" required>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Others">Others</option>
                    </select><br><br>

                    <label for="position">Position:</label><br>
                    <input type="text" name="position" id="position" required><br><br>

                    <label for="department">Department:</label><br>
                    <select name="department" id="department" required>
                        <option value="IT">IT</option>
                        <option value="Marketing">Marketing</option>
                        <option value="HR">HR</option>
                        <option value="Admin">Admin</option>
                    </select><br><br>

                    <label for="startdate">Start Date:</label><br>
                    <input type="date" name="startdate" id="startdate" required><br><br>

                    <label for="school">School:</label><br>
                    <input type="text" name="school" id="school"><br><br>

                    <label for="requiredhours">Required Hours:</label><br>
                    <input type="number" name="requiredhours" id="requiredhours"><br>

                    <input for="submit" type="submit" value="Submit" class="submit">
                    </form>
                </div>
			</div>


            <div class="rightcol">
                <div class="upload-picture">
                <img src="images/profile-user.png" alt="" class="picture"><br>
                 <h2>Upload Your Picture</h2>
                    <form method="post" action="upload_picture.php" enctype="multipart/form-data">
                        <input type="file" name="picture" id="picture">
                        <input type="submit" value="Upload" class="submit">
                    </form>
                 </div>
                <!-- Display Uploaded Picture -->
            <div class="uploaded-picture">
                <?php
            // Display the uploaded picture here
                 ?>
            
            </div>
            </div>`

        </div>
        </main>
    </section>
<!-- CONTENT -->
<script src="js/Dashboard.js"></script>
<script src="js/navDropdown.js"></script>
</body>
</html>
