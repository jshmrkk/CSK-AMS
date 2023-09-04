<?php
    session_start();

	header("Cache-Control: no-cache, no-store, must-revalidate");
	header("Pragma: no-cache");
	header("Expires: 0");

    include 'connects.php';

	$page = 'profile';
    $tab = 'admin';
    include_once('sidebar.php');

    if(isset($_SESSION['username'])) {
    //do nothing
    } else {
       header('Location: default.php');
       exit;
    }

	$name = $_SESSION['username'];
    $position = $_SESSION['position'];

	// $query_name = "SELECT name FROM int_info";
    // $result_name = mysqli_query($conn, $query_name);

    // $query_in = "SELECT name, department, start_date, hr_req, hr_ren, hr_left FROM int_info";
    // $result_in = mysqli_query($conn, $query_in);

	// $query_int = "SELECT name FROM int_info";
	// $result_int = mysqli_query($conn, $query_int);
	
	// $query_emp = "SELECT name FROM emp_info";
	// $result_emp = mysqli_query($conn, $query_emp);
	// $combinedNames = array();
	
	// while ($row1 = mysqli_fetch_assoc($result_int)) {
	//   $combinedNames[] = $row1['name'];
	// }
	
	// while ($row2 = mysqli_fetch_assoc($result_emp)) {
	//   $combinedNames[] = $row2['name'];
	// }


	// $query_notice = "SELECT name, type, date, remarks FROM notices";
    // $result_notice = mysqli_query($conn, $query_notice);
	if ($position == "employee") {
        $query = "SELECT name, department, position, start_date, work_days, work_hrs FROM emp_info WHERE name='$name'";
    } else {
        $query = "SELECT name, department, position, start_date, hr_req, hr_ren, hr_left FROM int_info WHERE name='$name'";
    }
    $result = mysqli_query($conn, $query);
    $row = mysqli_fetch_assoc($result);
    $date = $row['start_date'];
    $formatted_date = date('D, M d, Y', strtotime($date));
	$department = $_SESSION['department'];
?>

<script>
	function fetchUserData(selectedName) {
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			var userData = JSON.parse(xhr.responseText);
			document.getElementById('hr_req').value = userData.hr_req;
			document.getElementById('hr_ren').value = userData.hr_ren;
			document.getElementById('hr_left').value = userData.hr_left;
		}
		};
		xhr.open('GET', 'fetch_int_hours.php?name=' + selectedName, true);
		xhr.send();
  	}

	function formatDate(date) {
      const options = { weekday: 'long', month: 'long', day: 'numeric', year: 'numeric' };
      return date.toLocaleDateString(undefined, options);
    }

    function updateTime() {
      var date = new Date();
      var hours = date.getHours();
      var minutes = date.getMinutes();
      var seconds = date.getSeconds();
      var ampm = hours >= 12 ? 'PM' : 'AM';

      hours = hours % 12;
      hours = hours ? hours : 12;
      hours = hours.toString().padStart(2, '0');
      minutes = minutes.toString().padStart(2, '0');
      seconds = seconds.toString().padStart(2, '0');

    //   var currentDate = formatDate(date);
    //   document.getElementById("live-time").textContent = currentDate + " " + hours + ":" + minutes + ":" + seconds + ' ' + ampm;
    }
    
    setInterval(updateTime, 1000);	
</script>

<style>
  .correct-time {
    color: black;
  }

  .late-time {
    color: red;
  }
</style>	

<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Boxicons -->
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<!-- My CSS -->
	<link rel="stylesheet" href="css/Profile.css?v=<?php echo time(); ?>">
	<!-- <link rel="stylesheet" href="css/Attendances2.css"> -->
	<title>AMS | Attendance</title>
</head>


<body>
	<!-- SIDEBAR -->
<?php include_once 'sidebar.php'; ?>
	<!-- CONTENT -->
	<section id="content">
		<!-- NAVBAR -->
		<!-- Updated Navbar to Match other pages -->
		<nav>
			<i class='bx bx-menu' ></i>
			<h2><?php echo $_SESSION['username']; echo " | "; echo "AMS Admin"; echo "<br>";
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
<!-- Updated the Current Date Time to match other pages by Pedrozo -->
				<div class="input-box">
            <ul class="box-info">
                <div class="input-field">
                    <div class="date-time">
                        <h1>Current Time and Date: <span id="live-time"></span></h1>
                    </div>
                </div>
            </ul>
        </div>
				<div class="left">
                    <h1>Edit Profile</h1>
                </div>
			</div>
  			<!-- FOR PROFILE -->

			  <?php
   
    // Check the connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

	$positionFilter = isset($_GET['position']) ? $_GET['position'] : 'employee';

    // Retrieve the most recent entry from the database
   		$sql = "SELECT * FROM emp_info
		WHERE name = '$name' LIMIT 1";
		$result = $conn->query($sql);
	
	



    if ($result->num_rows > 0) {
        // Output the most recent entry in the form
        $row = $result->fetch_assoc();
        $fullname = $row['name'];
        $address = $row['address'];
        $age = $row['age'];
        $gender = $row['gender'];
        $position = $row['position'];
        $department = $row['department'];
        $startdate = $row['start_date'];
				
    } else {
        echo "No entry found.";
    }

    ?>

		<div class="profile-container">
			<div class="left-column">
				<img src="images/profile-user.png" alt="" class="picture">
			</div>
			<div class="right-column">
				<p><strong>Full Name:</strong> <?php echo $fullname; ?></p>
				<p><strong>Present Address:</strong> <?php echo $address; ?></p>
				<p><strong>Age:</strong> <?php if($age === 0){echo "Not Set";} 
				else{echo $age;} ?></p>
				<p><strong>Gender:</strong> <?php echo $gender; ?></p>	
				<p><strong>Department:</strong> <?php echo $department; ?></p>
				<p><strong>Start Date:</strong> <?php echo $startdate; ?></p>
			
			</div>
		</div>

	<div class="container">	
	<div class="column-left">

		<div class="button-changepass">
			<a>Change Password</a>
		</div>

		<form action="change_password.php" method="POST">
			<div class="passfonts">
				<div class="button-changepass">
					<label for="old_password">Old Password:</label><br>
					<input type="password" id="old_password" name="old_password" required>
				</div>

				<div class="button-changepass">
					<label for="new_password">New Password:</label><br>
					<input type="password" id="new_password" name="new_password" required>
				</div>

				<div class="button-changepass">
					<label for="confirm_password">Retype Password:</label><br>
					<input type="password" id="confirm_password" name="confirm_password" required>
				</div>
			</div>

			<div class="submit-button">	
				<button type="submit">Submit</button>
			</div>	
		</form>
	</div>


		<div class="column-right">
			<div class="button-container">
				<button><a href="admin_edit_profile.php?v=<?php echo time(); ?>">Edit Profile</a></button>
			</div>
			
	</div>

		</main>
	</section>
	<!-- CONTENT -->
	<script src="js/Dashboard.js"></script>
    <script src="js/summaryView.js"></script>
    <script src="js/navDropdown.js"></script>
	</body>
</html>