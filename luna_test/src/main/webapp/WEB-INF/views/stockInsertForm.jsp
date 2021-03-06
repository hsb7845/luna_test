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
<link rel='stylesheet' href='resources/luna/style.css' type='text/css' media='all'/>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Oswald:400,500,700%7CRoboto:400,500,700%7CHerr+Von+Muellerhoff:400,500,700%7CQuattrocento+Sans:400,500,700' type='text/css' media='all'/>
<link rel='stylesheet' href='resources/luna/css/easy-responsive-shortcodes.css' type='text/css' media='all'/>


<style type="text/css">

	#m1 {
		text-align: right;
	}

	#m2 {
		padding: 5px 550px;
	}

</style>
<title>상품 추가하기</title>
</head>
<body>
<form method="post" action="insertStock.do">
	<table>		
		<tr>
			<th id="m1">상품명</th>
			<td><input type="text" name="pname"></td>
		</tr>
		<tr>
			<th id="m1">상품입고수량</th>
			<td><input type="text" name="scount"></td>
		</tr>
		<tr>
			<th id="m1">원가</th>
			<td><input type="text" name="cost"></td>
		</tr>
		
		<tr>
			<th id="m1">상품내용</th>
			<td><input type="text" name="pcontent"></td>
		</tr>
		<tr>
			<th id="m1">판매가</th>
			<td><input type="text" name="price"></td>
		</tr>
	</table>
	<table>		
		<tr>
			<td id="m2" >
				<input type="submit" value="추가">
				<input type="reset"" value="다시입력">		
				<input type="button" value="뒤로 가기" onClick="location.href='http://localhost:8888/board/stock.do'">
			</td>
		</tr>
	</table>
</form>	
</body>
</html>