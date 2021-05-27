<%@page import="com.luna.board.dtos.CartDTO"%>
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


<title>장바구니 리스트 </title>
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
	
	.cartT {
		font-size: 15px;
	}
	.cartM {
		font-size: 13px;
	}

	#cartD {
		font-size: 10px;
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
	List<CartDTO> list = (List<CartDTO>) request.getAttribute("list");
%>
<body>
<%@ include file="header.jsp" %>
<p class="cls1">장바구니리스트</p> 
<form action="muldelCart.do" method="post">

<table border="1" cellpadding="2" cellspacing="0" bordercolor="#000000" style="border-collapse:collapse">
	<col width="50px">
	<col width="150px">
	<col width="150px">
	<col width="150px">
	<col width="150px">
	<tr align="center" class="cartT" >
		<th><input type="checkbox" name="all"  onclick="allSel(this)"/></th>
		<th>장바구니번호</th>
		<th>아이디</th>
		<th>상품게시글번호</th>
		<th>상품수량</th>
	</tr>
	
	<%
		if(list==null||list.size()==0){
			out.print("<tr><td colspan='5'>----작성된 글이 없습니다.</td></tr>");
			} else {
		for(int i=0;i<list.size();i++){
			CartDTO dto=list.get(i);
	%>
		<tr align="center" class="cartM">
				<td><input type="checkbox" name="chk" value="<%=dto.getSeq()%>"/></td>
				<td><%=dto.getSeq()%></td>
				<td><%=dto.getId()%></a></td>
				<td><%=dto.getPseq()%></td>
				<td><%=dto.getPcount()%></td>
			</tr>
	<%
			}
		}
	%>
	<tr>
		<td colspan="5" id="cartD" >
			<a href="buyFormByCart.do">전체 항목 구매</a>
			<a href="buyFormByCart.do">선택 항목 구매</a>
			<a href=".do">메인</a>
			<input type="submit" value="삭제" />
		</td>
	</tr>
</table>
</form>
<%@ include file="footer.jsp" %>
</body>
</html>