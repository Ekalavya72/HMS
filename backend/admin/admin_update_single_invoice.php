<?php
    session_start();
    include('assets/inc/config.php');

    if(isset($_POST['update_invoice'])) {
        $invoice_id = $_GET['invoice_id'];
        $title = $_POST['title'];
        $description = $_POST['description'];
        $amount = $_POST['amount'];
        $pat_id = $_POST['pat_id'];
        $date = $_POST['date'];
        $status = $_POST['status'];

        $query = "UPDATE invoice SET title=?, description=?, amount=?, pat_id=?, invoice_date=?, status=? WHERE invoice_id=?";
        $stmt = $mysqli->prepare($query);
        $stmt->bind_param('ssssssi', $title, $description, $amount, $pat_id, $date, $status, $invoice_id);
        $stmt->execute();

        if ($stmt) {
            $success = "Invoice Record Updated";
        } else {
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
        <?php include("assets/inc/sidebar.php");?>
        <!-- Left Sidebar End -->

        <!-- ============================================================== -->
        <!-- Start Page Content here -->
        <!-- ============================================================== -->
        <?php
            $invoice_id = $_GET['invoice_id'];
            $ret="SELECT * FROM invoice WHERE invoice_id=?";
            $stmt= $mysqli->prepare($ret) ;
            $stmt->bind_param('i', $invoice_id);
            $stmt->execute();
            $res=$stmt->get_result();
            while($row=$res->fetch_object()) {
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
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">Invoices</a></li>
                                        <li class="breadcrumb-item active">Update Invoice Record</li>
                                    </ol>
                                </div>
                                <h4 class="page-title">Update Invoice Record</h4>
                            </div>
                        </div>
                    </div>     
                    <!-- end page title --> 
                    <!-- Form row -->
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title">Fill all fields</h4>
                                    <!-- Update Invoice Form -->
                                    <form method="post">
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="title" class="col-form-label">Title</label>
                                                <input type="text" required="required" name="title" value="<?php echo $row->title; ?>" class="form-control" id="title" placeholder="Invoice Title">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="description" class="col-form-label">Description</label>
                                                <input type="text" required="required" name="description" value="<?php echo $row->description; ?>" class="form-control" id="description" placeholder="Invoice Description">
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="amount" class="col-form-label">Amount</label>
                                                <input type="text" required="required" name="amount" value="<?php echo $row->amount; ?>" class="form-control" id="amount" placeholder="Invoice Amount">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="pat_id" class="col-form-label">Patient ID</label>
                                                <input type="text" required="required" name="pat_id" value="<?php echo $row->pat_id; ?>" class="form-control" id="pat_id" placeholder="Patient ID">
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="date" class="col-form-label">Date</label>
                                                <input type="date" required="required" name="date" value="<?php echo $row->invoice_date; ?>" class="form-control" id="date">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="status" class="col-form-label">Status</label>
                                                <select id=" required="required" name="status" class="form-control">
                                                    <option>Select an option</option> <!-- Add this line to provide a default option -->
                                                    <option <?php echo ($row->status === 'Paid') ? 'selected' : ''; ?>>Paid</option>
                                                    <option <?php echo ($row->status === 'Unpaid') ? 'selected' : ''; ?>>Unpaid</option>
                                                </select>
                                            </div>
                                        </div>
                                        <hr>
                                        <button type="submit" name="update_invoice" class="ladda-button btn btn-primary" data-style="expand-right">Update Invoice Record</button>
                                    </form>
                                    <!-- End Update Invoice Form -->
                                </div> <!-- end card-body -->
                            </div> <!-- end card-->
                        </div> <!-- end col -->
                    </div>
                    <!-- end row -->

                </div> <!-- container -->

            </div> <!-- content -->

            <!-- Footer Start -->
            <?php include('assets/inc/footer.php');?>
            <!-- end Footer -->

        </div>
        <?php } ?>
        <!-- ============================================================== -->
        <!-- End Page content -->
        <!-- ============================================================== -->

    </div>
    <!-- END wrapper -->

    <!-- Right bar overlay-->
    <div class="rightbar-overlay"></div>

    <!-- Vendor js -->
    <script src="assets/js/vendor.min.js"></script>

    <!-- App js-->
    <script src="assets/js/app.min.js"></script>

    <!-- Loading buttons js -->
    <script src="assets/libs/ladda/spin.js"></script>
    <script src="assets/libs/ladda/ladda.js"></script>

    <!-- Buttons init js-->
    <script src="assets/js/pages/loading-btn.init.js"></script>
    
</body>

</html>