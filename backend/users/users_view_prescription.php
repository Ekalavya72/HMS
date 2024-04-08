<?php
  session_start();
  include('assets/inc/config.php');
  include('assets/inc/checklogin.php');
  check_login();
  $u_id = $_SESSION['u_id'];
?>
<!DOCTYPE html>
<html lang="en">

<?php include ('assets/inc/head.php');?>

<body>
    
    <!-- Begin page -->
    <div id="wrapper">

        <!-- Topbar Start -->
        <?php include('assets/inc/nav.php');?>
        <!-- end Topbar -->

        <!-- ========== Left Sidebar Start ========== -->
        <?php include("assets/inc/sidebar.php");?>
        <!-- Left Sidebar End -->

        <!-- ============================================================== -->
        <!-- Start Page Content here -->
        
        <!-- ============================================================== -->
        <?php
                $u_id= $_SESSION['u_id'];  // get
                                                
                                               
                $ret="SELECT * FROM  prescriptions where pres_pat_number=(SELECT pat_number FROM users where u_id=$u_id)"; 
                //sql code to get to ten docs  randomly
                $stmt= $mysqli->prepare($ret) ;
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
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">Patients</a></li>
                                        <li class="breadcrumb-item active">View Prescriptions</li>
                                    </ol>
                                </div>
                                <h4 class="page-title">#<?php echo $row->pres_number;?></h4>
                            </div>
                        </div>
                    </div>
                    <!-- end page title -->
                    
                    <div class="row">
                        <div class="col-12">
                            <div class="card-box">
                                <div class="row">
                                    <div class="col-xl-5">

                                        <div class="tab-content pt-0">

                                            <div class="tab-pane active show" id="product-1-item">
                                                <img src="assets/img/users/patient.png" alt="" class="img-fluid mx-auto d-block rounded">
                                            </div>

                                        </div>
                                    </div> <!-- end col -->
                                    <div class="col-xl-7">
                                        <div class="pl-xl-3 mt-3 mt-xl-0">
                                            <h2 class="mb-3">Name : <?php echo $row->pres_pat_name;?></h2>
                                            <hr>
                                            <h3 class="text-danger">Age : <?php echo $row->pres_pat_age;?> Years</h3>
                                            <hr>
                                            <h3 class="text-danger ">Patient Number : <?php echo $row->pres_pat_number;?></h3>
                                            <hr>
                                            <h3 class="text-danger ">Patient Category : <?php echo $row->pres_pat_type;?></h3>
                                            <hr>
                                            <h3 class="text-danger ">Patient Ailment : <?php echo $row->pres_pat_ailment;?></h3>
                                            <hr>
                                            <h2 class="align-centre">Prescription</h2>
                                            <hr>
                                            <p class="text-muted mb-4">
                                                <?php echo $row->pres_ins;?>
                                            </p>
                                            <hr>
                                            
                                        </div>
                                    </div> <!-- end col -->
                                </div>
                                <!-- end row -->
                                
                                

                            </div> <!-- end card-->
                        </div> <!-- end col-->
                    </div>
                    <!-- end row-->

                </div> <!-- container -->

            </div> <!-- content -->
            
            <!-- Footer Start -->
            <?php include('assets/inc/footer.php');?>
            <!-- end Footer -->

        </div>
        <?php }?>

        <!-- ============================================================== -->
        <!-- End Page content -->
        <!-- ============================================================== -->


    </div>
    <!-- END wrapper -->

   

    <!-- Right bar overlay-->
    <div class="rightbar-overlay"></div>

    <!-- Vendor js -->
    <script src="assets/js/vendor.min.js"></script>

    <!-- App js -->
    <script src="assets/js/app.min.js"></script>

</body>


</html>