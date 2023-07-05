/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package basic;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author lenovo
 */
public class GenerateReport extends HttpServlet {

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

            Class.forName("com.mysql.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/blooddonation?zeroDateTimeBehavior=CONVERT_TO_NULL";

            Connection con = DriverManager.getConnection(url, "root", "");

            ResultSet rs = con.createStatement().executeQuery("select d_pincode , count(*) from donor_master where d_status = true GROUP by d_pincode ORDER by count(*) DESC;");
            out.print("<table border=1>");
            out.print("<tr>");
            out.print("<td>");
            out.print("pincodes");
            out.print("</td>");
             out.print("<td>");
            out.print("active donor count");
            out.print("</td>");
            out.print("<td>");
            out.print("check records");
            out.print("</td>");
            out.print("</tr>");
            while(rs.next()){
            out.print("<tr>");
            out.print("<th>");
            out.print(rs.getString(1));
            out.print("</td>");
            out.print("<th>");
            out.print(rs.getString(2));
            out.print("</td>");
            out.print("<th>");
            out.print("<a href='pin?i="+ rs.getString(1) +"'>click here</a>");
            out.print("</th>");
            out.print("</tr>");
            }
            out.print("</table>");
        } catch (Exception e) {
            System.out.print(e.getMessage());
            out.print(e.getMessage());
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
