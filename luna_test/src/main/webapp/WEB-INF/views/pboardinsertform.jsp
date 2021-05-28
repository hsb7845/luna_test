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
		var table = "<table border='1'  ><thead><tr><th>옵션명&nbsp;<input type='text' id='otitle"+optNum+"' name='otitle' ></th><th colspan='3'>필수<input type='checkbox' value='필수' onclick='necc("+optNum+")' id='necessary"+optNum+"' name='necessary"+optNum+"'></th><th>옵션제거</th></tr></thead>";
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
				if($("input[name ='necessary"+i+"']").prop("checked")){
					necessary = "true";
					alert(necessary);
				}else{
					necessary = "false";
					alert(necessary);
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
				jsondata["opt"+i] = {"otitle":otitle,"ocontent":ocontent,"ovalue":ovalue,"necessary":necessary};
			} 	
		}else if(optNum==1){
			var otitle =  $("#otitle"+1).val();
			 var ocontent ="";
			var necessary = "";
			if($("input[name=necessary"+1).is(":checked")){
				necessary = "true";
				alert(necessary );
			}else{
				necessary = "false";
				alert(necessary );
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
			 jsondata["opt"+1] = {"otitle":otitle,"ocontent":ocontent,"ovalue":ovalue,"necessary":necessary};
		}
		var realObject = JSON.stringify(jsondata);
 		$.ajax({
 			url : "insertpboard.do",
 			mehthod : "post",
 			dataType : "json", 
 			traditional : true,
 			data : { "realObject" :realObject,"optNum" :optNum,"ptitle":$("#ptitle").val(),"pcontent":$("#pcontent").val(),"pnum_arr":pnum_arr,"mainNum":mainNum},
 			asnc:false,
			success : function(data) {
				//alert("성공!");
			}
 		});	
 		var formData = new FormData();
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
				//alert("성공!");
				location.href = "pboard.do";
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
<%@ include file="header.jsp" %>

</head>
<body>
	<form method="post" action="insertpboard.do" id="insert" enctype="multipart/form-data">
	<div>
		<div>
			<div>제목</div>
		<input type="text" name="ptitle" id="ptitle">
		</div>
		<br>
		<div><!-- 이미지 추가 -->
		
		<span><input type='file' multiple="multiple" id="imgname" name="imgname" onchange="setThumbnail(event);" ></span>
		<div id="image_container"></div>
		</div>
		<br>
		<span>항목추가</span>
		<button type="button" id="addStock" ><img id="btnimg" src="upload/plus.png"></button>
		<div id="stock"><!-- 가져온 stock 받아주는 div -->
			
		</div>
		<br>
		<button type="button" id="addOpt">옵션추가</button>
		<div id="opt"><!-- 해당 옵션 가져오는 태그 -->
			
			
		</div>
		
		
		<div>
			<div>내용</div>
			<div><!-- 표시할 textarea 영역 --> <textarea id="pcontent"  name="pcontent" rows="10" cols="100" ></textarea></div>
		</div>
		<div>
			<input type="button" value="작성" class="btnn">
			<input type="button" value="연습" class="praBtn">
		</div>
	</div>
	</form>
	<div id="log"></div>
</body>

<script type="text/javascript" src="<c:url value='resources/smarteditor2-2.8.2.3/js/HuskyEZCreator.js'/>" charset="utf-8"></script>
 </html>

