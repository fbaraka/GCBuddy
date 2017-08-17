<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: michaelgleeson
  Date: 8/7/17
  Time: 3:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Profile Page</title>
    <link rel="stylesheet" href="resources/css/profileStyle.css">
    <style>
        body {
            background: #E2E4E6;
        }
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>

<%--navbar was taken from bootstraps site and tweaked for our purpose--%>
<%--it needs the bootstrap imports to work--%>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/homepage">GC Buddy</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="/mentorship">Mentorship Portal</a></li>
                <li><a href="/parking">Parking</a></li>
            </ul>
            <p class="navbar-text navbar-right">Signed in as <a href="/profilepage" class="navbar-link">${firstName} ${lastName}</a></p>

            <%--added this button to let the user logout--%>
            <a href="/logout"><button type="button" class="btn btn-default navbar-btn navbar-right">Logout</button></a>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<center>
<div class="row">
        <div class="col-lg-6 coach-card">
                <img src=${userPic}
                             class="coach-img">
                <div class="row coach-info">
                    <div>
                        <div class="coach-info-text">
                            <span class="white-text">
                                <div class=text-align:"center">${firstName} ${lastName}</div><br>
                                <h4>${email}</h4><br>
                                <h4>city: ${city}</h4>
                            </span>
                        </div>
                        <hr class="sep-line">
                    </div>
                    <div>
                        <div class="coach-info-text" style="text-align: center">
                            <span class="white-text">
                                Bootcamp:
                                <span class="gray-text" style="color: #1ea8b4">
                                    ${bootCamp}
                                </span>
                            </span>
                        </div>
                    </div>
                    <hr class="sep-line">

                    <%--this section displays the users mentor information if they are registered as a mentor--%>
                    <c:if test="${isMentor}">
                        <div>
                            <div class="coach-info-text" style="text-align: center">
                                <span class="gray-text">
                                    You are a mentor for these languages:<br>
                                    <span class="gray-text" style="color: #1ea8b4">
                                            ${mentorDisc}
                                    </span>
                                </span>
                            </div>
                        </div><br>
                        <center>
                            <a href="/deleteMentor" class="btn-sm btn-danger">Remove yourself from mentor pool</a>
                        </center>
                        <hr class="sep-line">
                    </c:if>


                    <%--this section displays the users mentee information if they are registered as a mentee--%>
                    <c:if test="${isMentee}">
                        <div>
                            <div class="coach-info-text" style="text-align: center">
                                <span class="gray-text">
                                    You are a mentee for these languages:<br>
                                    <span class="gray-text" style="color: #1ea8b4">
                                            ${menteeDisc}
                                    </span>
                                </span>
                            </div>
                        </div><br>
                        <center>
                            <a href="/deleteMentee" class="btn-sm btn-danger">Remove yourself from mentee pool</a>
                        </center>
                        <hr class="sep-line">
                    </c:if>


                </div>


                <%--this section displays the users personality information if they are registered as a mentee or mentor--%>
                <c:if test="${hasPersonality}">
                <div class="coach-info-text" style="text-align: center; background: darkorange; margin: 0%;">
                    <div class="coach-desc-text">
                        <div>
                            <span class="coach-name" style="text-align: center"><h2>Personality Profile</h2></span>
                            <p>These numbers are generated based on your answers when you first sign up in the mentorship portal as either a mentee or mentor.</p>
                            <p>To change your answers go to the mentorship portal and select "Edit Disciplines".</p>
                        </div>
                    </div>
                </div>


                    <div class="coach-desc-text">
                        <div class="row coach-desc-text">
                            <span class="white-text">
                                    <span class="gray-text">
                                        Extroversion: ${extra}%<br>
                                        Openness: ${open}%<br>
                                        Agreeableness: ${agree}%<br>
                                        Conscientiousness: ${conscience}%<br>
                                        Emotion Range: ${emotion}%<br>
                                    </span>
                            </span>
                        </div>
                    </div>
                </c:if>
                <hr class="sep-line">
                <div class="coach-reserve-btn">
                    <a href="/deleteUser" class="btn btn-danger btn-block">Delete account</a>
                </div>
        </div>
</div>
</center>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>

</body>
</html>
