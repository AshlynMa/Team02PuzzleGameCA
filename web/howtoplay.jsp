<%-- 
    Document   : howtoplay
    Created on : Aug 10, 2015, 6:25:21 PM
    Author     : Ashlyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Puzzle Game - How to Play</title>
    </head>

    <body class="homepage">
        <!-- Header -->
        <jsp:include page="header.jsp" flush="true"/>

        <!-- Page -->

        <div id="page">
            <div class="container">
                <div class="row">

                    <div id="content" class="12u skel-cell-important">
                        <article>
                            <header>
                                <h2 class="main-title">Learn How to Play the Puzzle Game!</h2>
                            </header>
                            
                            <a href="#" class="image-style1"><img src="imgweb/htp_bg.jpg" alt=""></a>
                            
                            <br>
                            <h3>HOW TO PLAY</h3>
                            <p>The object is to find all the 'Sets' in the 12 cards. When you find a three card set, it will be replaced with three cards from the deck..<br>
                                You can keep playing until cards in the deck run out and then the game will automatically reset.<br>
                                A 'Set' is 3 cards in which each individual feature is either all the SAME on each card... OR all DIFFERENT on each card.<br>
                                That is to say, any feature in the 'Set' of three cards is either common to all three cards or is different on each card.</p>
                            <br>

                            <h3>THE FEATURES</h3>
                            <p>Symbols - Each card has ovals, squiggles, or diamonds on it;<br>
                                Colors - The symbols are red, green, or purple;<br>
                                Number - Each card has one, two, or three symbols on it;<br>
                                Shading - The symbols are solid, striped or open.</p>
                        </article>
                    </div>
                </div>
            </div>
        </div>


        <jsp:include page="footer.jsp" flush="true"/>
    </body>
</html>
