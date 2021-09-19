<%! private int countLogins = 0; %>
<%! private long timeOfLock = 0; %>
<!DOCTYPE html>
<head>
    <title>Personal Info List</title>
    <meta charset="UTF-8" />
    <link href="style.css" rel="stylesheet" />
</head>

<body>
<%
    String login = request.getParameter("login");
    String password = request.getParameter("password");
	String repPassword = request.getParameter("repPassword");
	String gender = request.getParameter("gender");
	String region = request.getParameter("region");
	String comment = request.getParameter("comment");
	String mailru = request.getParameter("mailru");
    boolean showForm = true;
    if (login != null) {
        if ("none@none.net".equals(login) && "123".equals(password) && "123".equals(repPassword)) {
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
<td>
<table>
<form action = 'index.jsp' method='post'>
	<tr><td align = 'right'>Email:</td> <td ><input type = 'email' name = 'login'/></td></tr>
	<tr><td align = 'right'>Passwod:</td> <td><input type = 'password' name = 'password'/></td></tr>
	<tr><td align = 'right'>Repeat passwod:</td> <td ><input type = 'repPassword' name = 'repPassword'/></td></tr>
	<tr><td align = 'right'>Gender:</td> <td >M<input type = 'radio' name = 'gender' value = 'M'/>F<input type = 'radio' name = 'gender' value = 'F'/></td></tr>
	<tr><td align = 'right'>Region:</td> <td ><select name = 'region'>
		<option value = 'uga'>Uganda</option>
		<option value = 'bur'>Burkina Faso</option>
		<option value = 'lug'>Lugandonia</option>
	</select></td></tr>
	<tr><td align = 'right'>Comment:</td> <td ><textarea rows = 10 cols = 22 name = 'comment'></textarea></td></tr>
	<tr><td align = 'right'>I agree to install Mail.ru agent:</td> <td ><input type = 'checkbox' name = 'mailru' checked = 'true'></td></tr>
	<tr><td></td><td align = 'right'><input type = 'submit' value = 'OK'></td></tr>
</form>
</td>
</table>
 
<%
    }
%>
<td>
<%
	out.write("login = "+login+"</br>"+"password = "+password+"</br>"+"repPassword = "+repPassword+"</br>"+"gender = "+gender+"</br>"+"region = "+region+"</br>"
	+"comment = "+comment+"</br>"+"mailru = "+mailru);

%>
</td>
</table>
</body>
</html>