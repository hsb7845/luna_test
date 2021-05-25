<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel='stylesheet' href='resources/luna/css/woocommerce-layout.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/woocommerce-smallscreen.css' type='text/css' media='only screen and (max-width: 768px)'/>
<link rel='stylesheet' href='resources/luna/css/woocommerce.css' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/font-awesome.min.css' type='text/css' media='all'/>
<!-- <link rel='stylesheet' href='resources/luna/style.css' type='text/css' media='all'/> -->
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>

<style type="text/css">
	@font-face {
	    font-family: 'Gyeonggi_Tittle_OTF_FontInstaller';
	    font-weight: normal;
	    font-style: normal;
	}
	body,button,input{
		font-family: 'Gyeonggi_Tittle_OTF_FontInstaller';
		font-weight: bold;
	}
	.cls1 {
	    font-size: 40px;
	    text-align: center;
	}
	
	.detail {
		text-align: center;
	}
	
	.detailD {
		font-size: 12px;
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
</style>
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<!-- 	<h1>구매 추가</h1> -->
	<p class="cls1">구매 추가</p> 
	<form method="post" action="buyDetailInsert.do">
	<table class="detail">
		<tr>
			<th scope="row">상품번호</th>
			<td><input type="text" name="pnum"></td>
		</tr>
		<tr>
			<th scope="row">수량</th>
			<td><input type="text" name="pcount"></td>
		</tr>
		<tr>
			<th scope="row">구매번호</th>
			<td><input type="text" name="bseq"></td>
		</tr>
		<tr>
			<td colspan="3" class="detailD">
				<input type="submit" value="작성">
				<input type="button" value="뒤로 가기" onClick="location.href='http://localhost:8888/board/buydetail.do'">
			</td>
		</tr>
		<%@ include file="footer.jsp" %>
	</table>
	</form>
</body>
</html>