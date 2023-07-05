/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package basic;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author lenovo
 */
public class AddBloodPackage extends HttpServlet {

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
         PrintWriter out = response.getWriter(); try{
            /* TODO output your page here. You may use following sample code. */
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String phno = request.getParameter("phno");
            String age = request.getParameter("age");
            String bloodgroup = request.getParameter("bloodgroup");
            String date = request.getParameter("date");
            String weight = request.getParameter("weight");
            String dname = request.getParameter("dname");
            String sql = "INSERT INTO `bloodpackage`( `fname`, `lname`, `phno`, `age`, `bloodgroup`, `collectionDate`, `weight`, `Doctor`) VALUES (?,?,?,?,?,?,?,?)";
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/blooddonation?zeroDateTimeBehavior=CONVERT_TO_NULL";
            Connection con = DriverManager.getConnection(url, "root", "");
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, fname);
            pstmt.setString(2, lname);
            pstmt.setString(3,phno);
            pstmt.setString(4, age);
            pstmt.setString(5, bloodgroup);
            pstmt.setString(6, date);
            pstmt.setString(7,weight);
            pstmt.setString(8,dname);
            pstmt.execute();
            response.sendRedirect("Manager/Manager.jsp");
            
            
        }catch(Exception e){
        out.println(e.getMessage());
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
