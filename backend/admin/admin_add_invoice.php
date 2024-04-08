<?php
    session_start();
    include('assets/inc/config.php');

    if(isset($_POST['generate_invoice'])) {
        $pat_id = isset($_POST['pat_id']) ? intval($_POST['pat_id']) : 0;
        $title = isset($_POST['title']) ? htmlspecialchars($_POST['title'], ENT_QUOTES, 'UTF-8') : '';
        $description = isset($_POST['description']) ? htmlspecialchars($_POST['description'], ENT_QUOTES, 'UTF-8') : '';
        $amount = isset($_POST['amount']) ? intval($_POST['amount']) : 0;
        $status = isset($_POST['status']) ? htmlspecialchars($_POST['status'], ENT_QUOTES, 'UTF-8') : '';
        $invoice_date = isset($_POST['invoice_date']) ? $_POST['invoice_date'] : '';

        // Validate and sanitize input data
        if (empty($pat_id) || empty($title) || empty($description) || empty($amount) || empty($status) || empty($invoice_date)) {
            $error = "All fields are required!";
        } else {
            // Insert invoice data into the database
            $creation_timestamp = time();
          

            $insert_query = "INSERT INTO invoice (pat_id, title, description, amount, creation_timestamp, status,invoice_date) VALUES (?, ?, ?, ?, ?, ?,?)";
            $stmt = $mysqli->prepare($insert_query);

            if ($stmt) {
                $stmt->bind_param("isssiss", $pat_id, $title, $description, $amount, $creation_timestamp, $status,$invoice_date);
                $stmt->execute();

                if ($stmt->affected_rows > 0) {
                    $success = "Invoice generated successfully!";
                } else {
                    $error = "Failed to generate invoice. Please try again.";
                }

                $stmt->close();
            } else {
                $error = "Database error. Please try again.";
            }
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
        <?php include("assets/inc/nav.php");?>
        <!-- end Topbar -->

        <!-- ========== Left Sidebar Start ========== -->
        <?php include("assets/inc/sidebar.php");?>
        <!-- Left Sidebar End -->

        <!-- ============================================================== -->
        <!-- Start Page Content here -->
        <!-- ============================================================== -->
        
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
                                        <li class="breadcrumb-item active">Generate Invoice</li>
                                    </ol>
                                </div>
                                <h4 class="page-title">Generate Invoice</h4>
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
                                    <!-- Add Invoice Form -->
                                    <form method="post" action="">
                                        <?php
                                            // Display success or error messages
                                            if (isset($success)) {
                                                echo '<div class="alert alert-success" role="alert">' . $success . '</div>';
                                            } elseif (isset($error)) {
                                                echo '<div class="alert alert-danger" role="alert">' . $error . '</div>';
                                            }
                                        ?>
                                        <div class="form-group">
                                            <label for="pat_id">Patient ID:</label>
                                            <input type="text" class="form-control" id="pat_id" name="pat_id" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="title">Title:</label>
                                            <input type="text" class="form-control" id="title" name="title" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="description">Description:</label>
                                            <textarea class="form-control" id="description" name="description" required></textarea>
                                        </div>

                                        <div class="form-group">
                                            <label for="amount">Amount:</label>
                                            <input type="text" class="form-control" id="amount" name="amount" required>
                                        </div>

                                        <div class="form-group">
                                        <label for="invoice_date">Invoice Date:</label>
                                         <input type="date" class="form-control" id="invoice_date" name="invoice_date" required>
                                          </div>
                                         
                                        <div class="form-group">
                                       <label>Status:</label><br>
                                     <div class="form-check form-check-inline">
                                     <input class="form-check-input" type="radio" name="status" id="unpaid" value="unpaid" checked>
                                     <label class="form-check-label" for="unpaid">Unpaid</label>
                                    </div>
                                      <div class="form-check form-check-inline">
                                     <input class="form-check-input" type="radio" name="status" id="paid" value="paid">
                                     <label class="form-check-label" for="paid">Paid</label>
                                       </div>
                                       </div>





                                        <button type="submit" name="generate_invoice" class="ladda-button btn btn-success" data-style="expand-right">Generate Invoice</button>
                                    </form>
                                    <!-- End Invoice Form -->
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