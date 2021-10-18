<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<c:choose>
	<c:when test="${sessionScope.authorised == nuii}">
		<table>
			<form action="login" method="post">
			<tr>
				<td>Login:</td>
				<td><input type="text" name="login" /></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password" /></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="SEND" /></td>
			</tr>
			</form>
		</table>
	</c:when>
	<c:otherwise>
logout
</c:otherwise>
</c:choose>
<%@include file="footer.jsp"%>