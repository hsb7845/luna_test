<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="UTF-8">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>adminMain</title>

        <!-- Custom fonts for this template-->
        <link
            href="resources/boot/vendor/fontawesome-free/css/all.min.css"
            rel="stylesheet"
            type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="resources/boot/css/sb-admin-2.min.css" rel="stylesheet">
		<link rel="stylesheet" href="<c:url value='resources/bootstrap-4.4.1-dist/css/bootstrap.min.css'/>">
		<script src="<c:url value='resources/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='resources/bootstrap-4.4.1-dist/js/bootstrap.min.js'/>"></script>
		<script>
		var chk_arr =[];
		var optNum = 0;
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
			
			
			function delOpt(num){
				 var table =$("#table"+num);
				 optNum--;
				 table.remove();
			}
		
		$(document).ready(function(){
			
			var jsondata = {};
			$("#addStock").click(function(){
				window.open("selectstock.do","팝업","width = 1000, height = 1000, top = 100, left = 200, location = no");
			});
			
			
			
			var $input = $("#stock");
			$("#stcok").on('input',function(){
				console.log("input text changed!"+$(this).val());
			});
			
			$("#addOpt").click(function(){		
				optNum++;
				var table = "<table border='1' id='table"+optNum+"' ><thead><tr><th>옵션명&nbsp;<input type='text' id='otitle"+optNum+"' name='otitle' ></th><th colspan='3'>필수<input type='checkbox' value='필수' onclick='necc("+optNum+")' id='necessary"+optNum+"' name='necessary"+optNum+"'></th><th><input type='button' onclick='delOpt("+optNum+")' value='옵션제거'></th></tr></thead>";
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
						jsondata["opt"+i] = {"otitle":otitle,"ocontent":ocontent,"ovalue":ovalue,"necessary":necessary};
					} 	
				}else if(optNum==1){
					var otitle =  $("#otitle"+1).val();
					 var ocontent ="";
					var necessary = "";
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
		<style type="text/css" > 
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

        <body id="page-top">
            <!-- Page Wrapper -->
            <div id="wrapper">
                <!-- Sidebar -->
                <ul
                    class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
                    id="accordionSidebar">
                    <!-- Sidebar - Brand -->
                    <a
                        class="sidebar-brand d-flex align-items-center justify-content-center"
                        href="index.do">
                        <div class="sidebar-brand-icon rotate-n-15">
                            <i class="fas fa-laugh-wink"></i>
                        </div>
                        <div class="sidebar-brand-text mx-3">
                            <img
                                id='mainLogo'
                                src='upload/logo_gray.png'
                                style='width:200px; height:90px; vertical-align: middle;'/>
                        </a>
                    </div>
                </a>
                
                <!-- Divider -->
                <hr class="sidebar-divider my-0">
                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="stock.do">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>재고관리</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">
                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="member.do">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>회원관리</span>
                    </a>
                </li>

                <!-- 게시판관리 -->
                <hr class="sidebar-divider">
                <!-- Nav Item - Utilities Collapse Menu -->
                <li class="nav-item">
                    <a
                        class="nav-link collapsed"
                        href="#"
                        data-toggle="collapse"
                        data-target="#collapseUtilities"
                        aria-expanded="true"
                        aria-controls="collapseUtilities">
                        <i class="fas fa-fw fa-wrench"></i>
                        <span>게시판관리</span>
                    </a>
                    <div
                        id="collapseUtilities"
                        class="collapse"
                        aria-labelledby="headingUtilities"
                        data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">
                                <a href="pboard.do">
                                    상품게시판관리:</a>
                            </h6>
                            <a class="collapse-item" href="pboard.do?select=귀걸이">귀걸이</a>
                            <a class="collapse-item" href="pboard.do?select=목걸이">목걸이</a>
                            <a class="collapse-item" href="pboard.do?select=반지">반지</a>
                            <a class="collapse-item" href="rboard.do">리뷰</a>
                            <a class="collapse-item" href="qboard.do">문의사항</a>
                            <a class="collapse-item" href="eboard.do">이벤트</a>
                        </div>
                    </div>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">                
                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="buylist.do">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>주문관리</a>
                    </span>
                </a>
            </li>


            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <!-- <div class="text-center d-none d-md-inline"> -->
            <!-- <button class="rounded-circle border-0" id="sidebarToggle"></button> -->
            <!-- </div> -->

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button
                        id="sidebarToggleTop"
                        class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <div class="input-group-append"></div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <div class="topbar-divider d-none d-sm-block"></div>
                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a
                                class="nav-link dropdown-toggle"
                                href="#"
                                id="userDropdown"
                                role="button"
                                data-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">admin</span>
                                <img
                                    class="img-profile rounded-circle"
                                    src="resources/boot/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div
                                class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="index.do">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    go main
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="logout.do">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>
                    </ul>

                </nav>
                <!-- End of Topbar -->

<!-- content 추가분 여기에 작성 -->
                <!-- Begin Page Content -->
                <div class="container-fluid" id="content" >
					<form method="post" action="insertpboard.do" id="insert" enctype="multipart/form-data">
					<div>
						<div>
							<div>제목</div>
						<input type="text" name="ptitle" id="ptitle">
						</div>
						<br>
						<div><!-- 이미지 추가 -->						
						<span><input type='file' multiple="multiple" id="imgname" name="imgname" onchange="setThumbnail(event);" required="required" ></span>
						<div id="image_container"></div>
						</div>
						<br>
						<span>항목변경</span>
						<button type="button" id="addStock" ><img id="btnimg" src="upload/plus.png"></button>
						<div >
						<table border='1'>
						<thead><!-- 가져온 stock 받아주는 div -->
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
							
						</tbody>
						</table>							
						</div>
						<br>
						<button type="button" id="addOpt">옵션추가</button>
						<div id="opt"><!-- 해당 옵션 가져오는 태그 --></div>
						<div>
							<div>내용</div>
							<div><!-- 표시할 textarea 영역 --> <textarea id="pcontent"  name="pcontent" rows="10" cols="100" ></textarea></div>
						</div>
						<div>
							<input type="button" value="작성" class="btnn">
						</div>
					</div>
					</form>
					<div id="log"></div>
                    </div>
                    <!-- End of Main Content -->
                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; Your Website 2021</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->
        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div
            class="modal fade"
            id="logoutModal"
            tabindex="-1"
            role="dialog"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="login.html">Logout</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="resources/boot/vendor/jquery/jquery.min.js"></script>
        <script src="resources/boot/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- Core plugin JavaScript-->
        <script src="resources/boot/vendor/jquery-easing/jquery.easing.min.js"></script>
        <!-- Custom scripts for all pages-->
        <script src="resources/boot/js/sb-admin-2.min.js"></script>
        <!-- Page level plugins -->
        <script src="resources/boot/vendor/chart.js/Chart.min.js"></script>
        <!-- Page level custom scripts -->
        <script src="resources/boot/js/demo/chart-area-demo.js"></script>
        <script src="resources/boot/js/demo/chart-pie-demo.js"></script>

    </body>
    <script type="text/javascript" src="<c:url value='resources/smarteditor2-2.8.2.3/js/HuskyEZCreator.js'/>" charset="utf-8"></script>
</html>