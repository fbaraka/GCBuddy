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
    var url_string = window.location.href;
    var url = new URL(url_string);
    var code = url.searchParams.get("code");
    document.getElementById('tempCode').value = code;
    window.onload = function(){
        document.forms['temp'].submit();
    } //the page sumbits the tempcode and return the authtoken and takes you to the homepage.
</script>
</body>
</html>
