<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<style type="text/css">
   .wrap{
      display : grid;
      grid-template-rows: 50px 500px 50px;
   }
    .wrap > div {margin: 1px; padding: 10px; font-size: 20px;}
    .header { 
        grid-column-start: 1; grid-column-end: 3; 
        background: white; 
    }
    .menu {
        grid-column-start: 1; grid-column-end: 2;
        background: white; 
    }
    .content {
        grid-column-start: 2; grid-column-end: 3;
        background: white; 
    }
    .footer { 
        grid-column-start: 1; grid-column-end: 3;
        background: white; 
    }
    
    * {
       margin: 10px;
    }
    #m1>h5:last-child{
       height: 20px;
    }
    span {
       display: inline-block;
       height: 20px;
    }
 
</style>

</head>
<body>
<% 
	String id = (String)session.getAttribute("id");
	if(id!=null){
			%>
			<h3>${nickname}님 환영합니다.</h3>
			<%
		}
	
%>
	<div class="wrap">
		<div class="header"><%@ include file="header.jsp" %>header</div>
		
		<div class="menu" >
		<a href="index.do" id="main">go main</a><br><br>
		
			<h5><a href="coupon.do">쿠폰함</a></h5>			
	      	<h5><a href="updatememberForm.do?id=${id}">회원정보 수정</a></h5>
			<h5><a href="cart.do">장바구니</a></h5>
	        <h5><a href="#">최근 본 상품</a></h5>
	        <h5><a href="rboard.do">내가 쓴 리뷰 보기</a></h5>
	        <h5><a href="qboard.do">내가 쓴 문의 사항 보기</a></h5>
	        <h5><a href="logout.do">로그아웃</a></h5>
	        
		</div>	
		<div class="content"></div>
		<div class="content"><a href="https://service.epost.go.kr/iservice/usr/trace/usrtrc001k01.jsp">우체국 배송조회</a></div>
		<div class="footer"><%@ include file="footer.jsp" %></div>
	</div>	
</body>
</html>