<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Aaron
  Date: 8/9/2017
  Time: 6:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<center>
    <h3>${button}</h3>
    <a href="https://slack.com/oauth/authorize?&client_id=219461147683.223751169686&scope=chat:write:user,team:read,users:read,users:read.email,users:write,users.profile:read">
        <img alt="Sign in with Slack" height="40" width="172"
             src="https://platform.slack-edge.com/img/sign_in_with_slack.png"
             srcset="https://platform.slack-edge.com/img/sign_in_with_slack.png 1x, https://platform.slack-edge.com/img/sign_in_with_slack@2x.png 2x"/>
    </a>
    <br>
    <c:if test="${isLogin}">
        <h3>Log in with email and password:</h3>
        <form:form action="/logInUser">
            ${msg}<br>
            <input type="email" placeholder="email" name="email"><br>
            <input type="password" placeholder="password" name="pass"><br>
            <input type="submit" name="submit" class="btn btn-default btn-success btn-lg" value="Submit"/>
        </form:form>
    </c:if>
    OR
    <a class="text-center" href="/dontLook">
        <br>

        <button type="button" class="btn btn-primary">Register here</button>
    </a>
</center>

</body>
</html>
