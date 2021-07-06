<?php

define("DB_SERVERNAME", "localhost");
define("DB_USERNAME", "root");
define("DB_PASSWORD", "root");
define("DB_NAME", "db-university");
define("DB_PORT", "8889");

$connection = new mysqli(DB_SERVERNAME, DB_USERNAME, DB_PASSWORD, DB_NAME, DB_PORT);

// var_dump($connection);

if ($connection && $connection->connect_error) {
    echo "Connection failed: " . $connection->connect_error;
}

$statement = $connection->prepare("INSERT INTO `students` (`id`,`degree_id`,`name`, `surname`,`date_of_birth`,`fiscal_code`,`enrolment_date`,`registration_number`,`email`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
$statement->bind_param("iisssssss", $id, $degree_id, $name, $surname, $date_of_birth, $fiscal_code, $enrolment_date, $registration_number, $email);
$id = 5001;
$degree_id = 50;
$name = "Simone";
$surname = "Casiraghi";
$date_of_birth = "1995-07-30";
$fiscal_code = "QPXVYW51Z02T877B";
$enrolment_date = "2020-07-23";
$registration_number = "623737";
$email = "simone@example.it";
$statement->execute();

$results = $connection->query("SELECT * FROM `students` WHERE students.surname = \"Casiraghi\" ;");
if ($results && $results->num_rows > 0) {
      var_dump($results);
  while ($row = $results->fetch_assoc()) {
      var_dump($row);
  }
} elseif ($results) {
      echo "0 Results";
} else {
      echo "Query Error";
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DB-UNIVERSITY</title>
</head>
<body>

    
</body>
</html>