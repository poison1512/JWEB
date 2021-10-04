<%@ page import="jadv.l04dbconnection.DbExecutor"%>
<a href="withauthorizator.jsp">Authorization</a> | <a href="form03.jsp">Registration</a>
<center>
<table>
<form action="" method="post">
    <tr><td>Name:</td><td><input type="text" name="name" value="<%=(request.getParameter("name") != null)?request.getParameter("name"):""%>"/></td></tr>
	<tr><td>Email:</td><td><input type="email" name="login" value="<%=(request.getParameter("login") != null)?request.getParameter("login"):""%>"/></td></tr>
    <tr><td>Password:</td><td><input type="password" name="password" value="<%=(request.getParameter("password") != null)?request.getParameter("password"):""%>"/></td></tr>
    <tr><td>Repeat password:</td><td><input type="password" name="passwordRepeat" value="<%=(request.getParameter("passwordRepeat") != null)?request.getParameter("passwordRepeat"):""%>"/></td></tr>
    <tr><td>Gender:</td><td>M<input type="radio" name="gender" value="M" <%=("M".equals(request.getParameter("gender")))?" checked=\"true\"":""%>/>F<input type="radio" name="gender" value="F" <%=("F".equals(request.getParameter("gender")))?" checked=\"true\"":""%>/></td></tr>
    <tr><td>Region:</td><td><select name="region">
        <option value="DNR" <%=("DNR".equals(request.getParameter("region")))?" selected=\"true\"":""%>>ДНР</option>
        <option value="LNR" <%=("LNR".equals(request.getParameter("region")))?" selected=\"true\"":""%>>ЛНР</option>
        <option value="Crimea" <%=("Crimea".equals(request.getParameter("region")))?" selected=\"true\"":""%>>Крым</option>
    </select></td></tr>
    <tr><td>Comment:</td><td><textarea rows=10 cols=20 name="comment"><%=(request.getParameter("comment") != null)?request.getParameter("comment"):""%></textarea></td></tr>
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
        DbExecutor de = new DbExecutor();
        de.addUser(login, login, password);
        out.write("Registration succeeded.");
    } else {
        out.write(errorText);
    }
%>