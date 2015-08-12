<%-- 
    Document   : header
    Created on : Aug 4, 2015, 1:27:46 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <title>Puzzle Game - Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/styletwo.css">
        <%--to highlight which menu item is currently selected--%>
        <script src="javascript/currentselectedmenu.js" type="text/javascript"></script>
    </head>

    <body onload="loadcurrentmenu();" class="homepage">
        <div id="header-wrapper">
            <div id="header" class="container">
                <div id="logo"><h1><a href="#">Puzzle<span>Game</span></a></h1></div>
                <nav id="nav">
                    <ul id="menu">
                        <li><a href="home.jsp">Home</a></li>
                        <li><a href="howtoplay.jsp">How to Play</a></li>
                        <li><a href="login.jsp">Log Out</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </body>

</html>
