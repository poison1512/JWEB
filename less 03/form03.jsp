﻿<center>
<table>
<form action="form03.jsp" method="post">
    <tr><td>Email:</td><td><input type="email" name="login"/></td></tr>
    <tr><td>Password:</td><td><input type="password" name="password"/></td></tr>
    <tr><td>Repeat password:</td><td><input type="password" name="passwordRepeat"/></td></tr>
    <tr><td>Gender:</td><td>M<input type="radio" name="gender" value="M"/>F<input type="radio" name="gender" value="F"/></td></tr>
    <tr><td>Region:</td><td><select name="region">
        <option value="DNR">ДНР</option>
        <option value="LNR">ЛНР</option>
        <option value="Crimea">Крым</option>
    </select></td></tr>
    <tr><td>Comment:</td><td><textarea rows=10 cols=20 name="comment"/></textarea></td></tr>
    <tr><td>I agree to install an Amigo Browser:</td><td><input type="checkbox" name="browser" checked="true"/></td></tr>
    <tr><td> </td><td><input type="submit" value="SEND"/></td></tr>
</form>
</table>
</center>
<%
    boolean isError = false;
    String errorText = "<ul>";
    String login = request.getParameter("login");
    String password = request.getParameter("password");
    String passwordRepeat = request.getParameter("passwordRepeat");
    String gender = request.getParameter("gender");
    String region = request.getParameter("region");
    String comment = request.getParameter("comment");
    String browser = request.getParameter("browser");
    out.write("login = " + login + ", password = " + password + ", passwordRepeat = " + passwordRepeat +
        ", gender = " + gender + ", region = " + region + ", comment = " + comment + ", browser = " + browser);
    if (login == null || login.isEmpty()) {
        isError = true;
        errorText += "<li>Login is empty!</li>";
    }
    errorText += "</ul>";
    if (!isError) {
        out.write("Registration succeeded.");
    } else {
        out.write(errorText);
    }
%>