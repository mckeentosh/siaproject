<%@page import="dao.Controller_Day_RecordDao"%>
<%
    
    Controller_Day_RecordDao dr = Controller_Day_RecordDao.getDay_RecordDao();
    String recordID = request.getParameter("recordID");
    dr.transferToDay_Record(Integer.parseInt(recordID));
     %>
        <script>
            function myFunction() {
                location.replace("openNewSession.jsp?sessionID=<%=recordID%>");   
            }
            window.onload = myFunction();
        </script>
    <%
    
%>