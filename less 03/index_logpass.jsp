<%! private int countLogins = 0; %>
<%! private long timeOfLock = 0; %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <meta charset="UTF-8" />
    <link href="style.css" rel="stylesheet" />
</head>

<body>
<%
    String login = request.getParameter("login");
    String password = request.getParameter("password");
    boolean showForm = true;
    if (login != null) {
        if ("admin".equals(login) && "123".equals(password)) {
            showForm = false;
            out.write("<center><font color=\"green\">Access granded.</text>");
        } else {
            countLogins++;
            if (countLogins == 3) {
                timeOfLock = System.currentTimeMillis();
                showForm = false;
            }
            out.write("<center><font color=\"red\">Access denied.</text>");
        }
    }
    if (timeOfLock != 0) {
        showForm = false;
        long rez = ((timeOfLock + 10000) - System.currentTimeMillis())/1000;
        if (rez > 0) {
            out.write("<center><font color=\"red\">You locked for " + rez + " seconds.</text>");
        } else {
            timeOfLock = 0;
            countLogins = 0;
            showForm = true;
        }
    }
    if (showForm) {
%>
<center>
Enter your login and password.<br/><br/>
<table>
<form action = 'index.jsp' method='post'>
	<tr><td align = 'right'>Login:</td> <td ><input type = 'text' name = 'login'></td></tr>
	<tr><td align = 'right'>Passwod: </td> <td><input type = 'password' name = 'password'></td></tr>
	<tr><td></td><td align = 'right'><input type = 'submit' value = 'OK'></td></tr>
</form>
</table>
<%
    }
%>
</body>
</html>