/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package basic;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.mysql.cj.protocol.Resultset;
import javax.sql.*;
import java.io.*;  
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.*;  
import javax.servlet.http.*;  

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class DisplayImage extends HttpServlet {  
  
    @Override
    public void doGet(HttpServletRequest request,HttpServletResponse response)  
             throws IOException  
    {
        requestProcess(request, response);
    }
   @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
       requestProcess(request, response);
    }
    public void requestProcess(HttpServletRequest request , HttpServletResponse response) throws IOException{
    {  
        String path="skand";
           
        
        
        int query = Integer.parseInt( request.getParameter("i"));
       
       try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blooddonation?zeroDateTimeBehavior=CONVERT_TO_NULL","root","");
           PreparedStatement pstmt = con.prepareStatement("select r_document from registration_master where r_id = ?");
           pstmt.setInt(1, query);
           ResultSet rs = pstmt.executeQuery();
           rs.next();
           path = rs.getString(1);
           System.out.println();
            System.out.println();
             System.out.println(); System.out.println();
              System.out.println(); System.out.println(); System.out.println(); System.out.println(); System.out.println(); System.out.println(); System.out.println(); System.out.println(); System.out.println(); System.out.println();
              
              
              
              
              
              
              
              
              
              
             
           System.out.println(path);
           
       }catch(Exception e){
       System.out.print(e.getMessage());
       }
        
    response.setContentType("image/jpeg");  
    ServletOutputStream out;  
    out = response.getOutputStream();  
    BufferedOutputStream bout;
    try{
        FileInputStream fin = new FileInputStream("D:\\#TheBloodDonationProject\\img\\"+path);
                BufferedInputStream bin = new BufferedInputStream(fin);
            bout = new BufferedOutputStream(out);
            int ch =0;
            while((ch=bin.read())!=-1)
            {
                bout.write(ch);
     
            }
    
    bout.close();  
    out.close();
    }  catch(Exception e){
            System.out.print(e.getMessage());
            }
    
    }  
    }
}  