<%--
  Created by IntelliJ IDEA.
  User: Feras
  Date: 8/7/2017
  Time: 10:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <form action="/homepage" role="form">


        <h3>Part 1</h3>

        <input type="text" id="firstName" class="form-control" placeholder="First Name" value="${firstName}" required>
        <br>
        <input type="text" id="lastName" class="form-control" placeholder="Last Name" value="${lastName}" required>
        <br>
        <input type="text" id="userName" class="form-control" placeholder="User Name" required>
        <br>
        <input type="password" id="passWord" class="form-control" placeholder="Password" required>
        <br>


        <h3>Contact Information</h3>

        <input type="email" id="email" class="form-control" placeholder="Email" value="${email}" required>
        <br>
        <input type="email" id="checkEmail" class="form-control" placeholder="Please Re-enter Email" required>
        <br>
        <input type="phone" id="phone" class="form-control" placeholder="Phone" required>
        <br>
        <input type="number" id="zip" class="form-control" placeholder="Zip Code" required>
        <br>


        <h3>About Yourself</h3>

       Which bootcamp are you in or have taken? :
        <select>
            <option value="cNet">C#/.Net</option>
            <option value="facebook">Facebook</option>
            <option value="frontend">Frontend</option>
            <option value="java">Java</option>
        </select>
        <br>
        <br>
        Are you an Alumni?
        <input type="radio" name="alumni" value="yes" tabindex="4">Yes&nbsp;<input type="radio" name="alumni" value="no" tabindex="5">No
        <br>
        <br>

        <input name="genre" type="checkbox" value="pop" tabindex="7">
        <label>Java</label>
        <br>
        <input name="genre" type="checkbox" value="rock" tabindex="8">
        <label>C#/.Net</label>
        <br>
        <input name="genre" type="checkbox" value="classic" tabindex="9">
        <label>Javascript</label>
        <br>
        <input name="genre" type="checkbox" value="folk" tabindex="10">
        <label>HTML/CSS</label>
        <br>
        <input name="genre" type="checkbox" value="country" tabindex="11">
        <label>Python</label>
        <br>
        <input name="genre" type="checkbox" value="other" tabindex="12">
        <label>Other: <input type="text" id="otherLanguage" class="form-control"></label>
        <br>
        <textarea id="message" class="form-control" placeholder="You're blurb in at least 140 characters" maxlength="255" minlength="140" required></textarea><br><br>

        <button type="submit" class="btn btn-default btn-success btn-lg">Submit</button>
        <br><br>


    </form>

</div>
</body>
</html>
