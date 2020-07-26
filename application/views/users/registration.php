<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.0/css/bootstrap.css">
    <!-- font-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css">
    <!-- Custom Styles -->
    <!-- <link rel="stylesheet" href="css/style.css"> -->

    <!-- Google Fonts -->
    <link
        href="https://fonts.googleapis.com/css2?family=Work+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">

    <link
        href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">

    <link
        href="https://fonts.googleapis.com/css2?family=Work+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">


    <title>sauda express - Sign up</title>
</head>

<body>

    <!-- Content -->

    <div class="container">
        <div class="row mx-auto">
            <img src="img/logo.png" alt="" class="mx-auto mt-3" style="background-color: #17a18d; border-radius: 47%;">
        </div>
        
        
        <!-- Phone Verification -->
        <div id="phoneForm">
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card content-box my-5">
                        <div class="card-body">
                            <div class="form-header text-center mb-3">
                                <h5 class="card-title text-center mb-0">Phone Verification</h5>
                                <small class="text-center text-info">Please verify you phone number to continue</small>
                            </div>
                            <div class="errorNotify mb-3"></div>
                            <div class="form-label-group mb-3">
                                <label for="inputPhone" class="mb-0">Phone Number</label>
                                <input type="text" id="inputPhone" class="form-control" placeholder="Phone number" autofocus>
                            </div>
                            <a href="javascript:void(0)" class="btn btn-info button-secondary text-white p-2 text-dec-none 
                                btn-block text-uppercase" type="submit" id="phoneSubmit">
                                <i class="fab fa-register mr-2"></i>Send Code
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Phone Verification Ends -->

        <!-- OTP Verfication -->
        <div id="otpForm">
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card content-box my-5">
                        <div class="card-body">
                            <div class="form-header text-center mb-3">
                                <h5 class="card-title text-center">OTP Verification</h5>
                                <small class="text-center text-info">Please enter 4 digit code send to your phone number</small>
                            </div>
                            <div class="errorNotify"></div>
                        <div class="form-label-group mb-3">
                            <label for="inputOtp" class="mb-0">OTP Code</label>
                            <input type="text" id="inputOtp" class="form-control" placeholder="OTP Code" autofocus>
                        </div>
                        <a href="javascript:void(0)" class="btn btn-info button-secondary text-white p-2 text-dec-none btn-block 
                                text-uppercase" id="otpSubmit" 
                            type="submit"><i class="fab fa-register mr-2"></i>Verify</a>
                    </div>
                </div>
            </div>
            </div>
        </div>
        <!-- OTP Verification Ends -->

        <!-- Phone Verification Confirm -->
        <div id="phoneVerified">
            <div class="row mx-auto">
                <div class="verifiedIcon mx-auto d-flex justify-items-center flex-column">
                    <i class="far fa-check-circle fa-5x d-block mx-auto mb-4" style="color: green;"></i>
                    <h2>Phone Verification Completed</h2>
                </div>
            </div>
        </div>
        <!-- Phone Verification Confirm Ends -->

        <!-- Registration Form -->
        <div id="registrationForm">
                <div class="row">
                    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                        <div class="card content-box mb-5">
                            <div class="card-body">
                                <h5 class="card-title text-center">Register Member</h5>
                                <div class="errorNotify"></div>
                            <form id="userRegistrationForm" method="post"> 
                                <!-- action="<?php //echo base_url('Auth/updateUserRegistration'); ?>"> -->
                                <div class="form-label-group mb-3">
                                    <label for="inputName" class="mb-0">Fullname</label>
                                    <input type="text" id="inputName" name="inputName" class="form-control" placeholder="Fullname" required autofocus>
                                </div>

                                <div class="form-label-group mb-3">
                                    <label for="inputEmail" class="mb-0">Email address</label>
                                    <input type="email" id="inputEmail" name="inputEmail" class="form-control" placeholder="Email address"
                                        required autofocus>
                                </div>
                                
                                <div class="form-label-group mb-3">
                                    <label for="inputAddress" class="mb-0">Address</label>
                                    <input type="text" id="inputAddress" name="inputAddress" class="form-control" placeholder="Address" required autofocus>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="form-label-group mb-3">
                                            <label for="selectCountry" class="mb-0">Country</label>
                                            <select class="form-control form-control-sm" id="selectCountry" name="selectCountry">
                                                <?php foreach($country as $count) : ?>
                                                <option value="<?php echo $count['place_name']; ?>"><?php echo $count['place_name']; ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-label-group mb-3">
                                            <label for="selectCity" class="mb-0">City</label>
                                            <select class="form-control form-control-sm" id="selectCity" name="selectCity">
                                                <?php foreach($city as $ci) : ?>
                                                <option value="<?php echo $ci['place_name']; ?>"><?php echo $ci['place_name']; ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="addressDetails">Address Details</label>
                                    <textarea class="form-control" id="addressDetails" name="addressDetails" rows="3" placeholder="Address Details"></textarea>
                                </div>

                                <div class="row">
                                    <div class="col">
                                        <div class="form-label-group mb-3">
                                            <label for="inputPassword" class="mb-0">Password</label>
                                            <input type="password" id="inputPassword" name="inputPassword" class="form-control" placeholder="Password" required>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-label-group mb-3">
                                            <label for="inputConfirmPassword" class="mb-0">Confirm Password</label>
                                            <input type="password" id="inputConfirmPassword" name="inputConfirmPassword" class="form-control" placeholder="Confirm Password" required>
                                        </div>
                                    </div>
                                </div>
                                
                                <input type="hidden" name="userId" id="userId">
                                <input type="submit" name="registerSubmit" id="registerSubmit" class="btn btn-primary button-primary text-white p-2 text-dec-none btn-block text-uppercase" value="Register">
                                <hr class="my-2">
                                <a href="javascript:void(0)" id="SigninSwitch" class="p-2 text-dec-none btn-block" type="submit">
                                    <i class="fab fa-register mr-2"></i> or Sign in
                                </a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Registration Form Ends -->
                
        <!-- Login Form -->
        <div id="loginForm">
                <div class="row">
                    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                        <div class="card content-box my-5">
                            <div class="card-body">
                                <h5 class="card-title text-center">Sign In</h5>
                                <div class="errorNotify"></div>
                              
                            <form id="userLoginForm" method="post"> 
                                <div class="form-label-group mb-3">
                                    <label for="inputLoginEmail" class="mb-0">Email address</label>
                                    <input type="email" id="inputLoginEmail" name="inputLoginEmail" class="form-control" placeholder="Email address"
                                        required autofocus>
                                </div>
        
                                <div class="form-label-group mb-3">
                                    <label for="inputLoginPassword" class="mb-0">Password</label>
                                    <input type="password" id="inputLoginPassword" name="inputLoginPassword" class="form-control" placeholder="Password"
                                        required>
                                </div>
        
                                <div class="custom-control custom-checkbox mb-3">
                                    <input type="checkbox" class="custom-control-input" id="rememberMe" name="rememberMe">
                                    <label class="custom-control-label" for="rememberMe">Remember me</label>
                                </div>
                                <input type="submit" name="signinSubmit" id="signinSubmit" class="btn btn-primary button-primary text-white p-2 text-dec-none btn-block text-uppercase" value="Sign in">
                                <hr class="my-2">
                                <a href="javascript:void(0)" id="RegisterSwitch" class="p-2 text-dec-none btn-block mx-auto" type="submit">
                                    <i class="fab fa-register mr-2"></i> or Register
                                </a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Login Form Ends -->

    </div>
    
    <!-- Footer -->



    <!-- Scripts -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

    <!-- Slick -->
    <!-- <script src="js/slick.js"></script> -->

    <!-- Custom Scripts -->
    <!-- <script type="text/javascript" src="js/script.js"></script> -->


    <script>
        $(document).ready(function() {
            localStorage.removeItem('UserId');
            $('#registrationForm').hide();
            $('#registrationForm').css('display', 'none');
            $('#phoneForm').hide();
            $('#phoneForm').css('display', 'none');
            $('#otpForm').hide();
            $('#otpForm').css('display', 'none');
            $('#phoneVerified').hide();
            $('#phoneVerified').css('display', 'none');

            // Phone Verification Submit
            $('#phoneSubmit').click(function() {
                var phoneNumber = $('#inputPhone').val();
                var phoneRegEx = /^[0-9]{12}$/;
                if(!phoneNumber.match(phoneRegEx)) {
                    $('.errorNotify').html("<small style='color: red;'>Error! Phone number is wronng</small>");
                }
                else {
                    $.ajax({
                        url: "<?php echo base_url(); ?>Dashboard/phoneVerify",
                        method: "POST",
                        data: { phone: phoneNumber },
                        dataType: "json",
                        success: function(data) {
                            if(data.status == 'Error') {
                                $('.errorNotify').html("<small style='color: red;'>"+ data.status + "! "+ data.response + "</small>");
                            }
                            else {
                                $('.errorNotify').html("<small style='color: green;'>"+ data.status + "! "+ data.response + "</small>");
                                localStorage.setItem('UserId',data.userId);
                                if(data.phone_exist && data.phone_verified) {
                                    // It means user exist and verified
                                    // Send to Login Page
                                    $('#phoneForm').hide();
                                    $('#phoneForm').css('z-index', '-10');
                                    $('#loginForm').show();
                                    $('#loginForm').css('z-index', '1');
                                }
                                else if(data.phone_exist && !data.phone_verified) {
                                    // It means user exist but not verified
                                    // Send to Phone Verification Page
                                    $('#phoneForm').hide();
                                    $('#phoneForm').css('z-index', '-10');
                                    $('#otpForm').show();
                                    $('#otpForm').css('z-index', '1');
                                }
                                else {
                                    $('#phoneForm').hide();
                                    $('#phoneForm').css('z-index', '-10');
                                    $('#otpForm').show();
                                    $('#otpForm').css('z-index', '1');
                                }
                            }
                        },
                        error: function(data) {
                            $('.errorNotify').html("<small style='color: red;'>"+ data.status + "! "+ data.response + "</small>");
                        }
                    });
                }
            });

            // Submit OTP
            $('#otpSubmit').click(function() {
                var otpCode = $('#inputOtp').val();
                var otpRegEx = /^[0-9]{4}$/;
                if(!otpCode.match(otpRegEx)) {
                    $('.errorNotify').html("<small style='color: red;'>Error! OTP should be 4 digit number</small>");
                }
                else {
                    $.ajax({
                        url: "<?php echo base_url(); ?>Auth/otpVerify",
                        method: "POST",
                        data: { code: otpCode, userId: localStorage.getItem('UserId') },
                        dataType: "json",
                        success: function(data) {
                            if(data.status == 'Error') {
                                $('.errorNotify').html("<small style='color: red;'>"+ data.status + "! "+ data.response + "</small>");    
                            }
                            else {
                                $('.errorNotify').html("<small style='color: green;'>"+ data.status + "! "+ data.response + "</small>");
                                
                                if(!data.user_found_in_otp && !data.user_verified) {
                                    $('#otpForm').hide();
                                    $('#otpForm').css('z-index', '-10');

                                    $('#phoneForm').show();
                                    $('#phoneForm').css('z-index', '1');
                                } 
                                else if(data.user_found_in_otp && data.user_verified) {
                                    $('#otpForm').hide();
                                    $('#otpForm').css('z-index', '-10');

                                    $('#loginForm').show();
                                    $('#loginForm').css('z-index', '1');
                                }
                                else {
                                    $('#otpForm').hide();
                                    $('#otpForm').css('z-index', '-10');
                                    $('#phoneVerified').hide();
                                    $('#phoneVerified').css('z-index', '-10');
                                    $('#registrationForm').show();
                                    $('#registrationForm').css('z-index', '1');
                                }
                                
                            }
                        },
                        error: function(data) {
                            $('.errorNotify').html("<small style='color: red;'>"+ data.status + "! "+ data.response + "</small>");
                        }
                    });
                }
            });

            $('#inputEmail').keyup(function() {
                if(validateEmail()) {
                    // if email is validated
                    $('#inputEmail').css("border", "1px solid green");
                }
                else {
                    // if email is not validated
                    $('#inputEmail').css("border", "1px solid red");
                }
            });

            $('#inputLoginEmail').keyup(function() {
                if(validateEmail()) {
                    // if email is validated
                    $('#inputLoginEmail').css("border", "1px solid green");
                }
                else {
                    // if email is not validated
                    $('#inputLoginEmail').css("border", "1px solid red");
                }
            });
            
            // Register User
            $('#userRegistrationForm').on('submit', function(event) {
                event.preventDefault();
                $('#userId').val(localStorage.getItem('UserId'));
                
                if(!$('#inputName').val()) { $('#inputName').css("border", "1px solid red"); }
                else { $('#inputName').css("border", "1px solid green"); }

                if(!$('#inputEmail').val()) { $('#inputName').css("border", "1px solid red"); }
                else { $('#inputEmail').css("border", "1px solid green"); }

                if(!$('#inputAddress').val()) { $('#inputName').css("border", "1px solid red"); }
                else { $('#inputAddress').css("border", "1px solid green"); }

                if(!$('#inputPassword').val()) { $('#inputName').css("border", "1px solid red"); }
                else { $('#inputPassword').css("border", "1px solid green"); }

                if(!$('#inputConfirmPassword').val()) { $('#inputName').css("border", "1px solid red"); }
                else { $('#inputConfirmPassword').css("border", "1px solid green"); }

                if(!$('#inputName').val() && !$('#inputEmail').val() && !$('#inputAddress').val() && !$('#inputPassword').val() 
                    && !$('#selectCountry') && !$('#selectCity') && !$('#inputConfirmPassword').val()) {
                    $('.errorNotify').html("<small style='color: red;'>Error! Please fill all fields</small>");
                }
                else {
                    $.ajax({
                        url: "<?php echo base_url(); ?>Auth/updateUserRegistration",
                        method: "POST",
                        data: $(this).serialize(),
                        dataType: "json",
                        success: function(data) {
                            if(data.status == 'Error') {
                                $('.errorNotify').html("<small style='color: red;'>"+ data.status + "! "+ data.response + "</small>");    
                            }
                            else {
                                $('.errorNotify').html("<small style='color: green;'>"+ data.status + "! "+ data.response + "</small>");
                                $('#registrationForm').hide();
                                $('#registrationForm').css('z-index', '-10');
                                $('#userId').val(localStorage.removeItem('UserId'));
                                $('#loginForm').show();
                                $('#loginForm').css('z-index', '1');
                            }
                        },
                        error: function(data) {
                            $('.errorNotify').html("<small style='color: red;'>"+ data.status + "! "+ data.response + "</small>");
                        }
                    });
                }
            });

            // Login User
            $('#userLoginForm').on('submit', function(event) {
                event.preventDefault();

                if(!$('#inputLoginEmail').val()) { $('#inputLoginEmail').css("border", "1px solid red"); }
                else { $('#inputLoginEmail').css("border", "1px solid green"); }

                if(!$('#inputLoginPassword').val()) { $('#inputLoginPassword').css("border", "1px solid red"); }
                else { $('#inputLoginPassword').css("border", "1px solid green"); }

                if(!$('#inputLoginEmail').val() && !$('#inputLoginPassword').val()) {
                    $('.errorNotify').html("<small style='color: red;'>Error! Please fill all fields</small>");
                }
                else {
                    $.ajax({
                        url: "<?php echo base_url(); ?>Auth/login",
                        method: "POST",
                        data: $(this).serialize(),
                        dataType: "json",
                        success: function(data) {
                            if(data.status == 'Error') {
                                $('.errorNotify').html("<small style='color: red;'>"+ data.status + "! "+ data.response + "</small>");    
                            }
                            else {
                                debugger;
                                $('.errorNotify').html("<small style='color: green;'>"+ data.status + "! "+ data.response + "</small>");
                                $('#loginForm').hide();
                                $('#loginForm').css('z-index', '-10');
                                window.location = "<?= base_url(); ?>Auth/welcome";
                            }
                        },
                        error: function(data) {
                            $('.errorNotify').html("<small style='color: red;'>"+ data.status + "! "+ data.response + "</small>");
                        }
                    });
                }
            });


            // Logout
            $('#userLoggedOut').click(function() {
                window.location = "<?= base_url(); ?>Auth/logout";
            });

            $('#RegisterSwitch').click(function() {
                $('#loginForm').hide();
                // $('#loginForm').css('z-index', '-10');
                $('#phoneForm').show();
                // $('#registrationForm').css('z-index', '1');
            });

            $('#SigninSwitch').click(function() {
                $('#registrationForm').hide();
                // $('#registrationForm').css('z-index', '1');
                $('#loginForm').show();
                // $('#loginForm').css('z-index', '-10');
            });


            // Private Functions
            function validateEmail() {
                var email = $('#inputEmail').val();
                var reg = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
                return (reg.test(email)) ? true : false;
            }
            
        });

    </script>
</body>

</html>