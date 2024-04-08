<?php
session_start();
include('assets/inc/config.php');
include('assets/inc/checklogin.php');
check_login();
$aid = $_SESSION['ad_id'];
if (isset($_GET['delete'])) {
    $id = intval($_GET['delete']);
    $adn = "delete from invoice where invoice_id=?";
    $stmt = $mysqli->prepare($adn);
    $stmt->bind_param('i', $id);
    $stmt->execute();
    $stmt->close();

    if ($stmt) {
        $success = "Invoice Deleted";
    } else {
        $err = "Try Again Later";
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
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">Invoice</a></li>
                                        <li class="breadcrumb-item active">Manage Invoices</li>
                                    </ol>
                                </div>
                                <h4 class="page-title">Manage Invoice Details</h4>
                            </div>
                        </div>
                    </div>
                    <!-- end page title -->

                    <div class="row">
                        <div class="col-12">
                            <div class="card-box">
                                <h4 class="header-title"></h4>
                                <div class="mb-2">
                                    <div class="row">
                                        <div class="col-12 text-sm-center form-inline">
                                            <div class="form-group mr-2" style="display:none">
                                                <select id="demo-foo-filter-status" class="custom-select custom-select-sm">
                                                    <option value="">Show all</option>
                                                    <option value="Paid">Paid</option>
                                                    <option value="Unpaid">Unpaid</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <input id="demo-foo-search" type="text" placeholder="Search" class="form-control form-control-sm" autocomplete="on">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="table-responsive">
                                    <table id="demo-foo-filtering" class="table table-bordered toggle-circle mb-0" data-page-size="7">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th data-toggle="true">Title</th>
                                                <th data-hide="phone">Description</th>
                                                <th data-hide="phone">Amount</th>
                                                <th data-hide="phone">Patient Name</th>
                                                <th data-hide="phone">Date</th>
                                                <th data-hide="phone">Status</th>
                                                <th data-hide="phone">Action</th>
                                            </tr>
                                        </thead>
                                        <?php
                                        $ret = "SELECT * FROM invoice ORDER BY RAND() ";
                                        $stmt = $mysqli->prepare($ret);
                                        $stmt->execute();
                                        $res = $stmt->get_result();
                                        $cnt = 1;
                                        while ($row = $res->fetch_object()) {
                                            // Fetch patient name based on pat_id
                                            $pat_id = $row->pat_id;
                                            $pat_query = "SELECT pat_fname, pat_lname FROM patients WHERE pat_id = ?";
                                            $pat_stmt = $mysqli->prepare($pat_query);
                                            $pat_stmt->bind_param("i", $pat_id);
                                            $pat_stmt->execute();
                                            $pat_stmt->bind_result($pat_fname, $pat_lname);
                                            $pat_stmt->fetch();
                                            $pat_stmt->close();
                                        ?>
                                            <tbody>
                                                <tr>
                                                    <td><?php echo $cnt; ?></td>
                                                    <td><?php echo $row->title; ?></td>
                                                    <td><?php echo $row->description; ?></td>
                                                    <td><?php echo $row->amount; ?></td>
                                                    <td><?php echo $pat_fname . ' ' . $pat_lname; ?></td>
                                                    <td><?php echo $row->invoice_date; ?></td>
                                                    <td>
                                                        <!-- Add this part for changing the status with tooltip -->
                                                        <div class="btn-group" data-toggle="tooltip" data-placement="top" title="Change Status">
                                                            <?php
                                                            if ($row->status === 'Unpaid') {
                                                                echo '<button type="button" class="btn btn-warning btn-sm take-cash-btn" data-invoice-id="' . $row->invoice_id . '">Unpaid</button>';
                                                            } else {
                                                                echo '<span class="badge badge-success">' . $row->status . '</span>';
                                                            }
                                                            ?>
                                                        </div>
                                                    </td>

                                                    <td>
                                                    <a href="admin_update_single_invoice.php?invoice_id=<?php echo $row->invoice_id;?>" class="badge badge-primary"><i class="mdi mdi-check-box-outline "></i> Update</a>
                                                        <a href="admin_view_invoice.php?invoice_id=<?php echo $row->invoice_id; ?>&&pat_id=<?php echo $row->pat_id; ?>" class="badge badge-success"><i class="mdi mdi-eye"></i> View</a>

                                          
                      



                                                    </td>
                                                </tr>
                                            </tbody>
                                        <?php $cnt = $cnt + 1;
                                        } ?>
                                        <tfoot>
                                            <tr class="active">
                                                <td colspan="8">
                                                    <div class="text-right">
                                                        <ul class="pagination pagination-rounded justify-content-end footable-pagination m-t-10 mb-0"></ul>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div> <!-- end .table-responsive-->
                            </div> <!-- end card-box -->
                        </div> <!-- end col -->
                    </div>

                   

                </div> <!-- content -->

                <!-- Footer Start -->
                <?php include('assets/inc/footer.php'); ?>
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
        

    </body>

    </html>