<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- <link rel='stylesheet' href='resources/luna/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/> -->
<!-- <link rel='stylesheet' href='resources/luna/css/woocommerce.css' type='text/css' media='all'/> -->
<!-- <link rel='stylesheet' href='resources/luna/css/font-awesome.min.css' type='text/css' media='all'/> -->
<link rel='stylesheet' href='resources/luna/style.css' type='text/css' media='all'/>
<!-- <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/> -->
<!-- <link rel='stylesheet' href='resources/luna/css/easy-responsive-shortcodes.css' type='text/css' media='all'/> -->


<title>헤더</title>
<style>

	div.menu2{
		text-transform; capitalize;
		color: darkmagenta;
		font-weight: bolder;
		text-align: right;		
		font-size: 10px;
	}

</style>
</head>
<body>
<header id="masthead" class="site-header">
		<div class="menu1">
			<h1 class="site-title"><a href="index.do" rel="home">
				<p style="text-align:center"><img id='mainLogo' src='upload/logo_black.png' style='width:300px; height:80px; vertical-align: middle;' /> </a></p>
			</a></h1>
		</div>
		<div class="menu2">
			<%
				if(session.getAttribute("id") == null){
			%>
					<a href="insertmemberform.do">회원가입</a> &nbsp;
					<a href="loginForm.do">로그인</a> &nbsp;
			<% 	
				} else {
			%>
					<a href="myPage.do">마이페이지</a> &nbsp;
					<a href="cart.do">장바구니</a> &nbsp; 
					<a href=logout.do>로그아웃</a> &nbsp; 
			<% 
				}
			%>
		
		</div>
		<nav id="site-navigation" class="main-navigation">
		<button class="menu-toggle">Menu</button>
		<a class="skip-link screen-reader-text" href="#content">Skip to content</a>
		<div class="menu-menu-1-container">
			<ul id="menu-menu-1" class="menu nav-menu">
				<li><a href="pboardpaging.do?sorting=1">신상품</a></li>
				<li><a href="pboardpaging.do?sorting=2">귀걸이</a></li>
				<li><a href="pboardpaging.do?sorting=3">목걸이</a></li>
				<li><a href="pboardpaging.do?sorting=4">반지</a></li>
				<li><a href="pboardpaging.do?sorting=5">팔찌</a></li>
				<li><a href="pboardpaging.do?sorting=6">기타</a></li>
				<li><a href="eboard.do">이벤트</a></li>
			</ul>
		</div>
		</nav>
		</header>
</body>
</html>