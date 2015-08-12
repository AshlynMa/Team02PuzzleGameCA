<%-- 
    Document   : signup
    Created on : Aug 4, 2015, 1:25:32 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>Puzzle Game - Sign Up</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <script type="text/javascript" src="javascript/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="javascript/validation.js"></script>
<!--    <script src="javascript/jquery.js" type="text/javascript"></script>-->
    
    <script type="text/javascript">
          $(document).ready(function(){
              $(".username").change(function(){
                  var username = $(this).val();
                  if(username.length >= 3){
                      $(".status").html("<img src='imgweb/loading.gif'><font color=gray> Checking availability...</font>");
                       $.ajax({
                          type: "POST",
                          url: "check",
                          data: "username="+ username,
                          success: function(msg){

                              $(".status").ajaxComplete(function(event, request, settings){
                                   
                                  $(".status").html(msg);

                              });
                          }
                      }); 
                  }
                  else{
                       
                      $(".status").html("<font color=red>Username should be <b>3</b> character long.</font>");
                  }
                  
              });
          });
        </script>
    
</head>
<body>

    <form action="signupServlet" method="get" onsubmit="return checkForm();" enctype="multipart/form-data">
        <div class="body"></div>
        <div class="grad"></div>
        <div class="header">
            <div>Puzzle<span>Game</span></div>
        </div>
        <br>
        <div class="login">
            <input type="text" placeholder="username" name="username" required pattern="\w+" required title="Username can only include alphabets, digits and underscroll." maxlength=50 class="username" /><br><div><span class="status"></span></div><br>
            <input type="text" placeholder="email" name="email" required pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" required title="Please enter a valid email address." maxlength=50><br>
            <input type="password" placeholder="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" name="password" required title="Password must be at least 6 characters long and include at least one capital letter and a digit."  maxlength=15><br>
            <input type="password" placeholder="confirm password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}" name="repassword" maxlength=15><br>

            <br>
            <input type="submit" value="Signup" />
            <h2>Already a member? <a href="login.jsp">Log In</a></h2>
        </div>
    </form>
</body>
</html>