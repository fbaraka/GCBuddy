<%--
  Created by IntelliJ IDEA.
  User: Feras
  Date: 7/21/2017
  Time: 11:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <!-- if using IE use the latest rendering-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--IMPORTANT: sets the page to width od the device and sets the zoom level-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Bootstrap 101 Template</title>

    <!-- Bootstrap -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


    <title>Login</title>
    <style>
        /* CSS used here will be applied after bootstrap.css */
        .jumbotron{
            color: darkorange;
            position: relative;
            z-index:-2;
        }

        #video-background {
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            overflow: hidden;
            z-index: -1;
            width:100%;
            opacity: 0.5;


        }
    </style>


</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="navbar-header">
        <a class="navbar-brand" href="#">Grand Circus</a>
    </div>
</nav>
<div class="jumbotron">
    <div class="fullscreen-bg"></div>
    <div class="container special">
    <video id="video-background" autoplay="true" loop="loop" preload="metadata" muted="muted">


        <source src="http://www.grandcircus.co/wp-content/themes/grandcircus/_assets/grand-circus-detroit-homepage-reel-sm.mp4"
                type="video/Mp4"/>
    </video>


    <h1 class="text-center">Welcome to Grand Circus Buddy!</h1>

    <p class="text-center">The app where Alumni and Current Students meet!</p>


    <!--add image -->
    <br>


    <h3 class="text-center">Sign in with slack: </h3>

    <center><a href="https://slack.com/oauth/authorize?scope=identity.basic&client_id=219461147683.223751169686">

        <img
                alt="Sign in with Slack" height="40" width="172"
                src="https://platform.slack-edge.com/img/sign_in_with_slack.png"
                srcset="https://platform.slack-edge.com/img/sign_in_with_slack.png 1x, https://platform.slack-edge.com/img/sign_in_with_slack@2x.png 2x"/></a>
        <br>

            Don't have slack? <a class="text-center" href="/dontLook">
                <br>

            <button type="button" class="btn btn-primary">Register here</button></center>
</div>
</div>


<br>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>

</body>
</html>
