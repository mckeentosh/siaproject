<%@page import="model.Day_Record"%>
<%@page import="dao.Controller_Day_RecordDao"%>
<%@page import="model.Records"%>
<%@page import="dao.Controller_RecordsDao"%>
<%@page import="java.sql.Date"%>
<%@page import="model.Student"%>
<%@page import="java.util.List"%>
<%@page import="dao.Controller_StudentDao"%>
<%@include file="profile_imports.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Profile</title>
</head>

<body>
    <!--Navigation Bar-->
    <div class="topnav">
        <a href="Home.jsp">Home</a>
        <a class="active" href="attendance.jsp">Attendance</a>
        <a href="profile.jsp">Profile</a>
        <div class="search-container">
          <form action="/action_page.php">
            <input type="text" placeholder="Search.." name="search">
            <button type="submit"><i class="fa fa-search"></i></button>
          </form>
        </div>
    </div>
    
    <!--Content-->
        <div class="container">
           <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-4">
                                <%String selectedBtn = request.getParameter("sessionID");%>
                                <h2>Manage <b>Session </b> <%=selectedBtn%> </h2>
                            </div>
                            
                            <div class="col-sm-2 form-inline my-2 my-lg-0">
                                <label>Set Time-in limit</label>
                                <input class="form-control mr-sm-2 " type="time" name="time" />
                            </div>
                            
                            <div class="col-sm-3">
                                <form name="vinform" class="form-inline my-2 my-lg-0">
                                    <label>UIC or Barcode ID</label>
                                    <input class="form-control mr-sm-2 " name="t1" type="text" placeholder="Search ID" aria-label="Search" onkeyup="sendInfo()">
                                </form>
                            </div>
                            
                            <div class="col-sm-3 form-inline my-2 my-lg-0">
                                <form action="updateSessionProcess.jsp" method="post">
                                    <br>
                                    <button class="btn btn-success form-control mr-sm-2"><i class="material-icons">&#xE147;</i> <span>Save Changes</span></button>
                                </form>
                            </div>
                        </div>
                    </div>

                    <%
                    Controller_Day_RecordDao dr = Controller_Day_RecordDao.getDay_RecordDao();
                    int convertSelectedBtn = Integer.parseInt(selectedBtn);
                    List<Day_Record> listDR = dr.fetchAll(convertSelectedBtn);

                        if (listDR.size()>0) {
                    %>
                    <table class="table table-striped table-hover table-responsive pl-2" style="overflow-x:auto; font-size: 12px;">
                        <thead>
                            <tr>
                                <th>RecordID</th>
                                <th>Time-in</th>
                                <th>Cadet ID</th>
                                <th>Present</th>
                                <th>Absent</th>
                                <th>Late</th>
                                <th>Excused</th>
                                <th>View Cadet</th>
                            </tr>
                        </thead>

                        <tbody>
                            <%
                            for (int i = 0; i < listDR.size(); i++) {
                                Day_Record rcd = listDR.get(i);
                            %>
                            <tr>
                                <td><%=rcd.getDay_record_records_id()%> </td>
                                <td><%=rcd.getDay_record_time()%> </td>
                                <td><%=rcd.getDay_record_cadet_id()%></td>
                                <form action="">
                                    <td><%--rcd.getDay_record_present() --%><input type="radio" name="status" value="present" checked></td>
                                    <td><input type="radio" name="status" value="absent"></td>
                                    <td><%--rcd.getDay_record_late()--%><input type="radio" name="status" value="late"></td>
                                    <td><%--rcd.getDay_record_excuse()--%><input type="radio" name="status" value="excuse"></td>
                                </form>
                                <td><a class="openSession btn btn-info" style="color: white;" href="profile.jsp">View</a></td>
                                <!--<td><button class="openSession btn btn-info" href="#openSessionModal" data-toggle="modal">Open</button></td>-->
                        <!--For the open button-->
    <!--                    <script>
                            //For the Opened button
                            $(document).on("click", ".openSession", function () {
    //                                var mySessionId = $(this).data('id');
                                var buttons = document.getElementsByClassName('btn');
                                for (var i=0 ; i < buttons.length ; i++){
                                  (function(index){
                                    buttons[index].onclick = function(){
                                        document.getElementById("currentSession").innerHTML = "Session " + index;
    //                                        alert("I am button " + index);
                                    };
                                  })(i);
                                }
                           });
                        </script>-->
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                    <%}else{
                        out.println("No Records Found");
                    }%>
            </div>
        </div>
        <!--End of Open Modal-->
        
</body>
</html>                                		                            