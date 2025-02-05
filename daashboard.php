<?php

    include "db-connection.php";

?>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Healthcare Dashboard</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
   
    <style>
        body {
            background-color: #f8f9fa;
        }
        .dashboard-header h2 {
            color: #28a745;
            font-weight: bold;
        }
        .btn-primary {
            background-color: #28a745;
            border-color: #28a745;
        }
        .btn-primary:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
        .card-header {
            background-color: #28a745;
            color: white;
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
        
        <!-- Dashboard Header -->
        <div class="text-center dashboard-header mb-4">
            <h2>Healthcare Dashboard</h2>
        </div>

        <!-- Quick Access Buttons -->
        <div class="text-center mb-4">
            <a class="btn btn-primary mr-2" href="add-patient.php">Add New Patient Record</a>

            <!-- Search Form -->
            <form class="form-inline" action="search-results.php" method="GET">
                <input class="form-control mr-2" type="search" name="query" placeholder="Search patient..." required>
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>

        <!-- Recent Patients Section -->
        <div class="card">
            <div class="card-header">
                Recent Patient Records
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead class="thead-light">
                        <tr>
                            <th>Patient Name</th>
                            <th>Age</th>
                            <th>Last Visit Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                       
                    </tbody>
                </table>
            </div>
        </div>

    </div>

</body>
</html>
