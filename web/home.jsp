<%-- 
    Document   : home
    Created on : Aug 4, 2015, 1:26:43 PM
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
    </head>
    <body class="homepage">
        <!-- Header -->
        <jsp:include page="header.jsp" flush="true"/>

        <div id="header-wrapper">
            <div id="banner">
                <div class="container">
                    <div class="row">
                        <section class="12u">
                            <header>
                                <h2>Welcome to Puzzle Game</h2>
                                <span class="byline">Please create a new game to play!</span>
                            </header>
                            <a href="#" class="button button-alt">Create New Game</a>
                        </section>
                    </div>
                </div>
            </div>			

        </div>
        <!-- Header Ends Here -->

        <!-- Featured Area -->
        <div id="featured-wrapper">

            <div class="container">
                <div class="row double">
                    <section class="4u">
                        <header>
                            <h2>Game 1</h2>
                        </header>
                        <a href="#" class="button button-style1">Join</a>
                    </section>
                    <section class="4u">
                        <header>
                            <h2>Game 2</h2>
                        </header>
                        <a href="#" class="button button-style1">Join</a>
                    </section>
                    <section class="4u">
                        <header>
                            <h2>Game 3</h2>
                        </header>
                        <a href="#" class="button button-style1">Join</a>
                    </section>
                    <br>
                    <br>
                    <br>
                    <br>
                </div>
            </div>

        </div>


        <!-- Featured Ends Here -->

      <jsp:include page="footer.jsp" flush="true"/>
</html>

