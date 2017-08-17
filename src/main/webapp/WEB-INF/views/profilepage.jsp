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
</head>
<body>

<style>
    body {
        background: #E2E4E6;
    }
</style>


<link rel="stylesheet" href="resources/css/profileStyle.css">


<div class="row">
    <center>
        <div class="col-sm-4">
            <div class="coach-card">
                <img src=${userPic}
                             class="coach-img">
                <div class="row coach-info">
                    <div class="col-md-5 ">
                        <div class="coach-info-text">
                            <span class="white-text">
                                <div class=text-align:"center">${firstName} ${lastName}</div>
                            </span>
                        </div>
                        <hr class="sep-line">
                    </div>
                    <div class="col-md-5">
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
                        <div class="col-md-5">
                            <div class="coach-info-text" style="text-align: center">
                                <span class="gray-text">
                                    You are a mentor for these languages:<br>
                                    <span class="gray-text" style="color: #1ea8b4">
                                        ${mentorDisc}
                                    </span>
                                </span>
                            </div>
                        </div>
                        <hr class="sep-line">
                    </c:if>


                    <%--this section displays the users mentee information if they are registered as a mentee--%>
                    <c:if test="${isMentee}">
                        <div class="col-md-5">
                            <div class="coach-info-text" style="text-align: center">
                                <span class="gray-text">
                                    You are a mentee for these languages:<br>
                                    <span class="gray-text" style="color: #1ea8b4">
                                        ${menteeDisc}
                                    </span>
                                </span>
                            </div>
                        </div>
                        <hr class="sep-line">
                    </c:if>


                </div>
                <div class="coach-details">
                    <div class="row">
                        <div class="col-sm-6">
                            <span class="coach-name"><p>${email}</p></span>
                        </div>
                    </div>
                </div>


                <%--this section displays the users personality information if they are registered as a mentee or mentor--%>
                <c:if test="${hasPersonality}">
                    <div class="coach-desc-text">
                        <div class="row">
                            <span class="white-text">
                                    <div class="coach-info-text">
                                        <span class="white-text">
                                            <div class=text-align:"center">Personality Profile</div>
                                        </span>
                                    </div>
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
                    <a href="/homepage" class="btn btn-danger btn-block">Go back home</a>
                </div>
            </div>
        </div>
    </center>
</div>

</body>
</html>
