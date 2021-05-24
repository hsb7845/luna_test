<%@page import="com.luna.board.dtos.BuyListDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
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
	 	$("#buyListInsertForm").click(function(){
			location.href='buyListInsertForm.do'
		});
 	
 		$("#main").click(function(){
 			location.href='.do'
 		});
	})
</script>
<style>

	.cls1 {
	    font-size: 40px;
	    text-align: center;
	}
	.buylistT{
		text-align: center;
		font-size: 15px;
	}
	.buylistM{
		text-align: center;
		font-size: 13px;
	}
	.buylistD {
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
</head>
<%
	List<BuyListDTO> list= (List<BuyListDTO>) request.getAttribute("list");
%>
<body>
<%@ include file="header.jsp" %>
<!-- <h1>구매현황</h1> -->
<p class="cls1">구매현황</p>
<form action="buyListMulDel.do" method="post">
<table border="1">
	<col width="50px">
	<col width="50px">
	<col width="100px">
	<col width="300px">
	<col width="200px">
	<tr align="center" class="buylistT" >
		<th><input type="checkbox" name="all"  onclick="allSel(this)"/></th>
		<th>번호</th>
		<th>아이디</th>
		<th>배송현황</th>
		<th>운송장번호</th>
		<th>받는이</th>
		<th>주소</th>
		<th>전화번호</th>
		<th>총 금액</th>
		<th>구매날짜</th>
		
	</tr>
	<%
		if(list==null||list.size()==0){
			out.print("<tr><td colspan='10'>----작성된 글이 없습니다.</td></tr>");
			}else{
		for(int i=0;i<list.size();i++){
			BuyListDTO dto=list.get(i);
	%>
				<tr align="center" class="buylistM">
					<td><input type="checkbox" name="chk" value="<%=dto.getBseq()%>"/></td>
					<td><%=dto.getBseq()%></td>
					<td><%=dto.getId()%></td>
					<td><a href="buyListUpdateForm.do?bseq=<%=dto.getBseq() %>"><%=dto.getDelStatus()%></a> </td>
					<td><a href="https://www.epost.go.kr/" target="_blank"><%=dto.getTrackingNum()%></a></td>
					<td><%=dto.getName()%></td>
					<td><%=dto.getAddress()%></td>
					<td><%=dto.getPhone()%></td>
					<td id="m2">₩<%=dto.getTotalPrice()%>원</td>
					<td id="m2"><fmt:formatDate value="<%=dto.getBuyDate()%>" pattern="yyyy년MM월dd일 hh:mm:ss" /> </td>
				</tr>
	<%
			}
		}
	%>
	<tr>
		<td colspan="10" class="buylistD">
			<input type="button" value="구매 등록" id="buyListInsertForm" />
			<input type="button" value="메인" id="main">
			<input type="submit" value="삭제" />
			
<!-- 			<a href="buyListInsertForm.do">글쓰기</a> -->
<!-- 			<a href="index.do">메인</a> -->
		</td>
	</tr>	
</table>
</form>
<%@ include file="footer.jsp" %>
</body>
</html>