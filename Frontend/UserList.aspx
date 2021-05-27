<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="WEBAPI.UserList" %>



<!DOCTYPE html>

<html>
<head> <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
            
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
              <a href="Profile.aspx" class="list-group-item list-group-item-action">Personal Information</a>
              <a href="UserList.cshtml" class="list-group-item list-group-item-action active">Userlist</a>
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
		                    <h4 style="font-weight:bold"> User list</h4>
		                    <hr>
		                </div>
		            </div>
		            <div class="row">
		                <div class="col-md-12">
		                   <table class="table table-bordered" id="tbluserlist">
                               <thead>
                                   <tr>
                                       <th>
                                           Id
                                       </th>
                                       <th>UserName</th>
                                       <th>Email</th>
                                       <th>Password</th>
                                       <th>Contact Number</th>
                                       <th>Address</th>
                                       <th>Role</th>
                                       <th><button  data-toggle="modal" data-target="#ErrorModal">te</button></th>
                                       <th>Delete</th>
                                      

                                   </tr>
                               </thead>
                               <tbody id="tblbody">
                               </tbody>
		                   </table>                            
		                </div>
		            </div>
		            
		        </div>
		    </div>
		</div>
	</div>
</div>
        <div class="modal fade" tabindex="-1" id="editmodal" data-keyboard="false" data-backdrop="static">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                             <h4 class="modal-title">Update User</h4>
                            <Button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                 <span aria-hidden="true">&times;</span>
                            </Button>
                           
                        </div>
                        <div class="modal-body">
                              <div class="row">
                                    <h1>test</h1>
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
        
    </form>

</body>
</html>


<script type="text/javascript">
    $(document).ready(function () {
   
       

        $.ajax({
            url: '../api/Registration/GetAll',
            method: 'GET',

            headers: {
                'Authorization': 'Bearer ' + sessionStorage.getItem('accessToken'),
                'Content-Type': 'application/json'
            },

            success: function (data) {

                $.each(data, function (index, value) {
                    var id = value.IntId
                    var row = $('<tr><td>' + value.IntId + '</td><td>'
                        + value.StrUsername + '</td><td>'
                        + value.StrEmail + '</td><td>'
                        + value.StrPassword + '</td><td>'
                        + value.StrContactNumber + '</td><td>'
                        + value.StrAddress + '</td><td>'
                        + value.StrType + '</td><td>' + '<button id="btnupdatefromtbl"  class="btn btn-info"><span class="glyphicon glyphicon-edit"></span></button>'+
                        '</td><td>' + '<a href="Delete?' + value.IntId +'" class="btn btn-info"><span class="glyphicon glyphicon-trash"></span></a>'+'</td><td>');

                    $('#tbluserlist').append(row);

                   
                });

              

            },
          
            error : function(jqXHR) {
                if (jqXHR.status == "401") {
                    $('#ErrorModal').modal('show');
                }
                else {
                    $('#diverrortext').text(jqXHR.responseText);
                    $('#Errordiv').show('fade');
                }
            },
        });

        $("#btnupdatefromtbl").click(function () {
            $("#editmodal").modal();
        });

    });
</script>