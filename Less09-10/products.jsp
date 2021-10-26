<%@ page isELIgnored="false"%>
<%@ page pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<c:forEach items = "${productList}" var="product">
<table>
tr><td><a href="products?id=${product.id}"><img src="static/images/${product.id}.gif" width="150" height="100%"/></a></td><td>${product.description}</td></tr>
<tr><td>${product.price}</td><td><form action="cart" method="post">
    <img onclick="sum('a${product.id}', -1)" src="static/images/1_minus_sign.png"/><input id="a${product.id}" size="2" type="text" name="quantity" value="1"/><img onclick="sum('a${product.id}', 1)" src="static/images/2_plus_sign.png"/>
    <input type="hidden" name="buy" value="${product.id}"/>
    <input onclick="sendParam('a${product.id}', '${product.id}')" type="button" value="Отловить"/></form></td></tr>
</table>
<br/>
<br/>
</c:forEach>
<%@include file="footer.jsp"%>