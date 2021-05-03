<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인페이지</title>
<style type="text/css">
   .wrap{
      display : grid;
      grid-template-rows: 50px 500px 50px;
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
    .grid3 {
        grid-column-start: 2; grid-column-end: 3;
        background: white; 
    }
    .grid4 { 
        grid-column-start: 1; grid-column-end: 3;
        background: white; 
    }
    
    * {
       margin: 5px;
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
      <div class="grid1">header</div>
      <div class="grid2"><h2>관리자페이지</h2>
         <div id="m1">
            <h5><a href="#">재고관리</a></h5>
            <h5><a href="#">회원관리</a></h5>
            <h5><a href="#">게시판관리</a></h5>
         </div>
         <div id="m2">
            <div><h6><a href="#">귀걸이</a></h6></div>
            <div><h6><a href="#">목걸이</a></h6></div>
            <div><h6><a href="#">기타</a></h6></div>
            <div><h6><a href="#">리뷰</a></h6></div>
            <div><h6><a href="#">문의사항</a></h6></div>
            <div><h6><a href="#">이벤트</a></h6></div>
         </div>
		<div id="m3">
			<section>
				<h5><a href="#">주문관리</a></h5>
			</section>
		</div>
		</div>	
		<div class="grid3">content</div>
		<div class="grid4">footer</div>
	</div>	
</body>
</html>