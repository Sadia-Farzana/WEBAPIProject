<!DOCTYPE html>

<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <title></title>
    <meta name="viewport" content="width=device-width" />
    <title></title>
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
    <form>
        <br />
        <br />
        <div class="container">
            <div class="card bg-light">
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
              <a href="Profile.aspx" class="list-group-item list-group-item-action active">Personal Information</a>
              <a href="UserList.cshtml" class="list-group-item list-group-item-action">Userlist</a>
              <a href="#" class="list-group-item list-group-item-action">Attendance</a>
              <a href="#" class="list-group-item list-group-item-action">Overall Attendance Report</a>
              <a href="RegistrationPage.aspx" class="list-group-item list-group-item-action">User Registration</a>
             
             
            </div> 
		</div>
		<div class="col-md-9">
		    <div class="card">
		        <div class="card-body">
		            <div class="row">
		                <div class="col-md-12">
		                    <h4>Personal Information</h4>
                           <div  class="float-lg-right" > <button id="btnlogout" class="btn btn-danger">Logout</button></div>
		                    <hr>
		                </div>
		            </div>
		            <div class="row">
		                <div class="col-md-12">
		                    
                             
                              <div class="form-group row">
                                <label for="name" class="col-4 col-form-label">Username</label> 
                                <div class="col-8">
                                      <h4 id="username" class="form-control here"></h4>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="lastname" class="col-4 col-form-label">Email</label> 
                                <div class="col-8">
                                  <h4 id="email" class="form-control here"></h4>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="text" class="col-4 col-form-label">Password</label> 
                                <div class="col-8">
                                   <h4 id="password" class="form-control here"></h4>
                                </div>
                              </div>
                           
                              <div class="form-group row">
                                <label for="email" class="col-4 col-form-label">Contact Number</label> 
                                <div class="col-8">
                                  <h4 id="phone" class="form-control here"></h4>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="website" class="col-4 col-form-label">Address</label> 
                                <div class="col-8">
                                  <h4 id="address" class="form-control here"></h4>
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="publicinfo" class="col-4 col-form-label">Role</label> 
                                <div class="col-8">
                                  <h4 id="role" class="form-control here"></h4>
                                </div>
                              </div>
                             <input type="hidden" id="IntId" />
                              <div class="form-group row">
                                <div class="offset-4 col-8">
                                  <Button onclick="UpdateUser(IntId)" class="btn btn-primary">Update My Profile</Button>
                                </div>
                              </div>
                            
		                </div>
		            </div>
		            
		        </div>
		    </div>
		</div>
	</div>
</div>
        <div class="modal fade" tabindex="-1" id="ErrorModal" data-keyboard="false" data-backdrop="static">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                             <h4 class="modal-title">Token expired</h4>
                            <Button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                 <span aria-hidden="true">&times;</span>
                            </Button>
                           
                        </div>
                        <div class="modal-body">
                            <h2>Session Time out.Please Login again.</h2>
                        </div>
                    </div>
                </div>
            </div>
        <div id="Errordiv" class="alert alert-danger collapse">
                <a id="linkclose" class="close" href="#">&times;</a>
                <div id="diverrortext"></div>
            </div>
        </div>
    </form>

</body>
</html>

<script src="Scripts/bootstrap.bundle.min.js"></script>
<script src="Scripts/bootstrap.bundle.js"></script>


<script type="text/javascript">
    $(document).ready(function () {
        if (sessionStorage.getItem('accessToken') == null) {
            window.location.href = "LoginPage.aspx";
        }
        $('#ErrorModal').on('hidden.bs.modal', function () {

            window.location.href = "LoginPage.aspx";
        });

        $('#btnlogout').click(function () {
            sessionStorage.removeItem('accessToken');
            window.location.href = "LoginPage.aspx";
        });

      
        $.ajax({
            url: 'api/Registration/Login',
            method: 'GET',
            
            headers: {
                'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken'),
                'Content-Type': 'application/json'
            },

            success: function (data) {
                //data = JSON.parse(data);
                $('#IntId').text(data.IntId);
                $('#username').text(data.StrUsername);
                $('#email').text(data.StrEmail);
                $('#password').text(data.StrPassword);
                $('#phone').text(data.StrContactNumber);
                $('#address').text(data.StrAddress);
                $('#role').text(data.StrType);

            
               
            },
            //complete: function (xmlHttp, status) {
            //    if (xmlHttp.status == 200) {
            //        $('#diverrortext').text(xmlHttp.responseText);
            //        $('#Errordiv').show('fade');

            //    }
            //},

           
            error: function (jqXHR) {
                if (jqXHR.status == "401") {
                    $('#ErrorModal').modal('show');
                }
                else {
                    $('#diverrortext').text(jqXHR.responseText);
                    $('#Errordiv').show('fade');
                }
            }
        });
        //});

    });
</script>