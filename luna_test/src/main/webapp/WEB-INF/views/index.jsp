<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- tag라이브러리 : tag모음.. JAVA코드를 치환하는 역할. -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    

<!-- 참고 사이트 -->
<!-- https://velog.io/@yseonjin/JSP-%EC%87%BC%ED%95%91%EB%AA%B0-%EA%B4%80%EB%A6%AC%ED%8E%98%EC%9D%B4%EC%A7%80-%EB%A7%8C%EB%93%A4%EA%B8%B0-%EC%97%B0%EC%8A%B5-8 -->

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
<!-- 		<td colspan="3" rowspan="1"><a herf="index.do"> -->
<!-- 			<img id='mainLogo' src='upload/logo.png' style='width:200px; height:100px; vertical-align: middle;' /> </a> -->
<!-- 		</td> -->
		<tr></tr>
		<td id="m1" colspan="7">
<!-- 			<a href="loginForm.do">로그인</a> -->
<!-- 			<a href="insertmemberform.do">회원가입</a> -->
<!-- 			<a href="myPage.do">마이페이지</a> -->
<!-- 			<a href="buylist.do">장바구니</a> -->
<!-- 			<a href="logout.do">로그아웃</a> -->

<%
	String custid="";
	if(session.getAttribute("id") != null){
		custid = (String)session.getAttribute("id");
	}
%>
		<a href="insertmemberform.do">회원가입</a> &nbsp;

<% 	
	if(custid.equals("admin")){
%>
		<a href="myPage.do">마이페이지</a> &nbsp;
		<a href="buylist.do">장바구니</a> &nbsp; 
		<a href=logout.do>로그아웃</a> &nbsp; 
<% 
	}else{
%>	
		<a href="loginForm.do">로그인</a> &nbsp;
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
		<td  id="m2"><a href="pboardpaging.do?sorting=7">이벤트</a></td>
	</tr>	
</table>
</header>
<% 
	String id = (String)session.getAttribute("id");
	if(id!=null){		
			%>
			
			<h3>${nickname}님 환영합니다.</h3>
			<%
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
	<a href="logout.do">로그아웃</a>
	<%@ include file="footer.jsp" %>
</body>
</html>