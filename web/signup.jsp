<%-- 
    Document   : signup
    Created on : Aug 4, 2015, 1:25:32 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>Sign Up</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    
       <form action="signupServlet" method="get">
        <div class="body"></div>
        <div class="grad"></div>
        <div class="header">
            <div>Puzzle<span>Game</span></div>
        </div>
        <br>
        <div class="login">
            <input type="text" placeholder="username" name="username"><br><br>
            <input type="text" placeholder="email" name="email"><br>
            <input type="password" placeholder="password" name="password"><br>
            <input type="password" placeholder="confirm password" name="repassword"><br>

            <input type="submit" value="Signup" />
            <h2>Already a member? <a href="login.jsp">Log In</a></h2>
        </div>
       </form>
</body>
</html>