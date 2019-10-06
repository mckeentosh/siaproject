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
        <a href="attendance.jsp">Attendance</a>
        <a class="active" href="profile.jsp">Profile</a>
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
                        <h2>Manage <b>Cadets</b></h2>
                    </div>
                    <div class="col-sm-6">
                        <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Cadet</span></a>
                        <a href="#editEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">edit</i> <span>Edit Cadet</span></a>

                        <h6><strong><% 
                            String msg = request.getParameter("msg");
                            if (msg!=null) {
                                out.print(msg);
                            }
                            %>
                        </strong></h6>
<!--                        <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						-->
                    </div>
                    
                </div>
            </div>
            
            <%
            Controller_StudentDao sd = Controller_StudentDao.getStudentDao();
            List<Student> list = sd.fetchAll();
            if (list.size()>0) {
            %>
            <table class="table table-striped table-hover table-responsive pl-4" style="overflow-x:auto; font-size: 12px;">
                <thead>
                    <tr>
<!--                        <th>
                            <span class="custom-checkbox">
                                <input type="checkbox" id="selectAll">
                                <label for="selectAll"></label>
                            </span>
                        </th>-->
                        <th>ID (UIC)</th>
                        <th>ID (Barcode)</th>
                        <th>Name</th>
                        <th>Platoon</th>
                        <th>Course</th>
                        <th>Status</th>
                        <th>No. Points</th>
                        <th>No. Absences</th>
                        <th>No. Tardiness</th>
                        <!--<th>Actions</th>-->
                    </tr>
                </thead>
                <tbody>
                    <%
                    for (int i = 0; i < list.size(); i++) {
                        Student std = list.get(i);
                    %>
                    <tr>
<!--                        <td>
                            <span class="custom-checkbox">
                                <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                <label for="checkbox1"></label>
                            </span>
                        </td>-->
                        
                        <td><%=std.getIdUic() %> </td>
                        <td><%=std.getIdBarcode() %> </td>
                        <td><%=std.getName() %></td>
                        <td><%=std.getPlatoon() %></td>
                        <td><%=std.getCourse()%></td>
                        <td><%=std.getStatus() %></td>
                        <td><%=std.getPoints() %></td>
                        <td><%=std.getAbsents()%></td>
                        <td><%=std.getTardiness() %></td>
                        
<!--                        <td>
                            <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                            <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                        </td>-->
                    </tr>
                    <%}%>
                </tbody>
            </table>
            <%}%>
                
<!--            <div class="clearfix">
                <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                <ul class="pagination">
                    <li class="page-item disabled"><a href="#">Previous</a></li>
                    <li class="page-item active"><a href="#" class="page-link">1</a></li>
                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                    <li class="page-item"><a href="#" class="page-link">3</a></li>
                    <li class="page-item"><a href="#" class="page-link">4</a></li>
                    <li class="page-item"><a href="#" class="page-link">5</a></li>
                    <li class="page-item"><a href="#" class="page-link">Next</a></li>
                </ul>
            </div>-->
        </div>
    </div>
                        
    <!-- Add Modal HTML -->
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
  
    <!-- Edit Modal HTML -->
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

    <!-- Delete Modal HTML -->
    <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                    <div class="modal-content">
                            <form>
                                    <div class="modal-header">						
                                            <h4 class="modal-title">Delete Employee</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    </div>
                                    <div class="modal-body">					
                                            <p>Are you sure you want to delete these Records?</p>
                                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                                    </div>
                                    <div class="modal-footer">
                                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                            <input type="submit" class="btn btn-danger" value="Delete">
                                    </div>
                            </form>
                    </div>
            </div>
    </div>
</body>
</html>                                		                            