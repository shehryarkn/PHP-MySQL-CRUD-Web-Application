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
$doctor->name = $_POST['name'];
$doctor->email = $_POST['email'];
$doctor->password = base64_encode($_POST['password']);
$doctor->phone = $_POST['phone'];
$doctor->gender = $_POST['gender'];
$doctor->specialist = $_POST['specialist'];
 
// create the doctor
if($doctor->update()){
    $doctor_arr=array(
        "status" => true,
        "message" => "Successfully Updated!"
    );
}
else{
    $doctor_arr=array(
        "status" => false,
        "message" => "Email already exists!"
    );
}
print_r(json_encode($doctor_arr));
?>