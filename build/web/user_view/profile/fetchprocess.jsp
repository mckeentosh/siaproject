<%@page import="model.Student"%>
<%@page import="dao.StudentDao"%>
<%
StudentDao sd = StudentDao.getStudentDao();
String id = request.getParameter("id");

if (id!=null) {
    if (!id.isEmpty()) {
       Student ss = sd.fetch(Integer.parseInt(id));
       if (ss!=null) { %>
           ID is: <%= ss.getId() %>
           Name is: <%= ss.getName() %>
       <%}else{ %>
            <jsp:include page="main.jsp">
                <jsp:param value="ID does not exist." name="msg"/>
            </jsp:include>
        <%}
    }
}
%>