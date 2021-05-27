<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel='stylesheet' href='resources/luna/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='resources/luna/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>

<title>헤더</title>
<style>
html, body {
    height: 100%;
    }
	*{
		margin : 0 auto;
/* 		width: 1024px;	 */
		font-family: 'GyeonggiBatang';      
	}
	#m1 {
		font-size: 12px;
        text-align: right;        
	}
	#menu3 { 		
		background-color: lightgray;
/* 		text-align: center;		 */
/* 		font-size: 13px; */
	}	
	#m2{
		text-transform; capitalize;
		color: darkmagenta;
		font-weight: bolder;
		text-align: center;		
		font-size: 15px;
	}
	
</style>
</head>
<body class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">
<header id="header">
<table border="0" cellpadding="2" cellspacing="0" bordercolor="#000000" style="border-collapse:collapse">
	<tr id="menu1">
		<td colspan="7"><a href="index.do">
			<p style="text-align:center;"><img id='mainLogo' src='upload/logo.png' style='width:200px; height:90px; vertical-align: middle;' /> </a></p>
		</td>
	</tr>
	<tr id="menu2">		
<!-- 		<td colspan="3" rowspan="1"><a herf="index.do"><img id='mainLogo' src='upload/logo.png' style='width:200px; height:100px; vertical-align: middle;' /> </a></td> -->
		<tr></tr>
		<td id="m1" colspan="7">		
<!-- 			<a href="loginForm.do">로그인</a> -->
<!-- 			<a href="insertmemberform.do">회원가입</a> -->
<!-- 			<a href="myPage.do">마이페이지</a> -->
<!-- 			<a href="buylist.do">장바구니</a> -->
<!-- 			<a href="logout.do">로그아웃</a> -->
			
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
			
				
		</td>
	</tr>	
	<tr></tr>
	<tr id="menu3" >
		<td id="m2"><a href="pboardpaging.do?sorting=1">신상품</a></td>
		<td  id="m2"><a href="pboardpaging.do?sorting=2">귀걸이</a></td>
		<td  id="m2"><a href="pboardpaging.do?sorting=3">목걸이</a></td>
		<td  id="m2"><a href="pboardpaging.do?sorting=4">반지</a></td>
		<td  id="m2"><a href="pboardpaging.do?sorting=5">팔찌</a></td>
		<td  id="m2"><a href="pboardpaging.do?sorting=6">기타</a></td>
		<td  id="m2"><a href="eboard.do">이벤트</a></td>
	</tr>	
</table>
</header>

</body>
</html>