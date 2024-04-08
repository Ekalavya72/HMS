<?php
	session_start();
    $u_id = $_SESSION['u_id']; //get the user
    $u_name= $_SESSION["u_name"]; 
	include('assets/inc/config.php');
		if(isset($_POST['update_profile']))
		{
            $u_id=$_SESSION['u_id'];
			$u_name=$_POST['u_name'];
			$u_email=$_POST['u_email'];
			$u_phone=$_POST['u_phone'];

            //$u_password=sha1(md5($_POST['u_password']));
            $u_pic=$_FILES["u_pic"]["name"];
		    move_uploaded_file($_FILES["u_pic"]["tmp_name"],"assets/img/users/".$_FILES["u_pic"]["name"]);

            //sql to insert captured values
			$query="UPDATE users SET u_name=?, u_email=?,  u_phone=?, u_pic=? WHERE u_id = ?";
			$stmt = $mysqli->prepare($query);
			$rc=$stmt->bind_param('sssss', $u_name, $u_email, $u_phone, $u_pic, $u_id);
			$stmt->execute();
			/*
			*Use Sweet Alerts Instead Of This Fucked Up Javascript Alerts
			*echo"<script>alert('Successfully Created Account Proceed To Log In ');</script>";
			*/ 
			//declare a varible which will be passed to alert function
			if($stmt)
			{
				$success = "Profile Updated";
			}
			else {
				$err = "Please Try Again Or Try Later";
			}
			
			
        }
        //Change Password
        if(isset($_POST['update_password']))
		{
            $u_id=$_SESSION['u_id'];
            $u_password=sha1(md5($_POST['u_password']));//double encrypt 
            
            //sql to insert captured values
			$query="UPDATE users SET u_password ='$u_password' WHERE u_id =$u_id ";
			$stmt = $mysqli->prepare($query);
			//$rc=$stmt->bind_param('ss', $u_password, $u_id);
			$stmt->execute();
			/*
			*Use Sweet Alerts Instead Of This Fucked Up Javascript Alerts
			*echo"<script>alert('Successfully Created Account Proceed To Log In ');</script>";
			*/ 
			//declare a varible which will be passed to alert function
			if($stmt)
			{
				$success = "Password Updated";
			}
			else {
				$err = "Please Try Again Or Try Later";
			}
			
			
		}
?>

<!DOCTYPE html>
<html lang="en">
<?php include('assets/inc/head.php');?>

<body>

    <!-- Begin page -->
    <div id="wrapper">

        <!-- Topbar Start -->
        <?php include('assets/inc/nav.php');?>
        <!-- end Topbar -->

        <!-- ========== Left Sidebar Start ========== -->
        <?php include('assets/inc/sidebar.php');?>
        <!-- Left Sidebar End -->

        <!-- ============================================================== -->
        <!-- Start Page Content here -->
        <!-- ============================================================== -->
        <?php
            $u_id=$_SESSION['u_id'];
            $u_name=$_SESSION['u_name'];
            $ret="SELECT * FROM  users where u_id=$u_id AND u_name='$u_name' "; 
            $stmt= $mysqli->prepare($ret) ;
            //$stmt->bind_param('ss',$u_id, $u_name) ;
            $stmt->execute() ;//ok
            $res=$stmt->get_result();
            $cnt=1;
            while($row=$res->fetch_object())
            {
        ?>
        <div class="content-page">
            <div class="content">
                
                <!-- Start Content-->
                <div class="container-fluid">

                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box">
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0)">Dashboard</a></li>
                                        <li class="breadcrumb-item active">Profile</li>
                                    </ol>
                                </div>
                                <h4 class="page-title"><?php echo $row->u_name;?>'s Profile</h4>
                            </div>
                        </div>
                    </div>
                    <!-- end page title -->
                            
                    <div class="row">
                        <div class="col-lg-4 col-xl-4">
                            <div class="card-box text-center">
                                <img src="../users/assets/img/users/<?php echo $row->u_pic;?>" class="rounded-circle avatar-lg img-thumbnail" alt="profile-image">
                                <div class="text-centre mt-3">

                                    <p class="text-muted mb-2 font-13"><strong>Full Name :</strong> <span class="ml-2"><?php echo $row->u_name;?></span></p>
                                    <p class="text-muted mb-2 font-13"><strong>Patient Number :</strong> <span class="ml-2"><?php echo $row->pat_number;?></span></p>
                                    <p class="text-muted mb-2 font-13"><strong>Phone Number :</strong> <span class="ml-2"><?php echo $row->u_phone;?></span></p>
                                    <p class="text-muted mb-2 font-13"><strong>User Email :</strong> <span class="ml-2"><?php echo $row->u_email;?></span></p>


                                </div>

                            </div> <!-- end card-box -->

                        </div> <!-- end col-->
                                
                        <div class="col-lg-8 col-xl-8">
                            <div class="card-box">
                                <ul class="nav nav-pills navtab-bg nav-justified">
                                    <li class="nav-item">
                                        <a href="#aboutme" data-toggle="tab" aria-expanded="false" class="nav-link active">
                                            Update Profile
                                        </a>
                                    </li>

                                    <li class="nav-item">
                                        <a href="#settings" data-toggle="tab" aria-expanded="false" class="nav-link">
                                            Change Password
                                        </a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane show active" id="aboutme">

                                        <form method="post" enctype="multipart/form-data">
                                            <h5 class="mb-4 text-uppercase"><i class="mdi mdi-account-circle mr-1"></i> Personal Info</h5>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="name">Full Name</label>
                                                        <input type="text" name="u_name" class="form-control" id="name" placeholder="<?php echo $row->u_name;?>">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="phone">Phone Number</label>
                                                        <input type="text" name="u_phone" class="form-control" id="phone" placeholder="<?php echo $row->u_phone;?>">
                                                    </div>
                                                </div> <!-- end col -->
                                            </div> <!-- end row -->
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="useremail">Email Address</label>
                                                        <input type="email" name="u_email" class="form-control" id="useremail" placeholder="<?php echo $row->u_email;?>">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="userpic">Profile Picture</label>
                                                        <input type="file" name="u_pic" class="form-control btn btn-success" id="userpic">
                                                    </div>
                                                </div>

                                            </div> <!-- end row -->
                                                    
                                                    

                                            <div class="text-right">
                                                <button type="submit" name="update_profile" class="btn btn-success waves-effect waves-light mt-2"><i class="mdi mdi-content-save"></i> Save</button>
                                            </div>
                                        </form>


                                    </div> <!-- end tab-pane -->
                                    <!-- end about me section content -->

                                            

                                    <div class="tab-pane" id="settings">
                                        <form method="post">
                                        <h5 class="mb-4 text-uppercase"><i class="mdi mdi-account-circle mr-1"></i> Personal Info</h5>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="oldpassword">Old Password</label>
                                                    <input type="password" class="form-control" id="oldpassword" placeholder="Enter Old Password">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="newpassword">New Password</label>
                                                        <input type="password" class="form-control" name="u_passord" id="newpassword" placeholder="Enter New Password">
                                                    </div>
                                                </div> <!-- end col -->
                                            </div> <!-- end row -->

                                            <div class="form-group">
                                                <label for="useremail">Confirm Password</label>
                                                <input type="password" class="form-control" id="useremail" placeholder="Confirm New Password">
                                            </div>

                                            <div class="text-right">
                                                <button type="submit" name="update_password" class="btn btn-success waves-effect waves-light mt-2"><i class="mdi mdi-content-save"></i> Update Password</button>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- end settings content-->

                                </div> <!-- end tab-content -->
                            </div> <!-- end card-box-->

                        </div> <!-- end col -->
                    </div>
                    <!-- end row-->

                </div> <!-- container -->

            </div> <!-- content -->
                    
            <!-- Footer Start -->
            <?php include("assets/inc/footer.php");?>
            <!-- end Footer -->

        </div>
        <?php }?>
        <!-- ============================================================== -->
        <!-- End Page content -->
        <!-- ============================================================== -->


    </div>
    <!-- END wrapper -->
    

    <!-- Right bar overlay-->
    <!-- <div class="rightbar-overlay"></div> -->

    <!-- Vendor js -->
    <script src="assets/js/vendor.min.js"></script>

    <!-- App js -->
    <script src="assets/js/app.min.js"></script>

</body>


</html>