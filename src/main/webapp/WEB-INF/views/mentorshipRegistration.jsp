<%--
  Created by IntelliJ IDEA.
  User: Feras
  Date: 8/9/2017
  Time: 10:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="background: linear-gradient(rgba(199, 199, 199, .8), rgba(232, 232, 232, .6));">
<html>
<head>
    <meta charset="UTF-8">
    <title>Register for the mentorship program</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#checkBtn').click(function () {
                checked = $("input[type=checkbox]:checked").length;

                if (!checked) {
                    alert("You must check at least one checkbox.");
                    return false;
                }

            });
        });

    </script>


    <style>
        body {
            font-family: 'Open Sans Condensed', sans-serif;
        }

        /* CSS Code */
        .popScroll {
            position: fixed;
            z-index: 10;
            top: 0;
            display: table;
            text-align: center;
            width: 100%;
            height: 100%;

        }

        .popup {
            z-index: 10;
            width: 450px;
            height: 480px;
            position: relative;
            margin: 20px auto;
            display: block;
            text-align: center;
            -moz-background-clip: padding;
            -o-background-clip: padding;
            -webkit-background-clip: padding-box;
            background-clip: padding-box; /* prevents bg color from leaking outside the border */
            background-color: #fff; /* layer fill content */
            -moz-box-shadow: 0 0 10px rgba(0, 0, 0, .18); /* drop shadow */
            -webkit-box-shadow: 0 0 10px rgba(0, 0, 0, .18); /* drop shadow */
            -o-box-shadow: 0 0 10px rgba(0, 0, 0, .18); /* drop shadow */
            box-shadow: 0 0 10px rgba(0, 0, 0, .18); /* drop shadow */
            -webkit-transform-origin: top center;
            -moz-transform-origin: top center;
            -o-transform-origin: top center;
            transform-origin: top center;
            -webkit-animation: iconosani 1.2s forwards;
            animation: iconosani 1.2s forwards;
            -moz-animation: iconosani 1.2s forwards;
            -o-animation: iconosani 1.2s forwards;
        }

        @-webkit-keyframes iconosani {
            0% {
                -webkit-transform: perspective(800px) rotateX(-90deg);
                -moz-transform: perspective(800px) rotateX(-90deg);
                -o-transform: perspective(800px) rotateX(-90deg);
                opacity: 1;
            }
            40% {
                -webkit-transform: perspective(800px) rotateX(30deg);
                -moz-transform: perspective(800px) rotateX(30deg);
                -o-transform: perspective(800px) rotateX(30deg);
                opacity: 1;
            }
            70% {
                -webkit-transform: perspective(800px) rotateX(-10deg);
                -moz-transform: perspective(800px) rotateX(-10deg);
                -o-transform: perspective(800px) rotateX(-10deg);
            }
            100% {
                -webkit-transform: perspective(800px) rotateX(0deg);
                -moz-transform: perspective(800px) rotateX(0deg);
                -o-transform: perspective(800px) rotateX(0deg);
                opacity: 1;
            }
        }

        .popScroll h1 {
            height: 60px;
            position: relative;
            color: #fff;
            font: 25px/60px sans-serif;
            text-align: center;
            text-transform: uppercase;
            background: rgba(237, 99, 52, .8);
        }

        .popScroll form {
            margin: 10px auto;
        }

        .subscribe-widget .email-form {
            font-size: 13px;
            color: #999999;
            padding-left: 6px;
            width: 270px;
            border: 1px solid #e0e0e0;
            padding: 5px 0 5px 5px;
            line-height: 25px;
        }

        .subscribe-widget .button {
            background: #3D79D0;
            padding: 6px 15px;
            color: #fff;
            border: none;
            line-height: 25px;
            margin-left: 0;
            cursor: pointer;
        }

        input[type="submit"] {
            -webkit-appearance: button;
            -moz-appearance: button;
            -o-appearance: button;
            cursor: pointer;
        }

        .popScroll p {
            padding: 1px 5px;
            font-family: 'Open Sans';
            font-size: 17px;
            margin-bottom: 10px;
        }

        #option {
            position: relative;
        }

        .boxi {
            display: inline-block;
            width: 169px;
            line-height: 42px;
            color: #fff;
            text-align: center;
            text-decoration: none;
            -webkit-transition: all 0.1s linear;
            -moz-transition: all 0.1s linear;
            -o-transition: all 0.1s linear;
        }

        #home {
            background:rgba(237, 99, 52, .8);
        }

        #close {
            background: rgb(170,170,170);
        }

        .popScroll em {
            width: 42px;
            display: inline-block;
            position: relative;
            margin: 0 -20px;
            line-height: 42px;
            background: #fff;
            color: #777;
            text-align: center;
            border-radius: 50px;
        }

        #home:hover {
            background: #1ea8b4;
        }

        .disciplines {
            color: #1ea8b4;
        }

        #close:hover {
            background: #B30E0E;
        }

        body.overlay:after {
            content: '';
            width: 100%;
            height: 100%;
            top: 0px;
            left: 0px;
            z-index: 0;
            opacity: .8;
            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            background: #000;
        }

        body.overlay { /* Prevents scrolling */
            overflow: hidden;
            max-height: 100%;
            max-width: 100%;
        }

        .ribbon {
            position: absolute;
            z-index: 100;
            width: 100px;
            height: 100px;
            overflow: hidden;
        }

        .ribbon.top-left {
            top: -2.6px;
            left: -5px;
        }

        .ribbon.top-left.ribbon-primary > small {
            *zoom: 1;
            filter: progid:DXImageTransform.Microsoft.gradient(gradientType=0, startColorstr='#FF428BCA', endColorstr='#FF2A6496');
            background-image: -moz-linear-gradient(top, rgba(237, 99, 52, .8), rgba(237, 99, 52, 1));
            background-image: -webkit-linear-gradient(top,rgba(237, 99, 52, .8),rgba(237, 99, 52, 1));
            background-image: linear-gradient(to bottom, rgba(237, 99, 52, .8), rgba(237, 99, 52, 1));
            position: absolute;
            display: block;
            width: 100%;
            padding: 8px 10px;
            text-align: center;
            text-transform: uppercase;
            font-weight: bold;
            font-size: 65%;
            color: white;
            background-color: rgba(237, 99, 52, .8);
            -moz-transform: rotate(-45deg);
            -ms-transform: rotate(-45deg);
            -webkit-transform: rotate(-45deg);
            transform: rotate(-45deg);
            -moz-box-shadow: 0 3px 6px -3px rgba(0, 0, 0, 0.5);
            -webkit-box-shadow: 0 3px 6px -3px rgba(0, 0, 0, 0.5);
            box-shadow: 0 3px 6px -3px rgba(0, 0, 0, 0.5);
            top: 16px;
            left: -27px;
        }

        .ribbon.top-left.ribbon-primary > small:before, .ribbon.top-left.ribbon-primary > small:after {
            position: absolute;
            content: " ";
        }

        .ribbon.top-left.ribbon-primary > small:before {
            left: 0;
        }

        .ribbon.top-left.ribbon-primary > small:after {
            right: 0;
        }

        .ribbon.top-left.ribbon-primary > small:before, .ribbon.top-left.ribbon-primary > small:after {
            bottom: -3px;
            border-top: 3px solid #0e2132;
            border-left: 3px solid transparent;
            border-right: 3px solid transparent;
        }

        .banner {
            width: 300px;
            height: 250px;
            position: relative;
            margin: 10px auto;
            display: block;
            text-align: center;
            -moz-background-clip: padding;
            -webkit-background-clip: padding-box;
            background-clip: padding-box; /* prevents bg color from leaking outside the border */
            background-color: #fff; /* layer fill content */
            -moz-box-shadow: 0 0 10px rgba(0, 0, 0, .18); /* drop shadow */
            -webkit-box-shadow: 0 0 10px rgba(0, 0, 0, .18); /* drop shadow */
            box-shadow: 0 0 10px rgba(0, 0, 0, .18); /* drop shadow */
        }

        .adstext {
            margin-top: 20px;
            color: #000;
            position: relative;
        }

        @media screen and (max-width: 600px) {

            .popup {
                width: 370px;
                height: 480px;
            }

            .popScroll h1 {
                height: 40px;
                font: 18px/40px sans-serif;
            }

            .subscribe-widget .email-form {
                width: 210px;
            }

            .adstext {
                margin-top: 20px;
            }

        }

        @media screen and (max-width: 400px) {

            .popup {
                width: 350px;
                height: 480px;
            }

            .popScroll h1 {
                height: 40px;
                font: 18px/40px sans-serif;
            }

            .subscribe-widget .email-form {
                width: 210px;
            }

            .banner {
                margin: 10px auto;

            }

            .adstext {
                margin-top: 20px;
            }
        }

        input.email-form:active, input.email-form:focus {
            -webkit-animation: fade 0.55s ease-in;
            -moz-animation: fade 0.55s ease-in;
            animation: fade 0.55s ease-in;
        }

        @-webkit-keyframes fade {
            0% {
                box-shadow: 0 0 0 0 transparent;
            }

            66% {
                box-shadow: 0 0 0 10px #3D79D0, 0 0 0 12px white;
            }

            100% {
                box-shadow: 0 0 0 20px transparent, 0 0 0 22px transparent;
            }
        }

        @-moz-keyframes fade {
            0% {
                box-shadow: 0 0 0 0 transparent;
            }

            66% {
                box-shadow: 0 0 0 10px #3D79D0, 0 0 0 12px white;
            }

            100% {
                box-shadow: 0 0 0 20px transparent, 0 0 0 22px transparent;
            }
        }

        @-o-keyframes fade {
            0% {
                box-shadow: 0 0 0 0 transparent;
            }

            66% {
                box-shadow: 0 0 0 10px #3D79D0, 0 0 0 12px white;
            }

            100% {
                box-shadow: 0 0 0 20px transparent, 0 0 0 22px transparent;
            }
        }

        @keyframes fade {
            0% {
                box-shadow: 0 0 0 0 transparent;
            }

            66% {
                box-shadow: 0 0 0 10px #3D79D0, 0 0 0 12px white;
            }

            100% {
                box-shadow: 0 0 0 20px transparent, 0 0 0 22px transparent;
            }
        }

        /* POPUP */

        .box {
            display: table;
            top: 0;
            visibility: hidden;
            -webkit-transform: perspective(1200px) rotateY(180deg) scale(0.1);
            -ms-transform: perspective(1200px) rotateY(180deg) scale(0.1);
            -moz-transform: perspective(1200px) rotateY(180deg) scale(0.1);
            transform: perspective(1200px) rotateY(180deg) scale(0.1);
            top: 0;
            left: 0;
            z-index: -1;
            position: absolute;
            width: 100%;
            height: 100%;
            opacity: 0;
            transition: 1s all;
        }

        .box p {
            display: table-cell;
            vertical-align: middle;
            font-size: 64px;
            color: #ffffff;
            text-align: center;
            margin: 0;
            opacity: 0;
            transition: .2s;
            -webkit-transition-delay: 0.2s;
            -moz-transition-delay: 0.2s;
            -ms-transition-delay: 0.2s;
            transition-delay: 0.2s;
        }

        .box p i {
            font-size: 128px;
            margin: 0 0 20px;
            display: block;
        }

        .box .close {
            display: block;
            cursor: pointer;
            border: 3px solid rgba(255, 255, 255, 1);
            border-radius: 50%;
            position: absolute;
            top: 50px;
            left: 50px;
            width: 50px;
            height: 50px;
            -webkit-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
            -moz-transform: rotate(45deg);
            transform: rotate(45deg);
            transition: .2s;
            -webkit-transition-delay: 0.2s;
            -ms-transition-delay: 0.2s;
            -moz-transition-delay: 0.2s;
            transition-delay: 0.2s;
            opacity: 0;
        }

        .box .close:active {
            top: 51px;
        }

        .box .close::before {
            content: "";
            display: block;
            position: absolute;
            background-color: rgba(255, 255, 255, 1);
            width: 80%;
            height: 6%;
            left: 10%;
            top: 47%;
        }

        .box .close::after {
            content: "";
            display: block;
            position: absolute;
            background-color: rgba(255, 255, 255, 1);
            width: 6%;
            height: 80%;
            left: 47%;
            top: 10%;
        }

        .box.open {
            left: 0;
            top: 0;
            visibility: visible;
            opacity: 1;
            z-index: 999;
            -webkit-transform: perspective(1200px) rotateY(0deg) scale(1);
            -moz-transform: perspective(1200px) rotateY(0deg) scale(1);
            -ms-transform: perspective(1200px) rotateY(0deg) scale(1);
            transform: perspective(1200px) rotateY(0deg) scale(1);
            width: 100%;
            height: 100%;
        }

        .box.open .close, .box.open p {
            opacity: 1;
        }

        #card {
            font-family: Georgia;
            background: #fff;
            width: 450px;
            height: 185px;
            margin: 200px auto;
            padding: 10px 25px 30px 25px;

            border: 1px solid white;
            -webkit-box-shadow: -1px 1px 8px 5px rgba(0, 0, 0, 0.2), inset 0 0 30px rgba(0, 0, 0, 0.1);
            -o-box-shadow: -1px 1px 8px 5px rgba(0, 0, 0, 0.2), inset 0 0 30px rgba(0, 0, 0, 0.1);
            -moz-box-shadow: -1px 1px 8px 5px rgba(0, 0, 0, 0.2), inset 0 0 30px rgba(0, 0, 0, 0.1);
            -khtml-box-shadow: -1px 1px 8px 5px rgba(0, 0, 0, 0.2), inset 0 0 30px rgba(0, 0, 0, 0.1);
            -ms-box-shadow: -1px 1px 8px 5px rgba(0, 0, 0, 0.2), inset 0 0 30px rgba(0, 0, 0, 0.1);
            box-shadow: -1px 1px 8px 5px rgba(0, 0, 0, 0.2), inset 0 0 30px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        #card spa {
            color: #dc152c;
            font-weight: normal;
            font-size: 48px;
            margin-bottom: 10px;
        }

        #card spa::first-letter {
            color: #194ff7;
        }

        #card spa b {
            color: #f1840b;
            font-weight: normal;
        }

        #card spa b + b {
            color: #194ff7;
        }

        #card spa b + b + b {
            color: #00940e;
        }

        .content {
            text-align: left;
            /* Pure CSS3 typing animation with steps() :
               http://lea.verou.me/2011/09/pure-css3-typing-animation-with-steps/ */
        }

        .content ul {
            padding: 0;
            margin: 5px;
            font: 16px Arial;
        }

        .content ul li {
            list-style: none;
        }

        .content ul li a {
            color: #12C;
        }

        .content ul li span {
            display: block;
            width: 100%;
            margin-bottom: 2px;
        }

        .content ul li span:nth-child(2) {
            margin-bottom: 10px;
        }

        .content ul li span:nth-child(2) a {
            color: #093;
            text-decoration: none;
        }

        .content ul li span:nth-child(3), .content ul li span:nth-child(4) {
            font-size: 14px;
        }

        .content .text {
            border: 1px solid #7ec6fd;
            float: left;
            width: 100%;
            margin-bottom: 10px;
        }

        .content .text h2 {
            position: relative;
            float: left;
            font-size: 100%;
            font-weight: normal;
            padding: 0;
            margin: 5px 10px;
        }

        .content .text h2 span {
            position: absolute;
            top: 0;
            right: 0;
            width: 0;
            background: white;
            /* same as background */
            border-left: 0.1em solid black;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        /*****************
        Section
        ******************/

        section {
            height: 100%;
            text-align: center;
        }

        section h1 {
            padding-top: 17%;
            font-family: 'Vollkorn', serif;
            font-size: 48px;
        }

        section p {
            width: 500px;
            margin: -28px auto 32px;
            font-family: 'Muli', sans-serif;
            font-size: 18px;
            line-height: 1.35;
        }
    </style>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <link rel="stylesheet" href="resources/css/style.css">
</head>
<body>

<c:choose>
    <c:when test="${isMentor}">
        <form:form name="mentorRegistration" action="${action}" method="POST">
            <!-- progressbar -->
            <ul id="progressbar">
                <li class="active">Mentorship</li>
                <li>Smart Profile 1/2</li>
                <li>Smart Profile 2/2</li>
            </ul>
            <!-- fieldsets -->
            <fieldset>
                <h2 class="fs-title">Mentorship Registration</h2>
                <h3 class="fs-subtitle">Languages</h3>
                What disciplines are you proficient in? <br>
                <br>
                <br>
                <input name="disciplines" type="checkbox" value="Java" tabindex="7" autofocus>
                <label>Java</label>
                <br>
                <br>
                <input name="disciplines" type="checkbox" value="C#/.Net" tabindex="8">
                <label>C#/.Net</label>
                <br>
                <br>
                <input name="disciplines" type="checkbox" value="Javascript" tabindex="9">
                <label>Javascript</label>
                <br>
                <br>
                <input name="disciplines" type="checkbox" value="HTML/CSS" tabindex="10">
                <label>HTML/CSS</label>
                <br>
                <br>
                <input name="disciplines" type="checkbox" value="Python" tabindex="11">
                <label>Python</label>
                <br>
                <br>
                <br>
                <input type="button" name="next" class="next action-button" value="Next"/>
            </fieldset>
            <fieldset>
                <h2 class="fs-title">Smart Profile 1/2</h2>
                <h3 class="fs-subtitle">Questions</h3>
                If you would like to be matched by your personality using IBM Watson technology, Please answer the
                following questions. (The more detail you use, the better match you will find)<br><br>
                What are three words you would use to describe yourself and why?<br>
                <textarea name="answer" cols="30" rows="3" placeholder="Please use no less than 20 words!"
                          style="color: black"></textarea>
                <br>
                How would someone else describe you after meeting you for the first time?<br>
                <textarea name="answer" cols="30" rows="2" placeholder="Please use no less than 20 words!"
                          style="color: black"></textarea>
                <br>
                <input type="button" name="previous" class="previous action-button" value="Previous"/>
                <input type="button" name="next" class="next action-button" value="Next"/>
            </fieldset>
            <fieldset>
                <h2 class="fs-title">Smart Profile 2/2</h2>
                <h3 class="fs-subtitle">Questions</h3>
                <br>
                Tell us about a time you were met with a challenge. How did you approach the challenge. What was the outcome?<br>
                <textarea name="answer" cols="30" rows="2" placeholder="Please use no less than 20 words!"
                          style="color: black"></textarea>
                <br>
                Describe your ideal work environment.<br>
                <textarea name="answer" cols="30" rows="2" placeholder="Please use no less than 20 words!"
                          style="color: black"></textarea>
                <br>
                How do you deal with pressure or stressful situations?<br>
                <textarea name="answer" cols="30" rows="2" placeholder="Please use no less than 20 words!"
                          style="color: black"></textarea>
                <br>
                <input type="button" name="previous" class="previous action-button" value="Previous"/>
                <input type="submit" name="submit" class="next action-button" value="Submit"/>
            </fieldset>

        </form:form>
    </c:when>
    <c:otherwise>


        <!-- popup -->
        <div class="popScroll">
            <div class="popup">
<span class="ribbon top-left ribbon-primary">
<small>Hello!</small>
</span>
                <h1>Hey there ${desc}</h1>
                    <!-- form -->
                        <%--<form id="subscribe-form">--%>
                        <%--<input type="email" name="email" placeholder="Your Email Please" class="email-form" required>--%>
                        <%--<button type="submit" class="button">Subscribe</button>--%>
                        <%--</form>--%>
                    <p>You are already a ${desc} in theses desciplines: <p class="disciplines"> ${disciplines}</p></p>
                <div id="option">
                    <a href="/goToPortal?addMore=false" id="home" class="boxi">Continue</a>
                    <em>or</em>
                    <a href="/goToPortal?addMore=true" id="close" class="boxi closei">Edit Disciplines</a>
                </div>
            </div>
        </div>
    </c:otherwise>
</c:choose>

<script>
    var $box = $('.box');

    $('.closei').each(function () {
        var color = $(this).css('backgroundColor');
        var content = $(this).html();
        $(this).click(function () {
            $box.css('backgroundColor', color);
            $box.addClass('open');
            $box.find('p').html(content);
        });

        $('.close').click(function () {
            $box.removeClass('open');
            $box.css('backgroundColor', 'transparent');

        });

        $('body').toggleClass('overlay');
        $("#pop-toggle").click(function () {
            $(".popup").toggle();
            $('body').toggleClass('overlay');
        })
        $(".close").click(function () {
            $(".popup").toggle();
            $('body').toggleClass('overlay');
        });

    });
</script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>

<script src="resources/js/index.js"></script>
</body>
</html>
