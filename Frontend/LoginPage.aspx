<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="WEBAPI.LoginPage" %>

<!DOCTYPE html>

<html>
<head>
    <title> Login Page</title>
    <link rel="icon" href="icon.gif"  type="image/gif" sizes="16x16" > 
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!------ Include the above in your HEAD tag ---------->

   
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" />
    <style>
        .container {
            border: 2px solid blue;
            text-align: center;
            height: 500px;
            width: 400px;
        }

        body {
            padding: 70px;
        }

        h1 {
            margin: auto;
        }

        .row {
            height: 90px;
            width: 396px;
            background-color: paleturquoise;
        }
    </style>
    </head>
<body oncontextmenu="return false">
    <div class="container">
        <div class="row">
            <h1><i class="fa fa-lock" aria-hidden="true"></i> Login</h1>

        </div><br /><br />


        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-user-tie"></i></span>
            </div>
            <input type="text" id="txtusername" class="form-control" placeholder="username or email" />
        </div><br />

        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text"><i class="fa fa-key icon"></i></span>
            </div>
            <input type="Password" id="txtpassword" class="form-control" placeholder="password" />
        </div><br />
        <div class="checkbox">
            <label><input type="checkbox" value="" /> Remember me</label>
        </div><br />
        <button type="submit" id="btnlogin" class="btn btn-success"><span class="glyphicon glyphicon-off"></span> Login</button>

        
        <br /> <center><div style="border:1px solid black;height:1px;width:300px;"></div></center><br />
        <div class="footer">
            <p>Don't have an Account! <a href="RegistrationPage.aspx">Sign Up Here</a></p>
            
        </div>
        <div id="Errordiv" class="alert alert-danger collapse">
                <a id="linkclose" class="close" href="#">&times;</a>
                <div id="diverrortext"></div>
            </div>

    </div>
</body>
<script src="Scripts/jquery-3.6.0.js"></script>
<script src="Scripts/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //var id = @Request.id
            //$.get("api/Registration/GetById/", { id: id }, function (data) {


                $('#btnlogin').click(function () {
                    $.ajax({
                        url: '/token',
                        method: 'POST',
                        contentType: 'application/json',
                        data: {

                            username: $('#txtusername').val(),
                            password: $('#txtpassword').val(),
                            grant_type: 'password',
                          
                        },
                        success: function (response) {
                            sessionStorage.setItem('accessToken', response.access_token);
                            window.location.href = "Profile.aspx";
                            //$('#diverrortext').text(JSON.stringify(response));
                            //$('#Errordiv').show('fade');
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