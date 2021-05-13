<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<script src="<c:url value='resources/js/jquery-3.6.0.min.js'/>"></script>

<!-- 관련 참고 사이트 -->
<!-- https://doublesprogramming.tistory.com/140 -->
<!-- https://kuzuro.blogspot.com/2018/10/7.html -->
<!-- https://start0.tistory.com/223 -->

<script>
	$(document).ready(function() {
		// 상품 등록 유효성검사
		$("#addBtn").click(function() {
			var pname=$("#pname").val();
			var scount=$("#scount").val();
			var cost=$("#cost").val();			
			var pcontent=$("#pcontent").val();
			var price=$("#price").val();
			
			if(pname == "") {
				alert("상품명을 입력해주세요");
				$("#pname").focus();
			} else if(scount == "") {
				alert("상품입고수량을 입력해주세요");
				$("#scount").focus();
			} else if(cost == "") {
				alert("상품 원가를 입력해주세요");
				$("#cost").focus();	
			} else if(pcontent == "") {
				alert("상품 설명을 입력해주세요");
				$("#pcontent").focus();
			} else if(price == "") {
				alert("상품 판매가격을 입력해주세요");
				$("#price").focus();
			}else{
				var form = document.getElementById("form");
				form.submit();
			}
			// 상품 정보 전송	
// 			document.form.action = "${path}/shop/product/insert.do";
//			document.form.action = "stockInsert.do";
//			document.form.submit();
			
		});
		// 상품 목록이동s
		$("#listBtn").click(function(){
// 			location.href='${path}/shop/product/list.do'
			location.href='stock.do'
		});
	}); 
// 	var t=document.getElementById("type");
// 	var type = t.options[t.selectedIndex].value;


// function handleOnChange(e) {
//   // 선택된 데이터의 텍스트값 가져오기
//   const text = e.options[e.selectedIndex].text;
  
//   console.log(e.options);
  
//   // 선택한 텍스트 출력
//   document.getElementById('result').innerText
// //    = text;
// }	

//1단계 . type의 값이 바뀐다.
//2단계 . 그 타입이 가지고 있는 색상을 DB에서 가져온다. -> ajax 처리
//3단계 . 그 색상을 option에 추가 

$("#type").change(function(){
	$.ajax({
		url : "getColor",
		mehthod : "post",
		dataType : "json",
		data : { "type" : $("#type").val},
		asnc:false,
		success : function(data) {
			
		}
	})
})

	
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
<form id="form" name="form" method="post" action="insertStock.do" autocomplete="off">
<div> 
	
	<p>type
	<select name="type" id="type" >		
		<option value="" >전체</option>
		<option value="반지">반지</option>
		<option value="귀걸이">귀걸이</option>
		<option value="목걸이">목걸이</option>				
	</select>		
	color
	<select name="color" id="color">
		<option value="">전체</option>
		<option value="골드">골드</option>
		<option value="로즈골드">로즈골드</option>
		<option value="실버">실버</option>
		
	</select>
	size
	<select name="size" id="size">
		<option value="">전체</option>
	</select>	
	</p>
	<div id='result'></div>
	<P>상품명  <input type="text" name="pname" id="pname" ></P>
	<P>상품입고수량  <input type="text" name="scount" id="scount" ></P>
	<P>상품원가  <input type="text" name="productCost" id="productCost" ></P>
	<P>상품내용  
		<textarea cols="30" rows="5" name="pcontent" id="pcontent" ></textarea></P>
	<P>상품가격  <input type="text" name="price" id="price"></P>	
		
	<input type="button" value="등록" id="addBtn">
	<input type="button" value="목록" id="listBtn">
</div>
</form>
</body>
</html>