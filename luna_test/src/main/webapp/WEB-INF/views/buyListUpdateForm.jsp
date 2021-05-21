<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>구매 목록 수정</title>
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
	<p class="cls1">구매 목록 수정</p>
	<form method="post" action="buyListUpdate.do">
	<table>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id" value="${dto.id }"></td>
		</tr>
		<tr>
			<th>운송장번호</th>
			<td><input type="text" name="trackingNum" value="${dto.trackingNum }"></td>
		</tr>
		<tr>
			<th>배송현황</th>
			<td><input type="text" name="delStatus" value=${dto.delStatus }></td>
		</tr>
		<tr>
			<th>받는이</th>
			<td><input type="text" name="name" value=${dto.name }></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address" value=${dto.address }></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="phone" value="${dto.phone }"></td>
		</tr>
		<tr>
			<th>총금액</th>
			<td><input type="text" name="totalPrice" value=${dto.totalPrice }></td>
		</tr>

		<tr>
			<td colspan="2"><input type="submit" value="수정"></td>
		</tr>
		<%@ include file="footer.jsp" %>
	</table>
	</form>
</body>
</html>