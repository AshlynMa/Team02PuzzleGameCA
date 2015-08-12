<%-- 
    Document   : game
    Created on : Aug 4, 2015, 1:28:42 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Puzzle Game - Playing!</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/styletwo.css">
        <link rel="stylesheet" type="text/css" href="css/component.css">
        <script type="text/javascript" src="javascript/jquery-1.4.2.min.js"></script>
       
    </head>

    <body class="homepage">

        <jsp:include page="header.jsp" flush="true"/>

        <br><br>
    <center>
        <table>
            <tr>
                <!--                <td width="100"><input type="button" value="Pause" onclick="toggle_timer()"></td>-->
                <td width="80">&nbsp;</td>
                <td width="130">Timer: <input type="text" id="tot_time" readonly size="5" value="0"></td>
                <td width="130">Score <input type="text" id="tot_score" readonly size="5" value="0"></td>
                <td width="150">Cards in deck: <input type="text" size="2" id="cardcount" readonly value="69"></td>
                <td width="100" id="matchfound">Match: <font color="#FF0000">waiting</font></td>
                <td width="100"><input type="button" value="Hint" onclick="findmatch(1)"></td>
            </tr>
        </table>

        <br><br>
        <!-- set up the playing area -->
        <table cellspacing=0 cellpadding=0>
            <tr>
                <td width="200" height="140" valign="middle" align="center">
                    <div id="r1c1" width="200" height="140" class="style1" onclick="toggleselect('r1c1');"></div>
                </td>
                <td width="200" height="140" valign="middle" align="center">
                    <div id="r1c2" width="200" height="140" class="style1" onclick="toggleselect('r1c2');"></div>
                </td>
                <td width="200" height="140" valign="middle" align="center">
                    <div id="r1c3" width="200" height="140" class="style1" onclick="toggleselect('r1c3');"></div>
                </td>
                <td width="200" height="140" valign="middle" align="center">
                    <div id="r1c4" width="200" height="140" class="style1" onclick="toggleselect('r1c4');"></div>
                </td>
            </tr>
            <tr>
                <td width="200" height="140" valign="middle" align="center">
                    <div id="r2c1" width="200" height="140" class="style1" onclick="toggleselect('r2c1');"></div>
                </td>
                <td width="200" height="140" valign="middle" align="center">
                    <div id="r2c2" width="200" height="140" class="style1" onclick="toggleselect('r2c2');"></div>
                </td>
                <td width="200" height="140" valign="middle" align="center">
                    <div id="r2c3" width="200" height="140" class="style1" onclick="toggleselect('r2c3');"></div>
                </td>
                <td width="200" height="140" valign="middle" align="center">
                    <div id="r2c4" width="200" height="140" class="style1" onclick="toggleselect('r2c4');"></div>
                </td>
            </tr>
            <tr>
                <td width="200" height="140" valign="middle" align="center">
                    <div id="r3c1" width="200" height="140" class="style1" onclick="toggleselect('r3c1');"></div>
                </td>
                <td width="200" height="140" valign="middle" align="center">
                    <div id="r3c2" width="200" height="140" class="style1" onclick="toggleselect('r3c2');"></div>
                </td>
                <td width="200" height="140" valign="middle" align="center">
                    <div id="r3c3" width="200" height="140" class="style1" onclick="toggleselect('r3c3');"></div>
                </td>
                <td width="200" height="140" valign="middle" align="center">
                    <div id="r3c4" width="200" height="140" class="style1" onclick="toggleselect('r3c4');"></div>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td width="200" height="140" valign="middle" align="center">
                    <div id="r4c1" width="200" height="140" class="style1" onclick="toggleselect('r4c1');"></div>
                </td>
                <td width="200" height="140" valign="middle" align="center">
                    <div id="r4c2" width="200" height="140" class="style1" onclick="toggleselect('r4c2');"></div>
                </td>
                <td width="200" height="140" valign="middle" align="center">
                    <div id="r4c3" width="200" height="140" class="style1" onclick="toggleselect('r4c3');"></div>
                </td>
            </tr>
        </table>
        
        <jsp:include page="footer.jsp" flush="true"/>
    </center>

    <script>
        var nextcard = 0;
        var count = 1;
        var totalTime = 60 * 30;
        var minute = parseInt(totalTime / 60);
        var second = parseInt(totalTime % 60);
        var cards = new Array();
        var colors = new Array('Red', 'Green', 'Purple');
        var shades = new Array('Striped', 'Solid', 'Outlined');
        var shapes = new Array('Oval', 'Diamond', 'Squiggle');
        var cardqueue = new Array();
        var placedcards = new Array();
        placedcards["r4c1"] = "";
        placedcards["r4c2"] = "";
        placedcards["r4c3"] = "";
        var allcards = new Array();
        for (i = 0; i < 3; i++)
            for (j = 0; j < 3; j++)
                for (k = 0; k < 3; k++)
                    for (ii = 0; ii < 3; ii++) {
                        pos = Number(i * 27) + Number(j * 9) + Number(k * 3) + ii;
                        allcards[pos] = ii + colors[i] + shades[j] + shapes[k];
                    }

        function shuffle() {
            //  var d = new Date();
            var cardindex = allcards;
            var randnum = 0;
            var top = 0;
            for (i = 0; i < 81; i++) {
                randnum = Math.floor(Math.random() * cardindex.length);
                cards[i] = cardindex[randnum];
                top = cardindex.length - 1;
                for (j = randnum; j < top; j++)
                    cardindex[j] = cardindex[j + 1];
                cardindex.pop();
            }
            //  var d2= new Date();
            //  var timetook=d2-d;
            //  document.write('The shuffle took '+timetook+' milliseconds');
        }

        function startgame() {
//            document.getElementById('ave_time').value = " ";
//            document.getElementById('quick_time').value = " ";
//            document.getElementById('slow_time').value = " ";
            shuffle();
            for (i = 1; i < 4; i++) {
                for (j = 1; j < 5; j++) {
                    pos = (i - 1) * 4 + (j - 1);
                    cardqueue[pos] = new Array();
                    cardqueue[pos]['card'] = cards[pos];
                    var cell = 'r' + i + 'c' + j;
                    cardqueue[pos]['cell'] = cell;
                }
            }
            placecards('250');
            setTimeout('starttimer()', 3000);
            nextcard = 12;

            document.getElementById('tot_time').value = minute + ':' + second;
            if (totalTime > 0) {
                totalTime = totalTime - 1;
                minute = parseInt(totalTime / 60);
                second = parseInt(totalTime % 60);
                setTimeout('CheckTime()', 1000);
            }
            else{
                //setTimeout('timer()',200);
                alert('Timed Out!');
                location.reload('game.jsp');
            }

        }

//        var end_time = 0;
        var tot_time = 0;
//        var ave_time = 0;
//        var quick_time = 0;
//        var slow_time = 0;
//        var timer_on = 0;
//        var passed = 0;
//        var times = new Array();
        function starttimer() {
            timer_on = 1;
            setTimeout('timer()', 250);
        }

        function CheckTime() {
            document.getElementById('tot_time').value = minute + ':' + second;
            if (totalTime > 0) {
                totalTime = totalTime - 1;
                minute = parseInt(totalTime / 60);
                second = parseInt(totalTime % 60);
                setTimeout('CheckTime()', 1000);
            }


        }

        var selectpos = 0;
        var selectarr = new Array();
        function toggleselect(divname) {
            dobj = document.getElementById(divname).style;
            if (selectarr[0] === divname || selectarr[1] === divname || selectarr[2] === divname) {
                var top = selectarr.length;
                for (i = 0; i < top; i++) {
                    if (selectarr[i + 1] === divname)
                        continue;
                    selectarr[i] = selectarr[i + 1];
                }
                selectarr.pop();
                selectpos--;
                dobj.borderTop = "2px solid rgb(255,255,255)";
                dobj.borderBottom = "2px solid rgb(255,255,255)";
                dobj.borderLeft = "2px solid rgb(255,255,255)";
                dobj.borderRight = "2px solid rgb(255,255,255)";
            }
            else {
                dobj.borderTop = "2px solid rgb(133,68,66)";
                dobj.borderBottom = "2px solid rgb(133,68,66)";
                dobj.borderLeft = "2px solid rgb(133,68,66)";
                dobj.borderRight = "2px solid rgb(133,68,66)";
                selectarr[selectpos] = divname;
                selectpos++;
                if (selectpos === 3)
                    checkmatch();
            }
        }

        function checkmatch() {
            for (i = 0; i < 4; i++) {
                if (oddmanout(placedcards[selectarr[0]].charAt(i), placedcards[selectarr[1]].charAt(i), placedcards[selectarr[2]].charAt(i))) {
                    //	  alert('Not a match: '+placedcards[selectarr[0]].charAt(i)+', '+placedcards[selectarr[1]].charAt(i)+', '+placedcards[selectarr[2]].charAt(i)+'\r\n'+
                    //			placedcards[selectarr[0]]+'\r\n'+placedcards[selectarr[1]]+'\r\n'+placedcards[selectarr[2]]);
                    cleanup();
                    return;
                }
            }
            // match found correctly, remove cards and add new ones
//            time_event();
            document.getElementById('matchfound').innerHTML = "Match: <font color=\"#FF0000\">waiting</font>";
            for (i = 0; i < 3; i++) {
                placedcards[selectarr[i]] = "";
                dobj = document.getElementById(selectarr[i]);
                dobj.style.borderTop = "2px solid rgb(255,255,255)";
                dobj.style.borderBottom = "2px solid rgb(255,255,255)";
                dobj.style.borderLeft = "2px solid rgb(255,255,255)";
                dobj.style.borderRight = "2px solid rgb(255,255,255)";
                dobj.innerHTML = '';
            }
            if (placedcards['r4c1'] !== "" || placedcards['r4c2'] !== "" || placedcards['r4c3'] !== "") { // had 15 cards, only rearrange
                for (i = 1; i < 4; i++) {
                    cname = 'r4c' + i;
                    if (placedcards[cname] !== "") {
                        for (ii = 0; ii < 3; ii++) {
                            if (selectarr[ii].charAt(1) !== "4" && placedcards[selectarr[ii]] === "") {
                                placedcards[selectarr[ii]] = placedcards[cname];
                                placedcards[cname] = "";
                                document.getElementById(cname).innerHTML = "";
                                var thiscard = placedcards[selectarr[ii]];
                                var num = thiscard.charAt(0);
                                var cardurl = thiscard.substring(1);
                                var injstr = '';
                                while (num >= 0) {
                                    injstr += '<img src="imgcard/' + cardurl + '.gif">';
                                    num--;
                                }
                                document.getElementById(selectarr[ii]).innerHTML = injstr;
                                break;
                            }
                        }
                    }
                }
                selectarr.pop();
                selectarr.pop();
                selectarr.pop();
                selectpos = 0;
                findmatch(2);
                return;
            }
            if (nextcard === 81) {
                selectarr.pop();
                selectarr.pop();
                selectarr.pop();
                selectpos = 0;
                findmatch(2);
                return;
            }
            // add cards to queue
            var pos = cardqueue.length;
            var j = 0;
            for (i = pos; i < pos + 3; i++) {
                cardqueue[i] = new Array();
                cardqueue[i]['card'] = cards[nextcard];
                cardqueue[i]['cell'] = selectarr[j];
                j++;
                nextcard++;
            }
            document.getElementById('tot_score').value = count++;
            var remain = 81 - nextcard;
            document.getElementById('cardcount').value = remain;
            selectarr.pop();
            selectarr.pop();
            selectarr.pop();
            selectpos = 0;
            placecards('500');
        }

        function oddmanout(v1, v2, v3) {
            if (v1 === v2 && v1 === v3 && v2 === v3)
                return 0;
            if (v1 !== v2 && v1 !== v3 && v2 !== v3)
                return 0;
            return 1;
        }

        function cleanup() {
            for (i = 0; i < 3; i++) {
                dobj = document.getElementById(selectarr[i]).style;
                dobj.borderTop = "2px solid rgb(255,255,255)";
                dobj.borderBottom = "2px solid rgb(255,255,255)";
                dobj.borderLeft = "2px solid rgb(255,255,255)";
                dobj.borderRight = "2px solid rgb(196, 227, 254)";
            }
            selectarr.pop();
            selectarr.pop();
            selectarr.pop();
            selectpos = 0;
        }

        function placecards(delay) {
            var thiscard = cardqueue[0]['card'];
            placedcards[cardqueue[0]['cell']] = cardqueue[0]['card'];
            var num = thiscard.charAt(0);
            var cardurl = thiscard.substring(1);
            var cell = cardqueue[0]['cell'];
            var injstr = '';
            while (num >= 0) {
                injstr += '<img src="imgcard/' + cardurl + '.gif">';
                num--;
            }
            document.getElementById(cell).innerHTML = injstr;
            var top = cardqueue.length;
            for (i = 0; i < top - 1; i++)
                cardqueue[i] = cardqueue[i + 1];
            cardqueue.pop();
            if (cardqueue.length > 0)
                setTimeout('placecards(' + delay + ')', delay);
            else
                findmatch(2);
        }

        function findmatch(mode) {
            if (placedcards["r4c1"] === "") {
                itop = 10;
                jtop = 11;
                ktop = 12;
            }
            else {
                itop = 13;
                jtop = 14;
                ktop = 15;
            }
            var found = 0;
            for (i = 0; i < itop && found === 0; i++) {
                var a = Math.floor(i / 4) + 1;
                var b = (i % 4) + 1;
                var c1 = 'r' + a + 'c' + b;
                if (placedcards[c1] === "")
                    continue;
                for (j = i + 1; j < jtop && found === 0; j++) {
                    var a = Math.floor(j / 4) + 1;
                    var b = (j % 4) + 1;
                    var c2 = 'r' + a + 'c' + b;
                    if (placedcards[c2] === "")
                        continue;
                    for (k = j + 1; k < ktop && found === 0; k++) {
                        var a = Math.floor(k / 4) + 1;
                        var b = (k % 4) + 1;
                        var c3 = 'r' + a + 'c' + b;
                        if (placedcards[c3] === "")
                            continue;
                        for (ii = 0; ii < 4 && found === 0; ii++) {
                            if (oddmanout(placedcards[c1].charAt(ii), placedcards[c2].charAt(ii), placedcards[c3].charAt(ii)))
                                break;
                            if (ii === 3)
                                found = 1;
                        }
                    }
                }
            }
            if (found === 1 && mode === 2) {
                document.getElementById('matchfound').innerHTML = "Match: <font color=\"#FF0000\">Found</font>";
                return;
            }
            if (found === 1) {
                if (mode === 1) {
                    for (ii = 0; ii < 3; ii++) {
                        if (ii === 0)
                            cname = c1;
                        if (ii === 1)
                            cname = c2;
                        if (ii === 2)
                            cname = c3;
                        dobj = document.getElementById(cname).style;
                        dobj.borderTop = "2px solid rgb(254,87,87)";
                        dobj.borderBottom = "2px solid rgb(254,87,87)";
                        dobj.borderLeft = "2px solid rgb(254,87,87)";
                        dobj.borderRight = "2px solid rgb(254,87,87)";
                    }
                }
            }
            else {
                if (mode === 2 && (placedcards["r4c1"] !== "" || nextcard >= 81)) {
//                    stoptimer();
                    document.getElementById('matchfound').innerHTML = "Match: <font color=\"#FF0000\">None</font>";
                    return;
                }
                if (placedcards["r4c1"] !== "") {
//                    stoptimer();
                    alert('There are no matches. In addition, there ain\'t enough room in the browser for more cards. Game over.');
                    return;
                }
                if (nextcard >= 81) {
//                    stoptimer();
                    alert('There are no more matches.');
                    return;
                }
                else {
                    var pos = cardqueue.length;
                    var j = 1;
                    for (i = pos; i < pos + 3; i++) {
                        cname = 'r4c' + j;
                        cardqueue[i] = new Array();
                        cardqueue[i]['card'] = cards[nextcard];
                        cardqueue[i]['cell'] = cname;
                        //		alert('adding exta card: cardqueue['+i+'][\'card\']="'+cards[nextcard]+'\r\n cardqueue['+i+'][\'cell\']="'+cname);
                        j++;
                        nextcard++;
                    }
                    var remain = 81 - nextcard;
                    document.getElementById('cardcount').value = remain;
                    selectarr.pop();
                    selectarr.pop();
                    selectarr.pop();
                    selectpos = 0;
                    placecards('500');
                }
            }
        }

        function force_nomatch(mod) {
            if (mod === 12) {
                for (i = 0; i < 12; i++) {
                    cell = 'r' + Number(Math.floor(i / 4) + 1) + 'c' + Number((i % 4) + 1);
                    cardqueue[i]['cell'] = cell;
                }
                cardqueue[0]['card'] = "0rod";
                cardqueue[1]['card'] = "0ros";
                cardqueue[2]['card'] = "0rss";
                cardqueue[3]['card'] = "1rsd";
                cardqueue[4]['card'] = "1rso";
                cardqueue[5]['card'] = "2rss";
                cardqueue[6]['card'] = "2roo";
                cardqueue[7]['card'] = "2ros";
                cardqueue[8]['card'] = "0pod";
                cardqueue[9]['card'] = "0pos";
                cardqueue[10]['card'] = "0pss";
                cardqueue[11]['card'] = "1psd";
            }
            if (mod === 15) {
                for (i = 0; i < 15; i++) {
                    cell = 'r' + Number(Math.floor(i / 4) + 1) + 'c' + Number((i % 4) + 1);
                    cardqueue[i]['cell'] = cell;
                }
                cardqueue[0]['card'] = "0rod";
                cardqueue[1]['card'] = "0ros";
                cardqueue[2]['card'] = "0rss";
                cardqueue[3]['card'] = "1rsd";
                cardqueue[4]['card'] = "1rso";
                cardqueue[5]['card'] = "2rss";
                cardqueue[6]['card'] = "2roo";
                cardqueue[7]['card'] = "2ros";
                cardqueue[8]['card'] = "0pod";
                cardqueue[9]['card'] = "0pos";
                cardqueue[10]['card'] = "0pss";
                cardqueue[11]['card'] = "1psd";
                cardqueue[12]['card'] = "1pso";
                cardqueue[13]['card'] = "2pss";
                cardqueue[14]['card'] = "2poo";
                cardqueue[15]['card'] = "2pos";
            }
        }

        startgame();
    </script>
    <div id='blocker' style="top: 48; left: 100; width: 805; height: 500; position: absolute; z-index: 3; background-color: #c4e3fe; layer-background-color: #c4e3fe; visibility: hidden;" width=800 height=600>&nbsp;</div>
    <script>
        var image = new Array();
        for (i = 0; i < 3; i++)
            for (j = 0; j < 3; j++)
                for (k = 0; k < 3; k++) {
                    var n = ((i + 1) * 9) + ((j + 1) * 3) + (k + 1);
                    image[n] = new Image();
                    var imgname = 'images/' + colors[i] + shades[j] + shapes[k] + '.png';
                    image[n].src = imgname;
                }
    </script>

    <!--        <form action="CreateNewGameServlet" method="get" >
    -->

    <!--            <div id="banner">
                        <div class="container">
                            <div class="row">
                                <section class="12u">
                                    <input type="submit" value="Create New Game">
                                </section>
                            </div>
                        </div>
                    </div>-->

    <!--            <br>
    
                <div class="onerow">
                    <div class="col2">&nbsp;</div>
                    <div class="col3"></div>
                    <div class="col2">&nbsp;</div>
                    <div class="col2">&nbsp;</div>
                    <div id="copyright" class="container">
                        Team 02 Java CA
                    </div>
                </div>
            </form>-->
</body>
</html>


