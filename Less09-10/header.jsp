<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Магазин драконов</title>
<link href="static/css/style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="static/scripts/jquery-3.6.0.js"></script>
<script type="text/javascript" src="static/scripts/jquery.poptrox-0.1.js"></script>
</head>
<body>
<div id="header" class="container">
	<div id="logo">
		<h1><a href="#">ДРАКОНЫ </a></h1>
		<p>Лучшие в мире<a href="http://www.freecsstemplates.org"></a></p>
	</div>
	<div id="menu">
		<ul>
			<li class="current_page_item"><a href="index.php">Главная</a></li>
			<li><a href="products">Товары</a></li>
			<li><a href="registr">Регистрация</a></li>
			<li><a href="login">Вход</a></li>
			<li><a href="cart">Гнездо</a></li>
		</ul>
	</div>
</div>
<!-- end #header -->
<div id="poptrox">
	<!-- start -->
	<ul id="gallery">
		<li><a href="static/images/1a.png"><img src="static/images/1.png" title="Typhoomerang" alt="" /></a></li>
		<li><a href="static/images/2a.png"><img src="static/images/2.png" title="Night Fury" alt="" /></a></li>
		<li><a href="static/images/3a.png"><img src="static/images/3.png" title="Hotburple" alt="" /></a></li>
		<li><a href="static/images/4a.png"><img src="static/images/4.png" title="Speed Stinger" alt="" /></a></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
	<br class="clear" />
	<script type="text/javascript">
		$('#gallery').poptrox();
		</script>
	<!-- end -->
</div>
<div id="page">
	<div id="bg1">
		<div id="bg2">
			<div id="bg3">
				<div id="content">