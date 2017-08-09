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

<table>
    <c:forEach items = "${cList}" var = "user">

    <tr>

        <td>${user.firstName}</td>
        <td>${user.lastName}</td>
        <td>${user.languages}</td>

    </tr>

</c:forEach></table>


</body>
</html>
