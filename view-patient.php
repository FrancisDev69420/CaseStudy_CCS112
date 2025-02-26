<?php

    include "db-connection.php";

    // Start the session
        session_start();

    // Check if the user is logged in
    if (!isset($_SESSION['username'])) {
        header("Location: login.php");
        exit();
    }

    if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['id'])) {

        $patient_id = $_GET['id'];

        // Fetch patient data
        $sql = "SELECT * FROM patients WHERE patient_id = $patient_id";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $patient = $result->fetch_assoc();
        } else {
            echo "<script>alert('Patient not found');</script>";
            header("Location: patient_list.php");
            exit();
        }

        // Fetch SOAP data
        $sqlSoap = "SELECT * FROM soap_notes WHERE patient_id = $patient_id";
        $resultSoap = $conn->query($sqlSoap);

        if ($resultSoap->num_rows > 0) {
            $soap = $resultSoap->fetch_assoc();
        } else {
            echo "<script>alert('SOAP notes not found');</script>";
            header("Location: patient_list.php");
            exit();
        }
    }

?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Patient</title>
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
    </style>
</head>

<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-success">

        <a class="navbar-brand" href="dashboard.php">Healthcare System</a>

        <div class="ml-auto">
            <a class="patient-list text-white mr-3 font-weight-bold" href="patient_list.php">Patient List</a>
            <a class="btn btn-danger" href="logout.php">Log out</a>
        </div>

    </nav>

    <div class="container mt-4">
        <div class="text-center mb-4">
            <h2 class="text-success">Patient Details</h2>
        </div>

        <div class="card mb-3">
            <div class="card-header bg-success text-white">Patient Information</div>
            <div class="card-body">
                <p><strong>First Name:</strong> <?php echo htmlspecialchars($patient['first_name']); ?></p>
                <p><strong>Last Name:</strong> <?php echo htmlspecialchars($patient['last_name']); ?></p>
                <p><strong>Age:</strong> <?php echo htmlspecialchars($patient['age']); ?></p>
                <p><strong>Gender:</strong> <?php echo htmlspecialchars($patient['gender']); ?></p>
                <p><strong>Contact Information:</strong> <?php echo htmlspecialchars($patient['contact_info']); ?></p>
                <p><strong>Address:</strong> <?php echo htmlspecialchars($patient['address']); ?></p>
                <p><strong>Last Visit:</strong> <?php echo htmlspecialchars($patient['last_visit']); ?></p>
            </div>
        </div>

        <div class="card mb-3">
            <div class="card-header bg-success text-white">SOAP Notes</div>
            <div class="card-body">
                <h3>Subjective</h3>
                <p><strong>Symptoms:</strong> <?php echo htmlspecialchars($soap['symptoms']); ?></p>
                <p><strong>Medical History:</strong> <?php echo htmlspecialchars($soap['medical_history']); ?></p>

                <h3>Objective</h3>
                <p><strong>Blood Pressure:</strong> <?php echo htmlspecialchars($soap['blood_pressure']); ?></p>
                <p><strong>Heart Rate:</strong> <?php echo htmlspecialchars($soap['heart_rate']); ?></p>
                <p><strong>Physical Exam Notes:</strong> <?php echo htmlspecialchars($soap['physical_exam_notes']); ?></p>
                <?php if (!empty($soap['file_path'])): ?>
                    <p><strong>Medical Reports:</strong> <a href="<?php echo htmlspecialchars($soap['file_path']); ?>" target="_blank"><?php echo basename($soap['file_path']); ?></a></p>
                <?php endif; ?>

                <h3>Assessment</h3>
                <p><strong>Diagnosis Summary:</strong> <?php echo htmlspecialchars($soap['diagnosis_summary']); ?></p>

                <h3>Plan</h3>
                <p><strong>Treatment Plan:</strong> <?php echo htmlspecialchars($soap['treatment_plan']); ?></p>
                <p><strong>Follow-Up Instructions:</strong> <?php echo htmlspecialchars($soap['follow_up_instructions']); ?></p>
                <p><strong>Appointment Date:</strong> <?php echo htmlspecialchars($soap['appointment_date']); ?></p>
            </div>
        </div>

        <div class="text-center mb-5">
            <a href="edit-patient.php?id=<?php echo $patient_id; ?>" class="btn btn-primary">Edit Patient</a>
            <a href="patient_list.php" class="btn btn-secondary">Back to Patient List</a>
        </div>
    </div>


</body>

</html>