<%@page import="model.Day_Record"%>
<%@page import="dao.Controller_Day_RecordDao"%>
<%@page import="java.sql.Date"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
<%@include file="attendance_imports.jsp" %>

<!--Files-->
<%@page import="java.util.List"%>
<%@page import="model.Student"%>
<%@page import="model.Session"%>
<%@page import="model.Records"%>
<%@page import="dao.Controller_StudentDao"%>
<%@page import="dao.Controller_SessionDao"%>
<%@page import="dao.Controller_RecordsDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance</title>
        
    </head>
    
    <style>
        table {
          border-collapse: collapse;
          width: 100%;
        }

        th, td {
          text-align: left;
          padding: 8px;
        }

        tr:nth-child(even) {background-color: #f2f2f2;}
    </style>
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
                        <div class="col-sm-6">
                            <h2>Manage <b>Attendance</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addSessionModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add Session</span></a>
                            
                            <h5><strong><% 
                                int latest = 0;
                                String msg = request.getParameter("msg");
                                if (msg!=null) {
                                    out.print(msg);
                                }
                                %>
                            </strong></h5>
                        </div>

                    </div>
                </div>

                <%
                Controller_RecordsDao rd = Controller_RecordsDao.getRecordsDao();
                
                List<Records> list = rd.fetchAll();
                    if (list.size()>0) {
                %>
                    <table>
                        <thead>
                            <tr>
                                <th>Session ID</th>
                                <th>Total Present</th>
                                <th>Total AM</th>
                                <th>Total PM</th>
                                <th>Session Date</th>
                                <th>View Session</th>
                            </tr>
                        </thead>

                        <tbody>
                            <%
//                            int sessions[] = new int [list.size()];
                            for (int i = 0; i < list.size(); i++) {
                                Records rcd = list.get(i);
                                latest = rcd.getRecordsID();
//                                sessions[i] = rcd.getRecordsID();
                            %>
                            <tr>
                                <td><%=rcd.getRecordsID()%> </td>
                                <td><%=rcd.getRecordsTotal()%> </td>
                                <td><%=rcd.getRecordsAM() %></td>
                                <td><%=rcd.getRecordsPM() %></td>
                                <td><%=rcd.getRecordsDate()%></td>
                                <!--For the open button-->
<!--                                <script>
                                    //For the Opened button
                                    function openSession(){
                                        var buttons = document.getElementsByClassName('btn');
                                        
                                        for (var i=0 ; i < buttons.length ; i++){
                                              (function(index){
                                                buttons[index].onclick = function(){
                                                    document.getElementById("currentSession").value=index;
                                                    document.getElementById("currentSessionDisplay").innerHTML = "Session " + index;
            //                                        alert("I am button " + index);
                                                };
                                              })(i);
                                            }
                                    }
                                    window.onload = openSession;
                                </script>-->
                                <td>
                                    <form action="session.jsp">
                                        <button class="openSession btn btn-info" name="sessionID" value="<%=i+1%>">Open</button>
                                    </form>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                    <%}%>

            </div>
        </div>
                
        <!-- Add Modal HTML -->
        <div id="addSessionModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form name="myForm" action="addRecordsProcess.jsp" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Session</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        
                        <div class="modal-body">
                            <div class="form-group">
                                <label>Current Session ID</label>
                                <input type="number" class="form-control" name="latestID" value="<%=latest%>" readonly>
                                <label>Session Date</label>
                                <input type="date" class="form-control" name="sessionDate" required>
                            </div>
                        </div>
                        
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--End of Add Modal -->
        
        <!--Add Cadet Modal-->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form name="myForm" action="addProfileProcess.jsp" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Cadet</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>ID (UIC)</label>
                                <input type="number" class="form-control" name="idUic" required>
                            </div>
                            <div class="form-group">
                                <label>ID (Barcode)</label>
                                <input type="number" class="form-control" name="idBarcode" required>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" name="name" required>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" class="form-control" name="password" required>
                            </div>
                            <div class="form-group">
                                <label>Position</label><br>
                                <input type="radio" name="position" value="admin" disabled> Admin<br>
                                <input type="radio" name="position" value="cadet" checked required> Cadet <br>
                            </div>					
                            <div class="form-group">
                                <label>Platoon</label>
                                <input type="text" class="form-control" name="platoon" required>
                            </div>					
                            <div class="form-group">
                                <label>Religion</label>
                                <input type="text" class="form-control" name="religion" required>
                            </div>					
                            <div class="form-group">
                                <label>Gender</label><br>
                                <input type="radio" name="gender" value="m" required> Male<br>
                                <input type="radio" name="gender" value="f" required> Female<br>
                            </div>					
                            <div class="form-group">
                                <label>Age</label>
                                <input type="text" class="form-control" name="age" required>
                            </div>					
                            <div class="form-group">
                                <label>Date of Birth</label>
                                <input type="date" class="form-control" name="dob" required>
                            </div>					
                            <div class="form-group">
                                <label>Course</label>
                                <input type="text" class="form-control" name="course" required>
                            </div>					
                            <div class="form-group">
                                <label>Section</label>
                                <input type="text" class="form-control" name="section" required>
                            </div>					
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--End of Add Cadet Modal-->
        
        <!-- Edit Cadet Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="updateProfileProcess.jsp" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Cadet</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>ID(UIC)</label>
                                <input type="text" class="form-control" name="idUic1" required>
                            </div>

                            <div class="form-group">
                                <label>ID (Barcode)</label>
                                <input type="text" class="form-control" name="idBarcode1">
                            </div>		

                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" name="name1">
                            </div>

                            <div class="form-group">
                                <label>Password</label>
                                <input type="text" class="form-control" name="password1">
                            </div>

                            <div class="form-group">
                                <label>Position</label><br>
                                <!--<input type="text" class="form-control" name="position1">-->

                                <select name="position1" class="custom-select mb-3">
                                    <option selected>Select Position</option>
                                    <option value="admin">Admin</option>
                                    <option value="cadet">Cadet</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Platoon</label>
                                <input type="text" class="form-control" name="platoon1">
                            </div>
                            <div class="form-group">
                                <label>Religion</label>
                                <input type="text" class="form-control" name="religion1">
                            </div>
                            <div class="form-group">
                                <label>Gender</label><br>
                                <select name="gender1" class="custom-select mb-3">
                                    <option selected>Select Gender</option>
                                    <option value="m">Male</option>
                                    <option value="f">Female</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Age</label>
                                <input type="text" class="form-control" name="age1">
                            </div>
                            <div class="form-group">
                                <label>Date of Birth</label>
                                <input type="date" class="form-control" name="dob1">
                            </div>
                            <div class="form-group">
                                <label>Course</label>
                                <input type="text" class="form-control" name="course1">
                            </div>
                            <div class="form-group">
                                <label>Section</label>
                                <input type="text" class="form-control" name="section1">
                            </div>
                            <div class="form-group">
                                <label>Status</label><br>
                                <select name="status1" class="custom-select mb-3">
                                    <option selected>Select Status</option>
                                    <option value="active">Active</option>
                                    <option value="inactive">Inactive</option>
                                    <option value="dropped">Dropped</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Points</label>
                                <input type="number" class="form-control" name="points1">
                            </div>
                            <div class="form-group">
                                <label>Absents</label>
                                <input type="number" class="form-control" name="absents1">
                            </div>
                            <div class="form-group">
                                <label>Tardiness</label>
                                <input type="number" class="form-control" name="tardiness1">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--End of Edit Cadet Modal-->
    </body>
</html>
