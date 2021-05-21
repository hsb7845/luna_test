<%@page import="com.luna.board.dtos.StockDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- tag라이브러리 : tag모음.. JAVA코드를 치환하는 역할. -->
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품재고리스트</title>
 <!-- Custom fonts for this template -->
<link
    href="vendor/fontawesome-free/css/all.min.css"
    rel="stylesheet"
    type="text/css">
<link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

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
	#m1{
		text-align: center;
	}
	#m2{
		text-align: center;
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

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
// core, BOM, DOM  3가지 영역으로 나눔
	function allSel(val){
		//val --> input객체--> Element객체 안에 구현 여러 속성들이 있음 그중에 tagName을 사용해봄
//		alert(val.tagName);
//		alert(val);
	// getElementById(), getElementsByTagName(), ...className ....등 
		var chks=document.getElementsByName("chk");//[chk,chk,chk...]
		for(var i=0;i<chks.length;i++){
			chks[i].checked=val.checked;
		}
//		val.parentNode.style.backgroundColor="red";
	}
	//form 태그에서 submit 이벤트가 발생하면 함수실행 
$(function(){
	$("form").submit(function(){
		var bool = true;
		var count=$(this).find("input[name=chk]:checked").length;
		if(count==0){
			alert('최소 하나이상 체크하세요!!!');
			bool= false;
		}else if(confirm("정말 삭제하시겠습니까?")==false){
			bool = false;
		}
		return bool
		
	});
	var chks = document.getElementsByName("chk");
 	for(var i=0;i<chks.length;i++){
 		chks[i].onclick =function(){//체크박스에서 클릭이벤트가 발생하면 함수를 실행해라
 			var checkdObjs = document.querySelectorAll("input[name=chk]:checked");
 			if(checkedObjs.length ==chks.length){
 				document.getElementsByName("all")[0].checked=true;
 			}else{
 				document.getElementsByName("all")[0].checked=false;
 			}
 		}
 	}
 	
		$("#stockInsertForm").click(function(){
//			location.href='${path}/shop/product/list.do'
		location.href='stockInsertForm.do'
		});
 	
 		$("#main").click(function(){
// 				location.href='${path}/shop/product/list.do'
 			location.href='.do'
 		});
 		
 		$("#stockForm").click(function(){
//				location.href='${path}/shop/product/list.do'
			location.href='stockForm.do'
		});

})
	
</script>
</head>
<%
	List<StockDTO> list= (List<StockDTO>) request.getAttribute("list");
%>
<body>
	<%@ include file="header.jsp" %>
<!-- <h1>상품재고현황</h1> -->

<p class="cls1">상품재고현황</p> 
<form action="muldelStock.do" method="post" >
<table  border="1" >
	<col width="50px">
	<col width="100px">
	<col width="300px">
	<col width="150px">
	<col width="100px">
	<col width="150px">
	<col width="500px">
	<col width="100px">
	<col width="150px">
	<tr>
		<th  id="m1"><input type="checkbox" name="all"  onclick="allSel(this)"/></th>
		<th  id="m1">상품번호</th>
		<th  id="m1">상품명</th>
		<th  id="m1">상품재고수량</th>
		<th  id="m1">원가</th>
		<th  id="m1">카테고리번호</th>
		<th  id="m1">상품내용</th>
		<th  id="m1">판매가</th>
		<th  id="m1">상품게시글번호</th>
	</tr>
	<%
		if(list==null||list.size()==0){
			out.print("<tr><td colspan='9'>----작성된 글이 없습니다.</td></tr>");
			}else{
		for(int i=0;i<list.size();i++){
			StockDTO dto=list.get(i);
	%>
				<tr align="center" >
					<td id="m2"><input type="checkbox" name="chk" value="<%=dto.getPnum()%>"/></td>
					<td id="m2"><%=dto.getPnum()%></td>
					<td id="m2"><a href="stockUpdateForm.do?pnum=<%=dto.getPnum()%>" ><%=dto.getPname()%></a></td>
					<td id="m2"><%=dto.getScount()%></td>
					<td id="m2"><%=dto.getCost()%></td>
					<td id="m2"><%=dto.getCnum()%></td>
					<td id="m2"><%=dto.getPcontent()%></td>
					<td id="m2"><%=dto.getPrice()%></td>					
					<td id="m2"><%=dto.getPseq() %></td>
				</tr>
	<%
			}
		}
	%>
</table>
<table>	
	<tr>
		<td colspan="9"  >
			<input type="button" value="상품입고" id="stockInsertForm">
			<input type="button" value="상품등록" id="stockForm">
			<input type="button" value="메인" id="main">
			<input type="submit" value="삭제" />
<!-- 			<a href="stockInsertForm.do">상품입고</a> -->			
<!-- 			<a href="stockForm.do">상품등록</a> -->			
<!-- 			<a href=".do">메인</a> -->
		</td>
	</tr>		
</table>
</form>
	<%@ include file="footer.jsp" %>
</body>
</html>