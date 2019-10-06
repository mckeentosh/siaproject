<%@page import="model.Student"%>
<%@page import="dao.Controller_StudentDao"%>
<%
Controller_StudentDao sd = Controller_StudentDao.getStudentDao();
String student = request.getParameter("idUic");

if (student!=null) {
    if (!student.isEmpty()) {
        sd.delete(student);
         %>
        <jsp:include page="main.jsp">
            <jsp:param value="Successfully Deleted" name="msg"/>
        </jsp:include>
        <%
        }else{
            %>
            <jsp:include page="main.jsp">
                <jsp:param value="Failed to Delete" name="msg"/>
            </jsp:include>
        <%
    }
}   
%>