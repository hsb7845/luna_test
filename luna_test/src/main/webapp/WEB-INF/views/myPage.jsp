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
	<div class="wrap">
		<div class="header"><%@ include file="header.jsp" %>header</div>
		<div class="menu" >
			<h5>${dto.nickname} 님 <a href="coupon.do">쿠폰함</a></h5>
			
			
	      	<h5><a href="updatemember.do">회원정보 수정</a></h5>
			<h5><a href="">장바구니</a></h5>
	        <h5><a href="member.do">최근 본 상품</a></h5>
	        <h5><a href="rboard.do">내가 쓴 리뷰 보기</a></h5>
	        <h5><a href="qboard.do">내가 쓴 문의 사항 보기</a></h5>
		</div>	
		<div class="content">content</div>
		<div class="footer"><%@ include file="footer.jsp" %>footer</div>
	</div>	
</body>
</html>