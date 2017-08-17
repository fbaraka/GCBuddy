<%--
  Created by IntelliJ IDEA.
  User: michaelgleeson
  Date: 8/7/17
  Time: 3:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html >
<head>
    <style>
        .jumbotron {
            color: black;
            position: relative;
            z-index: -2;
        }

        #video-background {
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            overflow: hidden;
            z-index: -1;
            width: 100%;
            opacity: 0.5;

        }
    </style>
    <meta charset="UTF-8">
    <title>UI Statistic Pop Out CSS</title>



    <link rel="stylesheet" href="resources/css/newstyle.css">


</head>

<body>
<div class="jumbotron">
    <video id="video-background" autoplay="true" loop="loop" preload="metadata" muted="muted">
        <source src="http://www.grandcircus.co/wp-content/themes/grandcircus/_assets/grand-circus-detroit-homepage-reel-sm.mp4"
                type="video/Mp4"/>
    </video>
</div>
    <br>

<div class='title'>
    <h1>
        GCBuddy - Choose an Option Below!
    </h1>
    <h2>
        Need help? Looking for Parking? You came to the right place!
    </h2>
</div>
<center>
    <a href="/logout">
        <button type="button" class="btn-lg btn-primary">Logout</button>
    </a>
</center>

<div class='ui'>
    <div class='ui_box'>
        <div class='ui_box__inner'>
            <h2>
                Mentorship Portal
            </h2>
            <p>Interested in becoming a Mentor? Or looking for a Mentor?</p>
            <div class='stockPhoto'>
                <img src="http://content.newsinc.com/jpg/1391/30574273/34106027.jpg?t=1459763220" width="125" height="70">
            </div>
            <p>Click below for more information.</p>
        </div>
        <div class='drop'>
            <p><a href="mentorship">Mentorship Registration</a></p>
            <div class='arrow'></div>
        </div>
    </div>
    <div class='ui_box'>
        <div class='ui_box__inner'>
            <h2>
                User Profile
            </h2>
            <p>View your Profile</p>
            <div class='stat_left'>
                <ul>
                    <li>
                        Bio
                    </li>
                    <li>
                        Contact Information
                    </li>
                    <li>
                        Mentor/Mentee Status
                    </li>
                    <li>
                        Coding Languages
                    </li>
                </ul>
            </div>
            <div class='stockPhoto'>
                <img src="${userPic}" width="100" height="100">
            </div>
            <p>Click below.</p>
        </div>
        <div class='drop'>
            <p><a href="profilepage">User Profile</a></p>
            <div class='arrow'>

            </div>
        </div>
    </div>
    <div class='ui_box'>
        <div class='ui_box__inner'>
            <h2>
                Parking Pricing and Locations
            </h2>
            <p>User Reported parking</p>
            <div class='stat'>
                <span>$$$$</span>
            </div>
            <div class='progress'>
                <div class='progress_bar--two'></div>
            </div>
            <p>Click here to view current parking prices nearby!</p>
        </div>
        <div class='drop'>
            <p><a href="parking">Parking Information</a></p>
            <div class='arrow'>
            </div>
        </div>
    </div>
</div>
<br>
<br>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<script src="resources/js/index.js"></script>

</body>
</html>
