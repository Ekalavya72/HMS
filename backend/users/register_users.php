<?php
	session_start();
	include('assets/inc/config.php');
		if(isset($_POST['register_users']))
		{
			$u_name=$_POST['u_name'];
			$u_email=$_POST['u_email'];
			$u_phone=$_POST['u_phone'];
      $u_password=sha1(md5($_POST['u_password']));
           
            //sql to insert captured values
			$query="insert into users (u_name, u_email, u_phone, u_password) values(?,?,?,?)";
			$stmt = $mysqli->prepare($query);
			$rc=$stmt->bind_param('ssss', $u_name, $u_email, $u_phone, $u_password);
			$stmt->execute();
			
			//Use Sweet Alerts Instead Of This Fucked Up Javascript Alerts
			// echo"<script>alert('Successfully Created Account Proceed To Log In ');</script>";
			 
			//declare a varible which will be passed to alert function
			if($stmt)
			{
				$success = "User Successful Register";
			}
			else {
				$err = "Please Try Again Or Try Later";
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
<body>
  



  <body class="authentication-bg authentication-bg-pattern">
    
    <div class="account-pages mt-3 mb-3">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6 col-xl-5">
                    <div class="card bg-pattern">

                        <div class="card-body p-3">

                            <div class="text-center w-75 m-auto">
                                <!-- <a href="index.php">
                                    <span><img src="assets/images/logo-dark.png" alt="" height="22"></span>
                                </a> -->
                                <p class="text-muted mb-4 mt-3">Enter your Details  to  Registration .</p>
                            </div>

                            <form method='post'>

                                <div class="form-group mb-3">
                                    <label for="u_name">Full  Name</label>
                                    <input class="form-control" name="u_name" type="Text" id="u_name" required="" placeholder="Enter your Full Name">
                                </div>
                                <div class="form-group mb-3">
                                    <label for="email">Email Address</label>
                                    <input class="form-control" name="u_email" type="email" id="email" required="" placeholder="Enter your Email Address">
                                </div>
                                <div class="form-group mb-3">
                                    <label for="u_phone">Your Phone Number</label>
                                    <input class="form-control" name="u_phone" type="Text" id="u_name" required="" placeholder="Enter your Phone Number">
                                </div>

                                <div class="form-group mb-3">
                                    <label for="password">Password</label>
                                    <input class="form-control" name="u_password" type="password" required="" id="password" placeholder="Enter your password">
                                </div>

                                <div class="form-group mb-0 text-center">
                                    <button class="btn btn-primary btn-block" name="register_users" type="submit"> Register </button>
                                </div>
                                <div class=" text-center">
                                  <p> <a href="index.php">login</a></p>
                                </div>
                                <div class="text-center">
                                  <p><a href="admin_pwd_reset.php">Forget your password?</a></p>
                                </div>
                                

                            </form>

                            
                            

                        </div> <!-- end card-body -->
                        
                    </div>
                    <!-- end card -->
                    

                    <!-- <div class="row mt-3">
                        <div class="col-12 text-center">
                            <p> <a href="admin_pwd_reset.php" class="text-white-50 ml-1">Forgot your password?</a></p>
                            <p class="text-white-50">Don't have an account? <a href="admin_register.php" class="text-white ml-1"><b>Sign Up</b></a></p>
                        </div> 
                        end col
                    </div> -->
                    <!-- end row -->
                   

                </div> <!-- end col -->
                
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </div>
    <!-- end page -->

   <!-- footer  -->
    <?php include ("assets/inc/footer1.php");?>

    <!-- Vendor js -->
    <script src="assets/js/vendor.min.js"></script>

    <!-- App js -->
    <script src="assets/js/app.min.js"></script>

</body>
</body>
</html>