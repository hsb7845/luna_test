<%@page import="com.luna.board.dtos.RBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
    
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
<meta http-equiv="X-UA-Compatible" content="ie=edge" />

<meta name="viewport" content="width=device-width, initial-scale=1">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 상세보기</title>

<link rel='stylesheet' href='resources/luna/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='resources/luna/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>

<style>
	.cls1 {
		font-size: 40px;
		text-align: center;
	}
	.rating .rate_radio + label {
	    position: relative;
	    display: inline-block;
	    margin-left: -4px;
	    z-index: 10;
	    width: 60px;
	    height: 60px;
	    background-image: url('resources/img/starrate.png');
	    background-repeat: no-repeat;
	    background-size: 60px 60px;
	    cursor: pointer;
	    background-color: #f0f0f0;
	}
	.rating .rate_radio:checked + label {
	    background-color: lightcoral;
	}
	
	
	/* 레이아웃 외곽 너비 400px 제한*/
	.wrap{
	    max-width: 480px;
	    margin: 0 auto; /* 화면 가운데로 */
	    background-color: #fff;
	    height: 100%;
	    padding: 20px;
	    box-sizing: border-box;
	
	}
	.reviewform textarea{
	    width: 100%;
	    padding: 10px;
	    box-sizing: border-box;
	}
	.rating .rate_radio {
	    position: relative;
	    display: inline-block;
	    z-index: 20;
	    opacity: 0.001;
	    width: 60px;
	    height: 60px;
	    background-color: lightcoral;
	    cursor: pointer;
	    vertical-align: top;
	    display: none;
	}
	.rating .rate_radio + label {
	    position: relative;
	    display: inline-block;
	    margin-left: -4px;
	    z-index: 10;
	    width: 60px;
	    height: 60px;
	    background-image: url('resources/img/starrate.png');
	    background-repeat: no-repeat;
	    background-size: 60px 60px;
	    cursor: pointer;
	    background-color: #f0f0f0;
	}
	.rating .rate_radio:checked + label {
	    background-color: lightcoral;
	}
	
	.warning_msg {
	    display: none;
	    position: relative;
	    text-align: center;
	    background: #ffffff;
	    line-height: 26px;
	    width: 100%;
	    color: red;
	    padding: 10px;
	    box-sizing: border-box;
	    border: 1px solid #e0e0e0;
	}
	
	
	#searching input {
	    width: 50px;
	    height: 50px;
	    padding: 20px;
	    box-sizing: border-box;
	    border-radius: 25px;
	    border: 0;
	    background: #eee;
	    font-size: 17px;
	    transition: all 0.5s;
	}
	
	#searching input:hover {
	    background: #ccc;
	}

	#searching input:focus {
	    outline: none;
	}

	.image_container {
		size: 50px;
	}
</style>
<script src="<c:url value='resources/js/jquery-3.6.0.min.js'/>"></script>
<script>
$(function(){
	$(".replyWriteBtn").on("click", function(){
		//버튼 클릭 했는데 안될때는 alert 으로 확인 해보면 편해요 
		//alert("여기 오니?");
		var formObj = $("form[name='replyForm']"); // <- 여기  새로만드는게 아니라 원래 있는거 가져오는 코드 인데 name 설정 안해서 작동안함 
		formObj.submit();
	});
})

</script>

</head>
<body>
<%@ include file="header.jsp" %>

<div class="star-box">
  <span class="star star_left"></span>
  <span class="star star_right"></span>

  <span class="star star_left"></span>
  <span class="star star_right"></span>

  <span class="star star_left"></span>
  <span class="star star_right"></span>

 <span class="star star_left"></span>
 <span class="star star_right"></span>

 <span class="star star_left"></span>
 <span class="star star_right"></span>
</div>

	<div class="wrap">



	<form method="post" name="replyForm" action="insertrreply.do">
	<input type="hidden" name="rseq" value="${dto.rseq}">
	<input type="hidden" name="par_rseq" value="${dto.par_rseq}">
	
	
	<p class="cls1">리뷰 상세보기</p>	
	<table>
	
		<tr>
			<th>제목</th>
			<td><input type="text" name="rtitle" value="${dto.rtitle }" readonly></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="rcontent" readonly>${dto.rcontent}</textarea></td>
		</tr>
		<tr>
			<th>별점</th>
			<td><input type="number" name="starrank" value="${dto.starrank}" readonly></td>
		</tr>
	</table>
	<table>
		<p2>댓글 달기</p2>
		<tr>
			<th>제목</th>
			<td><input type="text" name="rtitle"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="rcontent"></textarea></td>
		</tr>	
		
		<tr>
			<td colspan="3">
<!-- 				<input type="submit" value="수정"> -->
            	<input type="button" value="뒤로 가기" onClick="location.href='http://localhost:8888/board/rboard.do'">
            	<input type="button" value="답글 쓰기" class="replyWriteBtn">
			</td>
		</tr>
	
		
</table>
</form>
		

	
	
	
<!-- 	<input type="hidden" name="rate" id="rate" value="5" /> -->
<!--         <div class="review_rating"> -->
<!--             <div class="rating"> -->
<!--                 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
<!--                 <input type="checkbox" name="starrank" id="rating1" value="1" class="rate_radio" title="1점"> -->
<!--                 <label for="rating1"></label> -->
<!--                 <input type="checkbox" name="starrank" id="rating2" value="2" class="rate_radio" title="2점"> -->
<!--                 <label for="rating2"></label> -->
<!--                 <input type="checkbox" name="starrank" id="rating3" value="3" class="rate_radio" title="3점" > -->
<!--                 <label for="rating3"></label> -->
<!--                 <input type="checkbox" name="starrank" id="rating4" value="4" class="rate_radio" title="4점"> -->
<!--                 <label for="rating4"></label> -->
<!--                 <input type="checkbox" name="starrank" id="rating5" value="5" class="rate_radio" title="5점"> -->
<!--                 <label for="rating5"></label> -->
<!--             </div> -->
<!--         </div> -->
	</div>
	<%@ include file="footer.jsp" %>
	</form>
	
</body>
</html>
</html>