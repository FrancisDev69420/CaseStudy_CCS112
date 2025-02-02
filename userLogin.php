<?php
include("db-connection.php");
session_start();

if($_SERVER['REQUEST_METHOD']=='POST'){ 
    $username = $_POST['username'];
    $password = $_POST['password'];

    //Prepared Statement 
    $stmt = $conn->prepare("SELECT * FROM accounts WHERE username = ?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();
    //Checking if it return 1 result
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        //Verifying the password
        if (password_verify($password, password_hash($row['password'], PASSWORD_DEFAULT))) {
            if($row['role']=="admin"){
                $_SESSION['userID']=$row['acc_id'];
                header("Location: userDashboard.php");
                
                // echo '<script>alert("Unable to use admin account for regular user side")
                // window.location.href="userLogin.php"
                // </script>';
            }else if($row['role']=="user"){
                $_SESSION['userID']=$row['acc_id'];
                header("Location: userDashboard.php");
            }
            exit();
        } else {
            echo '<script>alert("Invalid Password")</script>';
        }
    } else {
        echo '<script>alert("Username not found.")</script>';
    }
    $stmt->close();
}


?>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Login</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }

            body {
                display: flex;
                height: 100vh;
            }

            .image-section {
                flex: 1;
            }
            .image-section img{
                height: 100%;
                width: 100%;
                object-fit: cover;
                object-position: center;
            }

            .form-section {
                flex: 1;
                background-color: #E1ACAC;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }

            .form-container {
                width: 500px;
                height: 500px;
                padding: 20px;
                background: white;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
                align-content: center;
            }

            .form-container h2 {
                margin-bottom: 20px;
                text-align: center;
                color: #333;
            }

            .form-group {
                margin-bottom: 15px;
            }

            .form-group label {
                display: block;
                margin-bottom: 5px;
                font-size: 14px;
                color: #555;
            }

            .form-group .inputField {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 14px;
            }

            .button-container {
                margin-top: 15px;
                text-align: center;
            }

            .submit-button,
            .signup-button {
                width: 100%;
                padding: 10px;
                margin-top: 10px;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
            }

            .submit-button {
                background-color: #b89294;
                color: white;
            }

            .submit-button:hover {
                background-color: #a37c82;
            }

            .signup-button {
                background-color: #f3f3f3;
                color: #333;
            }

            .signup-button:hover {
                background-color: #e0e0e0;
            }
        </style>
    </head>
    <body>
        <div class="image-section">
            <img src="https://i.ibb.co/gy3qzNT/Grilled-Cedar-Plank-Salmon-45-Minutes.jpg" alt="Grilled-Cedar-Plank-Salmon-45-Minutes" border="0">
        </div>
        <div class="form-section">
            <div class="form-container">
            <h2>User Login</h2>
            <form action="userLogin.php" method="POST">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input name="username" class="inputField" type="text" id="username" name="username" placeholder="Enter your username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input name="password" class="inputField" type="password" id="password" name="password" placeholder="Enter your password" required>
                    <div class="frame1" style="display: inline-flex; width: 100%; height: auto; left: 0; margin: 5px 5px 0px 0px;">
                        <input type="checkbox" id="togglePassword" style="margin-right: 5px;"><p>Show Password</p>
                    </div>
                </div>
                <button type="submit" class="submit-button">Login</button>
            </form>
            <div class="button-container">
                <button class="signup-button" onclick="location.href='signUp.php'">Sign Up</button>
            </div>
            </div>
        </div>
        <script> 
            const passwordField = document.getElementById('password'); 
            const togglePasswordCheckbox = document.getElementById('togglePassword'); 
            togglePasswordCheckbox.addEventListener('change', function () { 
                if (this.checked) { 
                    passwordField.type = 'text'; 
                } else { 
                    passwordField.type = 'password'; } 
            }); 
        </script>
    </body>
</html>
