<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/navBar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
    </head>
    
    <body>
        
        <center>
            <h2>
                <% 
                String msg = request.getParameter("msg");
                if (msg!=null) {
                    out.print(msg);
                }
                %>
            </h2>

            <a href="add.jsp">Add </a><br>
            <a href="delete.jsp">Delete</a><br>
            <a href="fetch.jsp">Retrieve </a><br>
            <a href="update.jsp">Update </a><br>
            <a href="fetchAll.jsp">Fetch All </a><br>
        </center>
        
    </body>
</html>