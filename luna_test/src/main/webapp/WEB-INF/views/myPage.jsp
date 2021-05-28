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
    }
    div.menu2{
		text-transform; capitalize;
		text-align: right;		
		font-size: 10px;
		background-color: white;
		font-color: white;
	}
    @font-face { 
   	    font-family: 'Gyeonggi_Tittle_OTF_FontInstaller'; 
   	    font-weight: normal; 
   	    font-style: normal; 
   	} 

   	body,button,input{ 
   		font-family: 'Gyeonggi_Tittle_OTF_FontInstaller'; 
   		font-weight: bold; 
   	}	 
   	h1 {
   		font-family: 'Gyeonggi_Tittle_OTF_FontInstaller';    	
   		font-color: white;
   	}
 
</style>

</head>
<body>
			<div class="menu1">
			<h1><a href="myPage.do" rel="home">
				<p style="text-align:left">
					<img id='mainLogo' src='upload/logo_gray.png' style='width:150px; height:80px; vertical-align: middle;' />
						마이페이지</a></p>
			</a></h1>
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
        <h3>${nickname}님 환영합니다.</h3>
    <%
		}
	
%>

    <%
	CouponDTO hit = (CouponDTO) request.getAttribute("dto");
%>

        <div class="wrap">
            <div class="menu">
<!--                 <a href="index.do" id="main">go main</a><br><br> -->
                <h5>
                    <a href="coupon.do">쿠폰함</a>
                    <%
 				if(hit != null && hit.getHit()>0) { 
 			%>
                        <img src="resources/img/bell.png" style="max-width: 1.8%; height: auto;"/>
                    <%
				}
			%>
                </h5>
                <h5>
                    <a href="updatememberForm.do?id=${id}">회원정보 수정</a>
                </h5>
                <h5>
                    <a href="cart.do">장바구니</a>
                </h5>
                <h5>
                    <a href="buylist.do?id=${id }">내 구매 목록</a>
                </h5>
                <h5>
                    <a href="rboard.do?id=${id }">내가 쓴 리뷰 보기</a>
                </h5>
                <h5>
                    <a href="qboard.do?id=${id }">내가 쓴 문의 사항 보기</a>
                </h5>

            </div>
            <div class="content"></div>
            <div class="content">
                <a href="https://service.epost.go.kr/iservice/usr/trace/usrtrc001k01.jsp">우체국 배송조회</a>
            </div>

        </div>
        <%@ include file="footer.jsp" %>
    <script>
    
    </script>

</body>
</html>