<?php

    include 'db-connection.php';

    // Start the session
    session_start();

    /* Check if the user is logged in
    if (!isset($_SESSION['user_id'])) {
        header("Location: login.php");
        exit();
    }
    */

    $searchInput = "";

    // Check if the search form is submitted
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $searchInput = $_POST['searchInput'];
    }
        
    

?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient List</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            background-color: #f8f9fa;
        }
        .table-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }
        .btn-success:hover {
            background-color: #218838;
        }
    </style>
</head>

<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-success">

        <a class="navbar-brand" href="daashboard.php">Healthcare System</a>

        <div class="ml-auto">
            <a class="patient-list text-white mr-3 font-weight-bold" href="patient-list.php">Patient List</a>
            <a class="btn btn-danger" href="logout.php">Log out</a>
        </div>

    </nav>

    <!-- Main Container -->
    <div class="container mt-4">
        
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2 class="text-success">Patient List</h2>
            <a href="add-patient.php" class="btn btn-success">+ Add New Patient</a>
        </div>

        <!-- Search Bar -->
        <div class="mb-3">

            <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
                <input type="text" id="searchInput" name="searchInput" class="form-control" placeholder="Search Patient...">
                <button type="submit" class="d-none"></button> <!-- Hidden submit button to enable form submission on Enter key press -->
            </form>
        </div>

        <!-- Patient Table -->
        <div class="table-container">
            <table class="table table-bordered table-hover">
                <thead class="thead-light">
                    <tr>
                        <th>Patient ID</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Contact</th>
                        <th>Last Visit</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="patientTable">
                    <?php


                        if(!empty($searchInput)) {
                            $query = "SELECT * FROM patients WHERE first_name LIKE '%$searchInput%' OR last_name LIKE '%$searchInput%' OR contact_info LIKE '%$searchInput%'";
                        }else{
                            $query = "SELECT * FROM patients ORDER BY patient_id ASC";
                        }

                        $result = mysqli_query($conn, $query);
                        while ($row = mysqli_fetch_assoc($result)) {
                            echo "<tr>";
                            echo "<td>" . $row['patient_id'] . "</td>";
                            echo "<td>" . $row['first_name'] . " " .  $row['last_name'] . "</td>";
                            echo "<td>" . $row['age'] . "</td>";
                            echo "<td>" . $row['contact_info'] . "</td>";
                            echo "<td>" . $row['last_visit'] . "</td>";
                            echo "<td>
                                    <a href='view-patient.php?id=" . $row['patient_id'] . "' class='btn btn-info btn-sm'>View</a>
                                    <a href='edit-patient.php?id=" . $row['patient_id'] . "' class='btn btn-warning btn-sm'>Edit</a>
                                    <a href='delete-patient.php?id=" . $row['patient_id'] . "' class='btn btn-danger btn-sm' onclick='return confirm(\"Are you sure you want to delete this patient?\");'>Delete</a>
                                </td>";
                            echo "</tr>";
                        }
                        
                    ?>
                </tbody>
            </table>
        </div>
    </div>
  

</body>
</html>
