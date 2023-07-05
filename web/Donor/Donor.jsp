<%-- 
    Document   : Donor.jsp
    Created on : Mar 21, 2022, 12:43:00 AM
    Author     : lenovo
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
//    if(request.getSession(false).getAttribute("type")!=null){
//    //     this is comment for security purpose
//    if(request.getSession(false).getAttribute("type").toString().equalsIgnoreCase("donor")){
//      }
//        else{
//        request.getRequestDispatcher("Login.html").forward(request, response);
//        }
//    }
//    else{
//    String redirectURL = "http://localhost:8080/TheBloodDonationProject/";
//        response.sendRedirect(redirectURL);
//
//    }
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
        <!--Import Css File-->
        <link rel="stylesheet" href="donor.css">
        <title>Donor Site</title>
    </head>


    <body class="grey lighten-3">

        <%!
            int id;
            String password, name, lastname, phno, email, weight, age, gender, bloodgroup, document, spno, address, pincode, dob;
            boolean status;
            String area;

        %>
        <%
            String connectionString = "jdbc:mysql://localhost:3306/blooddonation?zeroDateTimeBehavior=CONVERT_TO_NULL";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con1 = DriverManager.getConnection(connectionString, "root", "");
            Statement stmt1 = con1.createStatement();
            ResultSet set = stmt1.executeQuery("SELECT `areaname` FROM `area` WHERE id = 1");
            set.next();
            area = set.getString(1);
        %>
        <%
            System.out.println("this is donor");
            if (request.getSession(false).getAttribute("type").toString().compareToIgnoreCase("donor") == 0) {
                id = (int) request.getSession(false).getAttribute("id");

                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/blooddonation?zeroDateTimeBehavior=CONVERT_TO_NULL";
                String sql = "SELECT `u_fname`, `u_lname`, `u_phno`, `u_email`,u_password FROM `user_master` WHERE u_id =" + id;
                String sql2 = "SELECT `d_weight`, `d_age`, `d_gender`, `d_bloodgroup`, `d_document`, `d_sphno`, `d_address`, `d_pincode`, `d_dob`, d_status FROM `donor_master` WHERE u_id = " + id;
                Connection con = DriverManager.getConnection(url, "root", "");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                rs.next();
                password = rs.getString("u_password");
                name = rs.getString(1);
                lastname = rs.getString(2);
                phno = rs.getString(3);
                email = rs.getString(4);
                rs = stmt.executeQuery(sql2);
                rs.next();
                weight = rs.getString(1);
                age = rs.getString(2);
                gender = rs.getString(3);
                bloodgroup = rs.getString(4);
                document = rs.getString(5);
                spno = rs.getString(6);
                address = rs.getString(7);
                pincode = rs.getString(8);
                dob = rs.getString(9);
                status = rs.getBoolean(10);

            } else {
                RequestDispatcher rd = request.getRequestDispatcher("Login.html");
                rd.forward(request, response);
            }
        %>

        <!--Header Section-->
        <div class="navbar-fixed">
            <nav class="red">
                <div class="container">
                    <div class="nav-wrapper">
                        <a href="#!" class="navlogo center-on-small-and-down  flow-text">The Blood Donation</a>
                        <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i
                                class="material-icons white-text">menu</i></a>
                        <ul class="right hide-on-med-and-down">
                            <li><a href="#home" onclick="home()">HOME</a></li>
                            <li><a href="#camplocation" onclick="updatecamplocation()">CAMP LOCATION</a></li>
                            <li><a href="#updateProfile" onclick="updateprofile()">UPDATE PROFILE</a></li>
                            <li><a href="#updateStatus" onclick="updatestatus()">UPDATE STATUS</a></li>
                            <li><a href="../LogOut">LOGOUT</a></li>
                        </ul>
                        <script>
                            function updatecamplocation() {
                                document.getElementById("donorHomesection").style.display = "none";
                                document.getElementById("camplocation-section").style.display = "block";
                                document.getElementById("updateinfo-section").style.display = "none";
                                document.getElementById("updatestatus-section").style.display = "none";
                            }
                        </script>
                    </div>
                </div>
            </nav>
        </div>
        <ul class="sidenav" id="mobile-demo">
            <li><a href="#home" onclick="home()">HOME</a></li>
            <li><a href="#camplocation" onclick="updatecamplocation()">CAMP LOCATION</a></li>
            <li><a href="#updateProfile" onclick="updateprofile()">UPDATE PROFILE</a></li>
            <li><a href="#updateStatus" onclick="updatestatus()">UPDATE STATUS</a></li>
            <li><a href="#logout">LOGOUT</a></li>
        </ul>

        <!--Home section-->
        <section id="donorHomesection" class="section">
            <section class="section home-section">
                <div class="container">
                    <h4 class="sectionheading center red-text flow-text">
                        Give Blood
                    </h4>
                    <p class="sectioncontent  center flow-text">
                        Patient Need Your Help.
                    </p>
                </div>
            </section>

            <!--Requirement Section-->
            <section class="section requirement-section white">

                <div class="container">


                    <h4 class="sectionheading flow-text">
                        Requirements by blood donation type
                    </h4>
                    <p class="requirement-section-content">
                        These are some of the requirements donors must meet to be eligible to donate blood based on
                        their
                        donation type.
                    </p>
                    <h5 class="requirement-section-listHead">Blood Donation</h5>
                    <ul class="sectioncontent">
                        <li><i class="material-icons red-text">chevron_right</i>Donation frequency: Every 56 days*</li>
                        <li><i class="material-icons red-text">chevron_right</i>You must be in good health and feeling
                            well**</li>
                        <li><i class="material-icons red-text">chevron_right</i>You must be at least 18 years old</li>
                        <li><i class="material-icons red-text">chevron_right</i>You must weigh at least 110 lbs</li>

                    </ul>
                    <p class="sectioncontent #212121-text">
                        If you have any questions regarding your eligibility, please call us at (123) 456 7890
                    </p>
                </div>
            </section>

        </section>

        <!--Camplocation Section-->
        <section id="camplocation-section" class="section camplocation-section grey lighten-3">
            <div class="container">
                <div class="row">
                    <div class="col m9 offset-m2">
                        <div class="card updatecamp-card center">
                            <div class="card-title">
                                <h5>Update Camp Location</h5>
                            </div>
                            <div class="card-content">
                                <div class="form">
                                    <form action="../upd" method="POST">
                                        <div class="row">
                                            <div class="col s12">
                                                <div class="input-field col s12">
                                                    <textarea name="ucamplocation" id="textarea1" 
                                                              class="materialize-textarea" required> <%=area%> </textarea>
                                                    <label for="ucamplocation">Camp Location</label>
                                                </div>

                                            </div>
                                        </div>

                                    </form>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </section>

        <!--Update Info Section-->
        <section id="updateinfo-section" class="section updateinfo-section grey lighten-3 ">
            <div class="container">
                <div class="row">
                    <div class="col m10 offset-m1">
                        <div class="card updateinfo-card">
                            <div class="card-title">
                                <h5>Update Profile</h5>
                            </div>
                            <div class="card-content ">
                                <div class="form">
                                    <form action="../udo" method="post" enctype="multipart/form-data">
                                        <div class="row">
                                            <input type="text" value="<%=id%>" name="id" hidden>
                                            <div class="col s12 m6">
                                                <div class="input-field col s12">
                                                    <input type="text" name="fname" value="<%= name%>" required>
                                                    <label for="fname">First Name</label>
                                                </div>
                                            </div>
                                            <div class="col s12 m6">
                                                <div class="input-field col s12">
                                                    <input type="text" name="lname" value="<%=lastname%>" required>
                                                    <label for="lname">Last Name</label>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col s12 m6">
                                                <div class="input-field col s12">
                                                    <input type="tel" maxlength="10" minlength="10" name="phno"  value="<%=phno%>" required>
                                                    <label for="phno">Phone no</label>
                                                </div>
                                            </div>
                                            <div class="col s12 m6">
                                                <div class="input-field col s12">
                                                    <input type="tel" name="sphno" minlength="10" maxlength="10" value="<%=spno%>">
                                                    <label for="sphno">Secound Phone no</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col s12 m6">

                                                <div class="input-field col s12">
                                                    <input type="email" name="email" class="validate" value="<%=email%>" required>
                                                    <label for="email">E mail</label>
                                                </div>
                                            </div>
                                            <div class="col s12 m6">
                                                <div class="input-field col s12">
                                                    <input type="text" name="pwd" value="<%=password%>" required>
                                                    <label for="pwd">Password</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col s12 m6">
                                                <div class="input-field col s12">
                                                    <input type="text"  name="date" id="date" value="<%=dob%>" required>
                                                    <label for="date">Birthdate</label>
                                                </div>

                                            </div>
                                            <div class="col s12 m6">
                                                <div class="input-field col s12">
                                                    <input type="number" name="pincode" value="<%=pincode%>" required >
                                                    <label for="uage">Pincode</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col s12 m6">
                                                <div class="input-field col s12">
                                                    <p>Gender</p>
                                                    <p>
                                                        <span>
                                                            <label>
                                                                <input class="with-gap" name="gender" type="radio" value="male" checked
                                                                       required />
                                                                <span>Male</span>
                                                            </label>
                                                        </span>
                                                        <span>
                                                            <label>
                                                                <input class="with-gap" name="gender" type="radio" value="female"
                                                                       required />
                                                                <span>Female</span>
                                                            </label>
                                                        </span>
                                                        <span>
                                                            <label>
                                                                <input class="with-gap" name="gender" type="radio" value="other"
                                                                       required />
                                                                <span>Other</span>
                                                            </label>
                                                        </span>

                                                    </p>

                                                </div>
                                            </div>
                                            <div class="col s12 m6">
                                                <div class="input-field col s12">
                                                    <input type="number" name="weight" value="<%=weight%>" required>
                                                    <label for="weight">Weight</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col s12 m6">
                                                <div class="input-field col s12">

                                                    <select name="bloodgroup">
                                                        <option value="A+" selected >A+</option>
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

                                                    <!--                                                    <div class="file-field input-field">
                                                                                                            <div class="btn red ">
                                                                                                                <span>File</span>
                                                                                                                <input type="file">
                                                                                                            </div>
                                                                                                            <div class="file-path-wrapper">
                                                                                                                <input name="filename" class="file-path validate" type="text" 
                                                                                                                       placeholder="<%=document%> " disabled="true">
                                                                                                            </div>
                                                    
                                                                                                        </div>-->
                                                    <div class="col s12 m6">
                                                        <div class="input-field col s12">
                                                            <input type="text" name="s1" value="<%= status%>" required>
                                                            <label for="s1">Status</label>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="input-field col s12 ">
                                                <!--                                                <textarea name="uaddress" id="textarea1"  class="materialize-textarea"
                                                                                                          value=""></textarea></textarea>-->

                                                <input type="text" value ="<%=address%>" name = "address">
                                                <label for="address">Address</label>
                                            </div>
                                        </div>
                                        <div class="card-action center">
                                            <button class="btn waves-effect red" type="submit" onclick="alert('Update Successfully')">Save Changes</button>
                                        </div>

                                    </form>
                                </div>

                            </div>

                        </div>
                    </div>
                    </section>


                    <!--Update Status Section-->
                    <section id="updatestatus-section" class="section updatestatus-section grey lighten-3">
                        <div class="container">
                            <div class="row">
                                <div class="col m8 s12 offset-m2">
                                    <div class="card updatestatus-card">
                                        <div class="card-title">
                                            <h5>Update Status</h5>
                                        </div>
                                        <div class="card-content">

                                            <!--                                            <div class="switch">
                                                                                            <label>
                                                                                                <span class="switch-text">Not-avaliable</span>
                                                                                                <input type="checkbox">
                                                                                                <span class="lever"></span>
                                                                                                <span class="switch-text">Avaliable</span>
                                                                                            </label>
                                                                                        </div>-->
                                            <%

                                                if (status) {
                                                    out.print("<button class='waves-effect green btn' bgcolor='gree' type='button' id='btn' name='sk' value='' >available</button>");
                                                } else {
                                                    out.print("<button class='waves-effect orange btn' bgcolor='red' type='button' id='btn' name='sk' value=''> not available</button> ");
                                                }
                                            %>
                                            <script>
                                                const btn = document.getElementById("btn");

                                                let boole = <%=status%>;
                                                btn.addEventListener("click", () => {
                                                    boole = !boole;
                                                    window.location.replace("../fun.jsp?name=" + boole);
                                                    if (boole) {
                                                        btn.innerText = "availabel";
                                                        btn.value = boole;

                                                    } else {
                                                        btn.innerText = "not availabel";
                                                        btn.valu = boole;
                                                    }
                                                });
                                                //    let testBool = true;
//          document.getElementById('skand').onclick = changeColor;     
//    function changeColor() {
//        testBool = !testBool;
//        document.test.elements["sk"].value = "skand";
//        
//              
//            console.log('Toggled bool is',
//                                testBool);
//        return false;
//    }     
//        
//          
//        console.log('Default value of bool is',
//                                   testBool);
//      
//        function toggle() {
//            testBool = !testBool;
//              
//            console.log('Toggled bool is',
//                                testBool);
//        }
                                            </script>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- Compiled and minified JavaScript -->
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
                    <script src="donor.js"></script>
                    </body>

                    </html>
