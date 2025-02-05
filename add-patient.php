<?php

    include "db-connection.php";

?>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Patient</title>
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
            <a class="patient-list text-white mr-3 font-weight-bold" href="patient-list.php">Patient List</a>
            <a class="btn btn-danger" href="logout.php">Log out</a>
        </div>

    </nav>
    

    



      <div class="container mt-4">
        <div class="text-center mb-4">
            <h2 class="text-success">Patient Entry Form</h2>
        </div>

            <div class="card-body">
                <form action="add-patient.php" method="POST" enctype="multipart/form-data">

                
                    <div class="card mb-3">
                        <div class="card-header bg-success text-white">Patient Information</div>
                        <div class="card-body">
                
                            <!-- Full Name -->
                            <div class="form-group">
                                <label for="firstName">First Name</label>
                                <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter patient's first name" required>
                            </div>

                            <div class="form-group">
                                <label for="lasttName">Last Name</label>
                                <input type="text" class="form-control" id="lasttName" name="lasttName" placeholder="Enter patient's last name" required>
                            </div>

                            <!-- Age -->
                            <div class="form-group">
                                <label for="age">Age</label>
                                <input type="number" class="form-control" id="age" name="age" placeholder="Enter patient's age" required>
                            </div>

                            <!-- Gender -->
                            <div class="form-group">
                                <label for="gender">Gender</label>
                                <select class="form-control" id="gender" name="gender" required>
                                    <option value="">Select Gender</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>

                            <!-- Contact Number -->
                            <div class="form-group">
                                <label for="contact">Contact Information</label>
                                <input type="text" class="form-control" id="contact" name="contact" placeholder="Enter contact information" required>
                            </div>

                            <!-- Address -->
                            <div class="form-group">
                                <label for="address">Address</label>
                                <textarea class="form-control" id="address" name="address" rows="3" placeholder="Enter patient's address" required></textarea>
                            </div>

                            <!-- Address -->
                            <div class="form-group">
                                <label for="last-visit">Last Visit</label>
                                <input type="date" class="form-control" id="last-visit" name="last-visit" rows="3" placeholder="Enter patient's last visit date" required></input>
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
                                <textarea class="form-control" id="symptoms" name="symptoms" rows="3" placeholder="Describe the symptoms"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="medicalHistory">Medical History</label>
                                <textarea class="form-control" id="medicalHistory" name="medical_history" rows="3" placeholder="Enter medical history"></textarea>
                            </div>
                        </div>
                    </div>

                    <!-- Objective Section -->
                    <div class="card mb-3">
                        <div class="card-header bg-success text-white">Objective</div>
                        <div class="card-body">
                            <div class="form-group">
                                <label for="bloodPressure">Blood Pressure</label>
                                <input type="text" class="form-control" id="bloodPressure" name="blood_pressure" placeholder="e.g., 120/80">
                            </div>
                            <div class="form-group">
                                <label for="heartRate">Heart Rate (bpm)</label>
                                <input type="number" class="form-control" id="heartRate" name="heart_rate" placeholder="e.g., 75">
                            </div>
                            <div class="form-group">
                                <label for="physicalExam">Physical Exam Notes</label>
                                <textarea class="form-control" id="physicalExam" name="physical_exam" rows="3" placeholder="Notes from the physical exam"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="fileUpload">Upload Medical Reports</label>
                                <input type="file" class="form-control-file" id="fileUpload" name="medical_file">
                            </div>
                        </div>
                    </div>

                    <!-- Assessment Section -->
                    <div class="card mb-3">
                        <div class="card-header bg-success text-white">Assessment</div>
                        <div class="card-body">
                            <div class="form-group">
                                <label for="diagnosis">Diagnosis Summary</label>
                                <textarea class="form-control" id="diagnosis" name="diagnosis_summary" rows="3" placeholder="Enter diagnosis details"></textarea>
                            </div>
                        </div>
                    </div>

                    <!-- Plan Section -->
                    <div class="card mb-3">
                        <div class="card-header bg-success text-white">Plan</div>
                        <div class="card-body">
                            <div class="form-group">
                                <label for="treatmentPlan">Treatment Plan</label>
                                <textarea class="form-control" id="treatmentPlan" name="treatment_plan" rows="3" placeholder="Describe the treatment plan"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="followUp">Follow-Up Instructions</label>
                                <textarea class="form-control" id="followUp" name="follow_up_instructions" rows="3" placeholder="Follow-up details and recommendations"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="appointment">Appointment Scheduling</label>
                                <input type="datetime-local" class="form-control" id="appointment" name="appointment_date">
                            </div>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit" class="btn btn-primary btn-block">Save</button>

                </form>
            </div>
        </div>

    </div>



</body>

</html>


<?php

    if($_SERVER['REQUEST_METHOD'] == 'POST'){

        // Patient's Information
        $firstName = htmlspecialchars($_POST['firstName']);
        $lastName = htmlspecialchars($_POST['lastName']);
        $age = htmlspecialchars($_POST['age']);
        $gender = $_POST['gender'];
        $contact = htmlspecialchars($_POST['contact']);
        $address = htmlspecialchars($_POST['address']);

        //Soap Entry
        

    }



?>