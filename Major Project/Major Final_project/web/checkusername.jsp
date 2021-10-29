<%-- 
    Document   : checkusername
    Created on : Apr 11, 2018, 3:31:13 PM
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
        <title>JSP Page</title>
    </head>
    <body>
        <%
              String email = request.getParameter("email");
              
              try
              {
                  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject", "root", "");
                  PreparedStatement st = con.prepareStatement("SELECT * FROM Admin where username= ?");
                  st.setString(1, email);
                  boolean b = st.execute();
                  if(b==true)
                  {
                      %>
                      
                      <font color="red">
                          Email account already exists
                      </font>
                      <%
                  }
                  
                  else
                  {
                      %>
                      
                      <font color="green">
                          Email account already exists
                      </font>
                      <%
                  }
                  
              } 
              catch (Exception e) 
              {
              }



        %>
    </body>
</html>
