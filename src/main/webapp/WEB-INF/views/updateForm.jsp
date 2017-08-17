<%--
  Created by IntelliJ IDEA.
  User: Feras
  Date: 8/7/2017
  Time: 10:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html style="background: linear-gradient(rgba(237, 99, 52, .8), rgba(0, 0, 0, .6));">
<head>
    <meta charset="UTF-8">
    <title>Edit profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="resources/css/style.css">

</head>

<body>
<!-- multistep form -->

<%--all I did in this form was take out the option to update password and change the action to updateUser--%>
<form:form action="/updateUser" role="form" id="msform">
    <!-- progressbar -->
    <ul id="progressbar">
        <li class="active">Identification Information</li>
        <li>Contact Information</li>
        <li>About Yourself</li>
    </ul>
    <!-- fieldsets -->
    <fieldset>
        <h2 class="fs-title">Update your account</h2>
        <h3 class="fs-subtitle">Identification Information</h3>
        <input type="text" name="firstName" id="firstName" placeholder="First Name" value="${firstName}" required>
        <input type="text" name="lastName" id="lastName" placeholder="Last Name" value="${lastName}" required>
        <input type="button" name="next" class="next action-button" value="Next"/>
    </fieldset>
    <fieldset>
        <h2 class="fs-title">Update your account</h2>
        <h3 class="fs-subtitle">Contact Information</h3>
        <input type="email" name="email" id="email" placeholder="Email" value="${email}" required>
        <input type="email" name="checkEmail" id="checkEmail" placeholder="Confirm Email" required>
        <input type="tel" name="phone" id="phone" placeholder="Phone Number">
        <input type="text" name="city" id="city" placeholder="City" required>
        <input type="button" name="previous" class="previous action-button" value="Previous"/>
        <input type="button" name="next" class="next action-button" value="Next"/>
    </fieldset>
    <fieldset>
        <h2 class="fs-title">Update your account</h2>
        <h3 class="fs-subtitle">About Yourself</h3>
        Which bootcamp are you in or have taken? :


        <%--had to add a name to the select tag so it would store in the user entity--%>
        <select name="bootcamp">
            <option value="blankChoice" selected disabled>Choose One</option>
            <option value="cNet">C#/.Net</option>
            <option value="facebook">Facebook</option>
            <option value="frontend">Frontend</option>
            <option value="java">Java</option>
        </select>
        <br>
        <br>
        Are you an Alumnus?
        <br>
        <input type="radio" name="isAlumni" value="yes"/><label id="radio"> Yes
        <input type="radio" name="isAlumni" value="no"/> No </label>
        <br>
        <input type="button" name="previous" class="previous action-button" value="Previous"/>
        <input type="submit" name="submit" class="next action-button" value="Submit"/>
        <input type="hidden" name="authToken" value="${authToken}">
        <input type="hidden" name="slackId" value="${slackId}">
        <input type="hidden" name="photoUrl" value="${photoUrl}">
    </fieldset>
</form:form>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>

<script src="resources/js/index.js"></script>

</body>
</html>