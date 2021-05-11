<%@page import="com.luna.board.dtos.CouponDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
    
<!-- tag라이브러리 : tag모음.. JAVA코드를 치환하는 역할. -->
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      
<%
   	request.setCharacterEncoding("utf-8");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰함 </title>
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
<style>
.cls1 {
    font-size: 40px;
    text-align: center;
}
.cls2 {
    font-size: 20px;
    text-align: center;
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
	})
	
</script>
</head>
<%
	List<CouponDTO> list = (List<CouponDTO>) request.getAttribute("list");
%>
<body>

<div class="container" id="badge">
     <a class="entypo-bell"></a>
</div>
<p class="cls1">쿠폰함</p> 
<form action="muldelCoupon.do" method="post">
<!-- <table border="1"> -->
<%-- 	<col width="50px"> --%>
<%-- 	<col width="150px"> --%>
<%-- 	<col width="150px"> --%>
<%-- 	<col width="150px"> --%>
<%-- 	<col width="150px"> --%>
<!-- 	<tr> -->
<!-- 		<th><input type="checkbox" name="all"  onclick="allSel(this)"/></th> -->
<!-- 		<th>쿠폰번호</th> -->
<!-- 		<th>쿠폰내용</th> -->
<!-- 		<th>할인금액</th> -->
<!-- 		<th>아이디</th> -->
<!-- 	</tr> -->
<table	
	border="1"
	class="table table-bordered dataTable"
	id="dataTable"
	width="100%"
	cellspacing="0"
	role="grid"
	aria-describedby="dataTable_info"
	style="width: 100%;">
	<tr role="row">
	     <th
	         class="sorting_asc"
	         tabindex="0"
	         aria-controls="dataTable"
	         rowspan="1"
	         colspan="1"
	         aria-sort="ascending"
	         aria-label="Name: activate to sort column descending"
	         style="width: 10px;">
	         <input type="checkbox" name="all"  onclick="allSel(this)"/></th>	    
	     <th
	         class="sorting"
	         tabindex="0"
	         aria-controls="dataTable"
	         rowspan="1"
	         colspan="1"
	         aria-label="Office: activate to sort column ascending"
	         style="width: 50px;">쿠폰번호</th>
	       <th
	         class="sorting"
	         tabindex="0"
	         aria-controls="dataTable"
	         rowspan="1"
	         colspan="1"
	         aria-label="Position: activate to sort column ascending"
	         style="width: 150px;">쿠폰내용</th>
	     <th
	         class="sorting"
	         tabindex="0"
	         aria-controls="dataTable"
	         rowspan="1"
	         colspan="1"
	         aria-label="Age: activate to sort column ascending"
	         style="width: 31px;">할인금액</th>
	     <th
	         class="sorting"
	         tabindex="0"
	         aria-controls="dataTable"
	         rowspan="1"
	         colspan="1"
	         aria-label="Start date: activate to sort column ascending"
	         style="width: 50px;">아이디</th>                                      
	 </tr>
	
	<%
		if(list==null||list.size()==0){
			out.print("<tr><td colspan='5'>----작성된 글이 없습니다.</td></tr>");
			} else {
		for(int i=0;i<list.size();i++){
			CouponDTO dto=list.get(i);
			
			
			
	%>
		<tr align="center">
				<td><input type="checkbox" name="chk" value="<%=dto.getCseq()%>"/></td>
				<td><%=dto.getCseq()%></td>
				<td><a href="couponUpdateForm.do?cseq=<%=dto.getCseq()%>" ><%=dto.getCcontent()%></a></td>
				<td><%=dto.getDiscount()%></td>
				<td><%=dto.getId()%></td>
			</tr>
	<%
			}
		}
	%>
	<tr>
		<td colspan="5">
			<a href="couponInsertForm.do" >쿠폰추가</a>
			<a href=".do">메인</a>
			<input type="submit" value="삭제" />
		</td>
	</tr>
</table>
</form>

<script>



</script>
</body>
</html>