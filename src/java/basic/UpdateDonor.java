/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package basic;

import static basic.ManagerDonorUpdate.calculateAge;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Period;
import javax.servlet.ServletException;
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
public class UpdateDonor extends HttpServlet {

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
            String id = request.getParameter("id");
            out.println(id);
            String date = request.getParameter("date");
            out.println(date);
            LocalDate dob = LocalDate.parse(date);
            String fname = request.getParameter("fname");
            out.println(fname);

            String phno = request.getParameter("phno");
            out.println(phno);
            String lname = request.getParameter("lname");
            out.println(lname);
            String email = request.getParameter("email");
            out.println(email);
            String password = request.getParameter("pwd");
            out.println(password);
            String pincode = request.getParameter("pincode");
            String bloodgroup = request.getParameter("bloodgroup");
            out.println(bloodgroup);
            String weight = request.getParameter("weight");
            out.println(weight);
            String gender = request.getParameter("gender");
            out.println(gender);
            String address = request.getParameter("address");
            out.println(address);
            String sphno = request.getParameter("sphno");
            out.println(sphno);
//            Part pr = request.getPart("filename");
//            String filename = pr.getSubmittedFileName();out.println(filename);
            int a = calculateAge(dob);
            String age = String.valueOf(a);
            out.println(age);

            Class.forName("com.mysql.jdbc.Driver");
            String sql = "update user_master SET u_fname = ? , u_lname = ? ,u_phno = ?,u_email=?,u_password= ? where u_id = " + id;

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonation?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "");
            
            PreparedStatement pstmt = con.prepareStatement(sql);
            
            pstmt.setString(1,fname);
            pstmt.setString(2, lname);
            pstmt.setString(3,phno);
            pstmt.setString(4, email);
            pstmt.setString(5,password);
            out.println(pstmt.executeUpdate());
            sql = "UPDATE `donor_master` SET `d_weight`=?,`d_age`=?,`d_gender`=?,`d_bloodgroup`=?,`d_sphno`=?,`d_address`=?,`d_dob`=? , d_pincode = ? WHERE u_id =" +id;
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,weight);
            pstmt.setString(2, age);
            pstmt.setString(3,gender);
            pstmt.setString(4, bloodgroup);
            pstmt.setString(5, sphno);
            pstmt.setString(6,address);
            pstmt.setString(7,date);
            pstmt.setString(8, pincode);
            out.println(pstmt.executeUpdate());
            response.sendRedirect("Donor/Donor.jsp");
            
            
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
