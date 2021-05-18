<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
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
<title>리뷰 수정 창</title>

<link rel='stylesheet' href='resources/luna/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='resources/luna/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/font-awesome.min.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>


</head>
<body>
	<form method="post" action="updaterboard.do">
	
	<h1>리뷰 수정</h1>
	
	<input type="hidden" name="rseq" value="${dto.rseq}">
	<table>
		
		<tr>
			<th>제목</th>
			<td><input type="text" name="rtitle" value="${dto.rtitle }"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="rcontent">${dto.rcontent}</textarea></td>
		</tr>
		<tr>
			<th>별점</th>
			<td><input type="number" name="starrank" value="${dto.starrank}"></td>
		</tr>
		<tr>
			<td colspan="3"><input type="submit" value="수정"></td>
		</tr>
		<%@ include file="footer.jsp" %>
	</table>
	</form>
</body>
</html>