<%@page import="model.Student"%>
<%@page import="dao.StudentDao"%>
<%
StudentDao sd = StudentDao.getStudentDao();
String name = request.getParameter("name");
String id = request.getParameter("id");

    if (name!=null && id!=null) {
        if (!name.equals("") && !id.equals("")) {
            int r = Integer.parseInt(id);
            Student ss = sd.fetch(r);
            
            if (ss!=null) {
                ss.setName(name);
                int i = sd.update(ss);
                
                if(i>0){%> 
                    <jsp:include page="main.jsp">
                        <jsp:param value="Updated Successfully" name="msg"/>
                    </jsp:include>
                <% }else{
                    %>
                    <jsp:include page="main.jsp">
                        <jsp:param value="Update Failed" name="msg"/>
                    </jsp:include>
                    <%
                }
            }
            
        }
    }
%>