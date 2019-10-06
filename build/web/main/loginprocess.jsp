<%@page import="model.Student"%>
<%@page import="dao.Controller_LoginDao"%>
<%
Controller_LoginDao cd = Controller_LoginDao.getLoginDao();
String _id = request.getParameter("txtid");
String _password = request.getParameter("txtpassword");
String _position = request.getParameter("txtposition");

if (_id!=null && _password!=null) {
    if (!_password.equals("") && !_id.equals("") ) {
        try {   
            Student ctd = new Student();
            ctd.setIdUic(_id);
            ctd.setPassword(_password);
            ctd.setPosition(_position);
            int i = cd.checkLogin(ctd);
            
            if(i>0){%> 
                <jsp:include page="main.jsp">
                    <jsp:param value="Login Successful!" name="msg"/>
                </jsp:include>
            <% }else{
                %>
                <jsp:include page="main.jsp">
                    <jsp:param value="Login Failed." name="msg"/>
                </jsp:include>
                <%
            }
        }catch(NumberFormatException ex){}
}
%>
