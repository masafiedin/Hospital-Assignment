<?php
include('connect.php');

$sql = "SELECT id, name FROM users WHERE type=3";
$result = $conn->query($sql);

$user_data = array();
if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    $user_data[] = array("id" => $row["id"], "name" => $row["name"]);
  }
  echo json_encode($user_data);
} else {
  echo "0 results";
}

?>
