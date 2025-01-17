<?php
    session_start();
    include('assets/inc/config.php');//get configuration file
    if(isset($_POST['u_login']))
    {
        $u_name = $_POST['u_name'];
        //$doc_email = $_POST['doc_ea']
        $u_password = sha1(md5($_POST['u_password']));//double encrypt to increase security
        $stmt=$mysqli->prepare("SELECT u_name, u_password, u_id FROM users WHERE  u_name=? AND u_password=? ");//sql to log in user
        $stmt->bind_param('ss', $u_name, $u_password);//bind fetched parameters
        $stmt->execute();//execute bind
        $stmt -> bind_result($u_name, $u_password ,$u_id);//bind result
        $rs=$stmt->fetch();
        $_SESSION['u_id'] = $u_id;
        $_SESSION['u_name'] = $u_name;//Assign session to doc_number id
        //$uip=$_SERVER['REMOTE_ADDR'];
        //$ldate=date('d/m/Y h:i:s', time());
        if($rs)
            {//if its sucessfull
                header("location:users_dashboard.php");
            }

        else
            {
            #echo "<script>alert('Access Denied Please Check Your Credentials');</script>";
                $err = "Access Denied Please Check Your Credentials";
            }
    }
?>





<!DOCTYPE html>
<html lang="en">
<head>
  



  <meta charset="utf-8" />
    <title>Hospital Support System -A Super Responsive Information System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="" name="description" />
    <meta content="" name="MartDevelopers" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">
    
    <!-- App css -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/app.min.css" rel="stylesheet" type="text/css" />
    <!--Load Sweet Alert Javascript-->

    <script src="assets/js/swal.js"></script>
    <!--Inject SWAL-->
    <?php if(isset($success)) {?>
    <!--This code for injecting an alert-->
    <script>
    setTimeout(function() {
            swal("Success", "<?php echo $success;?>", "success");
        },
        100);
    </script>

    <?php } ?>

    <?php if(isset($err)) {?>
    <!--This code for injecting an alert-->
    <script>
    setTimeout(function() {
            swal("Failed", "<?php echo $err;?>", "Failed");
        },
        100);
    </script>

    <?php } ?>
</head>



<body class="authentication-bg authentication-bg-pattern">
    
    <div class="account-pages mt-5 mb-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6 col-xl-5">
                    <div class="card bg-pattern">

                        <div class="card-body p-4">

                            <div class="text-center w-75 m-auto">
                                <a href="index.php">
                                    <span><img src="assets/img/hss-main-logo.png" alt="" height="150"></span>
                                </a>
                                <p class="text-muted mb-4 mt-3">Enter your Name and password to access users panel.</p>
                            </div>

                            <form method='post'>

                                <div class="form-group mb-3">
                                    <label for="uname">User Name</label>
                                    <input class="form-control" name="u_name" type="text" id="uname" required="" placeholder="Enter your User Name">
                                </div>

                                <div class="form-group mb-3">
                                    <label for="password">Password</label>
                                    <input class="form-control" name="u_password" type="password" required="" id="password" placeholder="Enter your password">
                                </div>

                                <div class="form-group mb-0 text-center">
                                    <button class="btn btn-primary btn-block" name="u_login" type="submit">  Log In </button>
                                </div>
                                <div class="text-center">
                                  <p>Dont have an account? <a href="register_users.php">Register</a></p>
                                </div>

                            </form>
                            
                            

                        </div> <!-- end card-body -->
                    </div>
                    <!-- end card -->

                    <div class="row mt-3">
                        <div class="col-12 text-center">
                            <p> <a href="admin_pwd_reset.php" class="text-white-50 ml-1">Forgot your password?</a></p>
                            <!-- <p class="text-white-50">Don't have an account? <a href="admin_register.php" class="text-white ml-1"><b>Sign Up</b></a></p>-->
                        </div> <!-- end col -->
                    </div>
                    <!-- end row -->

                </div> <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </div>
    <!-- end page -->

   
    <?php include ("assets/inc/footer1.php");?>

    <!-- Vendor js -->
    <script src="assets/js/vendor.min.js"></script>

    <!-- App js -->
    <script src="assets/js/app.min.js"></script>

</body>
</html>