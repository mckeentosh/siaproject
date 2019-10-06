<%@page import="model.Day_Record"%>
<%@page import="model.Student"%>
<%@page import="dao.Controller_StudentDao"%>
<%@page import="dao.Controller_Day_RecordDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%
    Controller_Day_RecordDao dr = Controller_Day_RecordDao.getDay_RecordDao();
//    Controller_StudentDao newSessionRecord = Controller_StudentDao.getStudentDao();
//    Day_Record newRecord = new Day_Record();
//    String id = request.getParameter("uicBarcode");
//    String latestId = request.getParameter("count");
//    String time = request.getParameter("time");
    String recordID = request.getParameter("recordID");
//    String updatedRecordStatusID = request.getParameter("updatedRecordStatusID");
//    char firstCharID = updatedRecordStatusID.charAt(0);
    String checkStatus = request.getParameter("status");
    
    try {
        String[] parts = checkStatus.split("_"); //returns an array with the 2 parts
        String firstPart = parts[0];
        String secondPart = parts[1];
        Day_Record updateRecord = dr.fetch(Integer.parseInt(firstPart));


        if (secondPart.equals("present")){
            updateRecord.setDay_record_attendance_status(1.0);
        }
        if (secondPart.equals("absent")){
            updateRecord.setDay_record_attendance_status(2.0);
        }
        if (secondPart.equals("late")){
            updateRecord.setDay_record_attendance_status(3.0);
        }
        if (secondPart.equals("excused")){
            updateRecord.setDay_record_attendance_status(4.0);
        }

        int i = dr.update(updateRecord);

        if(i>0){%>
            <script>
                function myFunction() {
                    location.replace("newSession.jsp?sessionID=<%=recordID%>");
                }
                window.onload = myFunction();
            </script>

        <% }else{
            %>
            <script>
                function myFunction() {
                    location.replace("newSession.jsp?sessionID=<%=recordID%>");   
                }
                window.onload = myFunction();
            </script>
            <%
        }
    }catch(NumberFormatException ex){
        %>
        <script>
            function myFunction() {
                location.replace("newSession.jsp?sessionID=<%=recordID%>");
            }
            window.onload = myFunction();
        </script>
        <%
    }
%>