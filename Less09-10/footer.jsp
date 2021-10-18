<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page pageEncoding="UTF-8"%>
</div>
<div id="sidebar">
	<table border=1>
		<tr>
			<td width="252" align="left"><font color=white>
	<c:choose>
			<c:when test="${sessionScope.authorised != nuii}">Вы авторизировались как ${sessionScope.authorised}</c:when>
	<c:otherwise>
	Pliese autorise.
	</c:otherwise>
	</c:choose><br />
			В вашем гнезде <span id="cartSize">${(sessionScope.productsCartListSize==null?"0":""+sessionScope.productsCartListSize)}</span> драконеов.
			</font></td>
		</tr>
	</table>
	<h2>Типизация</h2>
	<ul>
		<li><a href="products?category=marine">Marine</a></li>
		<li><a href="products?category=fiery">Fiery</a></li>
		<li><a href="products?category=sparkling">Sparkling</a></li>
		<li><a href="registr">Регистрация</a></li>
		<li><a href="login">Вход</a></li>
		<li><a href="cart">Гнездо</a></li>
	</ul>
</div>
</div>
</div>
</div>
</div>
<div id="footer">
	<p>Copyright (c) 20 Century Fox | DreamWorks ent.</p>
</div>
<!-- end #footer -->
</body>
<script type="text/javascript">
    function sum(id, data) {
        var val1 = document.getElementById(id).value;
        if ((+val1 + +data) > 0) {
            document.getElementById(id).value = +val1 + +data;
        }
    }
    function say(id, prodname) {
        var val1 = document.getElementById(id).value;
        console.log("Поймали " + prodname + " в количестве " + +val1 + " особи");
    }
    function sendParam(id, prodid) {
        var val1 = document.getElementById(id).value;
        $.ajax({
            url: 'cart',
            method: 'post',
            data: "buy="+prodid+"&quantity="+ +val1,
            success: function(data){
                document.getElementById("cartSize").innerHTML=data;
            }
        })
    }
</script>    
</html>