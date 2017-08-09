<%--
  Created by IntelliJ IDEA.
  User: Feras
  Date: 8/9/2017
  Time: 10:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>Register for the mentorship program</title>
</head>
<body>
<form:form name="mentorRegistration" action="/mentor" method="POST">
What would you like to mentor or get mentored in? <br>
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
    <lable>Other</lable>
<br>
<br>

    <button type="submit" class="btn btn-default btn-success btn-lg">Submit</button>


</form:form>

</body>
</html>
