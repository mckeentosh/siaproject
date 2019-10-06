<%@page import="model.Day_Record"%>
<%@page import="model.Student"%>
<%@page import="dao.Controller_StudentDao"%>
<%@page import="dao.Controller_Day_RecordDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%
    Controller_Day_RecordDao dr = Controller_Day_RecordDao.getDay_RecordDao();
    Controller_StudentDao newSessionRecord = Controller_StudentDao.getStudentDao();
    Day_Record newRecord = new Day_Record();
    String id = request.getParameter("uicBarcode");
    String latestId = request.getParameter("count");
    String time = request.getParameter("time");
    String recordID = request.getParameter("recordID");
    String checkStatus = request.getParameter("status");

    Student  latestStudent = newSessionRecord.fetchUic(id);
    
    if (checkStatus == null){
        if (id!=null){
            if (!id.equals("")){
                Student check = newSessionRecord.fetchUic(id);
                boolean exist = false;

                if(check != null){
                    exist = true;
                }else{
                    check = newSessionRecord.fetchBarcode(id);
                    if(check != null){
                        exist = true;
                    }
                }

                if (exist){
                    try {
                    Date date = new Date();
                    String strDateFormat = "HH:mm";
                    SimpleDateFormat sdf = new SimpleDateFormat(strDateFormat);


                    int f = check.getIdIncremental();
                    id = String.valueOf(f);
                    String currentTime = sdf.format(date);
                    String timeIn[] = currentTime.split(":");
                    String timeLimit[] = time.split(":");


                    newRecord.setDay_record_id(Integer.parseInt(latestId));
                    newRecord.setDay_record_time(currentTime);
                    newRecord.setDay_record_cadet_id(f);
                    newRecord.setDay_record_records_id(Integer.parseInt(recordID));

                    int sumTimeIn = Integer.parseInt(timeIn[0]) + Integer.parseInt(timeIn[1]);
                    int sumTimeLimit = Integer.parseInt(timeLimit[0]) + Integer.parseInt(timeLimit[1]);

                    if ( sumTimeIn > sumTimeLimit){
                        newRecord.setDay_record_attendance_status(3.0);
                    }else{
                        newRecord.setDay_record_attendance_status(1.0);
                    }
    //                }else if (Integer.parseInt(timeLimit[0]) >= Integer.parseInt(timeIn[0]) && Integer.parseInt(timeLimit[1]) > Integer.parseInt(timeIn[1]) ){
    //                    newRecord.setDay_record_attendance_status(1.0);
    //                }
    //                }else{
    //                    newRecord.setDay_record_attendance_status(2.0);
    //                }

                    int i = dr.insert(newRecord);

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
    //                out.println(latestId);
    //                out.println(currentTime);
    //                out.println(f);
    //                out.println(recordID);
    //                out.println(timeLimit[0]);
                    }catch(NumberFormatException ex)
                    {
                        %>
                        <script>
                            function myFunction() {
                                location.replace("newSession.jsp?sessionID=<%=recordID%>");
                            }
                            window.onload = myFunction();
                        </script>
                        <%
                    }
                }else{
                    %>
                    <script>
                        function myFunction() {
                            location.replace("newSession.jsp?sessionID=<%=recordID%>");
                        }
                        window.onload = myFunction();
                    </script>
                    <%
                }
            }else{
                %>
                <script>
                    function myFunction() {
                        location.replace("newSession.jsp?sessionID=<%=recordID%>");
                    }
                    window.onload = myFunction();
                </script>
                <%
            }
        }else{
            %>
            <script>
                function myFunction() {
                    location.replace("newSession.jsp?sessionID=<%=recordID%>");
                }
                window.onload = myFunction();
            </script>
            <%
        }
    }else{
        String[] parts = checkStatus.split("_"); //returns an array with the 2 parts
        String firstPart = parts[0];
        String secondPart = parts[1];
        

        if (secondPart.charAt(0) != '('){
            try {
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
        }else{
            if (id!=null){
                if (!id.equals("")){
                    Student check = newSessionRecord.fetchUic(id);
                    boolean exist = false;

                    if(check != null){
                        exist = true;
                    }else{
                        check = newSessionRecord.fetchBarcode(id);
                        if(check != null){
                            exist = true;
                        }
                    }

                    if (exist){
                        try {
                        Date date = new Date();
                        String strDateFormat = "HH:mm";
                        SimpleDateFormat sdf = new SimpleDateFormat(strDateFormat);


                        int f = check.getIdIncremental();
                        id = String.valueOf(f);
                        String currentTime = sdf.format(date);
                        String timeIn[] = currentTime.split(":");
                        String timeLimit[] = time.split(":");


                        newRecord.setDay_record_id(Integer.parseInt(latestId));
                        newRecord.setDay_record_time(currentTime);
                        newRecord.setDay_record_cadet_id(f);
                        newRecord.setDay_record_records_id(Integer.parseInt(recordID));

                        int sumTimeIn = Integer.parseInt(timeIn[0]) + Integer.parseInt(timeIn[1]);
                        int sumTimeLimit = Integer.parseInt(timeLimit[0]) + Integer.parseInt(timeLimit[1]);

                        if ( sumTimeIn > sumTimeLimit){
                            newRecord.setDay_record_attendance_status(3.0);
                        }else{
                            newRecord.setDay_record_attendance_status(1.0);
                        }
        //                }else if (Integer.parseInt(timeLimit[0]) >= Integer.parseInt(timeIn[0]) && Integer.parseInt(timeLimit[1]) > Integer.parseInt(timeIn[1]) ){
        //                    newRecord.setDay_record_attendance_status(1.0);
        //                }
        //                }else{
        //                    newRecord.setDay_record_attendance_status(2.0);
        //                }

                        int i = dr.insert(newRecord);

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
        //                out.println(latestId);
        //                out.println(currentTime);
        //                out.println(f);
        //                out.println(recordID);
        //                out.println(timeLimit[0]);
                        }catch(NumberFormatException ex)
                        {
                            %>
                            <script>
                                function myFunction() {
                                    location.replace("newSession.jsp?sessionID=<%=recordID%>");
                                }
                                window.onload = myFunction();
                            </script>
                            <%
                        }
                    }else{
                        %>
                        <script>
                            function myFunction() {
                                location.replace("newSession.jsp?sessionID=<%=recordID%>");
                            }
                            window.onload = myFunction();
                        </script>
                        <%
                    }
                }else{
                    %>
                    <script>
                        function myFunction() {
                            location.replace("newSession.jsp?sessionID=<%=recordID%>");
                        }
                        window.onload = myFunction();
                    </script>
                    <%
                }
            }else{
                %>
                <script>
                    function myFunction() {
                        location.replace("newSession.jsp?sessionID=<%=recordID%>");
                    }
                    window.onload = myFunction();
                </script>
                <%
            }
        }
    }
%>