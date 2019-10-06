<%--<%@page import="model.Student"%>
<%@page import="dao.StudentDao"%>
<%
StudentDao sd = StudentDao.getStudentDao();
String name = request.getParameter("name");
String roll = request.getParameter("roll");

    if (name!=null && roll!=null) {
        if (!name.equals("") && !roll.equals("")) {
            int r = Integer.parseInt(roll);
            Student std = new Student();
            std.setRoll(r);
            std.setName(name);
            int i = sd.insert(std);
            
            if(i>0){%> 
                <jsp:include page="main.jsp">
                    <jsp:param value="Added Successfully" name="msg"/>
                </jsp:include>
            <% }else{
                %>
                <jsp:include page="main.jsp">
                    <jsp:param value="Fail to add." name="msg"/>
                </jsp:include>
                <%
            }
        }
    }
%>--%>

<%@page import="model.Student"%>
<%@page import="dao.StudentDao"%>
<%
StudentDao cd = StudentDao.getStudentDao();
String id = request.getParameter("id");
String name = request.getParameter("name");
String password = request.getParameter("password");
String position = request.getParameter("position");
String platoon = request.getParameter("platoon");
String religion = request.getParameter("religion");
String gender = request.getParameter("gender");
String age = request.getParameter("age");
String dob = request.getParameter("dob");
String course = request.getParameter("course");
String section = request.getParameter("section");
//String status = request.getParameter("status");
//String points = request.getParameter("points");
//String absents = request.getParameter("absents");
//String tardiness = request.getParameter("tardiness");

    if (name!=null && id!=null) {
        if (!name.equals("") && !id.equals("") ) {
            int idInt = 0;
            try {
                idInt = Integer.parseInt(id);

                Student ctd = new Student();
                ctd.setId(idInt);
                ctd.setName(name);
                ctd.setPassword(password);
                ctd.setPosition(position);
                ctd.setPlatoon(platoon);
                ctd.setReligion(religion);
                ctd.setGender(gender);
                ctd.setAge(age);
                ctd.setDOB(dob);
                ctd.setCourse(course);
                ctd.setSection(section);
                ctd.setStatus("active");
                ctd.setPoints(0);
                ctd.setAbsents(0);
                ctd.setTardiness(0);

                int i = cd.insert(ctd);

                if(i>0){%> 
                    <jsp:include page="main.jsp">
                        <jsp:param value="Added Successfully" name="msg"/>
                    </jsp:include>
                <% }else{
                    %>
                    <jsp:include page="main.jsp">
                        <jsp:param value="Fail to add." name="msg"/>
                    </jsp:include>
                    <%
                }
            } catch(NumberFormatException ex)
            {
//                out.print("Error ID input.");
                    %>
                    <jsp:include page="main.jsp">
                        <jsp:param value="Fail to add. (Error ID input)" name="msg"/>
                    </jsp:include>
                    <%
            }
        }
    }
%>