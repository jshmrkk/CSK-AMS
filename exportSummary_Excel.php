<?php
include "connects.php";
require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;

$spreadsheet = new Spreadsheet();

// Employee Sheet
$empSheet = $spreadsheet->getActiveSheet();
$empSheet->setTitle('Employee');

$timein_sql = "SELECT u.name, ei.department, ei.work_hrs, u.position, t.datetime AS timein, o.datetime AS timeout, n.type, n.date
                FROM users u
                LEFT JOIN emp_info ei ON u.name = ei.name
                LEFT JOIN time_in t ON u.name = t.name
                LEFT JOIN time_out o ON u.name = o.name
                LEFT JOIN notices n ON u.name = n.name
                WHERE u.position = 'employee'
                ORDER BY CASE ei.department
                    WHEN 'IT' THEN 1
                    WHEN 'Marketing' THEN 2
                    WHEN 'HR' THEN 3
                    WHEN 'Accounting' THEN 4
                    WHEN 'Admin' THEN 5
                    ELSE 6
                END, t.datetime ASC";
$timein_result = mysqli_query($conn, $timein_sql);

$empSheet->setCellValue('A2', 'Name');
$empSheet->setCellValue('B2', 'Department');
$empSheet->setCellValue('C2', 'Position');
$empSheet->setCellValue('D2', 'Schedule');

// Apply borders to the headers
$empSheet->getStyle('A2:D2')->getBorders()->getAllBorders()->setBorderStyle(Border::BORDER_THIN);

$row = 3;

$dates = array(); //Track dates
$nameTracker = array(); // Track names
$timeinData = array(); // Store time in data for each name
$noticeData = array(); // Store notice data for each name and date

while ($rowIn = mysqli_fetch_assoc($timein_result)) {
    $name = $rowIn['name'];
    $date = $rowIn['timein'] ? date('Y-m-d', strtotime($rowIn['timein'])) : '';
    $timein = $rowIn['timein'] ? date('H:i:s', strtotime($rowIn['timein'])) : '';
    $timeout = $rowIn['timeout'] ? date('H:i:s', strtotime($rowIn['timeout'])) : '';

    // Check if date exists in the dates array
    if (!in_array($date, $dates) && $date !== '') {
        $dates[] = $date;
    }

    // Store time in and time out data for each name and date
    $timeinData[$name][$date] = array(
        'timein' => $timein,
        'timeout' => $timeout
    );

    // Print the name only if it hasn't been printed before
    if (!in_array($name, $nameTracker)) {
        $empSheet->setCellValue('A' . $row, $name);
        $empSheet->setCellValue('B' . $row, $rowIn['department']);
        $empSheet->setCellValue('C' . $row, $rowIn['position']);
        $empSheet->setCellValue('D' . $row, $rowIn['work_hrs']);

        // Track the printed name
        $nameTracker[] = $name;
    } else {
        $row--; // Decrement the row if the name has been printed before to overwrite the whitespace
    }

    // Check if the name has an associated notice with date and type
    if (!empty($rowIn['date']) && !empty($rowIn['type'])) {
        $noticeDate = date('Y-m-d', strtotime($rowIn['date']));
        $noticeType = $rowIn['type'];

        // Store the notice data in the noticeData array
        if (!isset($noticeData[$name][$noticeDate])) {
            $noticeData[$name][$noticeDate] = array(
                'type' => $noticeType
            );
        }

        // Set the values in Ti and To based on the notice type
        if ($noticeType == 'School Initiated Leave') {
            $timeinData[$name][$noticeDate]['timein'] = 'SIL';
            $timeinData[$name][$noticeDate]['timeout'] = 'SIL';
        } elseif ($noticeType == 'Sick Leave') {
            $timeinData[$name][$noticeDate]['timein'] = 'SL';
            $timeinData[$name][$noticeDate]['timeout'] = 'SL';
        } elseif ($noticeType == 'Absence without Leave') {
            $timeinData[$name][$noticeDate]['timein'] = 'ABW';
            $timeinData[$name][$noticeDate]['timeout'] = 'ABW';
        } elseif ($noticeType == 'Late (No Time in)') {
            $timeinData[$name][$noticeDate]['timein'] = 'L';
            $timeinData[$name][$noticeDate]['timeout'] = 'L';
        } elseif ($noticeType == 'Unidentified') {
            $timeinData[$name][$noticeDate]['timein'] = '?';
            $timeinData[$name][$noticeDate]['timeout'] = '?';
        } elseif ($noticeType == 'Planned Leave') {
            $timeinData[$name][$noticeDate]['timein'] = 'PL';
            $timeinData[$name][$noticeDate]['timeout'] = 'PL';
        } 

        // Add the notice date to the dates array if it doesn't exist
        if (!in_array($noticeDate, $dates)) {
            $dates[] = $noticeDate;
        }
    }

    $row++;
}

sort($dates);
// Set headers for merged date columns
$columnIndex = 5;
foreach ($dates as $date) {
    $empSheet->setCellValueByColumnAndRow($columnIndex, 1, $date);
    $empSheet->mergeCellsByColumnAndRow($columnIndex, 1, $columnIndex + 1, 1);
    $empSheet->setCellValueByColumnAndRow($columnIndex, 2, 'Ti');
    $empSheet->getStyleByColumnAndRow($columnIndex, 2)->getBorders()->getAllBorders()->setBorderStyle(Border::BORDER_THIN);
    $empSheet->setCellValueByColumnAndRow($columnIndex + 1, 2, 'To');
    $empSheet->getStyleByColumnAndRow($columnIndex + 1, 2)->getBorders()->getAllBorders()->setBorderStyle(Border::BORDER_THIN);
    

    // Rotate text up for the date cells
    $empSheet->getStyleByColumnAndRow($columnIndex, 1)->getAlignment()->setTextRotation(90);
    $empSheet->getStyleByColumnAndRow($columnIndex + 1, 1)->getAlignment()->setTextRotation(90);

    // Center the content in the date cells
    $empSheet->getStyleByColumnAndRow($columnIndex, 1)->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
    $empSheet->getStyleByColumnAndRow($columnIndex, 1)->getAlignment()->setVertical(Alignment::VERTICAL_CENTER);
    $empSheet->getStyleByColumnAndRow($columnIndex + 1, 1)->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
    $empSheet->getStyleByColumnAndRow($columnIndex + 1, 1)->getAlignment()->setVertical(Alignment::VERTICAL_CENTER);

    // Set border style for the date cells
    $empSheet->getStyleByColumnAndRow($columnIndex, 1)->getBorders()->getAllBorders()->setBorderStyle(Border::BORDER_THIN);
    $empSheet->getStyleByColumnAndRow($columnIndex + 1, 1)->getBorders()->getAllBorders()->setBorderStyle(Border::BORDER_THIN);

    $columnIndex += 2;
}

// Apply borders to the name, department, position, and schedule columns
$empSheet->getStyle('A3:D' . ($row - 1))->getBorders()->getAllBorders()->setBorderStyle(Border::BORDER_THIN);

// If there is time in data in the respective date columns, fill with green color
$row = 3;
foreach ($nameTracker as $name) {
    $columnIndex = 5;
    foreach ($dates as $date) {
        $timein = isset($timeinData[$name][$date]['timein']) ? $timeinData[$name][$date]['timein'] : '';
        $timeout = isset($timeinData[$name][$date]['timeout']) ? $timeinData[$name][$date]['timeout'] : '';

        // Check if the Ti value is "PL" and replace the cell value with "PL" instead of filling it with green color
        if ($timein == 'PL') {
            $empSheet->setCellValueByColumnAndRow($columnIndex, $row, 'PL');
        } elseif ($timein == 'SIL') {
            $empSheet->setCellValueByColumnAndRow($columnIndex, $row, 'SIL');
        } elseif ($timein == 'SL') {
            $empSheet->setCellValueByColumnAndRow($columnIndex, $row, 'SL');
        } elseif ($timein == 'ABW') {
            $empSheet->getStyleByColumnAndRow($columnIndex, $row)->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setRGB('FF0000');
        } elseif ($timein == 'L') {
            $empSheet->setCellValueByColumnAndRow($columnIndex, $row, 'L');
        } elseif ($timein == '?') {
            $empSheet->getStyleByColumnAndRow($columnIndex, $row)->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setRGB('00FF00');
        } else {
            // Set the fill color of the cell in the Ti column to green if time in is not empty
            if (!empty($timein)) {
                // Get the time portion from the timein value
                $time = strtotime($timein);
                $timeFormatted = date('H:i', $time);
        
                // Check if the time is past 8:01
                if ($timeFormatted >= '08:01') {
                    $empSheet->setCellValueByColumnAndRow($columnIndex, $row, 'L');
                } else {
                    $empSheet->getStyleByColumnAndRow($columnIndex, $row)->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setRGB('00FF00');
                }
            }
        }

        // Check if the To value is "PL" and replace the cell value with "PL" instead of filling it with green color
        if ($timeout == 'PL') {
            $empSheet->setCellValueByColumnAndRow($columnIndex + 1, $row, 'PL');
        } elseif ($timeout == 'SIL') {
            $empSheet->setCellValueByColumnAndRow($columnIndex + 1, $row, 'SIL');
        } elseif ($timeout == 'SL') {
            $empSheet->setCellValueByColumnAndRow($columnIndex + 1, $row, 'SL');
        } elseif ($timeout == 'ABW') {
            $empSheet->getStyleByColumnAndRow($columnIndex + 1, $row)->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setRGB('FF0000');
        } elseif ($timeout == 'L') {
            $empSheet->getStyleByColumnAndRow($columnIndex + 1, $row)->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setRGB('00FF00');
        } elseif ($timeout == '?') {
            $empSheet->setCellValueByColumnAndRow($columnIndex + 1, $row, '?');
        } else {
            // Set the fill color of the cell in the To column to green if time out is not empty
            if (!empty($timeout)) {
                $empSheet->getStyleByColumnAndRow($columnIndex + 1, $row)->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setRGB('00FF00');
            }
        }

        // Center the content in the time in and time out cells
        $empSheet->getStyleByColumnAndRow($columnIndex, $row)->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
        $empSheet->getStyleByColumnAndRow($columnIndex, $row)->getAlignment()->setVertical(Alignment::VERTICAL_CENTER);
        $empSheet->getStyleByColumnAndRow($columnIndex + 1, $row)->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
        $empSheet->getStyleByColumnAndRow($columnIndex + 1, $row)->getAlignment()->setVertical(Alignment::VERTICAL_CENTER);

        // Set border style for the time in and time out cells
        $empSheet->getStyleByColumnAndRow($columnIndex, $row)->getBorders()->getAllBorders()->setBorderStyle(Border::BORDER_THIN);
        $empSheet->getStyleByColumnAndRow($columnIndex + 1, $row)->getBorders()->getAllBorders()->setBorderStyle(Border::BORDER_THIN);

        $columnIndex += 2;
    }
    $row++;
}


// Set the height of row A
$empSheet->getRowDimension(1)->setRowHeight(65);
// Auto-size the columns
foreach (range('A', $empSheet->getHighestColumn()) as $column) {
    $empSheet->getColumnDimension($column)->setAutoSize(true);
}



// Interns sheet
$internSheet = $spreadsheet->createSheet();
$internSheet->setTitle('Interns');

$timein_sql = "SELECT u.name, ii.department, ii.work_hrs, u.position, t.datetime AS timein, o.datetime AS timeout, n.type, n.date
                FROM users u
                LEFT JOIN int_info ii ON u.name = ii.name
                LEFT JOIN time_in t ON u.name = t.name
                LEFT JOIN time_out o ON u.name = o.name
                LEFT JOIN notices n ON u.name = n.name
                WHERE u.position = 'intern'
                ORDER BY CASE ii.department
                    WHEN 'IT' THEN 1
                    WHEN 'Marketing' THEN 2
                    WHEN 'HR' THEN 3
                    WHEN 'Accounting' THEN 4
                    WHEN 'Admin' THEN 5
                    ELSE 6
                END, t.datetime ASC";
$timein_result = mysqli_query($conn, $timein_sql);

$internSheet->setCellValue('A2', 'Name');
$internSheet->setCellValue('B2', 'Department');
$internSheet->setCellValue('C2', 'Position');
$internSheet->setCellValue('D2', 'Schedule');

// Apply borders to the headers
$internSheet->getStyle('A2:D2')->getBorders()->getAllBorders()->setBorderStyle(Border::BORDER_THIN);

$row = 3;

$nameTracker = array(); // Track names
$timeinData = array(); // Store time in data for each name
$noticeData = array(); // Store notice data for each name and date

while ($rowIn = mysqli_fetch_assoc($timein_result)) {
    $name = $rowIn['name'];
    $date = $rowIn['timein'] ? date('Y-m-d', strtotime($rowIn['timein'])) : '';
    $timein = $rowIn['timein'] ? date('H:i:s', strtotime($rowIn['timein'])) : '';
    $timeout = $rowIn['timeout'] ? date('H:i:s', strtotime($rowIn['timeout'])) : '';

    // Check if date exists in the dates array
    if (!in_array($date, $dates) && $date !== '') {
        $dates[] = $date;
    }

    // Store time in and time out data for each name and date
    $timeinData[$name][$date] = array(
        'timein' => $timein,
        'timeout' => $timeout
    );

    // Print the name only if it hasn't been printed before
    if (!in_array($name, $nameTracker)) {
        $internSheet->setCellValue('A' . $row, $name);
        $internSheet->setCellValue('B' . $row, $rowIn['department']);
        $internSheet->setCellValue('C' . $row, $rowIn['position']);
        $internSheet->setCellValue('D' . $row, $rowIn['work_hrs']);

        // Track the printed name
        $nameTracker[] = $name;
    } else {
        $row--; // Decrement the row if the name has been printed before to overwrite the whitespace
    }

    // Check if the name has an associated notice with date and type
    if (!empty($rowIn['date']) && !empty($rowIn['type'])) {
        $noticeDate = date('Y-m-d', strtotime($rowIn['date']));
        $noticeType = $rowIn['type'];

        // Store the notice data in the noticeData array
        if (!isset($noticeData[$name][$noticeDate])) {
            $noticeData[$name][$noticeDate] = array(
                'type' => $noticeType
            );
        }

        // Set the values in Ti and To based on the notice type
        if ($noticeType == 'School Initiated Leave') {
            $timeinData[$name][$noticeDate]['timein'] = 'SIL';
            $timeinData[$name][$noticeDate]['timeout'] = 'SIL';
        } elseif ($noticeType == 'Sick Leave') {
            $timeinData[$name][$noticeDate]['timein'] = 'SL';
            $timeinData[$name][$noticeDate]['timeout'] = 'SL';
        } elseif ($noticeType == 'Absence without Leave') {
            $timeinData[$name][$noticeDate]['timein'] = 'ABW';
            $timeinData[$name][$noticeDate]['timeout'] = 'ABW';
        } elseif ($noticeType == 'Late (No Time in)') {
            $timeinData[$name][$noticeDate]['timein'] = 'L';
            $timeinData[$name][$noticeDate]['timeout'] = 'L';
        } elseif ($noticeType == 'Unidentified') {
            $timeinData[$name][$noticeDate]['timein'] = '?';
            $timeinData[$name][$noticeDate]['timeout'] = '?';
        } elseif ($noticeType == 'Planned Leave') {
            $timeinData[$name][$noticeDate]['timein'] = 'PL';
            $timeinData[$name][$noticeDate]['timeout'] = 'PL';
        } 

        // Add the notice date to the dates array if it doesn't exist
        if (!in_array($noticeDate, $dates)) {
            $dates[] = $noticeDate;
        }
    }

    $row++;
}

sort($dates);
// Set headers for merged date columns
$columnIndex = 5;
foreach ($dates as $date) {
    $internSheet->setCellValueByColumnAndRow($columnIndex, 1, $date);
    $internSheet->mergeCellsByColumnAndRow($columnIndex, 1, $columnIndex + 1, 1);
    $internSheet->setCellValueByColumnAndRow($columnIndex, 2, 'Ti');
    $internSheet->getStyleByColumnAndRow($columnIndex, 2)->getBorders()->getAllBorders()->setBorderStyle(Border::BORDER_THIN);
    $internSheet->setCellValueByColumnAndRow($columnIndex + 1, 2, 'To');
    $internSheet->getStyleByColumnAndRow($columnIndex + 1, 2)->getBorders()->getAllBorders()->setBorderStyle(Border::BORDER_THIN);
    

    // Rotate text up for the date cells
    $internSheet->getStyleByColumnAndRow($columnIndex, 1)->getAlignment()->setTextRotation(90);
    $internSheet->getStyleByColumnAndRow($columnIndex + 1, 1)->getAlignment()->setTextRotation(90);

    // Center the content in the date cells
    $internSheet->getStyleByColumnAndRow($columnIndex, 1)->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
    $internSheet->getStyleByColumnAndRow($columnIndex, 1)->getAlignment()->setVertical(Alignment::VERTICAL_CENTER);
    $internSheet->getStyleByColumnAndRow($columnIndex + 1, 1)->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
    $internSheet->getStyleByColumnAndRow($columnIndex + 1, 1)->getAlignment()->setVertical(Alignment::VERTICAL_CENTER);

    // Set border style for the date cells
    $internSheet->getStyleByColumnAndRow($columnIndex, 1)->getBorders()->getAllBorders()->setBorderStyle(Border::BORDER_THIN);
    $internSheet->getStyleByColumnAndRow($columnIndex + 1, 1)->getBorders()->getAllBorders()->setBorderStyle(Border::BORDER_THIN);

    $columnIndex += 2;
}

// Apply borders to the name, department, position, and schedule columns
$internSheet->getStyle('A3:D' . ($row - 1))->getBorders()->getAllBorders()->setBorderStyle(Border::BORDER_THIN);

// If there is time in data in the respective date columns, fill with green color
$row = 3;
foreach ($nameTracker as $name) {
    $columnIndex = 5;
    foreach ($dates as $date) {
        $timein = isset($timeinData[$name][$date]['timein']) ? $timeinData[$name][$date]['timein'] : '';
        $timeout = isset($timeinData[$name][$date]['timeout']) ? $timeinData[$name][$date]['timeout'] : '';

        // Check if the Ti value is "PL" and replace the cell value with "PL" instead of filling it with green color
        if ($timein == 'PL') {
            $internSheet->setCellValueByColumnAndRow($columnIndex, $row, 'PL');
        } elseif ($timein == 'SIL') {
            $internSheet->setCellValueByColumnAndRow($columnIndex, $row, 'SIL');
        } elseif ($timein == 'SL') {
            $internSheet->setCellValueByColumnAndRow($columnIndex, $row, 'SL');
        } elseif ($timein == 'ABW') {
            $internSheet->getStyleByColumnAndRow($columnIndex, $row)->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setRGB('FF0000');
        } elseif ($timein == 'L') {
            $internSheet->setCellValueByColumnAndRow($columnIndex, $row, 'L');
        } elseif ($timein == '?') {
            $internSheet->getStyleByColumnAndRow($columnIndex, $row)->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setRGB('00FF00');
        } else {
            // Set the fill color of the cell in the Ti column to green if time in is not empty
            if (!empty($timein)) {
                // Get the time portion from the timein value
                $time = strtotime($timein);
                $timeFormatted = date('H:i', $time);
        
                // Check if the time is past 8:01
                if ($timeFormatted >= '08:01') {
                    $internSheet->setCellValueByColumnAndRow($columnIndex, $row, 'L');
                } else {
                    $internSheet->getStyleByColumnAndRow($columnIndex, $row)->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setRGB('00FF00');
                }
            }
        }

        // Check if the To value is "PL" and replace the cell value with "PL" instead of filling it with green color
        if ($timeout == 'PL') {
            $internSheet->setCellValueByColumnAndRow($columnIndex + 1, $row, 'PL');
        } elseif ($timeout == 'SIL') {
            $internSheet->setCellValueByColumnAndRow($columnIndex + 1, $row, 'SIL');
        } elseif ($timeout == 'SL') {
            $internSheet->setCellValueByColumnAndRow($columnIndex + 1, $row, 'SL');
        } elseif ($timeout == 'ABW') {
            $internSheet->getStyleByColumnAndRow($columnIndex + 1, $row)->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setRGB('FF0000');
        } elseif ($timeout == 'L') {
            $internSheet->getStyleByColumnAndRow($columnIndex + 1, $row)->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setRGB('00FF00');
        } elseif ($timeout == '?') {
            $internSheet->setCellValueByColumnAndRow($columnIndex + 1, $row, '?');
        } else {
            // Set the fill color of the cell in the To column to green if time out is not empty
            if (!empty($timeout)) {
                $internSheet->getStyleByColumnAndRow($columnIndex + 1, $row)->getFill()->setFillType(Fill::FILL_SOLID)->getStartColor()->setRGB('00FF00');
            }
        }

        // Center the content in the time in and time out cells
        $internSheet->getStyleByColumnAndRow($columnIndex, $row)->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
        $internSheet->getStyleByColumnAndRow($columnIndex, $row)->getAlignment()->setVertical(Alignment::VERTICAL_CENTER);
        $internSheet->getStyleByColumnAndRow($columnIndex + 1, $row)->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
        $internSheet->getStyleByColumnAndRow($columnIndex + 1, $row)->getAlignment()->setVertical(Alignment::VERTICAL_CENTER);

        // Set border style for the time in and time out cells
        $internSheet->getStyleByColumnAndRow($columnIndex, $row)->getBorders()->getAllBorders()->setBorderStyle(Border::BORDER_THIN);
        $internSheet->getStyleByColumnAndRow($columnIndex + 1, $row)->getBorders()->getAllBorders()->setBorderStyle(Border::BORDER_THIN);

        $columnIndex += 2;
    }
    $row++;
}


// Set the height of row A
$internSheet->getRowDimension(1)->setRowHeight(65);
// Auto-size the columns
foreach (range('A', $internSheet->getHighestColumn()) as $column) {
    $internSheet->getColumnDimension($column)->setAutoSize(true);
}


header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment;filename="Summary View Export.xlsx"');
header('Cache-Control: max-age=0');

$writer = new Xlsx($spreadsheet);
$writer->save('php://output');
?>