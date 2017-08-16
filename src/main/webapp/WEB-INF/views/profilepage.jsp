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
        background-image: url("https://d3c5s1hmka2e2b.cloudfront.net/uploads/topic/image/115/grand_circus.png");
    }
</style>


<link rel="stylesheet" href="resources/css/profileStyle.css">


<div class="row">
    <center>
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <div class="coach-card">
                <img src="${userPic}" width="100" height="100">

                <div class="row coach-info">
                    <div class="col-md-1"></div>
                    <div class="col-md-5 ">
                            <h2 style="text-align: center">
                        <span class="grey-text">
                            ${firstName}
                        </span><br>
                                <span class="white-text">
                                    ${lastName}
                                </span>
                            </h2>
                        <hr class="sep-line">
                    </div>
                    <div class="col-md-5">
                        <div class="coach-info-text">
                        <span class="grey-text">
                            ${Mentor/Mentee}
                        </span><br>
                            <span class="white-text">
                            Mentor
                        </span>
                        </div>
                        <hr class="sep-line">
                    </div>
                </div>
                <div class="coach-details">
                    <div class="row">
                        <div class="col-sm-6">
                            <span class="coach-name"><p>${firstName},${lastName}</p></span>
                            <span class="coach-job"><p>${email}</p></span>
                        </div>
                        <div class="col-sm-6">
                            <img src="" width="50">
                        </div>
                    </div>
                </div>
                <div class="coach-desc">
                    <div class="row">
                        <div class="row">
                            <div class="col-sm-1"></div>
                            <div class="col-sm-3 tarrif">
                            <span class="pers-count">
                                Langauge
                            </span><br>
                                <span class="pers-tarrif">
                                Java
                            </span>
                            </div>
                            <div class="col-sm-3 tarrif">
                            <span class="pers-count">
                                Langauge
                            </span><br>
                                <span class="pers-tarrif">
                                JavaScript
                            </span>
                            </div>
                            <div class="col-sm-3 tarrif-no-right">
                            <span class="pers-count">
                                Language
                            </span><br>
                                <span class="pers-tarrif">
                                HTML/CSS
                            </span>
                            </div>
                        </div>

                        <div class="coach-reserve-btn">
                            <a href="#" class="btn btn-danger btn-block"><a href="/homepage">Return to Home</a></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4"></div>
    </center>

</div>
</body>
</html>
