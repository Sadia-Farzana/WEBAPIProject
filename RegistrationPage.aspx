<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="WEBAPI.Registration" %>

<!DOCTYPE html>

<html>
<head>>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

    <style>
        .divider-text {
            position: relative;
            text-align: center;
            margin-top: 15px;
            margin-bottom: 15px;
        }

            .divider-text span {
                padding: 7px;
                font-size: 12px;
                position: relative;
                z-index: 2;
            }

            .divider-text:after {
                content: "";
                position: absolute;
                width: 100%;
                border-bottom: 1px solid #ddd;
                top: 55%;
                left: 0;
                z-index: 1;
            }

        .btn-facebook {
            background-color: #405D9D;
            color: #fff;
        }

        .btn-twitter {
            background-color: #42AEEC;
            color: #fff;
        }
    </style>
</head>



<body>
    <div class="container">
    

    <div class="card bg-light">
        <div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
              <a href="#" class="list-group-item list-group-item-action">Personal Information</a>
              <a href="UserList.aspx" class="list-group-item list-group-item-action">Userlist</a>
              <a href="#" class="list-group-item list-group-item-action">Attendance</a>
              <a href="#" class="list-group-item list-group-item-action">Overall Attendance Report</a>
              <a href="RegistrationPage.aspx" class="list-group-item list-group-item-action active">User Registration</a>
             
            </div> 
		</div>
        <article class="card-body mx-auto" style="max-width: 400px;">
            <h4 class="card-title mt-3 text-center">Create Account</h4>
            <p class="text-center"></p>
         
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                        <input id="txtusername" class="form-control" placeholder="User Name" type="text" >
                    </div>
                    <br />

                    <!-- form-group// -->
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                        </div>
                        <input id="txtemail" class="form-control" placeholder="Email address" type="email">
                    </div> <!-- form-group// -->
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
                        </div>
                        
                        <input id="txtphone" class="form-control" placeholder="Phone number" type="text">
                    </div> <!-- form-group// -->
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-building"></i> </span>
                        </div>
                        <select class="form-control" id="txtrole">
                            <option selected=""> Role</option>
                            <option value="Super Admin">Super Admin</option>
                            <option value="Admin">Admin</option>
                        </select>
                    </div> <!-- form-group end.// -->
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                        </div>
                        <input class="form-control" id="txtpassword" placeholder="Create password" type="password">
                    </div> <!-- form-group// -->
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-building"></i> </span>
                        </div>
                        <input class="form-control" id="txtaddress" placeholder="Address" type="text">
                    </div> <!-- form-group// -->
                    <div class="form-group">
                        <button type="submit" id="btnsignup" class="btn btn-primary btn-block"> Create Account  </button>
                    </div> <!-- form-group// --> 
                
            <p class="text-center" id="suucessmsg" ></p>
            <div id="Errordiv" class="alert alert-danger collapse">
                <a id="linkclose" class="close" href="#">&times;</a>
                <div id="diverrortext"></div>
            </div>
            <p class="text-center">Have an account? <a href="LoginPage.aspx">Log In</a> </p>

        </article>
    </div> <!-- card.// -->


    <br>
    <br>
    </div>
</body>
<script src="Scripts/jquery-3.6.0.js"></script>
<script src="Scripts/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
       
            $('#btnsignup').click(function () {
                $.ajax({
                    url: 'api/Registration/Signup',
                    method: 'POST',
                    data: {
                       
                        strusername: $('#txtusername').val(),
                        StrEmail: $('#txtemail').val(),
                        StrPassword: $('#txtpassword').val(),
                        StrContactNumber: $('#txtphone').val(),
                        StrAddress: $('#txtaddress').val(),
                        StrType: $('#txtrole').val(),
                    },
                    complete: function (xmlHttp, status) {
                        if (xmlHttp.status == 201) {
                            $('#suucessmsg').html("Registration Successfull");
                           // window.location.href = "LoginPage.cshtml";
                        }
                    },
                    error: function (jqXHR) {
                        $('#diverrortext').text(jqXHR.responseText);
                        $('#Errordiv').show('fade');
                        
                    }
                });
            });
        });
    </script>
    </html>
