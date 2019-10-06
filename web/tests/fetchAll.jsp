<%@page import="model.Student"%>
<%@page import="java.util.List"%>
<%@page import="dao.Controller_StudentDao"%>
<%
Controller_StudentDao sd = Controller_StudentDao.getStudentDao();
List<Student> list = sd.fetchAll();
if (list.size()>0) {
%>
<table>
    <tr>
        <td>ID (UIC)</td>
        <td>ID (Barcode)</td>
        <td>Name</td>
        <td>Position</td>
        <td>Platoon</td>
        <td>Religion</td>
        <td>Gender</td>
        <td>Age</td>
        <td>Date of Birth</td>
        <td>Course</td>
        <td>Section</td>
        <td>Status</td>
        <td>No. Points</td>
        <td>No. Absences</td>
        <td>No. Tardiness</td>
    </tr>
    
    <%
    for (int i = 0; i < list.size(); i++) {
        Student std = list.get(i);
    %>
    <tr>
        <td><%=std.getIdUic() %> </td>
        <td><%=std.getIdBarcode() %> </td>
        <td><%=std.getName() %></td>
        <td><%=std.getPosition() %></td>
        <td><%=std.getPlatoon() %></td>
        <td><%=std.getReligion() %></td>
        <td><%=std.getGender() %></td>
        <td><%=std.getAge() %></td>
        <td><%=std.getDOB()%></td>
        <td><%=std.getCourse()%></td>
        <td><%=std.getSection() %></td>
        <td><%=std.getStatus() %></td>
        <td><%=std.getPoints() %></td>
        <td><%=std.getAbsents()%></td>
        <td><%=std.getTardiness() %></td>
    </tr>
    <%}%>
    
</table>
<%}else{
    %>
    <jsp:include page="main.jsp">
        <jsp:param value="No records available." name="msg"/>
    </jsp:include>
    <%
}%>