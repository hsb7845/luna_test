<%@page import="com.luna.board.dtos.QBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
<meta http-equiv="X-UA-Compatible" content="ie=edge" />

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>문의 입력 창</title>

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
</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	$("#main").click(function(){
		location.href='.do'
	});
})
</script>
</head>
<body>
<%@ include file="header.jsp" %>
	<form method="post" action="insertqboard.do">
	<input type="hidden" value="${id }" name="id">
	<input type="hidden" value="${pseq }" name="pseq">
	<p class="cls1">문의 사항 작성</p>
	<table>
		<tr>
			<th>제목</th>
			<td><input type="text" name="qtitle" required="required"
			placeholder="제목을 입력하세요" onfocus="this.placeholder=''" 
			onblur="this.placeholder='제목을 입력하세요'" name="search"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="5" name="qcontent"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="등록">
				<input type="button" value="메인" id="main">
			</td>
		</tr>
		<%@ include file="footer.jsp" %>
	</table>
	</form>
</body>
</html>