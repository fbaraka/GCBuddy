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
<html>
<head>
    <title>Register for the mentorship program</title>
</head>
<body>
<c:choose>
    <c:when test="${isMentor}">
        <form:form name="mentorRegistration" action="${action}" method="POST">
            What disciplines? <br>
            <br>
            <input name="disciplines" type="checkbox" value="Java" tabindex="7">
            <label>Java</label>
            <br>
            <input name="disciplines" type="checkbox" value="C#/.Net" tabindex="8">
            <label>C#/.Net</label>
            <br>
            <input name="disciplines" type="checkbox" value="Javascript" tabindex="9">
            <label>Javascript</label>
            <br>
            <input name="disciplines" type="checkbox" value="HTML/CSS" tabindex="10">
            <label>HTML/CSS</label>
            <br>
            <input name="disciplines" type="checkbox" value="Python" tabindex="11">
            <label>Python</label>
            <br>
            <input name="disciplines" type="checkbox" value="other" tabindex="12">
            <lable>Other</lable>
            <br>
            <br>
            <h4>If you would like to be matched by your personality using IBM Watson technology, Please answer the
                following questions. (The more detail you use, the better match you will find)</h4><br><br>
            What are three words you would use to describe yourself and why?<br>
            <textarea name="answer" cols="117" rows="2" placeholder="Please use no less than 20 words!" style="color: black"></textarea>
            <hr>
            How would someone else describe you after meeting you for the first time?<br>
            <textarea name="answer" cols="117" rows="2" placeholder="Please use no less than 20 words!" style="color: black"></textarea>
            <hr>
            Tell us about a time you were met with a challenge. How did you approach the challenge. What was the outcome?<br>
            <textarea name="answer" cols="117" rows="2" placeholder="Please use no less than 20 words!" style="color: black"></textarea>
            <hr>
            Describe your ideal work environment.<br>
            <textarea name="answer" cols="117" rows="2" placeholder="Please use no less than 20 words!" style="color: black"></textarea>
            <hr>
            How do you deal with pressure or stressful situations?<br>
            <textarea name="answer" cols="117" rows="2" placeholder="Please use no less than 20 words!" style="color: black"></textarea>
            <hr>

            <button type="submit" class="btn btn-default btn-success btn-lg">Submit</button>

        </form:form>
    </c:when>
    <c:otherwise>
        You are a ${desc} in these disciplines: ${disciplines}
        <br>would you like to change these?
        <form:form action="/goToPortal">
            <input type="radio" name="addMore" value="yes">Yes
            <input type="radio" name="addMore" value="no">No<br>
            <button type="submit" class="btn btn-default btn-success btn-lg">Submit</button>
        </form:form>
    </c:otherwise>
</c:choose>
</body>
</html>
