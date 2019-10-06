<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@page import="model.Records"%>
<%@page import="dao.Controller_RecordsDao"%>
<%
Controller_RecordsDao rd = Controller_RecordsDao.getRecordsDao();
String latestID = request.getParameter("latestID");
String sessionDate = request.getParameter("sessionDate");
Date convertToDate = Date.valueOf(sessionDate);
int convertLatestID = Integer.parseInt(latestID);

if (sessionDate!=null) {
    if (!sessionDate.equals("") ) {
            Records rec = new Records();
            rec.setRecordsID(convertLatestID+1);
            rec.setRecordsTotal(0);
//            rec.setRecordsAM(0);
//            rec.setRecordsPM(0);
            rec.setRecordsDate(convertToDate);
            
            int i = rd.insert(rec);

            if(i>0){%> 
                <jsp:include page="newAttendance.jsp">
                    <jsp:param value="Added Successfully" name="msg"/>
                </jsp:include>
            <% }else{
                %>
                <jsp:include page="newAttendance.jsp">
                    <jsp:param value="Fail to add." name="msg"/>
                </jsp:include>
                <%
            }
    }
}
%>