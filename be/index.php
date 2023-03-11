<?php
include('connection.php');

$username = $_POST['username'];
$password = $_POST['password'];

$query = $mysqli->prepare('select id,username,password,first_name,last_name from users where username=?');
$query->bind_param('s', $username);
$query->execute();

$query->store_result();
$num_rows = $query->num_rows();
$query->bind_result($id, $username, $hashed_password, $first_name, $last_name);
$query->fetch();
$response = [];
if ($num_rows == 0) {
    $response['response'] = "user not found";
}
Sana Al Rayess5:59 PM
hayde ghalat
<?php

$servername = "localhost";
$username = "root";
$password = NULL;
$dbname = "healthcaredb";

$conn = new mysqli($servername, $username, $password, $dbname);
    
    $email = $_POST["email"];
    $password = $_POST["password"];
  
    $sql = "SELECT u.type, t.type as user_type FROM users u INNER JOIN user_types t ON u.type = t.id WHERE email='$email' AND password='$password'";
    $result = $conn->query($sql);
  
    // if the user exists, set session variables and redirect to appropriate