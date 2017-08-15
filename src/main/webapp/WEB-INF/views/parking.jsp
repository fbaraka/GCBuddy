<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: michaelgleeson
  Date: 8/15/17
  Time: 9:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/homepage">Go to home page</a>
<br>
<table border="1">
    <tr><td>Location</td>
        <td>Latitude</td>
        <td>Longitude</td>
        <td>Address</td>
        <td>Price</td>
        <td>Open Spots</td>
        <td>Reserve URL</td></tr>
    <c:forEach items="${c_List}" var="val">
    <tr>
        <td>${val.locationName}</td>
        <td>${val.latitude}</td>
        <td>${val.longitude}</td>
        <td>${val.address}</td>
        <td>${val.price}</td>
        <td>${val.openSpots}</td>
        <td>${val.reserveURL}</td>
    </tr>
</c:forEach> </table>
</body>
</html>
