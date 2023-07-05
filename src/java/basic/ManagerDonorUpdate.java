/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package basic;

import static basic.Registration.calculateAge;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.Period;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.*;

/**
 *
 * @author lenovo
 */
@MultipartConfig
public class ManagerDonorUpdate extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            String date = request.getParameter("date");

            LocalDate dob = LocalDate.parse(date);
            String fname = request.getParameter("fname");
            String phno = request.getParameter("phno");
            String lname = request.getParameter("lname");
            String email = request.getParameter("email");
            String password = request.getParameter("pwd");
            String bloodgroup = request.getParameter("bloodgroup");
            String weight = request.getParameter("weight");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            String pin = request.getParameter("pin");
            String sphno = request.getParameter("sphno");
            Part pr = request.getPart("filename");
            String filename = pr.getSubmittedFileName();
            int a = calculateAge(dob);
            String age = String.valueOf(a);
            InputStream is = pr.getInputStream();
            byte[] b = new byte[is.available()];
            is.read(b);

            String path = "D:\\#TheBloodDonationProject\\img\\" + pr.getSubmittedFileName();
            FileOutputStream fos = new FileOutputStream(path);
            fos.write(b);

//            out.println(fname);
//            out.println(lname);
//            out.println(date);
//            out.println(phno);
//            out.println(email);
//            out.println(password);
//            out.println(bloodgroup);
//            out.println(weight);
//            out.println(gender);
//            out.println(address);
//            out.println(pin);
//            out.println(sphno);
//            out.println(filename);
//            out.println(age);

            Class.forName("com.mysql.jdbc.Driver");
            String sql = "INSERT INTO `user_master`( `u_fname`, `u_lname`, `u_phno`, `u_email`, `u_password`, `u_type`) VALUES (?,?,?,?,?,?)";
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonation?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
            PreparedStatement pstmt2 = con.prepareStatement(sql);

            pstmt2.setString(1, fname);
            pstmt2.setString(2, lname);
            pstmt2.setString(3, phno);
            pstmt2.setString(4, email);
            pstmt2.setString(5, password);
            pstmt2.setString(6, "donor");
            pstmt2.executeUpdate();
            
     

            PreparedStatement pstmt3 = con.prepareStatement("select max(u_id) from user_master");
           ResultSet rs=pstmt3.executeQuery();
           rs.next();
           int uid = rs.getInt(1);
           
           
            PreparedStatement pstmt4 = con.prepareStatement("INSERT INTO `donor_master`( `u_id`, `d_weight`, `d_age`, `d_gender`, `d_bloodgroup`, `d_document`, `d_sphno`, `d_address`, `d_pincode`, `d_dob`,d_status) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
            pstmt4.setInt(1, uid);
            pstmt4.setString(2,weight);
            pstmt4.setString(3, age);
            pstmt4.setString(4, gender);
            pstmt4.setString(5, bloodgroup);
            pstmt4.setString(6, filename);
            pstmt4.setString(7,sphno);
            pstmt4.setString(8,address);
            pstmt4.setString(9, pin);
            pstmt4.setString(10,date);
            pstmt4.setBoolean(11, true);
            pstmt4.execute();
       response.sendRedirect("Manager/Manager.jsp");
        } catch (Exception e) {
            out.println(e.getMessage());

        }
    }

    public static int calculateAge(LocalDate dob) {
//creating an instance of the LocalDate class and invoking the now() method      
//now() method obtains the current date from the system clock in the default time zone      
        LocalDate curDate = LocalDate.now();
//calculates the amount of time between two dates and returns the years  
        if ((dob != null) && (curDate != null)) {
            return Period.between(dob, curDate).getYears();
        } else {
            return 0;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
