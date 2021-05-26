<%@page import="com.luna.board.dtos.StockDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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



<title>상품등록</title>
<script src="<c:url value='resources/js/jquery-3.6.0.min.js'/>"></script>

<!-- 관련 참고 사이트 -->
<!-- https://doublesprogramming.tistory.com/140 -->
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
		// 상품 목록이동
		$("#listBtn").click(function(){
// 			location.href='${path}/shop/product/list.do'
			location.href='stock.do'
		});
		
		// 다시입력
		$("#resetBtn").click(function(){
// 			location.href='${path}/shop/product/list.do'
			location.href='stockForm.do'
		});
		
		//1단계 . type의 값이 바뀐다.
		//2단계 . 그 타입이 가지고 있는 색상을 DB에서 가져온다. -> ajax 처리
		//3단계 . 그 색상을 option에 추가 
		$("#ptype").change(function(){
			$.ajax({
				url : "getColor.do",
				mehthod : "post",
				dataType : "json",
				data : { "ptype" : $("#ptype").val()},
				asnc:false,
				success : function(data) {
// 					alert(data["list"][0]["pcolor"]);

					var list = data["list"];
					var colorOption = "<option value=''>전체</option>";
					for(var i=0; i<list.length; i++) {					
						colorOption += '<option value="'+list[i]["pcolor"]+'"> '+list[i]["pcolor"]+'</option>'
					}				
					$("#pcolor").html(colorOption);
				}
			});			
		});
		$("#ptype").change(function(){
			$.ajax({
				url : "getSize.do",
				mehthod : "post",
				dataType : "json",
				data : { "ptype" : $("#ptype").val()},
				asnc:false,
				success : function(data) {
					var list = data["list"];
					var sizeOption = "<option value=''>전체</option>";
					for(var i=0; i<list.length; i++) {					
						sizeOption += '<option value="'+list[i]["psize"]+'"> '+list[i]["psize"]+'</option>'
					}				
					$("#psize").html(sizeOption);
				}
			});			
		});		
	}); 
</script>
<style>
	textarea {
		width: 250px;
		height: 100px;
		resize:none; /* 크기고정 */
	}
	.cls1 {
	    font-size: 40px;
	    text-align: center;
	}

	body,button,input{
		font-family: 'Gyeonggi_Tittle_OTF_FontInstaller';
		font-weight: bold;		
	}
	
	div#stockForm{
 	text-align: center;  		
	}

</style>
</head>
<%
	List<String> list = (List<String>)request.getAttribute("list");
%>

<body>

<!-- <h1>상품등록</h1> -->
<p class="cls1">상품등록</p> 
<form id="form" name="form" method="post" action="insertStock.do" autocomplete="off">
<div id="stockForm"> 
	
	<p>type
	<select name="ptype" id="ptype" >		
		<option value="" >전체</option>
		<%
			if(list==null||list.size()==0){
				out.print("<tr><td colspan='3'>----작성된 글이 없습니다.</td></tr>");
				}else{
			for(int i=0;i<list.size();i++){			
		%>
		<option value="<%=list.get(i) %>"><%=list.get(i)%></option>
			<%
			}
		}
	%>
		
<!-- 		<option value="반지">반지</option> -->
<!-- 		<option value="귀걸이">귀걸이</option> -->
<!-- 		<option value="목걸이">목걸이</option>				 -->
	</select>		
	color
	<select name="pcolor" id="pcolor" >
		<option value="">전체</option>
	</select>
	size
	<select name="psize" id="psize">
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
	<input type="button" value="다시입력" id="resetBtn">
</div>
</form>
<%@ include file="footer.jsp" %>
</body>
</html>