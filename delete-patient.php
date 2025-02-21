<?php

    include "db-connection.php";

    // Get the patient id from the URL
    if($_SERVER['REQUEST_METHOD'] == 'GET') {
        $patient_id = $_GET['id'];

        // Delete the patient from the database
        $sql = "DELETE FROM patients WHERE patient_id = $patient_id";

        if ($conn->query($sql) === TRUE) {
            echo "<script>alert('Patient deleted successfully');</script>";
        } else {
            echo "<script>alert('Error Deleting Record ' ". $conn->error . ");</script>";
        }

        // Redirect to the patient list page
        header("Location: patient_list.php");
        exit();

    }


?>