<%@page import="model.Student"%>
<%@page import="dao.Controller_StudentDao"%>
<%
Controller_StudentDao sd = Controller_StudentDao.getStudentDao();
String id = request.getParameter("idUic");

if (id!=null) {
    if (!id.isEmpty()) {
       Student ss = sd.fetch(id);
       if (ss!=null) { %>
           ID (Serial) is: <%= ss.getIdIncremental()%>
           ID (UIC) is: <%= ss.getIdUic() %>
           Name is: <%= ss.getName() %>
       <%}else{ %>
            <jsp:include page="main.jsp">
                <jsp:param value="ID does not exist." name="msg"/>
            </jsp:include>
        <%}
    }
}
%>