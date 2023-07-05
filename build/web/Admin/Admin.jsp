<%-- 
    Document   : Admin.jsp
    Created on : Mar 21, 2022, 12:44:49 AM
    Author     : lenovo
--%>

<%@page import="java.sql.*"%>
<%@page errorPage="../Error.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //     this is comment for security purpose
    if (request.getSession(false).getAttribute("type").toString().equalsIgnoreCase("admin")) {
    } else {
        response.sendRedirect("http://localhost:8080/TheBloodDonationProject/");
    }
%>
<!DOCTYPE html>
<html>

    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <link rel="stylesheet" href="admin.css">
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>

    <body class="grey lighten-3">
        <!--SIDE NAVBAR-->
        <div class="navbar-fixed header-section">
            <nav class="red">
                <div class="container">
                    <div class="nav-wrapper">
                        <div class="row">
                            <div class="col s12">
                                <a href="#" data-target="sidenav-1" class="left sidenav-trigger hide-on-medid-and-up"><i
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
            <li><a href="#updateStatus" onclick="eligible()">ELIGIBLE DONOR</a></li>
            <li><a href="#updateStatus" onclick="report()">GENERATE REPORT</a></li>
            <li><a href="#updateStatus" onclick="manager()">MANAGE MANAGER</a></li>
            <li><a href="#updateStatus" onclick="blood()">MANAGE BLOOD DONOR</a></li>
            <li><a href="#camplocation" onclick="camplocation()">UPDATE CAMP LOCATION</a></li>
            <li><a href="../LogOut">LOGOUT</a></li>
        </ul>


        <!--Home Section-->
        <section id="home-section" class="section homesection">

            <div class="container center">
                <h3>
                    Welcome Admin
                </h3>
            </div>

        </section>


        <!--Generate Report-->
        <section class="report-section section" id="report-section">
            <div class="container">
                <div class="row">
                    <div class="card  managedonorcard">
                        <div class="card-title grey lighten-4">
                            <div class="row">
                                <div class="col s12">
                                    <h6 class="left">Generate Report</h6>

                                </div>
                            </div>
                        </div>
                        <div class="card-content">
                            <div class="scroll">
                                <table class="striped table-sortable">

                                    <!--                                    <thead>
                                                                            <tr>
                                                                                <th>Pincode</th>
                                                                                <th>Count</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>380004</td>
                                                                                <td>5</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>380001</td>
                                                                                <td>3</td>
                                                                            </tr>
                                                                             <tr>
                                                                                <td>380016</td>
                                                                                <td>1</td>
                                                                            </tr>
                                    
                                                                        </tbody>-->
                                    <%!
                                        String url;
                                        Connection con;
                                        ResultSet rs;
                                    %>
                                    <%
                                        Class.forName("com.mysql.jdbc.Driver");
                                        url = "jdbc:mysql://localhost:3306/blooddonation?zeroDateTimeBehavior=CONVERT_TO_NULL";
                                        con = DriverManager.getConnection(url, "root", "");
                                        rs = con.createStatement().executeQuery("select d_pincode , count(*) from donor_master where d_status = true GROUP by d_pincode ORDER by count(*) DESC;");
                                        out.print("<table border=1>");
                                        out.print("<tr>");
                                        out.print("<th>");
                                        out.print("Pincodes");
                                        out.print("</th>");
                                        out.print("<th>");
                                        out.print("Count");
                                        out.print("</th>");
//                out.print("<td>");
//                out.print("check records");
//                out.print("</td>");
                                        out.print("</tr>");
                                        while (rs.next()) {
                                            out.print("<tr>");
                                            out.print("<th>");
                                            out.print(rs.getString(1));
                                            out.print("</td>");
                                            out.print("<th>");
                                            out.print(rs.getString(2));
                                            out.print("</td>");
//                    out.print("<th>");
//                    out.print("<a href='pin?i=" + rs.getString(1) + "'>click here</a>");
//                    out.print("</th>");
                                            out.print("</tr>");
                                        }
                                        out.print("</table>");

                                    %>
                                    <%//                                      Class.forName("com.mysql.jdbc.Driver");
//
//            String url = "jdbc:mysql://localhost:3306/blooddonation?zeroDateTimeBehavior=CONVERT_TO_NULL";
//
//            Connection con = DriverManager.getConnection(url, "root", "");
//
//            ResultSet rs = con.createStatement().executeQuery("select d_pincode , count(*) from donor_master where d_status = true GROUP by d_pincode ORDER by count(*) DESC;");
//            out.print("<table border=1>");
//            out.print("<tr>");
//            out.print("<td>");
//            out.print("pincodes");
//            out.print("</td>");
//             out.print("<td>");
//            out.print("active donor count");
//            out.print("</td>");
//            out.print("<td>");
//            out.print("check records");
//            out.print("</td>");
//            out.print("</tr>");
//            while(rs.next()){
//            out.print("<tr>");
//            out.print("<th>");
//            out.print(rs.getString(1));
//            out.print("</td>");
//            out.print("<th>");
//            out.print(rs.getString(2));
//            out.print("</td>");
//            out.print("<th>");
//            out.print("<a href='pin?i="+ rs.getString(1) +"'>click here</a>");
//            out.print("</th>");
//            out.print("</tr>");
//            }
//            out.print("</table>");    
                                    %>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!--Update Camp Location-->
        <section id="updatecamp-location" class="section updatecamplocationsection">
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
                                                              class="materialize-textarea" required></textarea></textarea>
                                                    <label for="ucamplocation">Camp Location</label>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="card-action">
                                            <button class="btn waves-effect waves-light red white-text submitbtn" type="submit"
                                                    name="action">Submit</button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
        </section>


        <!--MAnage Donor MODULE-->
        <!--Manage Blood Donor-->
        <section id="manageblood-donor" class="section manageblooddonor-section">
            <div class="container">
                <div class="card  managedonorcard">
                    <div class="card-title grey lighten-4">
                        <div class="row">
                            <div class="col s12">
                                <h6 class="left">List Of Donor</h6>

                            </div>
                        </div>
                    </div>
                    <div class="card-content">
                        <div class="scroll">
                            <table class="striped">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>First Name </th>
                                        <th>Last Name</th>
                                        <th>Phono </th>
                                        <th>Email</th>
                                        <th>password</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        String sqlaw = "SELECT * FROM `user_master` WHERE u_type='donor'";
                                        Statement stmt7 = con.createStatement();
                                        ResultSet set3 = stmt7.executeQuery(sqlaw);
                                        while (set3.next()) {
                                    %>  
                                    <tr><td><%=set3.getString(1)%></td>
                                        <td><%=set3.getString(2)%></td>
                                        <td><%=set3.getString(3)%></td>
                                        <td><%=set3.getString(4)%></td>
                                        <td><%=set3.getString(5)%></td>
                                        <td><%=set3.getString(6)%></td>
                                         <td>
<!--                                                                        <a href="#modal4"
                                                                           class="waves-effect waves-light btn-small modal-trigger light-blue darken-4">Update</a>-->
                                                                           <a href="../ded?id=<%=set3.getString(1)%>&v=donor" class="waves-effect waves-light btn-small  red">Delete</a>
                                                                    </td>
                                    </tr>
                                    <%
                                        }

                                    %>


                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div id="modal1" class="modal modal-fixed-header modal-fixed-footer">
            <div class="modal-header grey lighten-3">
                <h5>Update Info</h5>
            </div>
            <div class="modal-content">
                <div class="container">
                    <form action="updateinfo" method="post">
                        <div class="row">
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="text" name="dfname" value="" required>
                                    <label for="dfname">First Name</label>
                                </div>
                            </div>
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="text" name="dlname" value="" required>
                                    <label for="dlname">Last Name</label>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="tel" name="dphno" maxlength="10" value="" required>
                                    <label for="dphno">Phone no</label>
                                </div>
                            </div>
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="tel" name="dsphno" minlength="10" maxlength="10" value="">
                                    <label for="dsphno">Secound Phone no</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12 m6">

                                <div class="input-field col s12">
                                    <input type="email" name="demail" class="validate" value="" required>
                                    <label for="demail">E mail</label>
                                </div>
                            </div>
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="password" name="dpwd" value="" required>
                                    <label for="dpwd">Password</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="text" class="datepicker" id="dbdate" value="" required>
                                    <label for="dbdate">Birthdate</label>
                                </div>

                            </div>
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="number" name="dage" value="" required>
                                    <label for="dage">Age</label>
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
                                                <input class="with-gap" name="gender" type="radio" value="" required />
                                                <span>Male</span>
                                            </label>
                                        </span>
                                        <span>
                                            <label>
                                                <input class="with-gap" name="gender" type="radio" value="" required />
                                                <span>Female</span>
                                            </label>
                                        </span>
                                        <span>
                                            <label>
                                                <input class="with-gap" name="gender" type="radio" value="" required />
                                                <span>Other</span>
                                            </label>
                                        </span>

                                    </p>
                                </div>
                            </div>
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="number" name="dweight" value="" required>
                                    <label for="dweight">Weight</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12 m6">
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
                            <div class="col s12 m6">

                                <div class="input-field col s12">

                                    <div class="file-field input-field">
                                        <div class="btn red ">
                                            <span>File</span>
                                            <input type="file">
                                        </div>
                                        <div class="file-path-wrapper">
                                            <input name="filename" class="file-path validate" type="text"
                                                   placeholder="Upload Your Document ">
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12 ">
                                <textarea name="daddress" id="textarea1" class="materialize-textarea" value=""
                                          required></textarea></textarea>
                                <label for="daddress">Address</label>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer grey lighten-3">
                <a href="#!" class="modal-close waves-effect waves-green btn-flat">ADD</a>
                <a href="#!" class="modal-close waves-effect waves-green btn-flat">Cancel</a>
            </div>

        </div>


        <!--ELigible Donor MODULE-->
        <!--Eligible Donor-->
        <section id="eligible-section" class="section eligible-section">
            <div class="container">
                <div class="card  managedonorcard">
                    <div class="card-title grey lighten-4">
                        <div class="row">
                            <div class="col s12">
                                <h6 class="left">List Of New Donor</h6>
                                <a class="waves-effect waves-light btn modal-trigger right red" href="#modal2"><i
                                        class="material-icons left">add</i>New Donor</a>
                            </div>
                        </div>
                    </div>
                    <div class="card-content">
                        <div class="scroll">
                            <table class="striped">
                                <!--                            <thead>
                                                                <tr>
                                                                    <th>No</th>
                                                                    <th>Donor</th>
                                                                    <th>Blood Group</th>
                                                                    <th>Information</th>
                                                                    <th>Docudent</th>
                                                                    <th>Action</th>
                                                                </tr>
                                                            </thead>-->
                                <!--                            <tbody>
                                                                <tr>
                                                                    <td>1</td>
                                                                    <td>Sweta &nbsp;Rathod</td>
                                                                    <td>B-</td>
                                                                    <td>
                                                                        Email: &nbsp;swetarathod910@gmail.com <br>
                                                                        Phone No:&nbsp;8347406010 <br>
                                                                        Date of Birth:&nbsp;02/06/2002 <br>
                                                                        Gender:&nbsp; Female <br>
                                                                        Weight:&nbsp; 50 <br>
                                                                        Address:&nbsp; dsdsdkdjkdjkdjkdjkjkdksdkddjk <br>
                                                                    </td>
                                                                    <td>dsdsdssssssssssssssssssssssssssssssssssssss</td>
                                                                    <td>
                                                                        <a class="waves-effect waves-light btn-small light-blue darken-4">Qualify</a>
                                                                        <a class="waves-effect waves-light btn-small  red">Disqualify</a>
                                                                    </td>
                                                                </tr>
                                
                                                            </tbody>-->


                                <%                                    String url = "jdbc:mysql://localhost:3306/blooddonation?zeroDateTimeBehavior=CONVERT_TO_NULL";
                                    String query = "select * from registration_master where 1";
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection(url, "root", "");
                                    Statement stmt = con.createStatement();
                                    ResultSet rs = stmt.executeQuery(query);
                                    ResultSetMetaData rsmd = rs.getMetaData();
                                    out.print("<table border='1'>");
                                    out.print("<tr>");
                                    for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                                        out.print("<th>");

                                        out.print(rsmd.getColumnName(i));
                                        out.print("</th>");
                                    }
                                    out.print("<th>");
                                    out.print("Action");
                                    out.print("</th>");
                                    out.print("</tr>");

                                    while (rs.next()) {
                                        out.print("<tr>");
                                        for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                                            out.print("<td>");
                                            if (i == 11) {
                                                out.print("<a href='../dis?i=" + rs.getString(1) + "' >click here</a>");
                                            } else {
                                                out.print(rs.getString(i));
                                            }
                                            out.print("</td>");
                                        }
                                        out.print("<td>");

                                        out.print("<a href='../Eli?i=" + rs.getString(1) + "'>");
                                        out.print("Eligible");
                                        out.print("</a>");
                                        out.print("</td>");
                                        out.print("</tr>");
                                    }
                                %>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--Edit Donor Model-->
        <div id="modal2" class="modal modal-fixed-header modal-fixed-footer">
            <div class="modal-header grey lighten-3">
                <h5>New Donor</h5>
            </div>
            <div class="modal-content">
                <div class="container">
                    <form action="updateinfo" method="post">
                        <div class="row">
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="text" name="udfname" value="" required>
                                    <label for="udfname">First Name</label>
                                </div>
                            </div>
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="text" name="udlname" value="" required>
                                    <label for="udlname">Last Name</label>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="tel" name="udphno" maxlength="10" value="" required>
                                    <label for="udphno">Phone no</label>
                                </div>
                            </div>
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="tel" name="udsphno" minlength="10" maxlength="10" value="">
                                    <label for="udsphno">Secound Phone no</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12 m6">

                                <div class="input-field col s12">
                                    <input type="email" name="udemail" class="validate" value="" required>
                                    <label for="udemail">E mail</label>
                                </div>
                            </div>
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="password" name="udpwd" value="" required>
                                    <label for="udpwd">Password</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="text" class="datepicker" id="udbdate" value="" required>
                                    <label for="udbdate">Birthdate</label>
                                </div>

                            </div>
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="number" name="udage" value="" required>
                                    <label for="udage">Age</label>
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
                                                <input class="with-gap" name="gender" type="radio" value="" required />
                                                <span>Male</span>
                                            </label>
                                        </span>
                                        <span>
                                            <label>
                                                <input class="with-gap" name="gender" type="radio" value="" required />
                                                <span>Female</span>
                                            </label>
                                        </span>
                                        <span>
                                            <label>
                                                <input class="with-gap" name="gender" type="radio" value="" required />
                                                <span>Other</span>
                                            </label>
                                        </span>

                                    </p>
                                </div>
                            </div>
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="number" name="udweight" value="" required>
                                    <label for="udweight">Weight</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12 m6">
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
                            <div class="col s12 m6">

                                <div class="input-field col s12">

                                    <div class="file-field input-field">
                                        <div class="btn red ">
                                            <span>File</span>
                                            <input type="file">
                                        </div>
                                        <div class="file-path-wrapper">
                                            <input name="filename" class="file-path validate" type="text"
                                                   placeholder="Upload Your Document ">
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12 ">
                                <textarea name="uaddress" id="textarea1" class="materialize-textarea" value=""
                                          required></textarea></textarea>
                                <label for="uaddress">Address</label>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer grey lighten-3">
                <a href="#!" class="modal-close waves-effect waves-green btn-flat">ADD</a>
                <a href="#!" class="modal-close waves-effect waves-green btn-flat">Cancel</a>
            </div>

        </div>



        <!--MANAGER MODULE-->
        <!--MAnage manager-->
        <section id="manager-section" class="section manager-section">
            <div class="container">
                <div class="card  managedonorcard">
                    <div class="card-title grey lighten-4">
                        <div class="row">
                            <div class="col s12">
                                <h6 class="left">List Of Manager</h6>
                                <a class="waves-effect waves-light btn modal-trigger right red" href="#modal3"><i
                                        class="material-icons left">add</i>New Manager</a>
                            </div>
                        </div>
                    </div>
                    <div class="card-content">
                        <div class="scroll">
                            <!--                            <table class="striped">
                                                            <thead>
                                                                <tr>
                                                                    <th>No</th>
                                                                    <th>Name </th>
                                                                    <th>Id No</th>
                                                                    <th>Information</th>
                                                                    <th>Docudent</th>
                                                                    <th>Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>1</td>
                                                                    <td>Skand &nbsp;Brahmbhatt</td>
                                                                    <td>2</td>
                                                                    <td>
                                                                        Email: &nbsp;skandvb66@gmail.com <br>
                                                                        Phone No:&nbsp;6355249607 <br>
                                                                        Date of Birth:&nbsp;29/06/2002 <br>
                                                                        Gender:&nbsp; Male <br>
                                                                        Weight:&nbsp; 76 <br>
                                                                        Address:&nbsp; E-555, Sardarpatel nagar , navarangpura<br>
                                                                    </td>
                                                                    <td>2906002.jpg</td>
                                                                    <td>
                                                                        <a href="#modal4"
                                                                           class="waves-effect waves-light btn-small modal-trigger light-blue darken-4">Update</a>
                                                                        <a class="waves-effect waves-light btn-small  red">Delete</a>
                                                                    </td>
                                                                </tr>
                            
                                                            </tbody>
                                                        </table>-->

                            <table class="striped">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>First Name </th>
                                        <th>Last Name</th>
                                        <th>Phono </th>
                                        <th>Email</th>
                                        <th>password</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        String sqla = "SELECT * FROM `user_master` WHERE u_type='manager'";
                                        Statement stmt6 = con.createStatement();
                                        ResultSet set1 = stmt6.executeQuery(sqla);
                                        while (set1.next()) {
                                    %>  
                                    <tr><td><%=set1.getString(1)%></td>
                                        <td><%=set1.getString(2)%></td>
                                        <td><%=set1.getString(3)%></td>
                                        <td><%=set1.getString(4)%></td>
                                        <td><%=set1.getString(5)%></td>
                                        <td><%=set1.getString(6)%></td>
                                         <td>
<!--                                                                        <a href="#modal4"
                                                                           class="waves-effect waves-light btn-small modal-trigger light-blue darken-4">Update</a>-->
                                                                           <a href="../ded?id=<%=set1.getString(1)%>&v=man" class="waves-effect waves-light btn-small  red">Delete</a>
                                                                    </td>
                                    </tr>
                                    <%
                                        }

                                    %>


                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--Add Manager Model-->
        <div id="modal3" class="modal modal-fixed-header modal-fixed-footer">
            <div class="modal-header grey lighten-3">
                <h5>New Manager</h5>
            </div>
            <div class="modal-content">
                <div class="container">
                    <form action="../Ama" method="post">
                        <div class="row">
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="text" name="fname" value="" required>
                                    <label for="fname">First Name</label>
                                </div>
                            </div>
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="text" name="lname" value="" required>
                                    <label for="lname">Last Name</label>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="tel" name="phno" maxlength="10" value="" required>
                                    <label for="phno">Phone no</label>
                                </div>
                            </div>
                            <div class="col s12 m6">

                                <div class="input-field col s12">
                                    <input type="email" name="email" class="validate" value="" required>
                                    <label for="email">E mail</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                           
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="password" name="pwd" value="" required>
                                    <label for="pwd">Password</label>
                                </div>
                            </div>
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <button type="submit" class="modal-close waves-effect waves-green btn-flat"  >Add</button>
                                </div>
                            </div>
                            
                        </div>
                       
                        
                        
                    </form>
                </div>
            </div>
            <div class="modal-footer grey lighten-3">
                
                <a href="#!" class="modal-close waves-effect waves-green btn-flat">Cancel</a>
            </div>

        </div>
        <!--update manager Model-->
        <div id="modal4" class="modal modal-fixed-header modal-fixed-footer">
            <div class="modal-header grey lighten-3">
                <h5>Update Info</h5>
            </div>
            <div class="modal-content">
                <div class="container">
                    <form action="updateinfo" method="post">
                        <div class="row">
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="text" name="umfname" value="" required>
                                    <label for="umfname">First Name</label>
                                </div>
                            </div>
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="text" name="umlname" value="" required>
                                    <label for="umlname">Last Name</label>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="tel" name="umphno" maxlength="10" value="" required>
                                    <label for="umphno">Phone no</label>
                                </div>
                            </div>
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="tel" name="umsphno" minlength="10" maxlength="10" value="">
                                    <label for="umsphno">Secound Phone no</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12 m6">

                                <div class="input-field col s12">
                                    <input type="email" name="umemail" class="validate" value="" required>
                                    <label for="umemail">E mail</label>
                                </div>
                            </div>
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="password" name="umpwd" value="" required>
                                    <label for="umpwd">Password</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="text" class="datepicker" id="umbdate" value="" required>
                                    <label for="umbdate">Birthdate</label>
                                </div>

                            </div>
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="number" name="umage" value="" required>
                                    <label for="umage">Age</label>
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
                                                <input class="with-gap" name="gender" type="radio" value="" required />
                                                <span>Male</span>
                                            </label>
                                        </span>
                                        <span>
                                            <label>
                                                <input class="with-gap" name="gender" type="radio" value="" required />
                                                <span>Female</span>
                                            </label>
                                        </span>
                                        <span>
                                            <label>
                                                <input class="with-gap" name="gender" type="radio" value="" required />
                                                <span>Other</span>
                                            </label>
                                        </span>

                                    </p>
                                </div>
                            </div>
                            <div class="col s12 m6">
                                <div class="input-field col s12">
                                    <input type="number" name="umweight" value="" required>
                                    <label for="umweight">Weight</label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12 m6">
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
                            <div class="col s12 m6">

                                <div class="input-field col s12">

                                    <div class="file-field input-field">
                                        <div class="btn red ">
                                            <span>File</span>
                                            <input type="file">
                                        </div>
                                        <div class="file-path-wrapper">
                                            <input name="filename" class="file-path validate" type="text"
                                                   placeholder="Upload Your Docdent ">
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col s12 ">
                                <textarea name="umaddress" id="textarea1" class="materialize-textarea" value=""
                                          required></textarea></textarea>
                                <label for="umaddress">Address</label>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer grey lighten-3">
                <a href="#!" class="modal-close waves-effect waves-green btn-flat">Update</a>
                <a href="#!" class="modal-close waves-effect waves-green btn-flat">Cancel</a>
            </div>

        </div>



        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script src="admin.js"></script>


    </body>

</html>