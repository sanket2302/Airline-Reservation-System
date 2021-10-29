<%-- 
    Document   : contact
    Created on : Mar 19, 2018, 1:26:27 PM
    Author     : sanket gupta
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>contact</title>
    </head>
    <body>
        <%
            String Fname = request.getParameter("Fname");
            String Lname = request.getParameter("Lname");
            String email = request.getParameter("email");
            int phone = Integer.parseInt(request.getParameter("phone"));
            String message = request.getParameter("message");
            
            try
            {
                Class.forName("com.mysql.jdbc.Driver");                                                               //load the driver
                Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/Myproject","root","");
                
                PreparedStatement st = con.prepareStatement("INSERT INTO commoners(Fname,Lname,email,phone,message) VALUES(?,?,?,?,?)");
                st.setString(1, Fname);
                st.setString(2, Lname);
                st.setString(3, email);
                st.setInt(4, phone);
                st.setString(5, message);
                
                int count = st.executeUpdate();
                
                if(count>0)
                {
                    out.println("Updated");
                }
                else
                {
                    out.println("not updated");
                }
                con.close();
            }
            
          catch(Exception e)
          {
              out.println("exception occured !!");
                out.println(e);
          }
            

        %>
    </body>
</html>
