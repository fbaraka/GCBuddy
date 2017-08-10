<%--
  Created by IntelliJ IDEA.
  User: Feras
  Date: 8/9/2017
  Time: 9:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Mentorship Page</title>
</head>
<body>

<table border="1px">
    <tr>
        <td>Name</td>
        <td>Disciplines</td>
    </tr>
    <c:forEach items = "${cList}" var = "user">

    <tr>

        <td>${user.firstName} ${user.lastName}</td>
        <td>${user.disciplines}</td>
        <td>Send a message via Slack: <input type="text" name="message" id="username" placeholder="User Name" required></td>

    </tr>

</c:forEach></table>
<br>
<br>
<a href="/homepage">Return to Home</a>
</body>
</html>
