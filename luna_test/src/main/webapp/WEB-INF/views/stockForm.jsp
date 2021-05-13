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


// 컨트롤러에서 데이터 받기
var jsonData = JSON.parse('${getCnum}');
console.log(jsonData);

var cate1Arr = new Array();
var cate1Obj = new Object();

// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
for(var i = 0; i < jsonData.length; i++) {
 
 if(jsonData[i].type == "1") {
  cate1Obj = new Object();  //초기화
  cate1Obj.ptype = jsonData[i].ptype;
  cate1Obj.pcolor = jsonData[i].pcolor;
  cate1Obj.psize = jsonData[i].psize;
  cate1Arr.push(cate1Obj);
 }
}

// 1차 분류 셀렉트 박스에 데이터 삽입
var cate1Select = $("select.getCnum")

for(var i = 0; i < cate1Arr.length; i++) {
 cate1Select.append("<option value='" + cate1Arr[i].ptype + "'>"
      + cate1Arr[i].pcolor + cate1Arr[i].psize +"</option>"); 
}
	
// 2차 분류

$(document).on("change", "select.type", function(){

	 var cate2Arr = new Array();
	 var cate2Obj = new Object();
	 
	 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
	 for(var i = 0; i < jsonData.length; i++) {
	  
	  if(jsonData[i].level == "2") {
	   cate2Obj = new Object();  //초기화
	   cate2Obj.cateCode = jsonData[i].cateCode;
	   cate2Obj.cateName = jsonData[i].cateName;
	   cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
	   
	   cate2Arr.push(cate2Obj);
	  }
	 }
	 
	 var cate2Select = $("select.type");

	 for(var i = 0; i < cate2Arr.length; i++) {
	   cate2Select.append("<option value='" + cate2Arr[i].ptype + "'>"
	        + cate2Arr[i].pcolor +  cate2Arr[i].psize +"</option>");
	 } 
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
<form id="form" name="form" method="post" action="insertStock.do" autocomplete="off">
<div> 
	<p>type
	<select name="type" id="type" onchange="handleOnChange(this)">		
		<option value="" >전체</option>
		<option value="1">반지</option>
		<option value="2">귀걸이</option>
		<option value="3">목걸이</option>				
	</select>		
	color
	<select name="color" id="color">
		<option value="">전체</option>
		<option value="1_1">실버반지</option>
		<option value="1_2">골드반지</option>
		<option value="1_3">로즈골드반지</option>
		<option value="2_1">실버귀걸이</option>
		<option value="2_2">골드귀걸이</option>
		<option value="2_3">로즈골드귀걸이</option>
		<option value="2_4">진주귀걸이</option>
		<option value="3_1">실버목걸이</option>
		<option value="3_1">골드목걸이</option>
		<option value="3_1">로즈골드목걸이</option>
	</select>
	size
	<select name="size" id="size">
		<option value="">전체</option>
		<option value="9">one size</option>
		<option value="10">11호</option>
		<option value="11">13호</option>
	</select>	
	</p>
	<div id='result'></div>
	<P>상품명  <input type="text" name="pname" id="pname" ></P>
	<P>상품입고수량  <input type="text" name="scount" id="scount" ></P>
	<P>상품원가  <input type="text" name="productCost" id="productCost" ></P>
	<P>상품내용  
		<textarea clos="30" rows="5" name="pcontent" id="pcontent" ></textarea></P>
	<P>상품가격  <input type="text" name="price" id="price"></P>	
		
	<input type="button" value="등록" id="addBtn">
	<input type="button" value="목록" id="listBtn">
</div>
</form>
</body>
</html>