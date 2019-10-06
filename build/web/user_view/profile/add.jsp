<!DocType html>
<html>
    <head>
        <title>Profiling</title>
        
        <script type="text/javascript">
            function validate(){
                var id = document.myForm.id.value;
                
                if (id==="") {
                    alert("Please Enter ID");
                    docuement.myForm.id.focus();
                    return false;
                }
                
            }
        </script>
    </head>
    
    <body>
        <form name="myForm" action="addprocess.jsp" method="post"><br>
            Enter ID<input type="text" name="id"><br>
            Enter Name<input type="text" name="name"><br>
            Enter Password<input type="password" name="password"><br>
            Enter Position<input type="text" name="position"><br>
            Enter Platoon<input type="text" name="platoon"><br>
            Enter Religion<input type="text" name="religion"><br>
            Enter Gender
            <input type="radio" name="gender" value="m"> Male
            <input type="radio" name="gender" value="f"> Female <br>
            Enter Age<input type="text" name="age"><br>
            Enter Date of Birth<input type="date" name="dob"><br>
            Enter Course<input type="text" name="course"><br>
            Enter Section<input type="text" name="section"><br>
        <!--    Status<input type="text" name="status"><br>
            No. Point(s) e.g (Merits/Demerits)<input type="text" name="points" value="0" disabled><br>
            No. Absent(s)<input type="text" name="absents" value="0" disabled><br>
            No. Tardiness<input type="text" name="tardiness" value="0" disabled><br>-->

            <input type="submit" onClick="return validate();" value="Add Student"> <br>
        </form>
    </body>
</html>