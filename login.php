

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }

        .login-container {
            max-width: 400px;
            margin: auto;
            padding: 40px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .login-header h2 {
            color: #28a745;
            font-weight: bold;
            text-align: center;
        }

        .btn-primary {
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-primary:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

    </style>
</head>

<body>

    <div class="container mt-5">
        <div class="login-container">
            <div class="login-header">
                <h2>Login</h2>
            </div>

            <form action="login.php" method="POST">

                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                </div>

                <button type="submit" class="btn btn-primary btn-block">Login</button>

            </form>

        </div>
    </div>

</body>

</html>

<?php
// PHP code for login (optional)
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    session_start();
    $_SESSION['username'] = $_POST['username'];

    // Connection to database
    include "db-connection.php";

    // Get user inputs
    $username = htmlspecialchars($_POST['username']);
    $password = htmlspecialchars($_POST['password']);

    // Check if username and password match
    $sql = "SELECT * FROM users WHERE username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        // $temp=$row['password_hash'];
        if (md5($password)===$row['password_hash']) {
            // User found and password verified, redirect to dashboard
            header("Location: dashboard.php");
        } else {
            echo "<script>alert('Invalid password. Please try again.');</script>";
            // echo "<script>console.log('$temp')</script>";
        }
    } else {
        echo "<script>alert('No user found with that username.');</script>";
    }

    $stmt->close();
    $conn->close();
}
//docJane
//password123 

//sample1
//securepass456 

//admin
//admin
?>
