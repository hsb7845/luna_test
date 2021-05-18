<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value='resources/js/jquery-3.6.0.min.js'/>"></script>
<style>
#selected {
  margin : 20px; 
  padding : 30px;
  border : 1px solid black;
  border-radius : 5px;
}
</style>
</head>
<body>
<form>
<input type="hidden"  id="checked" />
<table border="1">
	<tr>
		<th><input type="checkbox" name="all"  onclick="allSel(this)"/></th>
		<th>상품번호</th>
		<th>상품명</th>
		<th>상품재고수량</th>
		<th>원가</th>
		<th>카테고리번호</th>
		<th>상품내용</th>
		<th>판매가</th>
		<th>상품게시글번호</th>
	</tr>
	
		<c:forEach items="${list}" var="i">
			<tr>
				<td><input type="checkbox"  name="chk" value="${i.pnum }" /></td>
				<td>${i.pnum }</td>
				<td>${i.pname }</td>
				<td>${i.scount }</td>
				<td>${i.cost }</td>
				<td>${i.cnum }</td>
				<td>${i.pcontent }</td>
				<td>${i.price }</td>
				<td>${i.pseq }</td>
			</tr>
		</c:forEach>
</table>

		<div id="selected">
			
		</div>
		<div><input type="button" value="확인" id="check"></div>
</form>

</body>
<script>
	$(document).ready(function(){
		$("#check").click(function(){
			var chk_arr = [];
			$("input[name='chk']:checked").each(function(){
				var chk =$(this).val();
				chk_arr.push(chk);
			})
			$.ajax({
				url : "getselectedstock.do",
				mehthod : "post",
				dataType : "json",
				traditional : true,
				data : { "chk_arr" :chk_arr},
				asnc:false,
				success : function(data) {
					var list = data["list"];
					var stockTable = "<table border='1'><tr><th>상품번호</th><th>상품명</th><th>상품재고수량</th><th>원가</th><th>카테고리번호</th><th>상품내용</th><th>판매가</th></tr>";
					for(var i=0; i<list.length; i++) {					
						stockTable += '<tr>';
						stockTable += "<td><input type='hidden' name='pnum' value='"+list[i]["pnum"]+"'>"+list[i]["pnum"]+'</td>';
						stockTable += "<td>"+list[i]["pname"]+'</td>';
						stockTable += '<td>'+list[i]["scount"]+'</td>';
						stockTable += '<td>'+list[i]["cost"]+'</td>';
						stockTable += "<td><input type='hidden' name='cnum' value='"+list[i]["cnum"]+"'>"+list[i]['cnum']+"</td>";
						stockTable += '<td>'+list[i]["pcontent"]+'</td>';
						stockTable += '<td>'+list[i]["price"]+'</td>';
						stockTable += '</tr>';
					}		
					stockTable += '</table>';
					$(opener.document).find("#stock").html(stockTable);
					window.close();
				}
			});	
			
		});
	});
	
</script>
</html>