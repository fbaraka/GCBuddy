<%--
  Created by IntelliJ IDEA.
  User: Feras
  Date: 8/7/2017
  Time: 10:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>RegistrationForm</title>

</head>
<body>
<header>
    <div class="content-wrapper">
        <div class="float-left">
            <p class="site-title">@Html.ActionLink("your logo here", "Index", "Home")</p>
        </div>
        <div class="float-right">
            <section id="login">
                @Html.Partial("_LoginPartial")
            </section>
            <nav>
                <ul id="menu">
                    <li>@Html.ActionLink("Home", "Index", "Home")</li>
                    <li>@Html.ActionLink("About", "About", "Home")</li>
                    <li>@Html.ActionLink("Contact", "Contact", "Home")</li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<div id="body">
    @RenderSection("featured", required: false)
    <section class="content-wrapper main-content clear-fix">
        @RenderBody()
    </section>
</div>
<footer>
    <div class="content-wrapper">
        <div class="float-left">
            <p>&copy; @DateTime.Now.Year - My ASP.NET MVC Application</p>
        </div>
    </div>
</footer>

@Scripts.Render("~/bundles/jquery")
@RenderSection("scripts", required: false)
</body>
</html>
