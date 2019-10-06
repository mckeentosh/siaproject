<!DOCTYPE html>
<html lang="en">
<!--Files-->
<%@page import="model.Student"%>
<%@page import="java.util.List"%>
<%@page import="dao.Controller_StudentDao"%>


<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Admin - Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
        <div class="sidebar-brand-icon rotate-n-15">
            <img src="img/uic-logo.png" width="50px" style="background-color: white;">
          <!--<i class="fas fa-laugh-wink"></i>-->
        </div>
        <div class="sidebar-brand-text mx-3">UIC ROTC <sup>2</sup></div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Monitor
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>Attendance</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Select By</h6>
            <a class="collapse-item" href="buttons.jsp">Platoon</a>
            <a class="collapse-item" href="buttons.jsp">Student</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>Profile</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Select By</h6>
                <a class="collapse-item" href="buttons.jsp">Platoon</a>
                <a class="collapse-item" href="buttons.jsp">Student</a>
          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Manage
      </div>

      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="newAttendance.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Attendance</span></a>
      </li>

      <!-- Nav Item - Tables -->
      <li class="nav-item">
        <a class="nav-link" href="newProfile.jsp">
          <i class="fas fa-fw fa-table"></i>
          <span>Profile</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>
          </form>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Mckeen Asma</span>
                <img class="img-profile rounded-circle" src="img/uic-logo.png" >
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  Activity Log
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Manage Attendance</h1>
            <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
          </div>

          <!-- Content Row -->

          <div class="row">

            <!-- Table Attendance -->
            <div class="col-xl-12 col-lg-7">
              <div class="card shadow mb-4">
                  <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row" style="background-color: #4e73df;">                     
                            <div class="col-sm-6 p-3">
                                <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Cadet</span></a>
                                <a href="#editEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Edit Cadet</span></a>

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
                    <table cellpadding="15" width="100%" style="overflow-x:auto; font-size: 12px;">
                        <thead>
                            <tr style="background-color: #36b9cc; color: white;">
        <!--                        <th>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="selectAll">
                                        <label for="selectAll"></label>
                                    </span>
                                </th>-->
                                
                                <th><b>ID (UIC)</b></th>
                                <th><b>ID (Barcode)</b></th>
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
                </div>
              </div>
            </div>
                        
                        
        </div>
                        
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.jsp">Logout</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Modals -->
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
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="js/demo/chart-area-demo.js"></script>
  <script src="js/demo/chart-pie-demo.js"></script>
</body>

</html>
