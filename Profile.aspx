

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
              <a href="UserList.aspx" class="list-group-item list-group-item-action">Userlist</a>
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
		                    <hr>
		                </div>
		            </div>
		            <div class="row">
		                <div class="col-md-12">
		                    
                             
                              <div class="form-group row">
                                <label for="name" class="col-4 col-form-label">Username</label> 
                                <div class="col-8">
                                  <input  id="username" class="form-control here" type="text" readonly="readonly" >
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="lastname" class="col-4 col-form-label">Email</label> 
                                <div class="col-8">
                                  <input id="email" name="lastname"  class="form-control here" type="text" readonly="readonly">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="text" class="col-4 col-form-label">Password</label> 
                                <div class="col-8">
                                  <input id="password"  class="form-control here" required="required" type="text" readonly="readonly">
                                </div>
                              </div>
                           
                              <div class="form-group row">
                                <label for="email" class="col-4 col-form-label">Contact Number</label> 
                                <div class="col-8">
                                  <input id="phone"  class="form-control here" required="required" type="text" readonly="readonly">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="website" class="col-4 col-form-label">Address</label> 
                                <div class="col-8">
                                  <input id="address"  class="form-control here" type="text" readonly="readonly">
                                </div>
                              </div>
                              <div class="form-group row">
                                <label for="publicinfo" class="col-4 col-form-label">Role</label> 
                                <div class="col-8">
                                  <input id="role"  class="form-control here" type="text" readonly="readonly">
                                </div>
                              </div>
                             
                              <div class="form-group row">
                                <div class="offset-4 col-8">
                                  <button name="submit" type="submit" class="btn btn-primary">Update My Profile</button>
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
       
        $.ajax({
            url: 'api/Registration/post/1',
            method: 'GET',
            
            headers: {
                'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken'),
                'Content-Type': 'application/json'
            },

            success: function (data) {
                
                //$.each(data, function (index, value) {

                //    var StrUsername = $(value.StrUsername);
                //    var StrEmail = $(value.StrUsername);
                //    var StrPassword = $(value.StrUsername);
                //    var StrContactNumber = $(value.StrUsername);
                //    var StrAddress = $(value.StrUsername);
                //    var StrType = $(value.StrUsername);

                //    $('#username').val(StrUsername);
                //    $('#email').val(StrEmail);
                //    $('#password').val(StrPassword);
                //    $('#phone').val(StrContactNumber);
                //    $('#address').val(StrAddress);
                //    $('#role').val(StrType);

                //});

                $('#username').val(data[0].StrUsername);
                console.log(data);
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