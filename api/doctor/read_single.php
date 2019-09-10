<?php
// include database and object files
include_once '../config/database.php';
include_once '../objects/doctor.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare doctor object
$doctor = new Doctor($db);

// set ID property of doctor to be edited
$doctor->id = isset($_GET['id']) ? $_GET['id'] : die();

// read the details of doctor to be edited
$stmt = $doctor->read_single();

if($stmt->rowCount() > 0){
    // get retrieved row
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    // create array
    $doctor_arr=array(
        "id" => $row['id'],
        "name" => $row['name'],
        "email" => $row['email'],
        "password" => $row['password'],
        "phone" => $row['phone'],
        "gender" => $row['gender'],
        "specialist" => $row['specialist'],
        "created" => $row['created']
    );
}
// make it json format
print_r(json_encode($doctor_arr));
?>