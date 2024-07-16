<%-- 
    Document   : login
    Created on : Jun 26, 2024, 10:26:35 PM
    Author     : sonnt-local
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>
        <div class="login-container">
            <h2 style="color: orange">Login</h2>
            <form action="login" method="POST">
                <label for="username" style="color: orange">Username</label>
                <input type="text" id="username" name="username" required/> 
                <label for="password" style="color: orange">Password</label>
                <input type="password" id="password" name="password" required/>
                <input type="submit" value="Login"/>
            </form>
        </div>
    </body>
</html>
