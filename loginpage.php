<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <style>
        .blog-single {
            border: 1px solid #ddd;
            padding: 20px;
            margin-bottom: 20px;
            text-align: center;
        }
        .blog-single img {
            width: 100%;
            max-width: 400px;
            height: auto;
        }
        .blog-single-det {
            margin-top: 20px;
        }
        .btn-blog {
            background-color: #28a745;
            border-color: #28a745;
        }
        .btn-blog:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
    </style>
</head>
<body>
    <section id="logins" class="our-blog container-fluid">
        <div class="container">
            <div class="inner-title">
                <h2>Login</h2>
            </div>
            <div class="row">
                <div class="col-sm-4 blog-smk">
                    <div class="blog-single">
                        <img src="assets/loginImg/patient.jpg" alt="">
                        <div class="blog-single-det">
                            <h6>Users Login</h6>
                            <a href="backend/users/index.php" target="_self">
                                <button class="btn btn-blog btn-sm">Click Here</button>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 blog-smk">
                    <div class="blog-single">
                        <img src="assets/loginImg/doctor.jpg" alt="">
                        <div class="blog-single-det">
                            <h6>Doctors login</h6>
                            <a href="backend/doc/index.php" target="_self">
                                <button class="btn btn-blog btn-sm">Click Here</button>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 blog-smk">
                    <div class="blog-single">
                        <img src="assets/loginImg/admin.jpg" alt="">
                        <div class="blog-single-det">
                            <h6>Admin Login</h6>
                            <a href="backend/admin/index.php" target="_self">
                                <button class="btn btn-blog btn-sm">Click Here</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>  