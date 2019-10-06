<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body class="bg-dark" style="color: white;">
    <center>
        <br><br><br><br>
        <h1>Login</h1>
        <form action="loginprocess.jsp" method="POST" >
            <table align="center">
                <tr>
                    <th align="right" class="pt-4">ID number:</th>
                    <td class="pt-4"><input type="text" name="txtid"></td>
                </tr>
                <tr>
                    <th align="right" class="pt-4">Password:</th>
                    <td class="pt-4"><input type="password" name="txtpassword"></td>
                </tr>
                <tr>
                    <label class="radio-inline "><input type="radio" name="txtposition" checked>Cadet</label>
                    <label class="radio-inline pl-4"><input type="radio" name="txtposition">Admin</label>
                </tr>
                <tr>
                    <td colspan="2" align="right" class="pt-4">
                        <input type="submit" value="Login" class="btn-primary">
                    </td>
                </tr>
            </table>
        </form>
    </center>
    </body>
</html>
