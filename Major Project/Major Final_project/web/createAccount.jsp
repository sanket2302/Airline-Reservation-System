<%-- 
    Document   : createAccount
    Created on : Mar 21, 2018, 10:32:58 PM
    Author     : sanket gupta
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account</title>
    </head>
    <body>
        <%
                String Fname = request.getParameter("Fname");
                String Lname = request.getParameter("Lname");
                String username = request.getParameter("user");
                String password = request.getParameter("password");
                
                try 
                {
                    Class.forName("com.mysql.jdbc.Driver");            // load the drivers
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject" , "root" , "");
                    PreparedStatement st = con.prepareStatement("INSERT INTO Admin VALUES(?,?,?,?)");
                    st.setString(1,Fname);
                    st.setString(2, Lname);
                    st.setString(3, username);
                    st.setString(4, password);

                    int count = st.executeUpdate();

                    if(count>0)
                      {
                          out.println("Account Created");
                      }
                    else
                    {
                              out.println("account not created");
                    
                    } 
             }
          catch(Exception e)
          {
              e.printStackTrace();
          }
        %>
    </body>
</html>
