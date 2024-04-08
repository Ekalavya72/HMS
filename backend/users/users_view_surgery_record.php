<?php
  session_start();
  include('assets/inc/config.php');
  include('assets/inc/checklogin.php');
  check_login();
  $u_id=$_SESSION['u_id'];
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
                                                
                                               
                $ret="SELECT * FROM  surgery where s_pat_number=(SELECT pat_number FROM users WHERE u_id=$u_id)"; 
                //sql code to get to ten docs  randomly
                $stmt= $mysqli->prepare($ret) ;
               // $stmt->bind_param('i',$s_number);
                $stmt->execute() ;//ok
                $res=$stmt->get_result();
                $cnt=1;
                while($row=$res->fetch_object())

                // $s_number=$_GET['s_number'];
                // $ret="SELECT  * FROM surgery WHERE s_number = ?";
                // $stmt= $mysqli->prepare($ret) ;
                // $stmt->bind_param('i',$s_number);
                // $stmt->execute() ;//ok
                // $res=$stmt->get_result();
                // //$cnt=1;
                // while($row=$res->fetch_object())
                {
                    $mysqlDateTime = $row->s_pat_date; //trim timestamp to dd/mm/yyyy formart
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
                                        <li class="breadcrumb-item"><a href="admin_dashboard.php">Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">Patients</a></li>
                                        <li class="breadcrumb-item active"> My Surgery  Records</li>
                                    </ol>
                                </div>
                                <h4 class="page-title">#<?php echo $row->s_number;?></h4>
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
                                                <img src="assets/img/surg.png" alt="" class="img-fluid mx-auto d-block rounded">
                                            </div>

                                        </div>
                                    </div> <!-- end col -->
                                    <div class="col-xl-7">

                                        <div class="pl-xl-3 mt-3 mt-xl-0">
                                            <h2 class="mb-3">Patient's Name : <?php echo $row->s_pat_name;?></h2>
                                            <hr>
                                            <h3 class="align-centre ">Patient Number : <?php echo $row->s_pat_number;?></h3>
                                            <hr>
                                            <h3 class="align-centre ">Patient Ailment : <?php echo $row->s_pat_ailment;?></h3>
                                            <hr>
                                            <h3 class="align-centre ">Date Surgery Conducted : <?php echo date("d/m/Y", strtotime($mysqlDateTime));?></h3>
                                            <hr>
                                            <h2 class="align-centre">Surgeon : <?php echo $row->s_doc;?> </h2>
                                            <hr>
                                            <h2 class="align-centre">Surgery Status : <span class="btn btn-success"> <?php echo $row->s_pat_status;?></span> </h2>
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