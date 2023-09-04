<?php
include "connects.php";
require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;

$spreadsheet = new Spreadsheet();

// Retrieve data from query parameters
$start_date = $_GET['start_date'];
$end_date = $_GET['end_date'];
$name = $_GET['name'];
$department = $_GET['department'];
$position = $_GET['position'];

// Employees sheet
$sheet = $spreadsheet->getActiveSheet();
$sheet->setTitle('Employees');

// $timein_sql = "SELECT u.name, o.tasks, COALESCE(ei.department, ii.department) AS department, COALESCE(ei.work_hrs, ii.work_hrs) AS work_hrs, u.position, t.datetime AS timein, o.datetime AS timeout, n.type, n.date
// FROM users u
// LEFT JOIN emp_info ei ON u.name = ei.name AND u.position = 'Employee'
// LEFT JOIN int_info ii ON u.name = ii.name AND u.position = 'Intern'
// LEFT JOIN time_in t ON u.name = t.name
// LEFT JOIN time_out o ON u.name = o.name
// LEFT JOIN notices n ON u.name = n.name
// WHERE u.name = '$name'
// ORDER BY t.datetime ASC";

$timein_sql = "SELECT u.name, t.datetime AS timein, o.datetime AS timeout, o.tasks
FROM users u
JOIN time_in t ON u.name = t.name
JOIN time_out o on u.name = o.name
WHERE u.name = '$name'
AND DATE(t.datetime) = DATE(o.datetime)
ORDER BY t.datetime ASC";

$data = mysqli_query($conn, $timein_sql);

// Headers
$sheet->setCellValue('A2', 'Name');
$sheet->setCellValue('A3', 'Department');
$sheet->setCellValue('A4', 'Position');

$sheet->setCellValue('B6', 'Date');
$sheet->setCellValue('C6', 'Time In');
$sheet->setCellValue('D6', 'Time Out');
$sheet->setCellValue('E6', 'Activities Done');

// padding
$sheet->getColumnDimension('A')->setAutoSize(true);
$sheet->getColumnDimension('B')->setAutoSize(true);

// align
$sheet->getStyle('B6')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
$sheet->getStyle('C6')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
$sheet->getStyle('D6')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
$sheet->getStyle('E6')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);

// Data
$sheet->setCellValue('B2', $name);
$sheet->setCellValue('B3', $department);
$sheet->setCellValue('B4', $position);

$styleArray = [
    'borders' => [
        'outline' => [
            'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
        ],
    ],
];

// add border to headers
$sheet->getStyle('B6')->applyFromArray($styleArray);
$sheet->getStyle('C6')->applyFromArray($styleArray);
$sheet->getStyle('D6')->applyFromArray($styleArray);
$sheet->getStyle('E6')->applyFromArray($styleArray);

// Loop through the data and set values to cells
$row = 7; // Start from row 2 (below the header row)
foreach ($data as $rowValues) {
    $col = 'B'; // Start from column A
    foreach ($rowValues as $value) {
        if($col == 'B'){

        }else if($col == 'C'){
            $dateTime = new DateTime($value);
            $time = $dateTime->format('H:i');
            $date = $dateTime->format('Y/m/d');

            $sheet->setCellValue('B' . $row, $date);
            $sheet->getColumnDimension('B')->setAutoSize(true);
            $sheet->getStyle('B' . $row)->applyFromArray($styleArray);

            $sheet->setCellValue($col . $row, $time);
        }
        else if($col == 'D'){
            $dateTime = new DateTime($value);
            $time = $dateTime->format('H:i:s');
            $sheet->setCellValue($col . $row, $time);
        }else{
            $sheet->setCellValue($col . $row, $value);
            
        }

        $sheet->getColumnDimension($col)->setAutoSize(true);
        $sheet->getStyle($col . $row)->applyFromArray($styleArray);
        $sheet->getStyle($col . $row)->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
        $col++; // Move to the next column (B, C, ...)
    }
    $row++; // Move to the next row
}

header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment;filename="Filtered Employee Attendance Record.xlsx"');
header('Cache-Control: max-age=0');

$writer = new Xlsx($spreadsheet);
$writer->save('php://output');
?>
