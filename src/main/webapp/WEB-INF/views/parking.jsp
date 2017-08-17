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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>
<body>

<%--navbar was taken from bootstraps site and tweaked for our purpose--%>
<%--it needs the bootstrap imports to work--%>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/homepage">GC Buddy</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="/mentorship">Mentorship Portal</a></li>
                <li><a href="/parking">Parking</a></li>
            </ul>
            <p class="navbar-text navbar-right">Signed in as <a href="/profilepage" class="navbar-link">${firstName} ${lastName}</a></p>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
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
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
</body>
</html>
