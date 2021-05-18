<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- tag라이브러리 : tag모음.. JAVA코드를 치환하는 역할. -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel='stylesheet' href='resources/luna/css/woocommerce-layout.css' type='text/css' media='all'/>
		<link rel='stylesheet' href='resources/luna/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
		<link rel='stylesheet' href='resources/luna/css/woocommerce.css' type='text/css' media='all'/>
		<link rel='stylesheet' href='resources/luna/css/font-awesome.min.css' type='text/css' media='all'/>
		<link rel='stylesheet' href='resources/luna/style.css' type='text/css' media='all'/>
		<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
		<link rel='stylesheet' href='resources/luna/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>

<style>

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
<title>Insert title here</title>
</head>
<body class="archive post-type-archive post-type-archive-product woocommerce woocommerce-page">
<header id="header">
<table border="0" cellpadding="2" cellspacing="0" bordercolor="#000000" style="border-collapse:collapse">
	<tr id="menu1">
		<td colspan="7"><a href="index.do">
			<img id='mainLogo' src='upload/logo.png' style='width:200px; height:90px; vertical-align: middle;' /> </a>
		</td>
	</tr>
	<tr id="menu2">		
<!-- 		<td colspan="3" rowspan="1"><a herf="index.do"><img id='mainLogo' src='upload/logo.png' style='width:200px; height:100px; vertical-align: middle;' /> </a></td> -->
		<tr></tr>
		<td id="m1" colspan="7">		
			<a href="loginForm.do">로그인</a>
			<a href="insertmemberform.do">회원가입</a>
			<a href="adminMain.do">마이페이지</a>
			<a href="buylist.do">장바구니</a>
		</td>
	</tr>	
	<tr></tr>
	<tr id="menu3" >
		<td id="m2"><a href="">신상품</a></td>
		<td  id="m2"><a href="">귀걸이</a></td>
		<td  id="m2"><a href="">목걸이</a></td>
		<td  id="m2"><a href="">반지</a></td>
		<td  id="m2"><a href="">팔찌</a></td>
		<td  id="m2"><a href="">기타</a></td>
		<td  id="m2"><a href="">이벤트</a></td>
	</tr>	
</table>
</header>




<% 
	String id = (String)session.getAttribute("id");
	String admin =(String)session.getAttribute("admin");
	System.out.println("jsp admin = "+admin);
	if(id!=null){
		if(admin.equals("관리자")){
			%>
			<h1>관리자 <%=id %>님 환영합니다.</h1>
			<%
		}else{
			%>
			<h1><%=id %>님 환영합니다.</h1>
			<%
		}
	}
%>

	<a href="pboard.do">상품게시판보기</a><br>
	<a href="pboardpaging.do">상품게시판보기(페이징)</a><br>	
	<a href="stock.do">상품재고보기(stock)</a><br>
	<a href="rboard.do">리뷰 게시판 보기</a><br>
	<a href="member.do">회원목록보기</a><br>
	<a href="qboard.do">문의사항 게시판 보기</a><br>
	<a href="buylist.do">구매 목록 보기</a><br>
	<a href="buydetail.do">구매 상세 보기</a><br>
	<a href="cart.do">장바구니 보기(cart)</a><br>
	<a href="eboard.do">이벤트 게시판 보기</a><br>
	<a href="poption.do">옵션 보기</a><br>	
	<a href="pcategory.do">상품 분류 보기</a><br>
	<a href="coupon.do">쿠폰함보기(coupon)</a><br>
	<a href="imgfile.do">이미지 파일 보기</a><br>
	<a href="loginForm.do">로그인</a><br>
	<a href="header.do">header</a><br>

</body>
</html>