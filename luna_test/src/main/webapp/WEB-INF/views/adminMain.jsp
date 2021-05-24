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
<title>관리자 메인페이지</title>

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
      font-family: 'GyeonggiBatang';      
   }
    .wrap > div {margin: 1px; padding: 10px; font-size: 20px;}
    .grid1 { 
        grid-column-start: 1; grid-column-end: 3; 
        background: white; 
    }
    .grid2 {
        grid-column-start: 1; grid-column-end: 2;
        background: white; 
    }
/*     .grid3 { */
/*         grid-column-start: 2; grid-column-end: 3; */
/*         background: white;  */
/*     } */
/*     .grid4 {  */
/*         grid-column-start: 1; grid-column-end: 3; */
/*         background: white;  */
/*     } */

	 .grid5 {
        grid-column-start: 50; grid-column-end: 2;
        background: white; 
        text-align: right;
    }
    
    * {
       margin: 5px;
    }
    #m1>h4:last-child{
       height: 20px;
    }
    span {
       display: inline-block;
       height: 20px;
    }
 
</style>
</head>
<body>
<%@ include file="header.jsp" %>
<% 
	String id = (String)session.getAttribute("id");
	if(id!=null){
			%>
			<h3>${nickname}님 환영합니다.</h3>
			<%
		}	
%>

	<div class="wrap">
<!-- 		<div class="grid1" id="header"> -->
<%-- 			<%@ include file="header.jsp"  %> --%>
<!--       		<a href="index.do" id="main">go main</a> -->
<!--       	</div>       -->
      	<div class="grid2" ><h2>관리자페이지</h2>
			<div id="m1">
	            <h4><a href="stock.do" id="button1">재고관리</a></h4>
	            <h4><a href="member.do" id="button2">회원관리</a></h4>
	            <h4><a href="pboard.do" id="button3">게시판관리</a></h4>
	         </div>
	         <div id="m2">
	            <div><h6><a href="#" id="button4-1"> 귀걸이</a></h6></div>
	            <div><h6><a href="#">목걸이</a></h6></div>
	            <div><h6><a href="#">기타</a></h6></div>
	            <div><h6><a href="rboard.do">리뷰</a></h6></div>
	            <div><h6><a href="qboard.do">문의사항</a></h6></div>
	            <div><h6><a href="eboard.do">이벤트</a></h6></div>
	         </div>
			<div id="m3">			
					<h4><a href="buylist.do" id="button4">주문관리</a></h4>		
			</div>
		</div>	
<!-- 		<div class="grid3" id="container">content	</div> -->

		<div class="grid5">
      		<a href="index.do" id="main"> ▶go main</a>
      	</div>      

	</div>	
	<%@ include file="footer.jsp" %>
</body>
</html>