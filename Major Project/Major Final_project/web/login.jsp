<%-- 
    Document   : login
    Created on : Mar 21, 2018, 10:18:53 PM
    Author     : sanket gupta
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <%
            String user = request.getParameter("user");
            String password = request.getParameter("password");
            
            try 
            {
               Class.forName("com.mysql.jdbc.Driver");            // load the drivers
               
               Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject", "root", "");
               
               PreparedStatement st = con.prepareStatement("Select * from Admin where username= ? AND password = ?");
               st.setString(1 ,user);
               st.setString(2 ,password);
               
               
               boolean b = st.execute();
               if(b)
               {
                   out.println(x);
                   
               }
               
            } 
            catch (Exception e) 
            {
                out.println("Exception Occured");
            }
            

        
        
        
%>
    </body>
</html>
