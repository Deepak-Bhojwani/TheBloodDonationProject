/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package basic;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lenovo
 */
public class LogIn extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.InterruptedException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InterruptedException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String phno = request.getParameter("phno");
        String password = request.getParameter("password");

        try {
            Boolean status;
            String query;
            String conString;

            conString = "jdbc:mysql://localhost:3306/blooddonation?zeroDateTimeBehavior=CONVERT_TO_NULL";
            query = "select u_type,u_id from user_master  where u_phno = '" + phno + "' and u_password = '" + password + "'";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(conString, "root", "");
            Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = stmt.executeQuery(query);
            status = rs.first();
            if (status) {
                String type = rs.getString("u_type");
                rs.first();
                int id = Integer.parseInt(rs.getString("u_id"));
                HttpSession hs = request.getSession(true);
                  
                hs.setAttribute("type", type);
                hs.setAttribute("id", id);
                if (type.equalsIgnoreCase("donor")) {
                     String url = "http://localhost:8080/TheBloodDonationProject/Donor/Donor.jsp";
                    response.sendRedirect(url);
                    

                } else if (type.equalsIgnoreCase("admin")) {
                      String url = "http://localhost:8080/TheBloodDonationProject/Admin/Admin.jsp";
                    response.sendRedirect(url);
                    
                   
                } else if (type.equals("manager")) {
                     String url = "http://localhost:8080/TheBloodDonationProject/Manager/Manager.jsp";
                    response.sendRedirect(url);
                } else {
                    out.print("Not allowed");
                }
            } else {
                out.print("there is no record found");
            }
        } catch (Exception e) {
            out.print("hhhhhh");
            out.print(e.getMessage());
        }
//        try{
//        boolean status = Check.checkRecord(request.getParameter("phno"), request.getParameter("password"),out);
//     
//        out.print("taru nam shu chhe");
//        if(status){
//        String type = Check.getType();
//        int id = Check.getId();
//        if(type.compareToIgnoreCase("admin")==0){
//        RequestDispatcher rd = request.getRequestDispatcher("Admin.jsp");
//            HttpSession session = request.getSession();
//            session.setAttribute("type", type);
//            session.setAttribute("id", id);
//        rd.forward(request, response);}
//        else if (type.compareToIgnoreCase("manager")==0){
//        RequestDispatcher rd = request.getRequestDispatcher("Manager.jsp");
//        HttpSession session = request.getSession();
//            session.setAttribute("type", type);
//            session.setAttribute("id", id);
//        rd.forward(request, response);
//        }
//        else if(type.compareToIgnoreCase("donor")==0){
//            out.print("ahiya sudhi avyo chhu");
//        RequestDispatcher rd = request.getRequestDispatcher("Donor.jsp");
//        HttpSession session = request.getSession();
//            session.setAttribute("type", type);
//            session.setAttribute("id", id);
//        rd.forward(request, response);        
//            out.print("welcome user");
//                }
//        else{
//        out.print("who the hell are you");
//        }
//            
//        }else{
//        out.print("<h1>something went worng</h1>");
//            RequestDispatcher rd = request.getRequestDispatcher("Login.html");
//            rd.include(request, response);
//        }
//        }catch(IOException | SQLException | ServletException e){
//            out.print("hello");
//            out.print(e.getMessage());
//        e.printStackTrace();
//        }
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
        try {
            processRequest(request, response);
        } catch (InterruptedException ex) {
            Logger.getLogger(LogIn.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (InterruptedException ex) {
            Logger.getLogger(LogIn.class.getName()).log(Level.SEVERE, null, ex);
        }
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
