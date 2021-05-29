<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	isELIgnored="false"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	$("input[name='update']").click(function(){
		var bseq = $("input[name='bseq']").val();
		var trackingNum = $("input[name='trackingNum']").val();
		var delStatus = $("#delStatus option:selected").val();
		
		$.ajax({
			url : "buyListUpdate.do",
			mehthod : "post",
			dataType : "json",
			traditional : true,
			data : { "bseq" :bseq,"trackingNum":trackingNum,"delStatus":delStatus},
			asnc:false,
			success : function(data) {
				opener.parent.location.reload();
				window.close();
			}
		});
	});
})
</script>



</head>
<body>
	<p class="cls1">구매 목록 수정</p>
	<form method="post" action="buyListUpdate.do">
	<input type="hidden" name="bseq" value=${dto.bseq }>
	<table>
		<tr>
			<th>운송장번호</th>
			<td><input type="text" name="trackingNum" value=${dto.trackingNum }></td>
		</tr>
		<tr>
			<th>배송현황</th>
			<td>
				<select id="delStatus"> 
					<option value="입금전"<c:if test="${dto.delStatus == '입금전' }"> selected</c:if>>입금전</option>
					<option value="물품준비중"<c:if test="${dto.delStatus == '물품준비중' }"> selected</c:if>>물품준비중</option>
	   			 	<option value="배송중" <c:if test="${dto.delStatus == '배송중' }"> selected</c:if>>배송중</option>
	   			 	<option value="구매완료" <c:if test="${dto.delStatus == '구매완료' }"> selected</c:if>>구매완료</option>
	   			 	<option value="취소" <c:if test="${dto.delStatus == '취소' }"> selected</c:if>>취소</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="수정" name="update"></td>
		</tr>
	</table>
	</form>
</body>
</html>