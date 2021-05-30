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

#typediv {
	text-align:right;
}
</style>
</head>
<body>
<form>
<input type="hidden"  id="checked" />
<div id="typediv">
<select name="ptype" id="ptype" >
<option value="all" selected>전체</option>
<c:forEach items="${ptype }" var="i">
<option value="${i }" >${i }</option>
</c:forEach>

</select>
</div>
<table border="1" id="stockList">
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
		<div><input type="button" value="상품변경" id="check"><input type="button" value="상품추가" id="add"></div>
</form>

</body>
<script>
	$(document).ready(function(){
		
		$("#ptype").change(function(){
			$.ajax({
				url : "getListType.do",
				mehthod : "post",
				dataType : "json",
				data : { "ptype" : $("#ptype").val()},
				asnc:false,
				success : function(data) {
// 					alert(data["list"][0]["pcolor"]);

					var list = data["list"];
					var listhtml = '<tr><th><input type="checkbox" name="all"  onclick="allSel(this)"/></th><th>상품번호</th>';
					listhtml += '<th>상품명</th><th>상품재고수량</th><th>원가</th><th>카테고리번호</th><th>상품내용</th><th>판매가</th><th>상품게시글번호</th></tr>'
					for(var i=0; i<list.length; i++) {					
						listhtml += '<tr><td><input type="checkbox"  name="chk" value="'+list[i]["pnum"]+'" /></td>';
						listhtml += '<td>'+list[i]["pnum"]+'</td>';
						listhtml += '<td>'+list[i]["pname"]+'</td>';
						listhtml += '<td>'+list[i]["scount"]+'</td>';
						listhtml += '<td>'+list[i]["cost"]+'</td>';
						listhtml += '<td>'+list[i]["cnum"]+'</td>';
						listhtml += '<td>'+list[i]["pcontent"]+'</td>';
						listhtml += '<td>'+list[i]["price"]+'</td>';
						listhtml += '<td>'+list[i]["pseq"]+'</td></tr>';
					}				
					$("#stockList").html(listhtml);
				}
			});			
		});
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
					var stockTable = "";
					for(var i=0; i<list.length; i++) {					
						stockTable += '<tr>';
						stockTable += "<td><input type='checkbox' name='main' value='"+list[i]["pnum"]+"' onclick='checkOnlyOne(this)'></td><td><input type='hidden' name='pnum' value='"+list[i]["pnum"]+"'>"+list[i]["pnum"]+'</td>';
						stockTable += "<td>"+list[i]["pname"]+'</td>';
						stockTable += '<td>'+list[i]["scount"]+'</td>';
						stockTable += '<td>'+list[i]["cost"]+'</td>';
						stockTable += "<td><input type='hidden' name='cnum' value='"+list[i]["cnum"]+"'>"+list[i]['cnum']+"</td>";
						stockTable += '<td>'+list[i]["pcontent"]+'</td>';
						stockTable += '<td>'+list[i]["price"]+'</td>';
						stockTable += '<td><input type="button" name="delSto" value="제거"></td> '
						stockTable += '</tr>';
					}		
					$(opener.document).find("#stock").html(stockTable);
					window.close();
				}
			});	
			
		});
		$("#add").click(function(){
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
					var stockTable = "";
					for(var i=0; i<list.length; i++) {					
						stockTable += '<tr>';
						stockTable += "<td><input type='checkbox' name='main' value='"+list[i]["pnum"]+"' onclick='checkOnlyOne(this)'></td><td><input type='hidden' name='pnum' value='"+list[i]["pnum"]+"'>"+list[i]["pnum"]+'</td>';
						stockTable += "<td>"+list[i]["pname"]+'</td>';
						stockTable += '<td>'+list[i]["scount"]+'</td>';
						stockTable += '<td>'+list[i]["cost"]+'</td>';
						stockTable += "<td><input type='hidden' name='cnum' value='"+list[i]["cnum"]+"'>"+list[i]['cnum']+"</td>";
						stockTable += '<td>'+list[i]["pcontent"]+'</td>';
						stockTable += '<td>'+list[i]["price"]+'</td>';
						stockTable += '<td><input type="button" name="delSto" value="제거"></td> '
						stockTable += '</tr>';
					}		
					$(opener.document).find("#stock").append(stockTable);
					window.close();
				}
			});	
			
		});
	});
	
</script>
</html>