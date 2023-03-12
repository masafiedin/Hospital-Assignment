<?php
include('connect.php');

$dept_id = $_GET['dept_id'];

$sql = "SELECT id, number FROM rooms WHERE department_id=$dept_id";
$result = $conn->query($sql);

$room_data = array();
if ($result->num_rows > 0) {
  while($row = $result->fetch_assoc()) {
    $room = array("id" => $row["id"], "number" => $row["number"]);
    array_push($room_data, $room);
  }
} else {
  echo "0 results";
}
$conn->close();

echo json_encode($room_data);
?>
