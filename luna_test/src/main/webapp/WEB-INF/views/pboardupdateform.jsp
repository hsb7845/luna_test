<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="<c:url value='resources/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='resources/bootstrap-4.4.1-dist/js/bootstrap.min.js'/>"></script>
<script type="text/javascript">
var chk_arr =[];
function setThumbnail(event) {
	for (var image of event.target.files) { 
		var reader = new FileReader(); 
		reader.onload = function(event) {
			var img = document.createElement("img"); 
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img); 
			};
		reader.readAsDataURL(image); 
	} 
}

	function addcon(tbody){
		 var tbodyId = document.getElementById("opt"+tbody);
		 var row = tbodyId.insertRow( tbodyId.rows.length ); // 하단에 추가
		 var cell1 = row.insertCell(0);
		 var cell2 = row.insertCell(1);
		 var cell3 = row.insertCell(2);
		 var cell4 = row.insertCell(3);
		 var cell5 = row.insertCell(4);
		 cell1.innerHTML = "항목";
		 cell2.innerHTML = "<input type='text' name='ocontent"+tbody+"'>";
		 cell3.innerHTML = "상품추가비용";
		 cell4.innerHTML = "<input type='text' name='ovalue"+tbody+"'>";
		 cell5.innerHTML = "<input type='button' onclick='delcon(\""+tbody+"\")' value='항목제거'>";
	}
	
	function delcon(table){
		var tableData = document.getElementById("opt"+table);
		if(tableData.rows.length>=2){
			tableData.deleteRow(tableData.rows.length-1);
		}
		
	}
	
	function checkOnlyOne(element) {
		  
		  const checkboxes 
		      = document.getElementsByName("main");
		  
		  checkboxes.forEach((cb) => {
		    cb.checked = false;
		  })
		  
		  element.checked = true;
		}
	
	
	function necc(){
		
	}

$(document).ready(function(){
	var optNum = $("input[name='optNum']").val();
	var jsondata = {};
	$("#addStock").click(function(){
		window.open("selectstock.do","팝업","width = 1200, height = 1200, top = 100, left = 200, location = no");
	});
	
	
	
	var $input = $("#stock");
	$("#stcok").on('input',function(){
		console.log("input text changed!"+$(this).val());
	});
	
	$("#addOpt").click(function(){		
		optNum++;
		var table = "<table border='1' class='option' ><thead><tr><th>옵션명&nbsp;<input type='text' id='otitle"+optNum+"' name='otitle' ></th><th colspan='3'>필수<input type='checkbox' value='필수' onclick='necc("+optNum+")' id='necessary"+optNum+"' name='necessary"+optNum+"'></th><th>옵션제거</th></tr></thead>";
		table += "<tbody id='opt"+optNum+"'><tr><th>항목<input type='button' onclick='addcon("+optNum+")' value='+'></th>";
		table += "<td><input type='text' name='ocontent"+optNum+"' ></td><th>상품추가비용</th><td><input type='text' name='ovalue"+optNum+"' ></td>";
		table += "<td><input type='button' onclick='delcon("+optNum+")' value='항목제거'></td></tr></tbody></table>"
		$("#opt").append(table);	
	})

	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "pcontent",
		sSkinURI: "resources/smarteditor2-2.8.2.3/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
	});

	 $(".praBtn").on("click", function() {
		 	var mainNum = 0;
			$("input[name='main']").each(function(){
				if($(this).is(":checked")){
					mainNum = $(this).val();
				}
			});
	});
	
	 
	 
	$(".btnn").on("click", function() {
		var pnum_arr = [];
		$("input[name='pnum']").each(function(){
			var pnum = $(this).val();
			pnum_arr.push(pnum);
		});
		var mainNum = 0;
		$("input[name='main']").each(function(){
			if($(this).is(":checked")){
				mainNum = $(this).val();
				//alert(mainNum);
			}
		});
		
		oEditors.getById["pcontent"].exec("UPDATE_CONTENTS_FIELD", []);
		var value = document.getElementById("pcontent").value;
		if(optNum>1){
			for(var i=1;i<=optNum;i++){
				var ocontent = "";
				var ovalue = "";
				var otitle = $("#otitle"+i).val();
				var oseq = $("#oseq"+i).val();
				if($("input[name ='necessary"+i+"']").prop("checked")){
					necessary = "true";
					//alert(necessary);
				}else{
					necessary = "false";
					//alert(necessary);
				}
				 $("input[name=ocontent"+i+"]").each(function(index, item){
					 if(index==0){
						 ocontent = $(this).val();
					  }else{
						 ocontent += "/"+$(this).val();
					  }
				   });
				 $("input[name=ovalue"+i+"]").each(function(index, item){	
					  if(index==0){
						 ovalue = $(this).val();
					  }else{
						  ovalue += "/"+$(this).val();
					  }
				   });
				jsondata["opt"+i] = {"otitle":otitle,"ocontent":ocontent,"ovalue":ovalue,"necessary":necessary,"oseq":oseq};
			} 	
		}else if(optNum==1){
			var otitle =  $("#otitle"+1).val();
			var ocontent ="";
			var necessary = "";
			var oseq = $("#oseq"+1).val();
			if($("input[name=necessary"+1).is(":checked")){
				necessary = "true";
				//alert(necessary );
			}else{
				necessary = "false";
				//alert(necessary );
			}
			 $("input[name=ocontent"+1+"]").each(function(index, item){
				  if(index==0){
					 ocontent = $(this).val();
				  }else{
					  ocontent += "/"+$(this).val();
				  }
			   });
			 $("input[name=ovalue"+1+"]").each(function(index, item){
				  if(index==0){
					 ovalue = $(this).val();
				  }else{
					  ovalue += "/"+$(this).val();
				  }
			   });
			 jsondata["opt"+1] = {"otitle":otitle,"ocontent":ocontent,"ovalue":ovalue,"necessary":necessary,"oseq":oseq};
		}
		var realObject = JSON.stringify(jsondata);
 		$.ajax({
 			url : "updatepboard.do",
 			mehthod : "post",
 			dataType : "json", 
 			traditional : true,
 			data : { "realObject" :realObject,"optNum" :optNum,"ptitle":$("#ptitle").val(),"pcontent":$("#pcontent").val(),"pnum_arr":pnum_arr,"mainNum":mainNum,"pseq":$("#pseq").val()},
 			asnc:false,
			success : function(data) {
				alert("글수정에성공하였습니다!");
			}
 		});	
 		var formData = new FormData();
 		var inputFile = $("#imgname");
 		if($("#imgname").val()==""){
 			
 			location.href = "pboard.do";
 		}else{
 			$("#update").submit();
 		}
 		
	});
})
</script>
<style type="text/css" > 

			.option{
				text-align :left;
			}
			#content {
			    background-color: white;
			}
			.container-fluid {
			    background-color: white;
			}
			@font-face {
			    font-family: 'Gyeonggi_Tittle_OTF_FontInstaller';
			    font-weight: normal;
			    font-style: normal;
			}
			
			body,
			button,
			input {
			    font-family: 'Gyeonggi_Tittle_OTF_FontInstaller';
			    font-weight: bold;
			}
			button {
			    color: #666666;
			    font-family: inherit;
			    font-size: 14px;
			    line-height: 1.8;
			    word-wrap: break-word;
			    -webkit-hyphens: auto;
			    -moz-hyphens: auto;
			    -ms-hyphens: auto;
			    hyphens: auto;
			
			    font-size: 100%;
			    /* Corrects font size not being inherited in all browsers */
			    margin: 0;
			    /* Addresses margins set differently in IE6/7,F3/4,S5,Chrome */
			    vertical-align: baseline;
			    /* Improves appearance and consistency in all browsers */
			}
			button,
			input[type="button"],
			input[type="reset"],
			input[type="submit"] {
			    border: 1px solid #ccc;
			    border-radius: 0;
			    background: #ccc;
			    color: #fff;
			    cursor: pointer;
			    /* Improves usability and consistency of cursor style between image-type 'input' and others */
			    -webkit-appearance: button;
			    /* Corrects inability to style clickable 'input' types in iOS */
			    padding: 3px 15px;
			}
			button:hover,
			input[type="button"]:hover,
			input[type="reset"]:hover,
			input[type="submit"]:hover {
			    opacity: 0.6;
			}
		#btnimg{
			width : 25px;
			height : 25px;
		}
	
		#image_container > img {
			width: 460px;
			height : 460px;
		}
		div#content{
			text-align: left;
		}
	</style>

</head>
<body>
<form method="post"  action="updateImg.do" id="update" enctype="multipart/form-data">
<div>
	<div>
		<div>글번호</div>
	<input type="text" name="pseq" id="pseq" value="${map.pboard.pseq}" readonly>
	</div>
	<div>
		<div>제목</div>
	<input type="text" name="ptitle" id="ptitle" value="${map.pboard.ptitle}">
	</div>
	<br>
	<div><!-- 이미지 추가 -->						
	<span><input type='file' multiple="multiple" id="imgname" name="uploadFiles" onchange="setThumbnail(event);" ></span>
	<div id="image_container"></div>
	</div>
	<br>
	<span>항목추가</span>
	<button type="button" id="addStock" ><img id="btnimg" src="upload/plus.png"></button>
	<div ><!-- 가져온 stock 받아주는 div -->		
	<table border="1">
		<thead>
		<tr>
			<th>메인</th>
			<th>상품번호</th>
			<th>상품명</th>
			<th>상품재고수량</th>
			<th>원가</th>
			<th>카테고리번호</th>
			<th>상품내용</th>
			<th>판매가</th>
			<th>제거</th>
		</tr>
		</thead>
		<tbody id="stock">
		<c:forEach items="${map.stockList }" var="i"> 
		<tr>
		<td><input type='checkbox' name='main' value='${i.pnum}' onclick='checkOnlyOne(this)' <c:if test="${i.main=='true' }">checked</c:if>></td>
		<td><input type='hidden' name='pnum' value="${i.pnum}">${i.pnum }</td>
		<td>${i.pname}</td>
		<td>${i.scount}</td>
		<td>${i.cost}</td>
		<td>${i.cnum}</td>
		<td>${i.pcontent}</td>
		<td>${i.price}</td>
		<td><input type="button" name="delSto" value="제거"></td>
		</tr>
		</c:forEach>
		</tbody>
	</table>					
	</div>
	<br>
	<button type="button" id="addOpt">옵션추가</button>
	<div id="opt"><!-- 해당 옵션 가져오는 태그 -->
	<c:forEach items="${map.option }" var="i" varStatus="status">
		<table border="1" class="option">
			<thead>
				<tr>
					<th>옵션명&nbsp;
					<input type="text" id="otitle${status.count}" name="otitle" value="${i.otitle }"><input type="hidden" id="oseq${status.count }" name="oseq" value="${i.oseq }"/></th>
					<th colspan="3">필수<input type="checkbox" value="필수" <c:if test="${i.necessary =='true' }">checked</c:if> onclick="necc(${status.count})" id="necessary${status.count}" name="necessary${status.count}"></th>
					<th>옵션제거</th>
				</tr>
			</thead>
			<tbody id="opt${status.count}">
				<c:forEach items="${i.oconArr}" var="k" varStatus="kStatus">
					<tr>
						<th>항목<c:if test="${kStatus.count==1 }" > <input type="button" onclick="addcon(${status.count})" value="+"></c:if></th>
						<td><input type="text" name="ocontent${status.count}" value="${k }"></td>
						<th>상품추가비용</th>
						<td><input type="text" name="ovalue${status.count}" value="${i.ovalArr[kStatus.index ]}"></td>
						<td><input type="button" onclick="delcon(${status.count})" value="항목제거"></td>
					</tr>
				<c:set var="optNum" value="${status.count}"/>
				</c:forEach>
			</tbody>
		</table>
	</c:forEach>
	<input type="hidden" value="${optNum}" name="optNum">
	</div>
	<div>
		<div>내용</div>
		<div><!-- 표시할 textarea 영역 --> <textarea id="pcontent"  name="pcontent" rows="10" cols="100" >${map.pboard.pcontent }</textarea></div>
	</div>
	<div>
		<input type="button" value="작성" class="btnn">
	</div>
</div>
</form>
</body>
<script type="text/javascript" src="<c:url value='resources/smarteditor2-2.8.2.3/js/HuskyEZCreator.js'/>" charset="utf-8"></script>

</html>