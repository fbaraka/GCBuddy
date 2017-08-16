<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 8/8/2017
  Time: 10:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>dontLook</title>
</head>
<body>
<form name="temp" action="RegistrationForm">
<input type="hidden" id="tempCode" name="tempCode" value="none">
</form>

<script>
    var url_string = window.location.href; // this is a command used in javascript in order to assign the url in the current window as a variable
    var url = new URL(url_string); // we then take that url_string and assign it as a url here
    var code = url.searchParams.get("code"); // a search happens through the url for the word "code"
    document.getElementById('tempCode').value = code; // this is where we grab the "element" (the hidden text field) and place the variable "code" from above, inside
    window.onload = function(){ // this is how we automatically submit the page, and the form, right when it loads up.
        document.forms['temp'].submit();
    } //the page submits the tempcode and then takes us to the RegistrationForm.jsp, which is in the action of the form
</script>
</body>
</html>
