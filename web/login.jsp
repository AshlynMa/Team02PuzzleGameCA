<%-- 
    Document   : login.jsp
    Created on : Aug 4, 2015, 3:06:05 PM
    Author     : Ashlyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Log In</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        <form action="loginServlet" method="post">
            <div class="body"></div>
            <div class="grad"></div>
            <div class="header">
                <div>Puzzle<span>Game</span></div>
            </div>
            <br>
            <div class="login">
                <input type="text" placeholder="username" name="username"><br>
                <input type="password" placeholder="password" name="password"><br><br>
                <input type="submit" value="Login" />
                <h2>Not a member? <a href="signup.jsp">Sign Up</a></h2>

                <%
                    if (request.getAttribute("errorMessage") != null) {
                %>
                <p style="color:red"> Login Failed. Please try again. </p>
                <%
                    }
                %>
            </div>
        </form>
    </body>
</html>
