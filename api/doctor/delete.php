<?php
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/doctor.php';

// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare doctor object
$doctor = new Doctor($db);
 
// set doctor property values
$doctor->id = $_POST['id'];
 
// remove the doctor
if($doctor->delete()){
    $doctor_arr=array(
        "status" => true,
        "message" => "Successfully Removed!"
    );
}
else{
    $doctor_arr=array(
        "status" => false,
        "message" => "Doctor Cannot be deleted. may be he's assigned to a patient!"
    );
}
print_r(json_encode($doctor_arr));
?>