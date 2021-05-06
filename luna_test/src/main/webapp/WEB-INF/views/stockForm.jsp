<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<script>
	$(document).ready(function() {
		// 상품 등록 유효성검사
		$("#addBtn").click(function() {
			var productName=$("#productName").val();
			var productPrice=$("#productPrice").val();
			var productDesc=$("#productDesc").val();
			var productPhoto=$("#productPhoto").val();
			
			if(productName == "") {
				alert("상품명을 입력해주세요");
				productName.focuse();
			} else if(productPrice == "") {
				alert("상품 가격을 입력해주세요");
				productPrice.focuse();
			} else if(productDesc == "") {
				alert("상품 설명을 입력해주세요");
				productDesc.focuse();
			} else if(productPhoto == "") {
				alert("상품 사진을 입력해주세요");
				productPhoto.focuse();	
			}				
			// 상품 정보 전송	
			document.form.action = "${path}/shop/product/insert.do";
			document.form.submit();
		});
		// 상품 목록이동
		$("#listBtn").click(function(){
			location.href='${path}/shop/product/list.do'
		});
	}); 	
</script>
<style>
	textarea {
		width: 250px;
		height: 100px;
		resize:none; /* 크기고정 */
}
</style>
</head>
<body>
<h1>상품등록</h1>
<form id="form" name="form" enctype="multipart/form-data" method="post">
<div> 
	<p>1차분류
	<select>		
		<option>전체</option>
		<option>반지</option>
		<option>귀걸이</option>
		<option>목걸이</option>		
	</select>
	2차분류
	<select>
		<option>전체</option>
		<option>실버반지</option>
		<option>골드반지</option>
		<option>로즈골드반지</option>
		<option>실버귀걸이</option>
		<option>골드귀걸이</option>
		<option>로즈골드귀걸이</option>
		<option>진주귀걸이</option>
		<option>실버목걸이</option>
		<option>골드목걸이</option>
		<option>로즈골드목걸이</option>
	</select>
	</p>
	<P>상품명  <input type="text" name="productName" id="productName" ></P>
	<P>상품가격  <input type="text" name="productPrice" id="productPrice"></P>
	<P>상품수량  <input type="text"></P>	
	<p>상품이미지
		<input type="file" name="productPhoto" id="productPhoto"></p>
	<P>상품소개  
		<textarea clos="30" rows="5" name="productDesc" id="productDesc"></textarea></P>
	<input type="button" value="등록" id="addBtn">
	<input type="button" value="목록" id="listBtn">
</div>
</form>
</body>
</html>