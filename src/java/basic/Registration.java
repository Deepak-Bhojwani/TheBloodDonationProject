/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package basic;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.time.LocalDate;
import java.time.Period;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author lenovo
 */
@MultipartConfig
public class Registration extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
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

            String query = "INSERT INTO `registration_master`( `r_fname`, `r_lname`, `r_phno`, `r_email`, `r_password`, `r_age`, `r_bloodgroup`,`r_sphno`, `r_address`, `r_pincode`,`r_document`,r_dob,r_gender,r_weight) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            String connectionString = "jdbc:mysql://localhost:3306/blooddonation?zeroDateTimeBehavior=CONVERT_TO_NULL";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(connectionString, "root", "");
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, fname);
            pstmt.setString(2, lname);
            pstmt.setString(3, phno);
            pstmt.setString(4, email);
            pstmt.setString(5, password);
            pstmt.setString(6, age);
            pstmt.setString(7, bloodgroup);
            pstmt.setString(8, sphno);
            pstmt.setString(9, address);
            pstmt.setString(10, pin);
            pstmt.setString(11, filename);
            pstmt.setString(12, date);
            pstmt.setString(13, gender);
            pstmt.setString(14, weight);
            pstmt.executeUpdate();

            InputStream is = pr.getInputStream();
            byte[] b = new byte[is.available()];
            is.read(b);

            String path = "D:\\#TheBloodDonationProject\\img\\" + pr.getSubmittedFileName();
            FileOutputStream fos = new FileOutputStream(path);
            fos.write(b);
            
            
            
            response.sendRedirect("http://localhost:8080/TheBloodDonationProject/");
            // buffered output
        } catch(SQLException e){
        out.print(e.getMessage());
        }catch (Exception e ) {
            out.print(e.getMessage());
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
