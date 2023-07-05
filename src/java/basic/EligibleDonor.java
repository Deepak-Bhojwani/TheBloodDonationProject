/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package basic;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lenovo
 */
public class EligibleDonor extends HttpServlet {

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
        int id = Integer.parseInt( request.getParameter("i"));
        try{
        Class.forName("com.mysql.jdbc.Driver");
        String sql = "INSERT INTO `user_master`( `u_fname`, `u_lname`, `u_phno`, `u_email`, `u_password`, `u_type`) VALUES (?,?,?,?,?,?)";
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonation?zeroDateTimeBehavior=CONVERT_TO_NULL","root","");
            PreparedStatement pstmt2 = con.prepareStatement(sql);
            PreparedStatement pstmt3 = con.prepareStatement("select max(u_id) from user_master");
            PreparedStatement pstmt = con.prepareStatement("SELECT * FROM `registration_master` WHERE r_id = ?");
            PreparedStatement pstmt4 = con.prepareStatement("INSERT INTO `donor_master`( `u_id`, `d_weight`, `d_age`, `d_gender`, `d_bloodgroup`, `d_document`, `d_sphno`, `d_address`, `d_pincode`, `d_dob`,d_status) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
            Statement stmt= con.createStatement();
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
           rs.next();
           int rid = rs.getInt(1);
           String fname = rs.getString(2);
           String lname = rs.getString(3);
           String phno = rs.getString(4);
           String email = rs.getString(5);
           String password = rs.getString(6);
           String type = "donor";
           int weight = rs.getInt(7);
           pstmt4.setInt(2, weight);
           int age = rs.getInt(8);
           pstmt4.setInt(3,age);
           String gender = rs.getString(9);
           pstmt4.setString(4, gender);
           String bloodgroup = rs.getString(10);
           pstmt4.setString(5, bloodgroup);
           String document = rs.getString(11);
           pstmt4.setString(6, document);
           long sphno = rs.getLong(12);
           pstmt4.setLong(7,sphno);
           String address = rs.getString(13);
           pstmt4.setString(8, address);
           int pin = rs.getInt(14);
           pstmt4.setInt(9,pin);
           String date = rs.getString(15);
           pstmt4.setString(10, date);
           pstmt4.setInt(11,1 );
           
           pstmt2.setString(1,fname);
           
           pstmt2.setString(2, lname);
         
           pstmt2.setString(3,phno);
           
           pstmt2.setString(4, email);
          
           pstmt2.setString(5, password);
           
           pstmt2.setString(6, type);
           
           pstmt2.executeUpdate();
           rs=pstmt3.executeQuery();
           rs.next();
           int uid = rs.getInt(1);
           
           pstmt4.setInt(1,uid);
            pstmt4.execute();
            stmt.execute("delete from registration_master where r_id = "+id);
            response.sendRedirect("http://localhost:8080/TheBloodDonationProject/Admin/Admin.jsp");
            
        }
        catch(Exception e){
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
