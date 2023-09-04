<?php
    session_start();

	header("Cache-Control: no-cache, no-store, must-revalidate");
	header("Pragma: no-cache");
	header("Expires: 0");

    include 'connects.php';

    if(isset($_SESSION['username'])) {
    //do nothing
    } else {
       header('Location: index.php');
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

	$page = 'reg_profile';
	$tab = 'reg';
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

      var currentDate = formatDate(date);
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
	<link rel="stylesheet" href="css/Reg_profile.css">
	<!-- <link rel="stylesheet" href="css/Attendances2.css"> -->
	<title>AMS | Attendance</title>

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
<!-- Old Sidebar Code below, included the file instead -->
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
	<?php include_once 'intern_sidebar.php'; ?>


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
		<!-- Updated Navbar to be uniform w/ other pages -->
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
  			<!-- FOR TIME -->
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
                    </ul>
                </div> -->
				<div class="input-box">
				<ul class="box-info">
					<div class="input-field">
						<div class="date-time">
							<h1>Current Time and Date: <span id="live-time"></span></h1>
						</div>
					</div>
				</ul>
			</div>	
				<br>
			</div>
  			<!-- FOR PROFILE -->

			  <?php
   
    // Check the connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Retrieve the most recent entry from the database
    $sql = "SELECT * FROM int_info
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
        $school = $row['school'];
        $required_hours = $row['hr_req'];
    } else {
        echo "No entry found.";
    }

    // Close the database connection
    $conn->close();
    ?>

		<div class="profile-container">
			<div class="left-column">
				<img src="images/profile-user.png" alt="" class="picture">
			</div>
			<div class="right-column">
				<p><strong>Full Name:</strong> <?php echo $fullname; ?></p>
				<p><strong>Present Address:</strong> <?php echo $address; ?></p>
				<p><strong>Age:</strong> <?php echo $age; ?></p>
				<p><strong>Gender:</strong> <?php echo $gender; ?></p>	
				<p><strong>Department:</strong> <?php echo $department; ?></p>
				<p><strong>Start Date:</strong> <?php echo $startdate; ?></p>
				<p><strong>School:</strong> <?php echo $school; ?></p>
				<p><strong>Hours Required:</strong> <?php echo $required_hours; ?></p>
				<p><strong>Hours Rendered:</strong> <?php echo $required_hours; ?></p>
				<p><strong>Hours Left:</strong> <?php echo $required_hours; ?></p>
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
				<button><a href="edit_profile.php">Edit Profile</a></button>
			</div>
			<div class="status">

				<a>My Status</a>
				<table>
				<tr>
					<th>Hours Required:</th>
					<th>Hours Left:</th>
					<th>
						<ul>
							<li>Late</li>
							<li>No Time Out</li>
							<li>Absences without leave</li>
							<li>School Initiated Leave</li>
							<li>Paid Vacation Leave</li>
							<li>Unpaid Vacation Leave</li>
							<li>Sick Leave</li>
						</ul>
					</th>
				</tr>

				</table>
			</div>
	</div>

		</main>
	</section>
	<!-- CONTENT -->
	<script src="js/Dashboard.js"></script>
	<script src="js/navDropdown.js"></script>
	</body>
</html>