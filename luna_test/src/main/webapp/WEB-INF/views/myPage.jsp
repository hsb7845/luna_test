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

<!-- <link rel='stylesheet' href='resources/luna/css/woocommerce-layout.css' type='text/css' media='all'/> -->
<!-- <link rel='stylesheet' href='resources/luna/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/> -->
<!-- <link rel='stylesheet' href='resources/luna/css/woocommerce.css' type='text/css' media='all'/> -->
<!-- <link rel='stylesheet' href='resources/luna/css/font-awesome.min.css' type='text/css' media='all'/> -->
<link rel='stylesheet' href='resources/luna/style.css' type='text/css' media='all'/>
<!-- <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/> -->
<!-- <link rel='stylesheet' href='resources/luna/css/easy-responsive-shortcodes.css' type='text/css' media='all'/> -->

<style type="text/css">

   .wrap{
      display : grid;
/*       grid-template-rows: 50px 600px 50px; */
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
        margin: 5px; 
     } 
    #m1>h5:last-child{
       height: px;
    }
    span {
       display: inline-block;
       height: 20px;
    }
   
    
    div.menu1 {
    	background-color: gray;
    	color: white
    }
    div.menu2{
		text-transform; capitalize;
		text-align: right;		
		font-size: 10px;
		background-color: white;
		font-color: white;
	}
    @font-face {
    font-family: 'GmarketSansLight';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

   	body,button,input{ 
   		font-family: 'GmarketSansLight'; 
   		font-weight: bold; 
   	}	 
   	h1 {
   		font-family: 'GmarketSansLight';    	
   		font-color: white;
   	}
   	h2, h3, h5{
   		font-family: 'GmarketSansLight';    	
   		font-color: white;
   	}
   	p {
   		font-size: 20px;
   		padding: 0px;
   	}
   	.p1 {
/*    		border: 1px solid red; */
   		padding: 0px !important;
   		margin-bottom : -15px !important; 
   	}
   	#mainLogo{
   			
   	
   	}

   	.coupon, .profile, .order, .buylist, .review, .pa, .post {
   		padding: 0px !important ;
/*    		border: 1px solid blue; */
   	}
   	
   	.home{
   	 		margin-left : 700px;
   	}
 
</style>

</head>
<body>
			<h2><div class="menu1">
			<a href="myPage.do"  class="home"  rel="home"  style="text-align:center">
<!-- 					<img id='mainLogo' src='upload/logo_gray.png' style='width:150px; height:80px; vertical-align: middle;' /> -->
						<span style=" color:white;" >
<!-- 							마이페이지 -->
							<img src="upload/mypage_white.png" style='width:200px; height:80px; vertical-align: middle;' />
						</span></a>
			</a></h2>
			<div class="menu2">
			<%
				if(session.getAttribute("id") == null){
			%>
					<a href="insertmemberform.do">회원가입</a> &nbsp;
					<a href="loginForm.do">로그인</a> &nbsp;
			<% 	
				} else {
			%>
<!-- 					<a href="myPage.do">마이페이지</a> &nbsp; -->
<!-- 					<a href="cart.do">장바구니</a> &nbsp;  -->
					<a href=index.do>go main</a> &nbsp; 
					<a href=logout.do>로그아웃</a> &nbsp; 
			<% 
				}
			%>
		
		</div>
		</div>


    <% 
	String id = (String)session.getAttribute("id");
	if(id!=null){
			%>
        <h3>&nbsp; ${nickname} 님 환영합니다.</h3>
    <%
		}
	
%>

    <%
	CouponDTO hit = (CouponDTO) request.getAttribute("dto");
%>
  <hr class="sidebar-divider">  
        <div class="wrap">
            <div class="menu">
<!--                 <a href="index.do" id="main">go main</a><br><br> -->              
                
             <div class="profile">                
                <p class="p1">
                    <a href="updatememberForm.do?id=${id}">profile 회원정보</a>
                </p>
                <h5>
                	회원이신 고객님의 개인정보를 관리하는 공간입니다.
               	</h5>
               </div>  
                <hr class="sidebar-divider">    
               <div class="order">
                <p class="p1">
                    <a href="cart.do">cart 장바구니</a>
                </p>
                <h5>
                	고객님께서 주문하신 상품의 주문내역을 확인하실 수 있습니다.
  
                </h5>
               </div>
                <hr class="sidebar-divider">    
                
                <div class="buylist">
                <p class="p1">
                    <a href="buylist.do?id=${id }">buy list 내 구매 목록</a>
                </p>
                <h5>
                	구매하신 상품의 목록을 보여드립니다.
                </h5>
                </div>
                <hr class="sidebar-divider">    
                <div class="review">
                <p class="p1">
                    <a href="rboard.do?id=${id }">review 내가 쓴 리뷰</a>
                </p>
                <h5>
                	고객님이 등록하신 리뷰의 목록을 보여드립니다.
                </h5>
                </div>
                <hr class="sidebar-divider">    
                <div class="qa">
                <p class="p1">
                    <a href="qboard.do?id=${id }">Q&A 내가 쓴 문의사항</a>
                </p>
                <h5>
                	고객님이 등록하신 리뷰의 목록을 보여드립니다.
                </h5>
                </div>
                <hr class="sidebar-divider">    
                <div class="post">
                 <p class="p1">
                    <a href="https://service.epost.go.kr/iservice/usr/trace/usrtrc001k01.jsp"> post office 우체국 배송조회</a>
                </p>
                <h5>
                	고객님이 주문하신 상품의 배송 조회를 할 수 있도록 우체국 사이트로 이동합니다.
                </h5>
                </div>
				<hr class="sidebar-divider">   
				<div class="coupon" >
                <span class="p1" >
                    <a href="coupon.do">coupon 쿠폰</a>
                </span>
                    <%
 				if(hit != null && hit.getHit()>0) { 
 			%>
                        <img src="resources/img/bell.png" style="max-width: 1.8%; height: auto;"/>
                    <%
				}
			%>
                
                <h5>
                	고객님이 보유하고 계신 쿠폰 내역을 보여드립니다.
                </h5>
                
			</div>
				  <hr class="sidebar-divider"> 
			
            </div>
	   	</div>   

	
	
	
		<div>
			
			<%@ include file="footer.jsp" %>
			
		</div>
  
    <script>
    
    </script>

</body>
</html>