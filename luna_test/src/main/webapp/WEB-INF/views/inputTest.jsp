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
	
	
	$(".btn").on("click", function() {
	
 		var formData = new FormData();
 		console.log($("#imgname")[0].files[0]);
 		var inputFile = $("#imgname");
 		var files = inputFile[0].files;
 		formData.append('key1','value1');
 		formData.append('key2','value2');
 		for(var i=0;i<files.length;i++){
 			formData.append('uploadFiles',files[i]);
 		}
 		$.ajax({
 			url : "uploadimgfileTest.do",
 			type : "post",
 			processData: false,
            contentType: false,
 			data : formData,
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
		<div><!-- 이미지 추가 -->
		
		<span><input type='file' multiple="multiple" id="imgname" name="imgname" onchange="setThumbnail(event);" ></span>
		<div id="image_container"></div>
		</div>
		<br><br>
			
			
		</div>
		
		<div>
			<div><input type="button" value="작성" class="btn"></div>
		</div>
	</div>
	</form>
</body>
 </html>

