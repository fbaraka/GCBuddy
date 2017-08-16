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
        <div class="col-sm-4">
            <div class="coach-card">
                <img src=${userPic}
                     class="coach-img">
                <div class="row coach-info">
                    <div class="col-md-1"></div>
                    <div class="col-md-5 ">
                        <div class="coach-info-text">
                        <span class="grey-text">

                        </span>
                            <span  class="white-text" >
                                <div class= text-align:"center"> </div>
                            ${firstName} ${lastName}
                        </span>
                        </div>
                        <hr class="sep-line">
                    </div>
                    <div class="col-md-5">
                        <div class="coach-info-text">
                        <span class="grey-text">
                            Bootcamp
                        </span><br>
                            <span class="white-text">
                            ${bootCamp}
                        </span>
                        </div>
                        <hr class="sep-line">
                    </div>
                </div>
                <div class="coach-details">
                    <div class="row">
                        <div class="col-sm-6">
                            <span class="coach-name"><p>${email}</p></span>
                            <span class="coach-job"><p>${languages}</p></span>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>

                    <div class="coach-desc-text">
                        <div class="row">
                            Originaire de Saint Gervais, j’ai 19 ans et je
                            suis passionné par le ski.
                            je passe le diplôme de monitorat ESF.
                            De bons conseils et je peux accompagner
                            des skieurs de tout niveaux.
                        </div>
                    </div>
                    <div class="coach-reserve-btn">
                        <a href="#" class="btn btn-danger btn-block">RESERVER</a>
                    </div>
                </div>
            </div>
        </div>
</div>

    </center>

</div>
</body>
</html>
