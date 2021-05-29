<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value='resources/js/jquery-3.6.0.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
			var selectedOptNum = 0;
			var selectedOpt = "";
			var pseq = $("input[name='pseq']").val();
			var price = $("#price").val();
			var ptitle = $("#ptitle").val();
			var selOpt = {};
			selOpt = {
				"ptitle" : ptitle,
				"pseq" : pseq
			};
		$("img[name='imgsub']").click(function(){
			var src = $(this).attr("src");
			$(".imgmain").attr("src",src);
		})
			
			
			
	$("input[name='buy']").click(function() {
			//alert(selectedOptNum);
			var id = $("input[name='id']")
					.val();
			if (selectedOptNum == 1) {
				var amount = $(
						"input[name='amount"
								+ 1 + "']")
						.val();
				var optname = $("#selectedOpt1")
						.text();
				price = $("input[name='price1']")
						.val();
				selOpt[1] = {
					"amount" : amount,
					"optName" : optname,
					"price" : price
				};
			}else if(selectedOptNum==0){
				alert("옵션을 선택해주세요!");
				return false;
			}else {
				for (var i = 1; i <= selectedOptNum; i++) {
					var amount = $("input[name='amount"+ i + "']").val();
					var optname = $("#selectedOpt" + i).text();
					price = $("input[name='price"+ i + "']").val();
					selOpt[i] = {"amount" : amount,"optName" : optname,"price" : price};
				}
			}
			selOpt = JSON.stringify(selOpt);
			if (id == "") {
				var newForm = document.createElement('form');
				newForm.name = "newForm";
				newForm.method = 'post';
				newForm.action = 'loginForm.do';
				var input1 = document.createElement('input');
				var input2 = document.createElement('input');
				var input3 = document.createElement('input');
				var input4 = document.createElement('input');
				input1.setAttribute("type","hidden");
				input1.setAttribute("name","returnUrl");
				input1.setAttribute("value","buyform");
				input2.setAttribute("type","hidden");
				input2.setAttribute("name","pseq");
				input2.setAttribute("value",pseq);
				input3.setAttribute("type","hidden");
				input3.setAttribute("name","selOpt");
				input3.setAttribute("value",selOpt);
				input4.setAttribute("type","hidden");
				input4.setAttribute("name","selOptNum");
				input4.setAttribute("value",selectedOptNum);
				newForm.appendChild(input1);
				newForm.appendChild(input2);
				newForm.appendChild(input3);
				newForm.appendChild(input4);
				document.body.appendChild(newForm);
				newForm.submit();
				//location.href = "loginForm.do?returnUrl=buyform&pseq="+pseq+"&selOpt="+selOpt;
			} else {
				var newForm = document.createElement('form');
				newForm.name = "newForm";
				newForm.method = 'post';
				newForm.action = 'buyform.do';
				var input2 = document.createElement('input');
				var input3 = document.createElement('input');
				var input4 = document.createElement('input');
				input2.setAttribute("type","hidden");
				input2.setAttribute("name","pseq");
				input2.setAttribute("value",pseq);
				input3.setAttribute("type","hidden");
				input3.setAttribute("name","selOpt");
				input3.setAttribute("value",selOpt);
				input4.setAttribute("type","hidden");
				input4.setAttribute("name","selOptNum");
				input4.setAttribute("value",selectedOptNum);
				newForm.appendChild(input2);
				newForm.appendChild(input3);
				newForm.appendChild(input4);
				document.body.appendChild(newForm);
				newForm.submit();
			}
		});
		$("#cart").click(function() {
			var id = $("input[name='id']").val();
			var pseq = $("input[name='pseq']").val();
			selOpt = {};
			if (selectedOptNum == 1) {
				var amount = $("input[name='amount"+ 1 + "']").val();
				var optname = $("#selectedOpt1").text();
				price = $("input[name='price1']").val();
				selOpt[1] = {"amount" : amount,"optName" : optname,"price" : price	};
			} else {
				for (var i = 1; i <= selectedOptNum; i++) {
					var amount = $("input[name='amount"+ i + "']").val();
					var optname = $("#selectedOpt" + i).text();
					price = $("input[name='price"+ i + "']").val();
					selOpt[i] = {"amount" : amount,"optName" : optname,"price" : price};
				}
			}
			selOpt = JSON.stringify(selOpt);
			//alert(selOpt);
			if (id == "") {
				location.href = "loginForm.do?returnUrl=pboard&pseq="+ pseq;
			} else {
				$.ajax({
					url : "insertCart.do",
					mehthod : "post",
					dataType : "json",
					data : {
						"id" : id,
						"pseq" : pseq,
						"selOpt" : selOpt,
						"selOptNum" : selectedOptNum
					},
					async : false,
					success : function(
							data) {

					}
				});
				var layer = document.getElementById("popup_layer");
				layer.style.visibility = "visible"; //반대는 hidden 
			}
		});

		$("input[name='selOpt']").click(function() {
			//alert(selectedOptNum);
			
			var optNum = $('input[name="optNum"]').val();
			if (optNum == 1) {
				var necc = $("#opt1").attr("name");
				var optval = $("#opt1 option:selected").val();
				var optname = $("#opt1 option:selected").attr("value2");
				price = parseInt(price)+ parseInt(optval);
				for(var i=1;i<=selectedOptNum;i++){
					var selOpt = $("#selectedOpt"+i).text();
					if(optname==selOpt){
						if(confirm("이미 같은 제품을 담았습니다.\r\n수량을 추가하시겠습니까?")){
							var amount = $("input[name='amount"+i+"']").val();
							amount++;
							$("input[name='amount"+i+"']").val(amount);
							change(i);
							return false;
						}else{
							return false;
						}
					}
				}
				if(selectedOptNum==3){
					alert("옵션은 최대 3개만 선택할수있습니다!");
					return false;
				}
				selectedOptNum++;
				if (optval == " "&& necc == "true") {
					alert("필수 옵션을 선택해주세요!!");
					return;
				} else if (optval != " ") {
					selectedOpt = optname;
					var innerText = "";
					innerText += "<tr id='selectedopt"+selectedOptNum+"'><td><span>"+ ptitle+ "</span><br><span id='selectedOpt"+selectedOptNum+"'>"+ selectedOpt+ "</span></td>";
					innerText += '<td><input type="text" name="amount'+selectedOptNum+'" value="1" readonly size="3"><input type="button" value=" + " onclick="add('
							+ selectedOptNum
							+ ');"><input type="button" value=" - " onclick="del('
							+ selectedOptNum
							+ ');"></td>';
					innerText += "<td><input type='hidden' name='sumPrice' id='sum"+selectedOptNum+"'value='"+price+"'/><input type='hidden' name='price"+selectedOptNum+"' value="+price+"><span id='sumText"+selectedOptNum+"'>"
							+ price
							+ "</span></td></tr>"
					$("#optContainer").append(
							innerText);
					changeTotalPrice();
				}
			} else if (optNum > 1) {
				var necc = "";
				var optval = "";
				var optname = "";
				price = $("#price").val();
				for (var i = 1; i <= optNum; i++) {
					necc = $('#opt' + i).attr('name');
					optval = $("#opt"+ i+ " option:selected").val();
					if (optval == " "&& necc == "true") {
						alert("필수 옵션을 선택해주세요!!");
						return;
					}
					optname += $("#opt"+ i+ " option:selected").attr("value2")+ "/";
					price = parseInt(price)+ parseInt(optval);
				}
				for(var i=1;i<=selectedOptNum;i++){
					var selOpt = $("#selectedOpt"+i).text();
					if(optname==selOpt){
						if(confirm("이미 같은 제품을 담았습니다.\r\n수량을 추가하시겠습니까?")){
							var amount = $("input[name='amount"+i+"']").val();
							amount++;
							$("input[name='amount"+i+"']").val(amount);
							change(i);
							return false;
						}else{
							return false;
						}
					}
				}
				if(selectedOptNum==3){
					alert("옵션은 최대 3개만 선택할수있습니다!");
					return false;
				}
				selectedOptNum++;
				selectedOpt = optname;
				var innerText = "";
				innerText += "<tr id='selectedopt"+selectedOptNum+"'><td><span>"
						+ ptitle
						+ "</span><br><span id='selectedOpt"+selectedOptNum+"'>"
						+ selectedOpt
						+ "</span></td>";
				innerText += '<td><input type="text" name="amount'+selectedOptNum+'" value="1" size="3" readonly><input type="button" value=" + " onclick="add('
						+ selectedOptNum
						+ ');"><input type="button" value=" - " onclick="del('
						+ selectedOptNum
						+ ');"></td>';
				innerText += "<td><input type='hidden' name='sumPrice' id='sum"+selectedOptNum+"'value='"+price+"'/><input type='hidden' name='price"+selectedOptNum+"' value="+price+"><span id='sumText"+selectedOptNum+"'>"
						+ price
						+ "</span></td></tr>"
				$("#optContainer").append(innerText);
				changeTotalPrice();
			}
		});
		$("input[name='ir']").click(function(){
			var id = $("input[name='id']").val();
			//alert(id);
			if(id==""){
				location.href = "loginForm.do?returnUrl=pboard&pseq="+pseq;
			}else{	
				$.ajax({
					url : "searchId.do",
					mehthod : "post",
					dataType : "json",
					data : {"pseq":pseq,"id":id},
					async : false,
					success : function(data) {
						pseq = data;
						if(pseq==0){
							alert("구매한 상품만 리뷰를 작성할수있습니다!");
						}else{
							goPage("insertrboardform.do?id="+id+"&pseq="+pseq);
						}
					}
			})
		//	alert("여기옴?3");
			}
		})
		
		
		
		
		$("input[name='iq']").click(function(){
			var id = $("input[name='id']").val();
			if(id==""){
				location.href = "loginForm.do?returnUrl=pboard&pseq="+pseq;
			}else{	
				goPage("insertqboardform.do?id="+id+"&pseq="+pseq);
			}
		})
});

	var sell_price;
	var amount;
	function goPage(url){
		location.href = url;
	}
	
	function add(i) {
		var amount = $("input[name='amount" + i + "']").val();
		amount++;
		$("input[name='amount" + i + "']").val(amount);
		change(i);
	}
	function del(i) {
		var amount = $("input[name='amount" + i + "']").val();
		if (amount == 1) {
		} else {
			amount--;
			$("input[name='amount" + i + "']").val(amount);
			change(i);
		}
	}

	function change(i) {
		var amount = $("input[name='amount" + i + "']").val();
		var price = $("input[name='price" + i + "']").val();
		var sum = amount * price;
		$("#sum" + i).val(sum)
		$('#sumText' + i).text(sum);
		changeTotalPrice();
	}

	function changeTotalPrice() {
		var totalPrice = 0;
		$("input[name=sumPrice]").each(function(index, item) {
			totalPrice += parseInt($(this).val());
		});
		$("#totalprice").text(totalPrice + "원");
	}

	function goCart() {
		var id = $("input[name='id']").val();
		location.href = "cart.do?id=" + id;
	}
	function showDQ(qseq){
		$(".detailQ").each(function(){
			$(this).hide();
		});
		if($("#detailQ"+qseq).css("display")=='none'){
			$("#detailQ"+qseq).show();
		}else{
			$("#detailQ"+qseq).hide();
		}
	}
	
	function showDR(rseq){
		$(".detailR").each(function(){
			$(this).hide();
		});
		if($("#detailR"+rseq).css("display")=='none'){
			$("#detailR"+rseq).show();
		}else{
			$("#detailR"+rseq).hide();
		}
		
	}
	
	
	
</script>
<style>
.option {
	padding :0;
	margin : 0;
}
.rank {
	 position: relative;
	 rigth : 400px;
}
.graph { 
        position: relative; /* IE is dumb */
        width: 200px; 
        border: 1px solid #B1D632; 
        padding: 2px; 
		font-size:11px;
		font-family:tahoma;
		margin-bottom:3px;
    }
    .graph .bar { 
        display: block;
        position: relative;
        background: #B1D632; 
        text-align: center; 
        color: #333; 
        height: 2em; 
        line-height: 2em;            
    }
    .graph .bar span { left: 1em; }

.imgmain {
	width: 400px;
	height: 530px;
	float: left;
	margin-right: 100px;
}

.imgsub {
	width: 50px;
	height: 50px;
}

#popup_layer {
	position: absolute;
	border: double;
	top: 50%;
	left: 50%;
	width: 500px;
	height: 400px;
	z-index: 1;
	background-color: white;
	visibility: hidden;
	align: center;
}

.box {
position:relative;
margin-left : 400px;
}
.footer {
	position:absolute;
	bottom:0;
}


.content {
position:relative;
}

#optContainer> tr>td{
padding : 5px;
}

#totalprice {
	font-size : 25pt;
}
.infoArea > table {
	width : 500px;
}


.qseq:hover{
		text-decoration : underline;
		cursor:pointer;
	}
	
.rseq:hover{
		text-decoration : underline;
		cursor:pointer;
}



</style>

<%@ include file="header.jsp" %>

</head>
<body>
	<form action="buyform.do" method="get">
	<input type="hidden" id="ptitle" value="${map.pboard.ptitle}" />
		<div class="box">
			<input type="hidden" name="id" value="${sessionScope.id }">
			<!-- 대표 이미지 -->
			<c:if test="${map.img != null }">
				<img  name="imgMain" class="imgmain" src="upload/img_dummy1.jpg">
			</c:if>

			<div>
				<!-- 서브 이미지 -->
				<c:forEach items="${map.img }" var="i">
					<img class="imgsub"  name="imgsub" src="upload/img_dummy1.jpg">
				</c:forEach>
			</div>
			<input type="hidden" name="pseq" value="${map.pboard.pseq }" />
			<div class="infoArea">
				<h2>${map.pboard.ptitle}</h2>
				<table >
					<tr>
					<th>판매가</th>
					<td><strong><fmt:formatNumber value="${map.pboard.stock.price }" pattern="#,###" />원</strong>
					<input type="hidden" value="${map.pboard.stock.price }" id="price"></td>
				<c:if test="${map.option !=null }">
					<c:forEach items="${map.option }" var="i" varStatus="j">
					<tr class="option">
					<th>${i.otitle }</th>
					<td>
				<select name="${i.necessary }" id="opt${j.count}">
						<c:if test="${i.necessary =='true' }">
							<option value=" ">-[필수]옵션을 선택해주세요.-</option>
						</c:if>
						<c:if test="${i.necessary =='false' }">
							<b>-[선택]추가를 원하시면 선택하세요.-</b>
						</c:if>
							
							<option value="" disabled="disabled">-----------</option>
							<c:forEach items="${i.oconArr }" var="k" varStatus="status">
								<option value="${i.ovalArr[status.index]}" value2="${k }">${k }</option>
							</c:forEach>
						</select>
						</td>
						</tr>
						<c:set var="optNum" value="${j.count }" scope="request" />
					</c:forEach>
					</c:if>
					<tr>
					<td colspan="2">
					<input type="hidden" name="optNum" value="${optNum }" />
					<input type="button" name="selOpt" value="옵션선택">
					</td>
					</tr>
					</table>
					<table>
					<thead>
						<tr>
						<th>선택상품</th>
						<th>수량</th>
						<th>가격</th>
					</thead>
					<tbody id="optContainer">
					
					</tbody>
					<tfoot>
					<tr>
					<th>총 금액 :</th><td colspan="2" id="totalprice"></td>
					</tr>
					<tr>
					<td colspan="3"><input type="button" value="장바구니" id="cart"> <input type="button" name="buy" value="바로구매"></td>
					</tr>
					</table>
			</div>
		
			<div class="content">
			<h1>상품내용</h1>
			${map.pboard.pcontent }
			</div>
			<br>
	</form>
	<div class="foot">
			<!-- 유사 제품 -->


		</div>
		<div class="rank">
			<!-- 평점 -->
			<br>
			<h2>평균 평점 : ${map.avgRank }점</h2>
	<c:forEach items="${map.rankAvg }" var="i" varStatus="sta">
		<div class="graph">
   			<span>${i.key}점</span><strong class="bar" style="width: ${i.value}%;"> ${i.value }<c:if test="${i.value!=0 }">%</c:if></strong>
		</div>
	</c:forEach>
		</div>
	</div>	
		<br><br>
	<div>
		<!-- 리뷰 -->
		<table border="1">
			<tr>
				<th colspan="3">상품후기</th>
			</tr>
			<tr>
			<tr>
				<%-- 					<c:if test="${map.rboard.img !=null }"> --%>
				<!-- 						<th>사진</th> -->
				<%-- 					</c:if> --%>
				<th>제목</th>
				<th>작성자</th>
				<th>평점</th>

			</tr>
			<c:if test="${map.rboard=='[]'}">
				<tr>
					<td colspan="3">작성된 리뷰가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${map.rboard!=null }">
				<c:forEach items="${map.rboard }" var="i">
					<c:if test="${i.par_rseq ==0}">
					<tr>
						<td ><p class="rseq" onclick="showDR(${i.rseq})">${i.rtitle }</p></td>
						<td>${i.id }</td>
						<%-- 							<c:if test="${i.img !=null }"> --%>
						<!-- 							<td><img class="imgmain" src="upload/img_dummy1.jpg"></td> -->
						<%-- 							</c:if> --%>
						<td><c:forEach begin="1" end="5" step="1" var="j" >
						<c:if test="${i.starrank<j }">
						<span>☆</span>
						</c:if>
						<c:if test="${i.starrank>=j }">
						<span>★</span>
						</c:if>
						</c:forEach></td>
					</tr>
					<tr id="detailR${i.rseq }" style="display:none;" class="detailR">
						<td colspan="3"><div>${i.rcontent }</div>
						<c:forEach var="j" items="${map.rboard }">
						
						<c:if test="${j.par_rseq==i.rseq }">
						<hr>
						<div><p><b>${j.id }</b></p>
						<hr>
							${j.rcontent }
						</div>
						</c:if>
						</c:forEach></td>
					</tr>
					</c:if>
				</c:forEach>
				<tr>
					<td colspan="3"><input type="button" name="ir" value="리뷰작성하기"></td>
				</tr>
			</c:if>

		</table>
	</div>
	<div>
		<!-- 문의 -->
		<table border="1">
			<tr>
				<th colspan="2">Q&A</th>
			</tr>
			<tr>
				<th>제목</th>
				<th>작성자</th>	
			</tr>
			<c:if test="${map.qboard=='[]' }">
				<tr>
					<td colspan="2">작성된 Q&A가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${map.qboard!=null }">
				<c:forEach items="${map.qboard }" var="i" varStatus="status">
					<c:if test="${i.par_qseq ==0 }">
					<tr>
						<td class="qseq" onclick="showDQ(${i.qseq})">${i.qtitle }</td>
						<td>${i.id }</td>
						
					</tr>
						<tr id="detailQ${i.qseq }" style="display:none;" class="detailQ">
						<td colspan="3"><div>${i.qcontent }</div>
						<c:forEach var="j" items="${map.qboard }">
						
						<c:if test="${j.par_qseq==i.qseq }">
						<hr>
						<div><p><b>${j.id }</b></p>
						<hr>
							${j.qcontent }
						</div>
						</c:if>
						</c:forEach></td>
					</tr>
					</c:if>
					
				</c:forEach>
			</c:if>
			<tr>
				<td colspan="2"><input type="button" name="iq" value="문의하기"></td>
			</tr>
		</table>
	</div>
	<div id="popup_layer">
		<div class="header">
			<h3>장바구니</h3>
			<a onclick="$('#popup_layer').hide()"><img src="upload/close.png"></a>
		</div>
		<div class="content">
			<img src="upload/cart.png">
			<p>장바구니에 상품이 정상적으로 담겼습니다.</p>
		</div>
		<div>
			<button onclick="goCart()">장바구니 이동</button>
			<button onclick="$('#popup_layer').hide()">쇼핑 계속하기</button>
		</div>
	</div>
</body>
</html>