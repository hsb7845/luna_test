<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
	<a href="adminMain.do">adminMain</a><br>

</body>
</html>