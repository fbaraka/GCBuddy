<%--
  Created by IntelliJ IDEA.
  User: Feras
  Date: 8/7/2017
  Time: 10:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <style>

    </style>
    <title>Title</title>
</head>
<body>
<a href="/homepage">Should Lead to Home Page</a>
<br>
<h1 class="page-header">Registration Information</h1>
<div class="form-container">
    <form:form action="/addUser" role="form">


        <h3>Part 1</h3>

        <input type="text" name="firstName" id="firstName" class="form-control" placeholder="First Name" value="${firstName}" required>
        <br>
        <input type="text" name="lastName" id="lastName" class="form-control" placeholder="Last Name" value="${lastName}" required>
        <br>
        <input type="text" name="username" id="username" class="form-control" placeholder="User Name" required>
        <br>
        <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
        <br>


        <h3>Contact Information</h3>

        <input type="email" name="email" id="email" class="form-control" placeholder="Email" value="${email}" required>
        <br>
        <input type="email" id="checkEmail" class="form-control" placeholder="Please Re-enter Email" required>
        <br>
        <input type="phone" id="phone" class="form-control" placeholder="Phone" required>
        <br>
        <input type="number" id="zip" class="form-control" placeholder="Zip Code" required>
        <br>


        <h3>About Yourself</h3>

       Which bootcamp are you in or have taken? :
        <select name="bootcamp">
            <option value="cNet">C#/.Net</option>
            <option value="facebook">Facebook</option>
            <option value="frontend">Frontend</option>
            <option value="java">Java</option>
        </select>
        <br>
        <br>
        Are you an Alumni?
        <input type="radio" name="isAlumni" value="yes" tabindex="4">Yes&nbsp;<input type="radio" name="isAlumni" value="no" tabindex="5">No
        <br>
        <br>
        What languages are you experienced in?
        <br>

        <input name="languages" type="checkbox" value="Java" tabindex="7">
        <label>Java</label>
        <br>
        <input name="languages" type="checkbox" value="C#/.Net" tabindex="8">
        <label>C#/.Net</label>
        <br>
        <input name="languages" type="checkbox" value="Javascript" tabindex="9">
        <label>Javascript</label>
        <br>
        <input name="languages" type="checkbox" value="HTML/CSS" tabindex="10">
        <label>HTML/CSS</label>
        <br>
        <input name="languages" type="checkbox" value="Python" tabindex="11">
        <label>Python</label>
        <br>
        <input name="languages" type="checkbox" value="other" tabindex="12">
        <input type="hidden" name="AuthToken" value="${authToken}">
        <label>Other: <input type="text" id="otherLanguage" class="form-control"></label>
        <br>
        Bio Blurb:
        <br>
        <textarea name="bioBlurb" id="bioBlurb" class="form-control" placeholder="You're blurb in at least 140 characters" maxlength="255" minlength="140" required></textarea><br><br>

        <button type="submit" class="btn btn-default btn-success btn-lg">Submit</button>
        <br><br>


    </form:form>

</div>
</body>
</html>
