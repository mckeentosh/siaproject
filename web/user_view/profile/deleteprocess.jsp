<%@page import="model.Student"%>
<%@page import="dao.StudentDao"%>
<%
StudentDao sd = StudentDao.getStudentDao();
String roll = request.getParameter("id");

if (roll!=null) {
    if (!roll.isEmpty()) {
        if (sd.delete(Integer.parseInt(roll)) > 0) { %>
        <jsp:include page="main.jsp">
            <jsp:param value="Successfully Deleted" name="msg"/>
        </jsp:include>
        <%}else{
            %>
            <jsp:include page="main.jsp">
                <jsp:param value="Failed to Delete" name="msg"/>
            </jsp:include>
            <%
        }
    }
}   
%>