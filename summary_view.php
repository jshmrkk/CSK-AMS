<?php

session_start();

header("Cache-Control: no-cache, no-store, must-revalidate");
header("Pragma: no-cache");
header("Expires: 0");

include 'connects.php';

require_once 'auth_check.php';

$page = 'summary_view';
$tab = 'attendance';
include_once('sidebar.php');

if (isset($_SESSION['username'])) {
    //do nothing
} else {
    header('Location: index.php');
    exit;
}

$name = $_SESSION['username'];
$position = $_SESSION['position'];


if ($position == "employee") {
    $query = "SELECT name, department, position, start_date, work_days, work_hrs FROM emp_info WHERE name='$name'";
} else {
    $query = "SELECT name, department, position, start_date, hr_req, hr_ren, hr_left FROM int_info WHERE name='$name'";
}
$result = mysqli_query($conn, $query);
$row = mysqli_fetch_assoc($result);
$date = $row['start_date'];
$formatted_date = date('D, M d, Y', strtotime($date));
$result_text = "<h1>Name: " .
    $row['name'] . "<br>Department: " .
    $row['department'] . "<br>Position: " .
    $row['position'] . "<br>Start Date: " .
    $formatted_date . "<br>Work Days: " .
    $row['work_days'] . "<br>Work Hours: " .
    $row['work_hrs'];
 
if ($position == "intern") {
    $result_text .= "<br>Hours Required: " .
        $row['hr_req'] . "<br>Hours Rendered: " .
        $row['hr_ren'] . "<br>Hours Left: " .
        $row['hr_left'];
}
?>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Boxicons -->
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <!-- My CSS -->
    <link rel="stylesheet" href="css/summary_view.css">
    <title>AMS | Employee and Intern Management</title>
</head>

<body>
    <!-- SIDEBAR -->
    <?php include_once 'sidebar.php'; ?>

    <!-- CONTENT -->
    <section id="content">
        <!-- NAVBAR -->
        <nav>
            <i class='bx bx-menu'></i>
            <h2><?php echo $_SESSION['username'];
                echo " | ";
                echo "AMS Admin";
                echo "<br>";
                echo $row['position'];
                echo " | ";
                echo $row['department'];
                ?></h2>
            <a href="logout.php" class="logout">
                <i class='bx bxs-log-out-circle'></i>
                <span class="text">Logout</span>
            </a>
            </li>
        </nav>

        <!-- MAIN -->
        <main>
            <div class="input-box">
                <ul class="box-info">
                    <div class="input-field">
                        <div class="date-time">
                            <h1>Current Time and Date: <span id="live-time"></span></h1>
                        </div>
                    </div>
                </ul>
            </div><br>

            <!-- Year, Month, Department and Week Filter -->
            <div class="ymw-department-filter">
                <h2 align="right">Filter by Year, Month, Department and Week</h3>
                <form action="summary_view.php" method="GET" id="filter-form">
                    <label for="filter-year">Select Year:</label>
                    <select id="filter-year" name="filter_year">
                        <?php
                        // Generate options for a range of years
                        $currentYear = date('Y');
                        $startYear = $currentYear - 4; // You can adjust the range as needed
                        $endYear = $currentYear + 0;
                        for ($year = $startYear; $year <= $endYear; $year++) {
                            $selected = ($_GET['filter_year'] ?? $currentYear) == $year ? 'selected' : '';
                            echo "<option value=\"$year\" $selected>$year</option>";
                        }
                        ?>
                    </select>
                    
                    <label for="filter-month">Select Month:</label>
                    <select id="filter-month" name="filter_month">
                        <?php
                         // Get the selected year from the form data or use the current year
                        $selectedYear = $_GET['filter_year'] ?? date('Y');
                        // Generate options for the 12 months of the year
                        for ($i = 1; $i <= 12; $i++) {
                            $month = date('F', mktime(0, 0, 0, $i, 1, $selectedYear));
                            $value = date('Y-m', mktime(0, 0, 0, $i, 1, $selectedYear));
                            $selected = ($_GET['filter_month'] ?? date('Y-m')) === $value ? 'selected' : '';
                            echo "<option value=\"$value\" $selected>$month</option>";
                        }
                        ?>
                    </select>

                    <label for="filter-week">Select Week:</label>
                    <select id="filter-week" name="filter_week">
                        <option value="whole_month">Whole Month</option>
                        <!-- Week filter options will be dynamically generated using JavaScript -->
                    </select>

                    <!-- Add hidden inputs to store selected week's start and end dates -->
                    <input type="hidden" id="selected-week-start" name="selected_week_start">
                    <input type="hidden" id="selected-week-end" name="selected_week_end">

                    <label for="filter-department">Select Department:</label>
                    <select id="filter-department" name="filter_department">
                        <option value="">All Departments</option>
                        <option value="IT">IT</option>
                        <option value="Marketing">Marketing</option>
                        <option value="HR">HR</option>
                        <option value="Accounting">Accounting</option>
                        <option value="Admin">Admin</option>
                    </select>
                    <input type="text" id="name-search" class="search-input" placeholder="Search by Name" >
                    <button class = "btn1" type="submit">Apply Filter</button> 
                </form>
            </div>

            <!-- STORE DATA -->
            <?php

            $users_sql = "SELECT name FROM users";
            $users_result = mysqli_query($conn, $users_sql);

            // Store all names from the users table
            $allNames = array();
            while ($row = mysqli_fetch_assoc($users_result)) {
                $allNames[] = $row['name'];
            }
            mysqli_free_result($users_result);

            // Create an associative array to store department, position, and work_hrs for each name
            $userInfo = array();

            // Loop through each name in the $allNames array
            foreach ($allNames as $name) {
                // Check if the name is an employee or an intern based on the 'position' column in the 'users' table
                $query = "SELECT * FROM users WHERE name='$name'";

                $result = mysqli_query($conn, $query);
                $row = mysqli_fetch_assoc($result);

                // Get the position from the users table
                $position = $row['position'];

                // Fetch the relevant information from the appropriate table (emp_info or int_info) based on the position
                if ($position == "employee") {
                    $query_emp = "SELECT department, position, work_hrs FROM emp_info WHERE name='$name'";
                    $result_emp = mysqli_query($conn, $query_emp);
                    $emp_row = mysqli_fetch_assoc($result_emp);

                    if (isset($userInfo[$name])) {
                        $userInfo[$name] = array(
                            'department' => $emp_row['department'],
                            'position' => $emp_row['position'],
                            'work_hrs' => $emp_row['work_hrs'],
                        );
                    }


                    mysqli_free_result($result_emp);
                } elseif ($position == "intern") {
                    $query_int = "SELECT department, position, work_hrs FROM int_info WHERE name='$name'";
                    $result_int = mysqli_query($conn, $query_int);
                    $int_row = mysqli_fetch_assoc($result_int);

                    if (isset($userInfo[$name])) {
                        $userInfo[$name] = array(
                            'department' => $int_row['department'],
                            'position' => $int_row['position'],
                            'work_hrs' => $int_row['work_hrs'],
                        );
                    }

                    mysqli_free_result($result_int);
                }
            }

            //RESPONSIBLE FOR THE FILTER DATA

            // Get the selected filters from the form
            $filterMonth = $_GET['filter_month'] ?? date('Y-m');
            $filterWeek = $_GET['filter_week'] ?? '';

            // Get the start and end dates for the selected week
            if ($filterWeek) {
                list($startDate, $endDate) = explode(':', $filterWeek);
            } else {
                // If no week is selected, consider the whole month
                $startDate = date('Y-m-01', strtotime($filterMonth));
                $endDate = date('Y-m-t', strtotime($filterMonth));
            }

            // Update the hidden inputs with selected week's start and end dates
            echo '<input type="hidden" id="selected-week-start" name="selected_week_start" value="' . $startDate . '">';
            echo '<input type="hidden" id="selected-week-end" name="selected_week_end" value="' . $endDate . '">';

            // Get the selected department from the form or use an empty string if not set
            $selectedDepartment = $_GET['filter_department'] ?? '';

            // Update the timein_sql query to use the filters
            // $timein_sql = "SELECT u.name, COALESCE(ei.department, ii.department) AS department, COALESCE(ei.work_hrs, ii.work_hrs) AS work_hrs, u.position, t.datetime AS timein, o.datetime AS timeout, n.type, n.date
            //             FROM users u
            //             LEFT JOIN emp_info ei ON u.name = ei.name AND u.position = 'Employee'
            //             LEFT JOIN int_info ii ON u.name = ii.name AND u.position = 'Intern'
            //             LEFT JOIN time_in t ON u.name = t.name
            //             LEFT JOIN time_out o ON u.name = o.name
            //             LEFT JOIN notices n ON u.name = n.name
            //             WHERE DAYOFWEEK(t.datetime) BETWEEN 2 AND 7
            //             AND t.datetime BETWEEN '$startDate' AND '$endDate'
            //             ORDER BY CASE COALESCE(ei.department, ii.department)
            //                 WHEN 'IT' THEN 1
            //                 WHEN 'Marketing' THEN 2
            //                 WHEN 'HR' THEN 3
            //                 WHEN 'Accounting' THEN 4
            //                 WHEN 'Admin' THEN 5
            //                 ELSE 6
            //             END, timein ASC";
            $timein_sql = "SELECT u.name, COALESCE(ei.department, ii.department) AS department, COALESCE(ei.work_hrs, ii.work_hrs) AS work_hrs, u.position, t.datetime AS timein, o.datetime AS timeout, n.type, n.date
              FROM users u
              LEFT JOIN emp_info ei ON u.name = ei.name AND u.position = 'Employee'
              LEFT JOIN int_info ii ON u.name = ii.name AND u.position = 'Intern'
              LEFT JOIN time_in t ON u.name = t.name
              LEFT JOIN time_out o ON u.name = o.name
              LEFT JOIN notices n ON u.name = n.name
              WHERE DAYOFWEEK(t.datetime) BETWEEN 2 AND 7
              AND t.datetime BETWEEN '$startDate' AND '$endDate'
              AND ('$selectedDepartment' = '' OR COALESCE(ei.department, ii.department) = '$selectedDepartment')
              ORDER BY CASE COALESCE(ei.department, ii.department)
                  WHEN 'IT' THEN 1
                  WHEN 'Marketing' THEN 2
                  WHEN 'HR' THEN 3
                  WHEN 'Accounting' THEN 4
                  WHEN 'Admin' THEN 5
                  ELSE 6
              END, timein ASC";

            $timein_result = mysqli_query($conn, $timein_sql);
            

            

            // Get the start and end dates of the selected week from the hidden inputs
            $filterWeekStart = $_GET['selected_week_start'] ?? '';
            $filterWeekEnd = $_GET['selected_week_end'] ?? '';

            // Initialize the $dates array with empty value
            $dates = [];

            // Update the $dates array based on the selected week
            if ($filterWeekStart && $filterWeekEnd) {
                $currentDate = new DateTime($filterWeekStart);
                $endDate = new DateTime($filterWeekEnd);
                $endDate->modify('+1 day'); // Add one day to include the end date in the loop

                while ($currentDate < $endDate) {
                    $dayOfWeek = $currentDate->format('N');

                    // Check if the day of the week is from Monday to Saturday (1 to 6)
                    if ($dayOfWeek >= 1 && $dayOfWeek <= 6) {
                        $dates[] = $currentDate->format('Y-m-d');
                    }

                    // Move to the next day
                    $currentDate->modify('+1 day');
                }
            }

            // Track names
            $nameTracker = array();

            // Store time in data for each name
            $timeinData = array();

            while ($row = mysqli_fetch_assoc($timein_result)) {
                $name = $row['name'];
                $date = $row['timein'] ? date('Y-m-d', strtotime($row['timein'])) : '';

                if (!in_array($date, $dates) && $date !== '') {
                    $dates[] = $date;
                }

                // Store time in and time out data for each name and date
                if (!isset($timeinData[$name])) {
                    $timeinData[$name] = array(
                        'department' => $row['department'],
                        'position' => $row['position'],
                        'work_hrs' => $row['work_hrs'],
                        'data' => array()
                    );
                }

                if (!isset($timeinData[$name]['data'][$date])) {
                    $timeinData[$name]['data'][$date] = array(
                        'timein' => $row['timein'],
                        'timeout' => $row['timeout']
                    );
                }

                // Track the printed name
                if (!in_array($name, $nameTracker)) {
                    $nameTracker[] = $name;
                }

                // Check if the name has an associated notice with date and type
                $noticeDate = $row['date'];
                $noticeType = $row['type'];

                if ($noticeDate && $noticeType) {
                    // Store the notice data in the noticeData array
                    if (!isset($timeinData[$name]['data'][$noticeDate])) {
                        $timeinData[$name]['data'][$noticeDate] = array();
                    }

                    // Set the values in Ti and To based on the notice type
                    if ($noticeType == 'School Initiated Leave') {
                        $timeinData[$name]['data'][$noticeDate]['timein'] = 'SIL';
                        $timeinData[$name]['data'][$noticeDate]['timeout'] = 'SIL';
                    } elseif ($noticeType == 'Sick Leave') {
                        $timeinData[$name]['data'][$noticeDate]['timein'] = 'SL';
                        $timeinData[$name]['data'][$noticeDate]['timeout'] = 'SL';
                    } elseif ($noticeType == 'Absence without Leave') {
                        $timeinData[$name]['data'][$noticeDate]['timein'] = 'ABW';
                        $timeinData[$name]['data'][$noticeDate]['timeout'] = 'ABW';
                    } elseif ($noticeType == 'Late (No Time in)') {
                        $timeinData[$name]['data'][$noticeDate]['timein'] = 'L';
                        $timeinData[$name]['data'][$noticeDate]['timeout'] = 'L';
                    } elseif ($noticeType == 'Unidentified') {
                        $timeinData[$name]['data'][$noticeDate]['timein'] = '?';
                        $timeinData[$name]['data'][$noticeDate]['timeout'] = '?';
                    } elseif ($noticeType == 'Planned Leave') {
                        $timeinData[$name]['data'][$noticeDate]['timein'] = 'PL';
                        $timeinData[$name]['data'][$noticeDate]['timeout'] = 'PL';
                    }

                    // Add the notice date to the dates array if it doesn't exist
                    if (!in_array($noticeDate, $dates)) {
                        $dates[] = $noticeDate;
                    }
                }
            }

            sort($dates);
            mysqli_free_result($timein_result);
            ?>
            <div class="tg-wrap1">
                <table style="width: 100%" class="tg">
                    <tbody>
                        <tr>
                            <th class="tgw row-sticky1" colspan="4"></th>
                            <?php
                            // Display unique dates in table header
                            foreach ($dates as $date) {
                                echo '<th class="tg-0pky row-sticky" colspan="2">' . $date . '</th>';
                            }
                            ?>
                        </tr>
                        <tr>
                            <!-- column-name is responsible for the unsightly color change -->
                            <th class="tg-0pky row-sticky2">Name</th>
                            <th class="tg-0pky row-sticky2">Department</th>
                            <th class="tg-0pky row-sticky2">Position</th>
                            <th class="tg-0pky row-sticky2">Schedule</th>
                            <?php
                            // Display corresponding headers for each date
                            foreach ($dates as $date) {
                                echo '<th class="tg-0pky row-sticky2">Ti</th>';
                                echo '<th class="tg-0pky row-sticky2">To</th>';
                            }
                            ?>
                        </tr>                  
                        <?php
                        // Display data rows
                        foreach ($allNames as $name) {
                            
                            

                            // Check if the name exists in the timeinData array
                            if (isset($timeinData[$name])) {
                                $department = $timeinData[$name]['department'];
                                if ($selectedDepartment !== '' && $selectedDepartment !== $department) {
                                    continue;
                                }
                                echo '<tr>';
                                echo '<td class="tg-0pky tg-name">' . $name . '</td>';
                                echo '<td class="tg-0pky">' . $department . '</td>';
                                echo '<td class="tg-0pky">' . $timeinData[$name]['position'] . '</td>';
                                echo '<td class="tg-0pky">' . $timeinData[$name]['work_hrs'] . '</td>';

                                

                                // Display corresponding data for each date
                                foreach ($dates as $date) {
                                    $timein = isset($timeinData[$name]['data'][$date]) ? $timeinData[$name]['data'][$date]['timein'] : '';
                                    $timeout = isset($timeinData[$name]['data'][$date]) ? $timeinData[$name]['data'][$date]['timeout'] : '';

                                    // Check if the name has multiple timeouts in a single day
                                    if ($timeout !== '' && $timein === '') {
                                        $latestTimeout = '';
                                        foreach ($timeinData[$name]['data'][$date] as $entry) {
                                            if ($entry['timeout'] !== '') {
                                                $latestTimeout = $entry['timeout'];
                                            }
                                        }
                                        $timein = $latestTimeout === '' ? 'L' : '';
                                    }

                                    // Check if the Ti value is "PL" and replace the cell value with "PL" instead of filling it with green color
                                    if ($timein == 'PL') {
                                        echo '<td class="tg-0pky">' . $timein . '</td>';
                                    } elseif ($timein == 'SIL') {
                                        echo '<td class="tg-0pky">' . $timein . '</td>';
                                    } elseif ($timein == 'SL') {
                                        echo '<td class="tg-0pky">' . $timein . '</td>';
                                    } elseif ($timein == 'ABW') {
                                        echo '<td class="tg-0pky red-bg">' . '</td>';
                                    } elseif ($timein == 'L') {
                                        echo '<td class="tg-0pky">' . $timein . '</td>';
                                    } elseif ($timein == '?') {
                                        echo '<td class="tg-0pky green-bg">' . '</td>';
                                    } else {
                                        echo '<td class="tg-0pky' . ($timein ? ' green-bg' : '') . '"></td>';
                                    }

                                    // Check if the To value is "PL" and replace the cell value with "PL" instead of filling it with green color
                                    if ($timeout == 'PL') {
                                        echo '<td class="tg-0pky">' . $timeout . '</td>';
                                    } elseif ($timeout == 'SIL') {
                                        echo '<td class="tg-0pky">' . $timeout . '</td>';
                                    } elseif ($timeout == 'SL') {
                                        echo '<td class="tg-0pky">' . $timeout . '</td>';
                                    } elseif ($timeout == 'ABW') {
                                        echo '<td class="tg-0pky red-bg">' . '</td>';
                                    } elseif ($timeout == 'L') {
                                        echo '<td class="tg-0pky green-bg">' . '</td>';
                                    } elseif ($timeout == '?') {
                                        echo '<td class="tg-0pky">' . $timeout . '</td>';
                                    } else {
                                        echo '<td class="tg-0pky' . ($timeout ? ' green-bg' : '') . '"></td>';
                                    }
                                }
                            // } else {
                            //     // If there is no timeinData for the name, use the $userInfo array to display the information
                            //     if (isset($userInfo[$name])) {
                            //         echo '<td class="tg-0pky">' . $userInfo[$name]['department'] . '</td>';
                            //         echo '<td class="tg-0pky">' . $userInfo[$name]['position'] . '</td>';
                            //         echo '<td class="tg-0pky">' . $userInfo[$name]['work_hrs'] . '</td>';

                            //         // Display empty cells for each date since there is no timeinData
                            //         foreach ($dates as $date) {
                            //             echo '<td class="tg-0pky"></td>';
                            //             echo '<td class="tg-0pky"></td>';
                            //         }
                            //     } else {
                            //         // If there is no timeinData for the name, use the $userInfo array to display the information
                            //         if (isset($userInfo[$name])) {
                            //             echo '<td class="tg-0pky">' . $userInfo[$name]['department'] . '</td>';
                            //             echo '<td class="tg-0pky">' . $userInfo[$name]['position'] . '</td>';
                            //             echo '<td class="tg-0pky">' . $userInfo[$name]['work_hrs'] . '</td>';

                            //             // Display empty cells for each date since there is no timeinData
                            //             foreach ($dates as $date) {
                            //                 echo '<td class="tg-0pky"></td>';
                            //                 echo '<td class="tg-0pky"></td>';
                            //             }
                            //         } else {
                            //             // If there is no information for the name in the $userInfo array, display empty cells for department, position, and work hours
                            //             echo '<td class="tg-0pky"></td>';
                            //             echo '<td class="tg-0pky"></td>';
                            //             echo '<td class="tg-0pky"></td>';

                            //             // Display empty cells for each date since there is no timeinData and userInfo for this name
                            //             foreach ($dates as $date) {
                            //                 echo '<td class="tg-0pky"></td>';
                            //                 echo '<td class="tg-0pky"></td>';
                            //             }
                            //         }
                                // }

                                echo '</tr>';
                            }
                        }

                        ?>
                    </tbody>
                </table>
            </div>
        

            <!-- end of table div -->

            <form action="exportSummary_Excel.php" method="POST">
                <div class="input-field">
                    <input type="submit" class="submit-excel" value="Export Summary View to Excel File">
                </div>
            </form>


            <!-- CONTENT -->



            <!-- Small modification for Year and Department Filter -->
            <!-- JavaScript code for dynamically updating the week filter options and dates -->
            <script>
                const monthSelect = document.getElementById('filter-month');
                const weekSelect = document.getElementById('filter-week');

                function updateTableHeader(selectedWeek) {
                    if (selectedWeek === monthSelect.value + '-01' + ':' + new Date(monthSelect.value + '-01').toISOString().slice(0, 10)) {
                        document.getElementById('table-header').textContent = 'Monthly Summary';
                    } else {
                        const weekDates = selectedWeek.split(':');
                        document.getElementById('table-header').textContent = 'Summary: ' + weekDates[0] + ' to ' + weekDates[1];
                    }
                }

                monthSelect.addEventListener('change', function() {
                    const selectedMonth = this.value;
                    weekSelect.innerHTML = ''; // Clear existing options

                    const firstDayOfMonth = new Date(selectedMonth + '-01');
                    const lastDayOfMonth = new Date(firstDayOfMonth);
                    lastDayOfMonth.setMonth(lastDayOfMonth.getMonth() + 1);
                    lastDayOfMonth.setDate(lastDayOfMonth.getDate() - 1);

                    const numWeeks = Math.ceil((lastDayOfMonth.getDate() + firstDayOfMonth.getDay()) / 7);

                    // Add the "Whole Month" option
                    const wholeMonthOption = document.createElement('option');
                    wholeMonthOption.value = selectedMonth + '-01' + ':' + lastDayOfMonth.toISOString().slice(0, 10);
                    wholeMonthOption.textContent = 'Whole Month';
                    weekSelect.appendChild(wholeMonthOption);

                    for (let i = 1; i <= numWeeks; i++) {
                        const startDate = new Date(firstDayOfMonth);
                        startDate.setDate(startDate.getDate() + (i - 1) * 7 - startDate.getDay());
                        const endDate = new Date(startDate);
                        endDate.setDate(endDate.getDate() + 6);

                        const weekLabel = 'Week ' + i + ' (' + startDate.toISOString().slice(0, 10) + ' to ' + endDate.toISOString().slice(0, 10) + ')';
                        const value = startDate.toISOString().slice(0, 10) + ':' + endDate.toISOString().slice(0, 10);
                        const option = document.createElement('option');
                        option.value = value;
                        option.textContent = weekLabel;
                        weekSelect.appendChild(option);

                        // Add the start date and end date to the data-week attribute of each week option
                        option.dataset.week = startDate.toISOString().slice(0, 10) + ':' + endDate.toISOString().slice(0, 10);
                    }

                    // Trigger the change event to update the table when the month changes
                    weekSelect.dispatchEvent(new Event('change'));
                });

                // Trigger the change event to populate the week filter options initially
                monthSelect.dispatchEvent(new Event('change'));

                // Listen for changes to the week filter
                weekSelect.addEventListener('change', function() {
                    // Update the table header
                    updateTableHeader(this.value);

                    // Update the hidden inputs with selected week's start and end dates
                    const selectedWeek = this.value;
                    const weekDates = selectedWeek.split(':');
                    document.getElementById('selected-week-start').value = weekDates[0];
                    document.getElementById('selected-week-end').value = weekDates[1];

                    // Update the form action URL with the selected filters before submitting the form
                    const form = document.getElementById('filter-form');
                    form.action = `summary_view.php?filter_month=${weekDates[0].slice(0, 7)}&filter_week=${selectedWeek}`;

                    // Submit the form
                    form.submit();
                });
            
                // After form submission, set the selected option in the week dropdown based on the query parameters
                window.addEventListener('DOMContentLoaded', function() {
                    const urlParams = new URLSearchParams(window.location.search);
                    const filterWeek = urlParams.get('filter_week');
                    if (filterWeek) {
                        weekSelect.value = filterWeek;
                        // Update the table header after setting the selected option
                        updateTableHeader(filterWeek);
                    }
                });

                const nameSearchInput = document.getElementById('name-search');

                nameSearchInput.addEventListener('input', function() {
                    const filterValue = nameSearchInput.value.toLowerCase();
                    const nameCells = document.querySelectorAll('.tg-name');
                    
                    nameCells.forEach(function(cell) {
                        const name = cell.textContent.toLowerCase();
                        cell.closest('tr').style.display = name.includes(filterValue) ? '' : 'none';
                    });
                });
            </script>


            </script>
            <script src="js/Dashboard.js"></script>
            <script src="js/summaryView.js"></script>
            <script src="js/navDropdown.js"></script>

        </main>
    </section>

</body>

</html>