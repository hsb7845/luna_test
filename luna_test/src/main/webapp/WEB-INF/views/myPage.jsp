<%@page import="com.luna.board.dtos.CouponDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
<meta http-equiv="X-UA-Compatible" content="ie=edge" />

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>마이 페이지</title>

<link rel='stylesheet' href='resources/luna/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='resources/luna/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>

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

<%
	CouponDTO hit = (CouponDTO) request.getAttribute("dto");
%>

	<div class="wrap">
		<div class="header"><%@ include file="header.jsp" %>header</div>
		
		<div class="menu" >
		<a href="index.do" id="main">go main</a><br><br>
			
			
			
			<h5><a href="coupon.do">쿠폰함</a>
 			<%
 				if(hit != null && hit.getHit()>0) { 
 			%>
 					<img src="resources/img/bell.png" style="max-width: 1.8%; height: auto;" />
 			<%
				}
			%>
			</h5>



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
	
<script>

 
</script>	
		
</body>
</html>