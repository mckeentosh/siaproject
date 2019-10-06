<%@page import="javafx.scene.control.RadioButton"%>
<%@page import="model.Student"%>
<%@page import="dao.Controller_StudentDao"%>
<%
Controller_StudentDao sd = Controller_StudentDao.getStudentDao();
String idUic = request.getParameter("idUic1");
String idBarcode = request.getParameter("idBarcode1");
String name = request.getParameter("name1");
String password = request.getParameter("password1");
String position = request.getParameter("position1");
String platoon = request.getParameter("platoon1");
String religion = request.getParameter("religion1");
String gender = request.getParameter("gender1");
String age = request.getParameter("age1");
String dob = request.getParameter("dob1");
String course = request.getParameter("course1");
String section = request.getParameter("section1");
String status = request.getParameter("status1");
String points = request.getParameter("points1");
String absents = request.getParameter("absents1");
String tardiness = request.getParameter("tardiness1");
position = "" + position;

Student ss = sd.fetch(idUic);


if (ss != null) {
    if (!name.equals("")) {
        ss.setName(name);
        sd.update(ss);
    }
    else if (!idBarcode.equals("")) {
        ss.setIdBarcode(idBarcode);
        sd.update(ss);
    }
    else if (!password.equals("")) {
        ss.setPassword(password);
        sd.update(ss);
    }
    else if (!age.equals("")) {
        ss.setAge(age);
        sd.update(ss);
    }
    else if (!platoon.equals("")) {
        ss.setPlatoon(platoon);
        sd.update(ss);
    }
    else if (!course.equals("")) {
        ss.setCourse(course);
        sd.update(ss);
    }
    else if (!religion.equals("")) {
        ss.setReligion(religion);
        sd.update(ss);
    }
    else if (!dob.equals("")) {
        ss.setDOB(dob);
        sd.update(ss);
    }
    else if (!section.equals("")) {
        ss.setSection(section);
        sd.update(ss);
    }
    else if (!points.equals("")) {
        int pInt = Integer.parseInt(points);
        ss.setPoints(pInt);
        sd.update(ss);
    }
    else if (!absents.equals("")) {
        int aInt = Integer.parseInt(absents);
        ss.setAbsents(aInt);
        sd.update(ss);
    }
    else if (!tardiness.equals("")) {
        int tInt = Integer.parseInt(tardiness);
        ss.setTardiness(tInt);
        sd.update(ss);
    }
    else if (!position.equals("") && !position.equals("Select Position")) {
        ss.setPosition(position);
        sd.update(ss);
    }
    else if (!gender.equals("") && !gender.equals("Select Gender")) {
        ss.setGender(gender);
        sd.update(ss);
    }
    else if (!status.equals("") && !status.equals("Select Status")) {
        ss.setStatus(status);
        sd.update(ss);
    }
    %> 
        <jsp:include page="newProfile.jsp">
            <jsp:param value="Update Successful!" name="msg"/>
        </jsp:include>
    <%
}else{
    %>
    <jsp:include page="newProfile.jsp">
        <jsp:param value="Failed, ID not found!" name="msg"/>
    </jsp:include>
    <%
}
%>
