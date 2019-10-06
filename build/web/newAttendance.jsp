<!DOCTYPE html>
<html lang="en">
<!--Files-->
<%@page import="java.util.List"%>
<%@page import="model.Student"%>
<%@page import="model.Session"%>
<%@page import="model.Records"%>
<%@page import="model.Day_Record"%>
<%@page import="dao.Controller_StudentDao"%>
<%@page import="dao.Controller_SessionDao"%>
<%@page import="dao.Controller_RecordsDao"%>
<%@page import="dao.Controller_Day_RecordDao"%>


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
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Valerie Luna</span>
                <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
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
                            <div class="col-sm-8 p-4">
                                <a href="#addSessionModal" class="btn btn-success p-2" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add Session</span></a>
                            </div>
                            <div class="col-sm-4 p-4">
                                <h5 style="color:white; padding: 10px;"><strong><% 
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
                    Controller_Day_RecordDao dr = Controller_Day_RecordDao.getDay_RecordDao();
                    List<Records> list = rd.fetchAll();
                    Day_Record checkDayRecord = dr.fetchAll();
                    
                        if (list.size()>0) {
                    %>
                    <div>
                        <%
                            if  (checkDayRecord != null){%>
                                <h4 style="color: white; padding: 5px; word-spacing: 1px; background-image: linear-gradient(90deg, darkred, darkblue);">Currently Editing Session <%= checkDayRecord.getDay_record_id()%></h4>
                            <%}else{%>
                                <h4 style="color: white; padding: 5px; word-spacing: 1px; background-image: linear-gradient(90deg, darkgoldenrod, darkblue);">Session Editing is Available.</h4>
                            <%}
                        %>
                    </div>
                        <table cellpadding="15" width="100%" class="table-responsive" >
                            <thead>
                                <tr style="background-color: #36b9cc; color: white;">
                                    <th>Session ID</th>
                                    <th>Total Present</th>
                                    <!--<th>Total AM</th>-->
                                    <!--<th>Total PM</th>-->
                                    <th>Session Date</th>
                                    <th>View Session</th>
                                    <!--<th>Edit Session</th>-->
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
                                    <!--<td><%--rcd.getRecordsAM() --%></td>-->
<!--                                    <td><%--rcd.getRecordsPM() --%></td>-->
                                    <td><%=rcd.getRecordsDate()%></td>
                                    <td>
                                        <form action="openNewSession.jsp">
                                            <center><button class="openSession btn btn-info" name="sessionID" value="<%=i+1%>">Open</button></center>
                                        </form>
                                    </td>
                                    
<!--                                    <td>
                                        <form action="editSession.jsp">
                                            <center><button class="btn btn-info" name="sessionID" value="<%=i+1%>">Edit</button></center>
                                        </form>
                                    </td-->
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                        <%}else{
                            out.println("No Records Found.");
                            }%>

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

  <!--Scripts-->
  <!-- Modals -->
  
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
                            <input type="date" id="selectDate" onload="getDate()" class="form-control" name="sessionDate" required>
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
