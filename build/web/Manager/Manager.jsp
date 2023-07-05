<%-- 
    Document   : Manager.jsp
    Created on : Mar 21, 2022, 12:43:28 AM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //     this is comment for security purpose
    if (request.getSession(false).getAttribute("type").toString().equalsIgnoreCase("manager")) {
    } else {
        request.getRequestDispatcher("Login.html").forward(request, response);
    }
%>
<!DOCTYPE html>
<html>

    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="manager.css">
    </head>

    <body class="grey lighten-3">
        <!--Header Section-->

        <div class="navbar-fixed header-section">
            <nav class="red">
                <div class="container">
                    <div class="nav-wrapper">
                        <div class="row">
                            <div class="col s12">
                                <a href="#" data-target="sidenav-1" class="left sidenav-trigger hide-on-medium-and-up"><i
                                        class="material-icons white-text">menu</i></a>
                                <a href="#" class="navlogo center flow-text">The Blood Donation</a>

                            </div>
                        </div>

                    </div>
                </div>
            </nav>
        </div>
        <ul class="sidenav sidenav-fixed" id="sidenav-1">
            <li><a href="#home" onclick="home()">HOME</a></li>
            <li><a href="#updateProfile" onclick="adddonor()">ADD BLOOD DONOR</a></li>
            <li><a href="#updateStatus" onclick="addpackage()">ADD BLOOD PACKAGE</a></li>
            <li><a href="#updateStatus" onclick="updatestatus()">UPDATE DONOR'S STATUS</a></li>
            <li><a href="#profile" onclick="updatebloodgroup()">UPDATE BLOOD GROUP</a></li>
            <li><a href="../LogOut">LOGOUT</a></li>
        </ul>
        <!--Home section-->
        <section id="home" class="section home-section">
            <div class="container">
                <img class="responsive-img" src="homePage.jpg" alt="">
            </div>
        </section>

        <!--Add New Donor Section-->
        <section id="adddonor-section" class="section adddonor-section ">
            <div class="container">
                <div class="row">
                    <div class="col m10 s12 offset-m1">
                        <div class="card adddonor-card">
                            <div class="card-title center">
                                <h5>Blood Donor</h5>
                            </div>
                            <div class="card-content ">
                                <div class="form">
                                <form action="../mdu" method="POST" enctype="multipart/form-data">

                                    <div class="row">
                                        <div class="input-field col s12 #b71c1c">
                                            <input type="text" name="fname">
                                            <label for="fname">First Name</label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="input-field col s12">
                                            <input type="text" name="lname">
                                            <label for="lname">Last Name</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <input type="email" name="email" class="validate">
                                            <label for="email">E mail</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <input type="password" name="pwd" id="txtNewPassword">
                                            <label for="pwd">Password</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <input type="password" name="rpwd" id="txtConfirmPassword" onChange="isPasswordMatch();">
                                            <label for="rpwd">Confirm Password</label>
                                        </div>
                                    </div>
                                    <div id="divCheckPassword"></div>
                                     <script src="jquery-3.6.0.min.js"></script>
                                    <script>
                                        
                                        $('#txtConfirmPassword').on('keyup', function () {
                                            $('#hulk').attr("disabled", true);
                                            var password = $("#txtNewPassword").val();
                                            var confirmPassword = $("#txtConfirmPassword").val();

                                            if (password != confirmPassword) {
                                                $("#divCheckPassword").html("Passwords do not match!");
                                            } else {
                                                $("#divCheckPassword").html("Passwords match.");
                                                $("#hulk").removeAttr("disabled");
                                            }
                                        });
                                    </script>
                                    <!--                                <div class="row">
                                                                        <div class="input-field col s12">
                                                                            <input type="number" name="age">
                                                                            <label for="age">Age</label>
                                                                        </div>
                                                                    </div>-->
                                    <div class="row">
                                        <div class="input-field col s5">
                                            <select name="bloodgroup">
                                                <option value="A+" selected>A+</option>
                                                <option value="A-" class="red-text">A-</option>
                                                <option value="B+">B+</option>
                                                <option value="B-">B-</option>
                                                <option value="O+">O+</option>
                                                <option value="O-">O-</option>
                                                <option value="AB+">AB+</option>
                                                <option value="AB-">AB-</option>

                                            </select>
                                            <label>Blood Group</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <input type="number" name="weight">
                                            <label for="bg">Weight</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <p>Gender</p>
                                            <p>
                                                <span>
                                                    <label>
                                                        <input class="with-gap" name="gender" type="radio" value="male" />
                                                        <span>Male</span>
                                                    </label>
                                                </span>
                                                <span>
                                                    <label>
                                                        <input class="with-gap" name="gender" type="radio" value="female"/>
                                                        <span>Female</span>
                                                    </label>
                                                </span>
                                                <span>
                                                    <label>
                                                        <input class="with-gap" name="gender" type="radio" value="other" />
                                                        <span>Other</span>
                                                    </label>
                                                </span>

                                            </p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <p>Date of birth</p>
                                            <input type="date"  name="date">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <textarea name="address" id="textarea1" class="materialize-textarea"></textarea>
                                            <label for="address">Address</label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="input-field col s12">
                                            <input type="number" name="pin">
                                            <label for="no">Pin Code</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <input type="number" name="phno" maxlength="10">
                                            <label for="phno">Phone no</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <input type="number" name="sphno" minlength="10" maxlength="10">
                                            <label for="sphno">Secound Phone no</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <div class="file-field input-field">
                                                <div class="btn red ">
                                                    <span>File</span>
                                                    <input type="file" name="filename" required>
                                                </div>
                                                <div class="file-path-wrapper">
                                                    <input  class="file-path validate" type="text"
                                                            placeholder="Upload Your Document ">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <button class="btn waves-effect red" type="submit" name="regBtn" onclick="alert('Registered Successfully')" id="hulk">Submit

                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>


                            </div>

                        </div>
                    </div>
                    </section>

                    <!--Add Blood Package-->
                    <section id="addbloodpackage-section" class="addbloodpackage section">
                        <div class="conatiner center">
                            <div class="row">
                                <div class="col m10 s12 offset-m1">
                                    <div class="card updatebgroup-card">
                                        <div class="card-title">
                                            <h5>Add Blood Package</h5>
                                        </div>
                                        <div class="card-content center">
                                            <div class="form">
                                                <form method="post" action="../Abp">
                                                <div class="row">
                                                    <div class="col s12 m6">
                                                        <div class="input-field col s12">
                                                            <input name="fname" type="text">
                                                            <label for="fname">First Name</label>
                                                        </div>
                                                    </div>

                                                    <div class="col s12 m6">
                                                        <div class="input-field col s12">
                                                            <input name="lname" type="text">
                                                            <label for="lname">Last Name</label>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col s12 m6">
                                                        <div class="input-field col s12">
                                                            <input name="phno" type="text">
                                                            <label for="phno">Phone No</label>
                                                        </div>
                                                    </div>
                                                    <div class="col s12 m6">
                                                        <div class="input-field col s12">
                                                            <input type="number" name="age">
                                                            <label for="age">Age</label>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col s12 m6">
                                                        <div class="input-field col s12">
                                                            <select name="bloodgroup">
                                                                <option value="A+"  selected>A+</option>
                                                                <option value="A-" class="red-text">A-</option>
                                                                <option value="B+">B+</option>
                                                                <option value="B-">B-</option>
                                                                <option value="O+">O+</option>
                                                                <option value="O-">O-</option>
                                                                <option value="AB+">AB+</option>
                                                                <option value="AB-">AB-</option>
                                                            </select>
                                                            <label>Blood Group</label>
                                                        </div>

                                                    </div>
                                                    <div class="col s12 m6">
                                                        <div class="input-field col s12">
                                                            <input type="text" class="datepicker" id="dbdate" name="date">
                                                            <label for="date">Collection Date</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col s12 m6">
                                                        <div class="input-field  s12">
                                                            <input type="number" name="weight">
                                                            <label for="weight">Weight </label>
                                                        </div>
                                                    </div>
                                                    <div class="col s12 m6">
                                                        <div class="input-field  s12">
                                                            <input type="text" name="dname">
                                                            <label for="dname">Doctor Name </label>
                                                        </div>
                                                    </div>
                                               
                                                </div>
                                                
                                            </div>
                                        </div>

                                        <div class="card-action center">
                                            <button class="btn waves-effect red" type="submit" name="addbloodpackagebutton">Add blood package</button>
                                        </div></form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>


                    <!--Update Blood Group-->
                    <section id="updatebloodgroup-section" class="updatebgroup section">
                        <div class="conatiner center">
                            <div class="row">
                                <div class="col m5 s12 offset-m3">
                                    <div class="card updatebgroup-card">
                                        <div class="card-title">
                                            <h5>Update Blood Group</h5>
                                        </div>
                                        <div class="card-content center">
                                            <div class="form">
                                                <div class="row">
                                                    <div class="input-field col m12 s12 ">
                                                        <input type="text" name="phoneno" pattern="[6-9]{1}[0-9]{9}" maxlength="10">
                                                        <label for="phoneno">Phone Number</label>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="input-field col s12">
                                                        <select>
                                                            <option value="A+" selected>A+</option>
                                                            <option value="A-" class="red-text">A-</option>
                                                            <option value="B+">B+</option>
                                                            <option value="B-">B-</option>
                                                            <option value="O+">O+</option>
                                                            <option value="O-">O-</option>
                                                            <option value="AB+">AB+</option>
                                                            <option value="AB-">AB-</option>

                                                        </select>
                                                        <label>Blood Group</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-action center">
                                            <button class="btn waves-effect red" name="updaetbloodgroupbtn" onclick='alert("updation being done")'>Update Blood group</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!--Update Blood Status-->
                    <section id="updatestatus-section" class="updatebgroup section">
                        <div class="conatiner">
                            <div class="row">
                                <div class="col m5 s12 offset-m3">
                                    <div class="card updatebgroup-card">
                                        <div class="card-title center">
                                            <h5>Update Donor's Status</h5>
                                        </div>
                                        <div class="card-content">
                                            <form id="demoForm" method="post">
                                                <div class="row ">
                                                    <div class="input-field col s12 ">
                                                        <input type="tel" name="phoneno" maxlength="10">
                                                        <label for="phoneno">Phone
                                                            Number</label>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="input-field col s12">
                                                         <div class="input-field col s12">
                                                            <select name="status">
                                                                <option value="true"  selected>available</option>
                                                                <option value="false" class="red-text">not available</option>
                                                                
                                                            </select>
                                                            <label>Status</label>

                                                    </div>
                                                </div>
                                          

                                        </div>
                                        <div class="card-action center">
                                            <button class="btn waves-effect red" name="updatestatusbtn" onclick='alert("updation being done")'>Update Status</button>
                                        </div>
                                            </form>
                                    </div>
                                </div>
                            </div>
                    </section>



                    <!-- Compiled and minified JavaScript -->
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
                    <script src="manager.js"></script>
                    </body>

                    </html>