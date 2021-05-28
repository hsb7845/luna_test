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
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0" />  -->
<!-- <meta http-equiv="X-UA-Compatible" content="ie=edge" /> -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->

<!-- <link rel='stylesheet' href='resources/luna/css/woocommerce-layout.css' type='text/css' media='all'/> -->
<!-- <link rel='stylesheet' href='resources/luna/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/> -->
<!-- <link rel='stylesheet' href='resources/luna/css/woocommerce.css' type='text/css' media='all'/> -->
<!-- <link rel='stylesheet' href='resources/luna/css/font-awesome.min.css' type='text/css' media='all'/> -->
<link rel='stylesheet' href='resources/luna/style.css' type='text/css' media='all'/>
<!-- <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/> -->
<!-- <link rel='stylesheet' href='resources/luna/css/easy-responsive-shortcodes.css' type='text/css' media='all'/> -->

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
<body>
<div>
	<%@ include file="header.jsp" %>
</div>
<div>


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
	<a href="logout.do">로그아웃</a><br>
	<a href="main.do">메인페이지</a>
</div>
<div>
	<%@ include file="footer.jsp" %>
</div>	
</body>
</html>