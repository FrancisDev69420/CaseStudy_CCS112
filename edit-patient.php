<?php

    include "db-connection.php";

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

    if($_SERVER['REQUEST_METHOD'] == 'POST') {

        $patient_id = $_GET['id'];
        
        // Patient's Information
        $firstName = htmlspecialchars($_POST['firstName']);
        $lastName = htmlspecialchars($_POST['lastName']);
        $age = htmlspecialchars($_POST['age']);
        $gender = $_POST['gender'];
        $contact = htmlspecialchars($_POST['contact']);
        $address = htmlspecialchars($_POST['address']);
        $lastVisit = $_POST['last_visit'];

        // SOAP Entry
        $symptoms = htmlspecialchars($_POST['symptoms']);
        $medicalHistory = htmlspecialchars($_POST['medical_history']);
        $bloodPressure = htmlspecialchars($_POST['blood_pressure']);
        $heartRate = htmlspecialchars($_POST['heart_rate']);
        $physicalExam = htmlspecialchars($_POST['physical_exam']);
        $diagnosisSummary = htmlspecialchars($_POST['diagnosis_summary']);
        $treatmentPlan = htmlspecialchars($_POST['treatment_plan']);
        $followUpInstructions = htmlspecialchars($_POST['follow_up_instructions']);
        $appointmentDate = $_POST['appointment_date'];

        $patientFolder = preg_replace('/[^A-Za-z0-9_\-]/', '_', $firstName . "_" . $lastName); // Replace special characters with "_"
        $targetDir = "uploads/" . $patientFolder . "/";

        // Create the directory if it doesn't exist
        if (!file_exists($targetDir)) {
            mkdir($targetDir, 0777, true); // true enables recursive directory creation
        }

        // Handle file upload
        $medicalFile = $_FILES['medical_file']['name'];
        $targetFile = $targetDir . basename($medicalFile);
        move_uploaded_file($_FILES['medical_file']['tmp_name'], $targetFile);

        // Update patient data
        // Insert patient data into the database
        $sql = "UPDATE patients 
            SET first_name = ?, last_name = ?, age = ?, gender = ?, contact_info = ?, address = ?, last_visit = ? 
            WHERE patient_id = ?";

        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssissssi", $firstName, $lastName, $age, $gender, $contact, $address, $lastVisit, $patient_id);

        if($stmt->execute()) {
            
            // Update SOAP data
            $sqlSoap = "UPDATE soap_notes 
                SET symptoms = ?, medical_history = ?, blood_pressure = ?, heart_rate = ?, physical_exam_notes = ?, diagnosis_summary = ?, treatment_plan = ?, follow_up_instructions = ?, appointment_date = ?, file_path = ? 
                WHERE patient_id = ?";

            $stmtSoap = $conn->prepare($sqlSoap);
            $stmtSoap->bind_param("ssssssssssi", $symptoms, $medicalHistory, $bloodPressure, $heartRate, $physicalExam, $diagnosisSummary, $treatmentPlan, $followUpInstructions, $appointmentDate, $targetFile, $patient_id);

            if($stmtSoap->execute()) {
                echo "<script>alert('Patient data updated successfully'); window.location='patient_list.php';</script>";
                exit();
            } else {
                echo "<script>alert('Error updating SOAP data');</script>";
            }

        } else {
            echo "<script>alert('Error updating patient data');</script>";

        } 

        // Close patient statement and database connection
        $stmt->close();
        $conn->close();

    }


?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Patient</title>
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

        <a class="navbar-brand" href="daashboard.php">Healthcare System</a>

        <div class="ml-auto">
            <a class="patient-list text-white mr-3 font-weight-bold" href="patient_list.php">Patient List</a>
            <a class="btn btn-danger" href="logout.php">Log out</a>
        </div>

    </nav>

    <div class="container mt-4">
        <div class="text-center mb-4">
            <h2 class="text-success">Patient Edit Form</h2>
        </div>

        <div class="card-body">
            <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']) . '?id=' . $patient_id; ?>" method="POST" enctype="multipart/form-data">

                <div class="card mb-3">
                    <div class="card-header bg-success text-white">Patient Information</div>
                    <div class="card-body">

                        <!-- Full Name -->
                        <div class="form-group">
                            <label for="firstName">First Name</label>
                            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter patient's first name" value="<?php echo htmlspecialchars($patient['first_name']); ?>" required>
                        </div>

                        <div class="form-group">
                            <label for="lastName">Last Name</label>
                            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Enter patient's last name" value="<?php echo htmlspecialchars($patient['last_name']); ?>" required>
                        </div>

                        <!-- Age -->
                        <div class="form-group">
                            <label for="age">Age</label>
                            <input type="number" class="form-control" id="age" name="age" placeholder="Enter patient's age" value="<?php echo htmlspecialchars($patient['age']); ?>" required>
                        </div>

                        <!-- Gender -->
                        <div class="form-group">
                            <label for="gender">Gender</label>
                            <select class="form-control" id="gender" name="gender" required>
                                <option value="">Select Gender</option>
                                <option value="Male" <?php if ($patient['gender'] == 'Male') echo 'selected'; ?>>Male</option>
                                <option value="Female" <?php if ($patient['gender'] == 'Female') echo 'selected'; ?>>Female</option>
                                <option value="Other" <?php if ($patient['gender'] == 'Other') echo 'selected'; ?>>Other</option>
                            </select>
                        </div>

                        <!-- Contact Number -->
                        <div class="form-group">
                            <label for="contact">Contact Information</label>
                            <input type="text" class="form-control" id="contact" name="contact" placeholder="Enter contact information" value="<?php echo htmlspecialchars($patient['contact_info']); ?>" required>
                        </div>

                        <!-- Address -->
                        <div class="form-group">
                            <label for="address">Address</label>
                            <textarea class="form-control" id="address" name="address" rows="3" placeholder="Enter patient's address" required><?php echo htmlspecialchars($patient['address']); ?></textarea>
                        </div>

                        <!-- Last Visit -->
                        <div class="form-group">
                            <label for="last-visit">Last Visit</label>
                            <input type="date" class="form-control" id="last-visit" name="last_visit" value="<?php echo htmlspecialchars($patient['last_visit']); ?>" required>
                        </div>

                    </div>
                </div>

                <!-- For SOAP -->
                <!-- Subjective Section -->
                <div class="card mb-3">
                    <div class="card-header bg-success text-white">Subjective</div>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="symptoms">Symptoms</label>
                            <textarea class="form-control" id="symptoms" name="symptoms" rows="3" placeholder="Describe the symptoms"><?php echo htmlspecialchars($soap['symptoms']); ?></textarea>
                        </div>
                        <div class="form-group">
                            <label for="medicalHistory">Medical History</label>
                            <textarea class="form-control" id="medicalHistory" name="medical_history" rows="3" placeholder="Enter medical history"><?php echo htmlspecialchars($soap['medical_history']); ?></textarea>
                        </div>
                    </div>
                </div>

                <!-- Objective Section -->
                <div class="card mb-3">
                    <div class="card-header bg-success text-white">Objective</div>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="bloodPressure">Blood Pressure</label>
                            <input type="text" class="form-control" id="bloodPressure" name="blood_pressure" placeholder="e.g., 120/80" value="<?php echo htmlspecialchars($soap['blood_pressure']); ?>">
                        </div>
                        <div class="form-group">
                            <label for="heartRate">Heart Rate (bpm)</label>
                            <input type="number" class="form-control" id="heartRate" name="heart_rate" placeholder="e.g., 75" value="<?php echo htmlspecialchars($soap['heart_rate']); ?>">
                        </div>
                        <div class="form-group">
                            <label for="physicalExam">Physical Exam Notes</label>
                            <textarea class="form-control" id="physicalExam" name="physical_exam" rows="3" placeholder="Notes from the physical exam"><?php echo htmlspecialchars($soap['physical_exam_notes']); ?></textarea>
                        </div>
                          <div class="form-group">
                            <label for="fileUpload">Upload Medical Reports</label>
                            <input type="file" class="form-control-file" id="fileUpload" name="medical_file">

                            <?php if (!empty($soap['file_path'])): ?>
                                <p>Current file: <a href="<?php echo htmlspecialchars($soap['file_path']); ?>" target="_blank"><?php echo basename($soap['file_path']); ?></a></p>
                            <?php endif; ?>

                        </div>
                    </div>
                </div>

                <!-- Assessment Section -->
                <div class="card mb-3">
                    <div class="card-header bg-success text-white">Assessment</div>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="diagnosis">Diagnosis Summary</label>
                            <textarea class="form-control" id="diagnosis" name="diagnosis_summary" rows="3" placeholder="Enter diagnosis details"><?php echo htmlspecialchars($soap['diagnosis_summary']); ?></textarea>
                        </div>
                    </div>
                </div>

                <!-- Plan Section -->
                <div class="card mb-3">
                    <div class="card-header bg-success text-white">Plan</div>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="treatmentPlan">Treatment Plan</label>
                            <textarea class="form-control" id="treatmentPlan" name="treatment_plan" rows="3" placeholder="Describe the treatment plan"><?php echo htmlspecialchars($soap['treatment_plan']); ?></textarea>
                        </div>
                        <div class="form-group">
                            <label for="followUp">Follow-Up Instructions</label>
                            <textarea class="form-control" id="followUp" name="follow_up_instructions" rows="3" placeholder="Follow-up details and recommendations"><?php echo htmlspecialchars($soap['follow_up_instructions']); ?></textarea>
                        </div>
                        <div class="form-group">
                            <label for="appointment">Appointment Scheduling</label>
                            <input type="datetime-local" class="form-control" id="appointment" name="appointment_date" value="<?php echo htmlspecialchars($soap['appointment_date']); ?>">
                        </div>
                    </div>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn btn-primary btn-block">Save</button>

            </form>
        </div>
    </div>

</body>

</html>

