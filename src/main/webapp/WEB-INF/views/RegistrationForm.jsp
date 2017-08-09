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
<html>
<head>
    <meta charset="UTF-8">
    <title>Multi Step Form with Progress Bar using jQuery and CSS3</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">


    <link rel="stylesheet" href="resources/css/style.css">


</head>

<body>
<!-- multistep form -->
<form:form action="/addUser" role="form" id="msform">
    <!-- progressbar -->
    <ul id="progressbar">
        <li class="active">Identification Information</li>
        <li>Contact Information</li>
        <li>About Yourself</li>
    </ul>
    <!-- fieldsets -->
    <fieldset>
        <h2 class="fs-title">Create your account</h2>
        <h3 class="fs-subtitle">Identification Information</h3>
        <input type="text" name="firstName" id="firstName" placeholder="First Name" value="${firstName}" required>
        <input type="text" name="lastName" id="lastName" placeholder="Last Name" value="${lastName}" required>
        <input type="text" name="username" id="username" placeholder="User Name" required>
        <input type="password" name="password" id="password" placeholder="Password" required>
        <input type="password" name="checkPassWord" placeholder="Confirm Password" required>
        <input type="button" name="next" class="next action-button" value="Next"/>
    </fieldset>
    <fieldset>
        <h2 class="fs-title">Create your account</h2>
        <h3 class="fs-subtitle">Contact Information</h3>
        <input type="email" name="email" id="email" placeholder="Email" value="${email}" required>
        <input type="email" name="checkEmail" id="checkEmail" placeholder="Confirm Email" required>
        <input type="tel" name="phone" id="phone" placeholder="Phone Number" required>
        <input type="number" name="zip" id="zip" placeholder="Zip Code" required>
        <input type="button" name="previous" class="previous action-button" value="Previous"/>
        <input type="button" name="next" class="next action-button" value="Next"/>
    </fieldset>
    <fieldset>
        <h2 class="fs-title">Create your account</h2>
        <h3 class="fs-subtitle">About Yourself</h3>
        Which bootcamp are you in or have taken? :
        <select>
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
        <br>
        What Languages are you familiar with?<br>
        <input name="languages" type="checkbox" value="java"/>
        <label id="java">- Java</label>
        <br>
        <br>
        <input name="languages" type="checkbox" name="HTML/CSS"/>
        <label id="htmlcss">- HTML/CSS</label>
        <br>
        <br>
        <input name="languages" type="checkbox" name="Swift"/>
        <label id="swift">- Swift</label>
        <br>
        <br>
        <input name="languages" type="checkbox" name="javascript"/>
        <label id="javascript">- Javascript</label>
        <br>
        <br>
        <input name="languages" type="checkbox" value="other">
        <label id="other">- Other:</label> <input type="text" id="otherLanguage" class="form-control">
        <br>
        <br>
        Bio:
        <br>
        <textarea name="bioBlurb" id="bioBlurb" class="form-control" placeholder="Your blurb in at least 140 characters" maxlength="255"
                  minlength="140" required></textarea><br><br>
        <input type="button" name="previous" class="previous action-button" value="Previous"/>
        <input type="submit" name="submit" class="btn btn-default btn-success btn-lg" value="Submit"/>
        <input type="hidden" name="AuthToken" value="${authToken}">
    </fieldset>
</form:form>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>

<script src="resources/js/index.js"></script>

</body>
</html>