<?php
include('connection.php');

$email = $_POST['email'];
$password = $_POST['password'];
$name = $_POST['name'];
$dob = $_POST['dob'];
$type = $_POST['type'];
$bloodtype = $_POST['bloodType'];
$usertype = $_POST['userType'];

$check_email = $mysqli->prepare('select email from users where email=?');
$check_email->bind_param('s', $email);
$check_email->execute();
$check_email->store_result();
$email_exists = $check_email->num_rows();

$hashed_password = password_hash($password, PASSWORD_BCRYPT);


if ($email_exists > 0 || $userType !=1) {
    $response['status'] = "failed";
} else {
    $query = $mysqli->prepare('insert into users(email,password,name,dob,type) values(?,?,?,?,?)');
    $query->bind_param('sssss', $email, $hashed_password, $name, $dob, $type);
    $query->execute();
    $response['status'] = "success";
}

echo json_encode($response);
