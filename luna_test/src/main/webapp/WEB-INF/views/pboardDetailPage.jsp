<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				selectedOptNum++;
				var necc = $("#opt1").attr("name");
				var optval = $("#opt1 option:selected").val();
				var optname = $("#opt1 option:selected").attr("value2");
				price = parseInt(price)+ parseInt(optval)
				if (optval == " "&& necc == "true") {
					alert("필수 옵션을 선택해주세요!!");
					return;
				} else if (optval != " ") {
					selectedOpt = optname;
					var innerText = "";
					innerText += "<tr id='selectedopt"+selectedOptNum+"'><td><span>"+ ptitle+ "</span><br><span id='selectedOpt"+selectedOptNum+"'>"+ selectedOpt+ "</span></td>";
					innerText += '<td><input type="text" name="amount'+selectedOptNum+'" value="1" size="3"><input type="button" value=" + " onclick="add('
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
				selectedOptNum++;
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
				selectedOpt = optname;
				var innerText = "";
				innerText += "<tr id='selectedopt"+selectedOptNum+"'><td><span>"
						+ ptitle
						+ "</span><br><span id='selectedOpt"+selectedOptNum+"'>"
						+ selectedOpt
						+ "</span></td>";
				innerText += '<td><input type="text" name="amount'+selectedOptNum+'" value="1" size="3"><input type="button" value=" + " onclick="add('
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
});

	var sell_price;
	var amount;
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
</script>
<style>
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
}
.footer {
	position:absolute;
	bottom:0;
}

</style>

<%@ include file="header.jsp" %>

</head>
<body>

	<form action="buyform.do" method="get">
		<div class="box">
			<input type="hidden" name="id" value="${sessionScope.id }">
			<!-- 대표 이미지 -->
			<c:if test="${map.img != null }">
				<img class="imgmain" src="upload/img_dummy1.jpg">
			</c:if>

			<div>
				<!-- 서브 이미지 -->
				<c:forEach items="${map.img }" var="i">
					<img class="imgsub" src="upload/img_dummy1.jpg">
				</c:forEach>
			</div>
			<input type="hidden" name="pseq" value="${map.pboard.pseq }" />
		<div>
			<div>
				<h3>${map.pboard.ptitle}</h3>
				<input type="hidden" id="ptitle" value="${map.pboard.ptitle}" />
				<h4>판매가 : ${map.pboard.stock.price }원</h4>
				<input type="hidden" value="${map.pboard.stock.price }" id="price">
			</div>

			<c:if test="${map.option !=null }">
				<c:forEach items="${map.option }" var="i" varStatus="j">
					<c:if test="${i.necessary =='true' }">
						<b>필수</b>
					</c:if>
					<c:if test="${i.necessary =='false' }">
						<b>선택</b>
					</c:if>
				&nbsp;&nbsp; ${i.otitle }
				<select name="${i.necessary }" id="opt${j.count}">
						<option value=" ">선택</option>
						<option value="" disabled="disabled">-----------</option>
						<c:forEach items="${i.oconArr }" var="k" varStatus="status">
							<option value="${i.ovalArr[status.index]}" value2="${k }">${k }</option>
						</c:forEach>
					</select>
					<br>
					<c:set var="optNum" value="${j.count }" scope="request" />

				</c:forEach>
				<input type="hidden" name="optNum" value="${optNum }" />
				<input type="button" name="selOpt" value="옵션선택">

				<p>선택상품 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 수량
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 가격
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
				<div id="optContainer"></div>

				<p>총 금액 :</p>
		</div>
		<div id="totalprice"></div>

		</c:if>



		<div>
			<input type="button" value="장바구니" id="cart"> <input
				type="button" name="buy" value="바로구매">
		</div>

		<div>${map.pboard.pcontent }</div>
		<br>
	</form>
	<div class="foot">
			<!-- 유사 제품 -->


		</div>
		<div>
			<!-- 평점 -->
			<br>
			<p>${map.avgRank }
			<ul class="ratio">
				<li><div style="height: 30%">
						<em>30%</em>
					</div></li>
				<li><div style="height: 40%">
						<em>40%</em>
					</div></li>
				<li><div style="height: 100%">
						<em>50%</em>
					</div></li>
				<li><div style="height: 30%">
						<em>30%</em>
					</div></li>
				<li><div style="height: 40%">
						<em>40%</em>
					</div></li>
			</ul>
			<span>1점</span> <span>2점</span> <span>3점</span> <span>4점</span> <span>5점</span>
		</div>
	</div>
	
	<div>
		<!-- 리뷰 -->
		<table border="1">
			<tr>
				<th colspan="3">리뷰</th>
			</tr>
			<tr>
			<tr>
				<th>아이디</th>
				<%-- 					<c:if test="${map.rboard.img !=null }"> --%>
				<!-- 						<th>사진</th> -->
				<%-- 					</c:if> --%>
				<th>제목</th>
				<th>평점</th>

			</tr>
			<c:if test="${map.rboard=='[]'}">
				<tr>
					<td colspan="3">작성된 리뷰가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${map.rboard!=null }">

				<c:forEach items="${map.rboard }" var="i">
					<tr>
						<td>${i.id }</td>
						<%-- 							<c:if test="${i.img !=null }"> --%>
						<!-- 							<td><img class="imgmain" src="upload/img_dummy1.jpg"></td> -->
						<%-- 							</c:if> --%>
						<td>${i.rtitle }</td>
						<td>${i.starrank }</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="3"><a
						href="insertReview.do?pseq=${map.pboard.pseq }">리뷰작성하기</a></td>
				</tr>
			</c:if>

		</table>
	</div>
	<div>
		<!-- 문의 -->
		<table border="1">
			<tr>
				<th colspan="3">Q&A</th>
			</tr>
			<tr>
				<th>아이디</th>
				<th>제목</th>
				<th>내용</th>
			</tr>
			<c:if test="${map.qboard=='[]' }">
				<tr>
					<td colspan="3">작성된 Q&A가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${map.qboard!=null }">

				<c:forEach items="${map.qboard }" var="i">
					<tr>
						<td>${i.id }</td>

						<td>${i.qtitle }</td>
					</tr>
				</c:forEach>
			</c:if>
			<tr>
				<td colspan="3"><a
					href="insertQuestion.do?pseq=${map.pboard.pseq }">문의작성하기</a></td>
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