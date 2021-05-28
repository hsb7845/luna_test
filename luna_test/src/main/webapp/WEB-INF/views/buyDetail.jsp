<%@page import="com.luna.board.dtos.BuyDetailDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	// core, BOM, DOM  3가지 영역으로 나눔
	function bankDisplay() {
	    var bank =  $("#selectbank option:selected").val();
	    switch(bank){
	       case '0':
	        $("input[name='bank']").val('은행 및 계좌번호가 표시됩니다.') ;
	         break;
	       case '1': 
	    	   $("input[name='bank']").val('(국민은행) 0XX-XX-XXXX-XXX');  
	         break;
	       case '2':
	    	   $("input[name='bank']").val('(기업은행) XXX-0XXXXX-0X-0XX');  
	         break;
	       case '3':
	    	   $("input[name='bank']").val('(우리은행) 1XX-XX-0XXXXXXX');  
	         break;
	       case '4':
	    	   $("input[name='bank']").val( '(농협) 0XXXXXX-0X-0XXXXX');   
	         break;
	    }
    
   		 return true;
	}
 	function allSel(val){
 		//val --> input객체--> Element객체 안에 구현 여러 속성들이 있음 그중에 tagName을 사용해봄
//  		alert(val.tagName);
//  		alert(val);
		// getElementById(), getElementsByTagName(), ...className ....등 
 		var chks=document.getElementsByName("chk");//[chk,chk,chk...]
 		for(var i=0;i<chks.length;i++){
 			chks[i].checked=val.checked;
 		}
//  		val.parentNode.style.backgroundColor="red";
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
	 	$("#buyDetailInsertForm").click(function(){
			location.href='buyDetailInsertForm.do'
		});
		$("#main").click(function(){
			location.href='.do'
		});
	})
</script>
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
	.detailT {
		text-align: center;
		font-size: 15px;
	}
	.detailM{
		text-align: center;
		font-size: 13px;
	}
	.detailD {
		padding-left: 30px; 
		padding-bottom:50px;
	}
	.detailD >span {
		padding-left: 30px; 
		padding-right: 30px;
	}
	
	.noBankbook{
		padding-left: 30px; 
	}
</style>


</head>

<body>

<%@ include file="header.jsp" %>
<form action="muldel.do">
<!-- <h1>구매현황</h1> -->
<h2>주문 상세정보</h2> 
<div  class="detailD">
	주문일자<span>
	<fmt:formatDate value="${list[0].blDTO.buyDate }" pattern="yyyy.MM.dd " />
	</span>  
	주문 번호<span>${list[0].blDTO.bseq }</span>
</div>
<table>
	<tr>
		<td>상품주문번호</td><td></td><td>상품정보</td><td>상품금액(수량)</td><td>진행상태</td>
	</tr>
	<c:forEach items="${list }" var="list">
		<tr>
			<td>${list.bdseq }</td>
			<td>${list.image.imgname }</td>
			<td><a href="pboarddetail.do?pseq=${list.pboard.pseq }">${list.pboard.ptitle }</a><br>${list.selOpt }</td>
			<td>${list.price }<br>(${list.pcount }개)</td>
			<td>${list.blDTO.delStatus}</td>
		</tr>
	</c:forEach>
</table>
<div class="noBankbook">
<select id="selectbank" onchange="bankDisplay()" >
    <option selected value=0>-선택하세요-
    <option value=1>국민은행
    <option value=2>기업은행
    <option value=3>우리은행
    <option value=4>농협
</select>
   	<br>
    <font color="#0000ff">*</font> 입  금  계  좌 :
    <input name="bank" type="text" size="50" maxlength="50"value=""  placeholder="은행 및 계좌번호가 표시됩니다." readonly>
    </div>
 	 <div style="float:middle"><h2>입금액 : ${list[0].blDTO.totalPrice}원</h2></div>
  	
  
</form>
<%@ include file="footer.jsp" %>
</body>
</html>