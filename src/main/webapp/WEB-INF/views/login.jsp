<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Aaron
  Date: 8/9/2017
  Time: 6:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>login and register form</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

    <link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css'>

    <link rel="stylesheet" href="resources/css/loginstyle.css">


</head>

<body>
<div class="jumbotron">
    <video id="video-background" autoplay="true" loop="loop" preload="metadata" muted="muted">
        <source src="http://www.grandcircus.co/wp-content/themes/grandcircus/_assets/grand-circus-detroit-homepage-reel-sm.mp4"
                type="video/Mp4"/>
    </video>
</div>
<br>
<c:if test="${isLogin}">
<div class="wrapper">
    <div class="login is-active">
        <form:form action="/logInUser">
            ${msg}<br>
            <div id="gclogo">
                <img class="circular--square"
                     src="https://course_report_production.s3.amazonaws.com/rich/rich_files/rich_files/50/s300/grand-circus-logo.jpg"
                     width="100" height="100">
            </div>
            <div class="form-element">
                <span><i class="fa fa-envelope"></i></span><input type="email" placeholder="Your Email Address"
                                                                  name="email"/>
            </div>
            <div class="form-element">
                <span><i class="fa fa-lock"></i></span><input type="password" placeholder=" Password" name="pass"/>
            </div>
            <button class="btn-login" onclick="location.href='/homepage';">login</button>
        </form:form>
        </c:if>
        <div id="slackbutton">
            <%--<h3>${button}</h3>--%>
            <a href="https://slack.com/oauth/authorize?&client_id=219461147683.223751169686&scope=chat:write:user,team:read,users:read,users:read.email,users:write,users.profile:read">
                <img id="slack" alt="Sign in with Slack" height="40" width="172"
                     src="https://platform.slack-edge.com/img/sign_in_with_slack.png"
                     srcset="https://platform.slack-edge.com/img/sign_in_with_slack.png 1x, https://platform.slack-edge.com/img/sign_in_with_slack@2x.png 2x"/>
            </a>
        </div>
    </div>
    <br>

    <%--<div class="register down">--%>
    <%--<div class="form-element">--%>
    <%--<span><i class="fa fa-user"></i></span><input type="text" placeholder="Full Name"/>--%>
    <%--</div>--%>
    <%--<div class="form-element">--%>
    <%--<span><i class="fa fa-envelope"></i></span><input type="email" placeholder="Your Email Address"/>--%>
    <%--</div>--%>
    <%--<div class="form-element">--%>
    <%--<span><i class="fa fa-lock"></i></span><input type="password" placeholder="Password"/>--%>
    <%--</div>--%>
    <%--<div class="form-element">--%>
    <%--<span><i class="fa fa-lock"></i></span><input type="password" placeholder="Re-Enter Password"/>--%>
    <%--</div>--%>
    <%--<button class="btn-register">register</button>--%>
    <%--</div>--%>

    <div class="login-view-toggle">
        <div class="sign-up-toggle is-active">Don't have an account? <a href="/dontLook">Sign Up</a></div>
        <%--<div class="login-toggle">Already have an account? <a href="#">Login</a></div>--%>
    </div>
</div>
<br>
<script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>

<script src="resources/js/loginindex.js"></script>

</body>
</html>
