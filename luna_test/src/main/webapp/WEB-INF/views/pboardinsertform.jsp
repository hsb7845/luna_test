<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 스마트에디터 -->
<!-- <script type="text/javascript" src="resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script> -->
<link rel="stylesheet" href="<c:url value='resources/bootstrap-4.4.1-dist/css/bootstrap.min.css'/>">
<script src="<c:url value='resources/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='resources/bootstrap-4.4.1-dist/js/bootstrap.min.js'/>"></script>
<script>
function setThumbnail(event) {
	for (var image of event.target.files) { 
		var reader = new FileReader(); 
		reader.onload = function(event) {
			var img = document.createElement("img"); 
			img.setAttribute("src", event.target.result);
			document.querySelector("div#image_container").appendChild(img); 
			}; 
		console.log(image); 
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
		 cell1.innerHTML = "";
		 cell2.innerHTML = "<input type='text' name='ocontent"+tbody+"'>";
		 cell3.innerHTML = "<input type='text' name='ovalue"+tbody+"'>";
		 cell4.innerHTML = "<input type='button' onclick='delcon(\""+tbody+"\")' value='삭제'>";
	}
	
	function delcon(table){
		var tableData = document.getElementById("opt"+table);
		if(tableData.rows.length>=2){
			tableData.deleteRow(tableData.rows.length-1);
		}
		
	}
	

$(document).ready(function(){
	var optNum = 0;
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
		var table = "<table border='1' ><thead><tr><th>옵션명&nbsp;<input type='text' id='otitle"+optNum+"' name='otitle' ></th><th>항목명<input type='button' onclick='addcon("+optNum+")' value='+'></th><th>상품실제내용</th><th>삭제</th></tr></thead>";
		table += "<tbody id='opt"+optNum+"'><tr><td></td>";
		table += "<td><input type='text' name='ocontent"+optNum+"' ></td><td><input type='text' name='ovalue"+optNum+"' ></td>";
		table += "<td><input type='button' onclick='delcon("+optNum+")' value='삭제'></td></tr></tbody></table>"
		$("#opt").append(table);	
	})

	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "pcontent",
		sSkinURI: "resources/smarteditor2-2.8.2.3/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
	});
	
	$(".btn").on("click", function() {
		oEditors.getById["pcontent"].exec("UPDATE_CONTENTS_FIELD", []);
		var value = document.getElementById("pcontent").value;
		if(optNum>1){
			for(var i=1;i<=optNum;i++){
				var ocontent = "";
				var ovalue = "";
				var otitle = $("#otitle"+i).val();
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
				jsondata["opt"+i] = {"otitle":otitle,"ocontent":ocontent,"ovalue":ovalue};
			} 	
		}else if(optNum==1){
			var otitle =  $("#otitle"+1).val();
			 var ocontent ="";
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
			 jsondata["opt"+1] = {"otitle":otitle,"ocontent":ocontent,"ovalue":ovalue};
		}
 		$.ajax({
 			url : "insertpboard.do",
 			mehthod : "post",
 			dataType : "json",
 			traditional : true,
 			data : { "jsondata" :jsondata},
 			asnc:false,
			success : function(data) {
				alert("성공!");
			}
 		});	

	});
})
	
</script>
<style>
	#btnimg{
		width : 25px;
		height : 25px;
	}
	
	#image_container > img {
		width: 460px;
		height : 460px;
	}
	
</style>
<body>
	<form method="post" action="insertpboard.do" id="insert" enctype="multipart/form-data">
	<div>
		<div>
			<div>제목</div>
			<div><input type="text" name="ptitle" id="ptitle"></div>
		</div>
		<br><br>
		<div><!-- 이미지 추가 -->
		<span><input type='file' multiple="multiple" onchange="setThumbnail(event);" ></span>
		<div id="image_container"></div>
		</div>
		<br><br>
		<div>
		<span>항목추가</span>
		<button type="button" id="addStock" ><img id="btnimg" src="upload/plus.png"></button></div>
		<div id="stock"><!-- 가져온 stock 받아주는 div -->
			
		</div>
		<br><br>
		<button type="button" id="addOpt">옵션추가</button>
		<div id="opt"><!-- 해당 옵션 가져오는 태그 -->
			
			
		</div>
		
		
		<div>
			<div>내용</div>
			<div><!-- 표시할 textarea 영역 --> <textarea id="pcontent"  name="pcontent" rows="10" cols="100" ></textarea></div>
		</div>
		<div>
			<div><input type="button" value="작성" class="btn"></div>
		</div>
	</div>
	</form>
</body>

<script type="text/javascript" src="<c:url value='resources/smarteditor2-2.8.2.3/js/HuskyEZCreator.js'/>" charset="utf-8"></script>
 </html>

