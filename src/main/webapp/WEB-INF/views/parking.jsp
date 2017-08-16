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
    <title>Parking</title>
    <style>
        /* Always set the map height explicitly to define the size of the div
         * element that contains the map. */
        #map {
            height: 100%;
        }

        /* Optional: Makes the sample page fill the window. */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
    </style>
</head>
<body>
<a href="/homepage">Go to home page</a>
<br>
<table border="1" id="parkTable">
    <tr>
        <td>Location</td>
        <td>Latitude</td>
        <td>Longitude</td>
        <td>Address</td>
        <td>Price</td>
        <td>Open Spots</td>
        <td>Reserve URL</td>
    </tr>
    <c:forEach items="${c_List}" var="val">
        <tr onload="addToList(${val.latitude},${val.longitude} )">
            <td>${val.locationName}</td>
            <td class="lat">${val.latitude}</td>
            <td class="lng">${val.longitude}</td>
            <td>${val.address}</td>
            <td>${val.price}</td>
            <td>${val.openSpots}</td>
            <td><a href="${val.reserveURL}">Reserve a spot</a></td>
        </tr>
    </c:forEach>
</table>

</form>

<div id="map"></div>
<script src="https://code.jquery.com/jquery-3.2.1.js"
        integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="
        crossorigin="anonymous">

</script>
<script>
    var map;


    $(document).ready(function () {
        $('#parkTable tr').each(function() {
            var lat = $(this).find(".lat").html();
            lat = parseFloat(lat);
            var lng = $(this).find(".lng").html();
            lng = parseFloat(lng);
            addToList(lat, lng);
            console.log(lat);
        });
        locations.shift();
        initMap();
    });



    function loc(lat, lng) {
        this.lat = lat;
        this.lng = lng;
    }


    var locations = []

    function addToList(lat, lng) {
        locations.push(new loc(lat, lng))
    }

    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: 42.335873, lng: -83.049912},
            zoom: 15
        });

        var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

        // Add some markers to the map.
        // Note: The code uses the JavaScript Array.prototype.map() method to
        // create an array of markers based on a given "locations" array.
        // The map() method here has nothing to do with the Google Maps API.
        var markers = locations.map(function (location, i) {
            return new google.maps.Marker({
                position: location,
                label: labels[i % labels.length]
            });
        });
        // Add a marker clusterer to manage the markers.
        var markerCluster = new MarkerClusterer(map, markers,
            {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
    }


</script>
<script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD6pFDPVXl6a5K0UMyCBCCJOVupX2lGkRs&callback=initMap"
        async defer></script>
</body>
</html>
