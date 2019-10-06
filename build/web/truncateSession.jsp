<%@page import="dao.Controller_Day_RecordDao"%>
<%
    Controller_Day_RecordDao dr = Controller_Day_RecordDao.getDay_RecordDao();
    dr.truncateSession();
    
    %>
        <jsp:include page="newAttendance.jsp">
            <jsp:param value="Saved." name="msg"/>
        </jsp:include>
    <%
%>