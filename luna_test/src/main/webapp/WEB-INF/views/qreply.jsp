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
<title>문의 상세보기</title>

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
	/* 레이아웃 외곽 너비 400px 제한*/
	.wrap{
	    max-width: 480px;
	    margin: 0 auto; /* 화면 가운데로 */
	    background-color: #fff;
	    height: 100%;
	    padding: 20px;
	    box-sizing: border-box;
	
	}
	
	
</style>
<script src="<c:url value='resources/js/jquery-3.6.0.min.js'/>"></script>
<script>
$(function(){
	$(".replyWriteBtn").on("click", function(){
		//버튼 클릭 했는데 안될때는 alert 으로 확인 해보면 편해요 
		//alert("여기 오니?");
		var formObj = $("form[name='qReplyForm']"); // <- 여기  새로만드는게 아니라 원래 있는거 가져오는 코드 인데 name 설정 안해서 작동안함 
		formObj.submit();
	});
})

</script>

</head>
<body>
<%@ include file="header.jsp" %>


	<div class="wrap">



	<form method="post" name="qReplyForm" action="insertqreply.do">
	<input type="hidden" name="qseq" value="${dto.qseq}">
	<input type="hidden" name="par_qseq" value="${dto.par_qseq}">
	
	
	<p class="cls1">리뷰 상세보기</p>	
	<table>
	
		<tr>
			<th>제목</th>
			<td><input type="text" name="par_qtitle" value="${dto.qtitle }" readonly></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="par_qcontent" readonly>${dto.qcontent}</textarea></td>
		</tr>
	</table>
	<table>
		<p2>댓글 달기</p2>
		<tr>
			<th>제목</th>
			<td><input type="text" name="qtitle"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="qcontent"></textarea></td>
		</tr>	
		
		<tr>
			<td colspan="2">
<!-- 				<input type="submit" value="수정"> -->
            	<input type="button" value="뒤로 가기" onClick="location.href='http://localhost:8888/board/qboard.do'">
            	<input type="button" value="답글 쓰기" class="replyWriteBtn">
			</td>
		</tr>
	
		
</table>


	
	

	</div>
	<%@ include file="footer.jsp" %>
	</form>
	
</body>
</html>
</html>