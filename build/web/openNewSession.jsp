<%@page import="dao.Controller_Day_RecordDao"%>
<%@page import="model.Day_Record"%>

<%
    Controller_Day_RecordDao dr = Controller_Day_RecordDao.getDay_RecordDao();
    String selectedBtn = request.getParameter("sessionID");
    int conv = Integer.parseInt(selectedBtn);
    Day_Record checkArchive = dr.fetchArchive(conv);
    
    if (checkArchive == null){
        %>
            <jsp:include page="newSession.jsp">
                <jsp:param value="New Record Found." name="msg"/>
            </jsp:include>
        <%
    }else{
        %>
            <jsp:include page="newSession.jsp">
                <jsp:param value="Record Found." name="msg"/>
            </jsp:include>
        <%
    }
%>