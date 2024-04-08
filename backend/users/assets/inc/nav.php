<?php
    $u_id = $_SESSION['u_id'];
    $u_name = $_SESSION['u_name'];
    $ret="SELECT * FROM  users WHERE u_id = ? AND u_name=? "; //
    $stmt= $mysqli->prepare($ret) ;
    $stmt->bind_param('ss',$u_id,$u_name);
    $stmt->execute() ;//ok
    $res=$stmt->get_result();
    //$cnt=1;
    while($row=$res->fetch_object())
    {
?>
<div class="navbar-custom">
    <ul class="list-unstyled topnav-menu float-right mb-0">
        
        <li class="dropdown notification-list">
            <a class="nav-link dropdown-toggle nav-user mr-0 waves-effect waves-light" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                <img src="assets/img/users/<?php echo $row->u_pic;?>" alt="upic" class="rounded-circle">
                <span class="pro-user-name ml-1">
                    <?php echo $row->u_name;?>  <i class="mdi mdi-chevron-down"></i> 
                </span>
            </a>
            <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                <!-- item-->
                <div class="dropdown-header noti-title">
                    <h6 class="text-overflow m-0">Welcome !</h6>
                </div>

                <!-- item-->
                <a href="users_account.php" class="dropdown-item notify-item">
                        <i class="fas fa-user"></i>
                        <span>My Account</span>
                    </a>

                <a href="users_update-account.php" class="dropdown-item notify-item">
                    <i class="fas fa-user-tag"></i>
                    <span>Update Account</span>
                </a>


                <div class="dropdown-divider"></div>

                <!-- item-->
                <a href="users_logout_partial.php" class="dropdown-item notify-item">
                    <i class="fe-log-out"></i>
                    <span>Logout</span>
                </a>

            </div>
        </li>

       

    </ul>

    <!-- LOGO -->
    <div class="logo-box">
        <a href="user_dashboard.php" class="logo text-center">
            <span class="logo-lg">
                <img src="assets/img/logo-light.png" alt="error" height="34">
                <!-- <span class="logo-lg-text-light">HSS</span> -->
            </span>
            <span class="logo-sm">
                <img src="assets/img/logo-sm-white.png" alt="error" height="30">
                <!-- <span class="logo-sm-text-dark">HSS</span> -->
                <!-- <img src="#" alt="" height="24"> -->
            </span>
        </a>
    </div>

    <ul class="list-unstyled topnav-menu topnav-menu-left m-0">
        <li>
            <button class="button-menu-mobile waves-effect waves-light">
                <i class="fe-menu"></i>
            </button>
        </li>
        
        <li class="dropdown d-none d-lg-block">
            <a class="nav-link dropdown-toggle waves-effect waves-light" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                Create New
                <i class="mdi mdi-chevron-down"></i>
            </a>
            <div class="dropdown-menu">


                <!-- item-->
                <a href="#" class="dropdown-item">
                    <i class="fe-activity mr-1"></i>
                    <span>Appointment Request</span>
                </a>



                <div class="dropdown-divider"></div>


            </div>
        </li>
      
    </ul>
</div>
<?php }?>