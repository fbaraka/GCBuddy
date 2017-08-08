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
        body {
            text-align: center;
        }

        .form-container {
            width: 100%;
            max-width: 320px;
            margin: 0 auto;

        input[type=text], input[type=email], input[type=phone], input[type=number], textarea {
            width: 90%;
            margin: 20px auto;
            border: 1px solid white;
            box-shadow: 0 0 1px 1px white;
        }

        textarea {
            min-height: 150px;
        }

        .panel {
            background: rgba(0, 0, 0, .2);

        .panel-heading {
            margin-bottom: 20px;
        }

        }
        .btn-group {
            width: 90%;
            margin: 0 auto 10px auto;
        }

        .back {
            float: left;
        }

        .continue {
            float: right;
        }

        }

        /* Multi-Part CSS */
        input[type=checkbox] {
            position: absolute;
            /* Position the checkbox in upper left corner */

            opacity: 0;
        }

        /* Styling Parts */
        #part1,
        #part2,
        #part3 {
            z-index: 2;
            display: block;
            height: auto;
            opacity: 1;
            transition: opacity 1s ease-in-out;
        }

        /* Hidden Parts */
        #part2,
        #part3 {
            opacity: 0;
            height: 0;
            overflow: hidden;
        }

        /* Show Step 2 & Hide Step 1 */
        #step2:checked ~ #part2 {
            opacity: 1;
            height: auto;
        }

        #step2:checked ~ #part1 {
            opacity: 0;
            height: 0;
            display: none;
        }

        /* Show Step 3  & Hide Step 2 */
        #step3:checked ~ #part3 {
            opacity: 1;
            height: auto;
        }

        #step3:checked ~ #part2 {
            opacity: 0;
            width: 0;
            height: 0;
        }
    </style>
    <title>Title</title>
</head>
<body>
<a href="/homepage">Should Lead to Home Page</a>
<br>
<h1 class="page-header">Registration Information</h1>
<div class="form-container">
    <form action="/homepage" role="form" >
        <input id='step2' type='checkbox'>
        <input id='step3' type='checkbox'>

        <div id="part1" class="form-group">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Part 1</h3>
                </div>
                <input type="text" id="firstName" class="form-control" placeholder="First Name"
                       aria-describedby="sizing-addon1">
                <br>
                <input type="text" id="lastName" class="form-control" placeholder="Last Name"
                       aria-describedby="sizing-addon1">
                <br>
                <input type="text" id="userName" class="form-control" placeholder="User Name"
                       aria-describedby="sizing-addon1">
                <br>
                <input type="text" id="passWord" class="form-control" placeholder="Password"
                       aria-describedby="sizing-addon1">
                <br>
                <div class="btn-group btn-group-lg" role="group" aria-label="...">
                    <label for='step2' id="continue-step2" class="continue">
                        <div class="btn btn-default btn-success btn-lg">Continue</div>
                    </label>
                </div>
            </div>
        </div>

        <div id="part2" class="form-group">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Contact Information</h3>
                </div>
                <input type="email" id="email" class="form-control" placeholder="Email">
                <br>
                <input type="email" id="checkEmail" class="form-control" placeholder="Please Re-enter Email">
                <br>
                <input type="phone" id="phone" class="form-control" placeholder="Phone">
                <br>
                <input type="number" id="zip" class="form-control" placeholder="Zip Code">
                <br>
                <div class="btn-group btn-group-lg btn-group-justified" role="group" aria-label="...">
                    <label for='step2' id="back-step2" class="back">
                        <div class="btn btn-default btn-primary btn-lg" role="button">Back</div>
                    </label>
                    <label for='step3' id="continue-step3" class="continue">
                        <div class="btn btn-default btn-success btn-lg" role="button">Continue</div>
                    </label>
                </div>
            </div>
        </div>

        <div id="part3" class="form-group">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">About Yourself</h3>
                </div>
                <textarea id="message" class="form-control" placeholder="Message"></textarea>
                <div class="btn-group btn-group-lg" role="group" aria-label="...">
                    <label for='step3' id="back-step3" class="back">
                        <div class="btn btn-default btn-primary btn-lg">Back</div>
                    </label>
                    <label class="continue">
                        <button type="submit" class="btn btn-default btn-success btn-lg">Submit</button>
                    </label>
                </div>
            </div>
        </div>
    </form>
</div>

</body>
</html>
