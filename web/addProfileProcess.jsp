<%@page import="model.Student"%>
<%@page import="dao.Controller_StudentDao"%>
<%
Controller_StudentDao cd = Controller_StudentDao.getStudentDao();
String idUic = request.getParameter("idUic");
String idBarcode = request.getParameter("idBarcode");
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

    if (name!=null && idUic!=null) {
        if (!name.equals("") && !idUic.equals("") ) {
            try {
//                idInt = Integer.parseInt(id);
                Student ctd = new Student();
//                ctd.setIdIncremental(ctd.getIdIncremental()+1);
                ctd.setIdUic(idUic);
                ctd.setIdBarcode(idBarcode);
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
                    <jsp:include page="newProfile.jsp">
                        <jsp:param value="Added Successfully" name="msg"/>
                    </jsp:include>
                <% }else{
                    %>
                    <jsp:include page="newProfile.jsp">
                        <jsp:param value="Fail to add." name="msg"/>
                    </jsp:include>
                    <%
                }
            } catch(NumberFormatException ex)
            {
                %>
                <jsp:include page="newProfile.jsp">
                    <jsp:param value="Fail to add. (Error ID input)" name="msg"/>
                </jsp:include>
                <%
            }
        }
    }
%>