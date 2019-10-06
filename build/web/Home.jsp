*<%@include file="home_imports.jsp" %>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Home</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
    <!--Navigation Bar-->
    <div class="topnav">
        <a class="active" href="Home.jsp">Home</a>
        <a href="attendance.jsp">Attendance</a>
        <a href="profile.jsp">Profile</a>
        <div class="search-container">
          <form action="/action_page.php">
            <input type="text" placeholder="Search.." name="search">
            <button type="submit"><i class="fa fa-search"></i></button>
          </form>
        </div>
    </div>

<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav hidden-xs">
      <h2><img src="rotc-logo.png" width="180px"></h2>
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="#section1">Dashboard</a></li>
        <li><a href="#section3">Change Password</a></li>
        <li><a href="#section3">Logout</a></li>
      </ul><br>
    </div>
    <br>
    
    <div class="col-sm-9">
      <div class="well">
        <center>
        <h4>Dashboard</h4>
        <p>A graphical representation of Attendance and Profile</p>
        </center>
      </div>
      <div class="row">
        <div class="col-sm-6">
          <div class="well">
            <h4>No. Users</h4>
            <p>100</p> 
          </div>
        </div>
          

        <div class="col-sm-6">
          <div class="well">
            <h4>No. Sessions</h4>
            <p>10</p> 
          </div>
        </div>
         
        <div class="col-sm-12">
            <div class="well">
                <h4>Profile Chart</h4>
                
                    <!--Male and Female-->
                    <center>
                    <div id="piechartMaleAndFe"></div>
                    </center>
                    <script type="text/javascript">
                    // Load google charts
                    google.charts.load('current', {'packages':['corechart']});
                    google.charts.setOnLoadCallback(drawChart);

                    // Draw the chart and set the chart values
                    function drawChart() {
                      var data = google.visualization.arrayToDataTable([
                      ['Task', 'Male and Female'],
                      ['Male', 50],
                      ['Female', 50]
                    ]);

                      // Optional; add a title and set the width and height of the chart
                      var options = {'title':'Male and Female', 'width':550, 'height':400};

                      // Display the chart inside the <div> element with id="piechart"
                      var chart = new google.visualization.PieChart(document.getElementById('piechartMaleAndFe'));
                      chart.draw(data, options);
                    }
                    </script>
                    
                    <br>
                    <!--Youngest to Oldest-->
                    <center>
                    <div id="piechartYoungToOld"></div>
                    </center>
                    <script type="text/javascript">
                        // Load google charts
                        google.charts.load('current', {'packages':['corechart']});
                        google.charts.setOnLoadCallback(drawChart);

                        // Draw the chart and set the chart values
                        function drawChart() {
                          var data = google.visualization.arrayToDataTable([
                          ['Task', 'Youngest to Oldest'],
                          ['Youngest Male', 18],
                          ['Youngest Female', 17],
                          ['Oldest Male', 22],
                          ['Oldest Female', 18]
                        ]);

                          // Optional; add a title and set the width and height of the chart
                          var options = {'title':'Youngest to Oldest', 'width':550, 'height':400};

                          // Display the chart inside the <div> element with id="piechart"
                          var chart = new google.visualization.PieChart(document.getElementById('piechartYoungToOld'));
                          chart.draw(data, options);
                        }
                    </script>
                    
                    <!--Highest to Merited and Demerited-->
                    <center>
                        <div class="mAndD" id="piechartHighestMerited" ></div>
                        <div class="mAndD" id="piechartHighestDemerited"></div>
                    </center>
                    <style>
                        .mAndD { 
                            display: inline-block; 
                            padding:2px;
                            margin:10px;
                        }
                    </style>
                    
                    <script type="text/javascript">
                        //DEMERITED
                        // Load google charts
                        google.charts.load('current', {'packages':['corechart']});
                        google.charts.setOnLoadCallback(drawChart);

                        // Draw the chart and set the chart values
                        function drawChart() {
                          var data = google.visualization.arrayToDataTable([
                          ['Task', 'Highest Demerited Student'],
                          ['Mckeen Asma', 5],
                          ['Brem Barcelo', 4],
                          ['Jaco Miras', 3],
                          ['Danelle Pio', 4],
                          ['Jonas Surigao', 5]
                        ]);

                          // Optional; add a title and set the width and height of the chart
                          var options = {'title':'Highest Demerited Student', 'width':262, 'height':200};

                          // Display the chart inside the <div> element with id="piechart"
                          var chart = new google.visualization.PieChart(document.getElementById('piechartHighestDemerited'));
                          chart.draw(data, options);
                        }
                        </script>
                    <script type="text/javascript">
                    //MERITED
                        // Load google charts
                        google.charts.load('current', {'packages':['corechart']});
                        google.charts.setOnLoadCallback(drawChart);

                        // Draw the chart and set the chart values
                        function drawChart() {
                          var data = google.visualization.arrayToDataTable([
                          ['Task', 'Highest Merited Student'],
                          ['Mckeen Asma', 1],
                          ['Brem Barcelo', 2],
                          ['Jaco Miras', 3],
                          ['Danelle Pio', 4],
                          ['Jonas Surigao', 5]
                        ]);

                          // Optional; add a title and set the width and height of the chart
                          var options = {'title':'Highest Merited Student', 'width':262, 'height':200};

                          // Display the chart inside the <div> element with id="piechart"
                          var chart = new google.visualization.PieChart(document.getElementById('piechartHighestMerited'));
                          chart.draw(data, options);
                        }
                    </script>
            </div>
        </div>
        
        <div class="col-sm-12">
            
        </div>
        
      </div>
    </div>
  </div>
</div>

</body>
</html>
