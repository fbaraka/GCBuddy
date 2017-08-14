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

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body style="background: rgb(170,170,170);">
<a href="/homepage">Go to home page</a>
<br>
<br>
<div class="jumbotron" style="background: #1ea8b4; margin-left: 5%; margin-right: 5%; border-radius: 25px">
    <h1 style="text-align: center">
        Your Potential Matches
    </h1>
    <h4 style="text-align: center">This list is ordered using IBM Watson technology to match personalities based on the answers you provided in the mentorship registration.</h4>
</div>

<h5 style="color: green;">${msg}</h5>
<div class="row" style="background: rgb(170,170,170);">
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
                        <input type="hidden" name="addMore" value="false">
                        <textarea name="slackMessage" placeholder="Input message here"
                                  style="width: inherit;"></textarea><br>
                        <input type="submit" value="Send Message" class="btn btn-success">
                    </form>
                </div>
            </div>

        </div>
    </c:forEach>
</div>


</body>
</html>
