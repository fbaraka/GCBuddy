<%--
  Created by IntelliJ IDEA.
  User: Feras
  Date: 8/9/2017
  Time: 9:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Mentorship Page</title>
    <style>
        .media {
            box-shadow: 0px 0px 4px -2px #000;
            margin: 20px 0;
            padding: 15px;
            background: rgba(196, 102, 0, .8);
        }

        .media-body {
            padding: 10px;
        }

        .media-body a {
            text-decoration: none;
        }

        .media .label {
            padding: 5px 10px;
        }

        .dp {
            border: 10px solid #eee;
            transition: all 0.2s ease-in-out;
        }

        .dp:hover {
            border: 2px solid #eee;
            transform: rotate(360deg);
            -ms-transform: rotate(360deg);
            -webkit-transform: rotate(360deg);
            -webkit-font-smoothing: antialiased;
        }

    </style>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body style="background: #E2E4E6;">

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
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>


<div class="jumbotron" style="background: #1ea8b4; margin-left: 5%; margin-right: 5%; border-radius: 25px">
    <h1 style="text-align: center">
        Your Potential Matches
    </h1>
    <h4 style="text-align: center">This list is ordered using IBM Watson technology to match personalities based on the answers you provided in the mentorship registration.</h4>
</div>

<h5 style="color: green;">${msg}</h5>
<div class="row" style="background: #E2E4E6;">
    <c:forEach items="${cList}" var="user">
        <div class="col-md-6">
            <div class="media" style=" margin-left: 5%; margin-right: 5%; border-radius: 25px">
                <a class="pull-left" href="/profilepage">
                    <img class="media-object dp img-circle"
                         src="http://pics3.pof.com/thumbnails/size220/1136/22/57/311935dd6-93d4-46f0-beda-2c9b5a1d1b06.jpg"
                         style="width: 100px;height:100px;">
                </a>
                <div class="media-body">
                    <h4 class="media-heading">${user.firstName} ${user.lastName}
                        <small style="color: #1ea8b4;"> Detroit, MI</small>
                    </h4>
                    <h5 style="color: #1ea8b4">${user.disciplines}</h5>
                    <hr style="margin:8px auto">
                    <form action="/sendmessage">
                        <input type="hidden" name="slackId" value="${user.slackId}">
                        <textarea name="slackMessage" placeholder="Input message here"
                                  style="width: 100%;"></textarea><br>
                        <input type="submit" value="Send Message" class="btn btn-success">
                    </form>
                </div>
            </div>

        </div>
    </c:forEach>
</div>

<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>

</body>
</html>
