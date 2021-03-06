<%@page import="com.luna.board.dtos.StockDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="UTF-8">
<title>stockForm</title>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta
	    name="viewport"
	    content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

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
	<!-- 관련 참고 사이트 -->
	<!-- https://doublesprogramming.tistory.com/140 -->
	<!-- https://start0.tistory.com/223 -->

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(document).ready(function() {
		// 상품 등록 유효성검사
		$("#addBtn").click(function() {
			var pname=$("#pname").val();
			var scount=$("#scount").val();
			var cost=$("#cost").val();			
			var cnum=$("#cnum").val();			
			var pcontent=$("#pcontent").val();
			var price=$("#price").val();
			
			if(pname == "") {
				alert("상품명을 입력해주세요");
				$("#pname").focus();
			} else if(scount == "") {
				alert("상품입고수량을 입력해주세요");
				$("#scount").focus();
			} else if(cost == "") {
				alert("상품 원가를 입력해주세요");
				$("#cost").focus();	
			} else if(pcontent == "") {
				alert("상품 설명을 입력해주세요");
				$("#pcontent").focus();
			} else if(price == "") {
				alert("상품 판매가격을 입력해주세요");
				$("#price").focus();
			}else{
				var form = document.getElementById("form");
				form.submit();
			}
			// 상품 정보 전송	
// 			document.form.action = "${path}/shop/product/insert.do";
//			document.form.action = "stockInsert.do";
//			document.form.submit();
			
		});
		// 상품 목록이동
		$("#listBtn").click(function(){
// 			location.href='${path}/shop/product/list.do'
			location.href='stock.do'
		});
		
		// 다시입력
		$("#resetBtn").click(function(){
// 			location.href='${path}/shop/product/list.do'
			location.href='stockForm.do'
		});
		
		//1단계 . type의 값이 바뀐다.
		//2단계 . 그 타입이 가지고 있는 색상을 DB에서 가져온다. -> ajax 처리
		//3단계 . 그 색상을 option에 추가 
		$("#ptype").change(function(){
			$.ajax({
				url : "getColor.do",
				mehthod : "post",
				dataType : "json",
				data : { "ptype" : $("#ptype").val()},
				asnc:false,
				success : function(data) {
// 					alert(data["list"][0]["pcolor"]);

					var list = data["list"];
					var colorOption = "<option value=''>전체</option>";
					for(var i=0; i<list.length; i++) {					
						colorOption += '<option value="'+list[i]["pcolor"]+'"> '+list[i]["pcolor"]+'</option>'
					}				
					$("#pcolor").html(colorOption);
				}
			});			
		});
		$("#ptype").change(function(){
			$.ajax({
				url : "getSize.do",
				mehthod : "post",
				dataType : "json",
				data : { "ptype" : $("#ptype").val()},
				asnc:false,
				success : function(data) {
					var list = data["list"];
					var sizeOption = "<option value=''>전체</option>";
					for(var i=0; i<list.length; i++) {					
						sizeOption += '<option value="'+list[i]["psize"]+'"> '+list[i]["psize"]+'</option>'
					}				
					$("#psize").html(sizeOption);
				}
			});			
		});	
// 		$("#ptype").change(function(){
// 			$.ajax({
// 				url : "getCnum.do",
// 				mehthod : "post",
// 				dataType : "json",
// 				data : { "ptype" : $("#ptype").val()},
// 				asnc:false,
// 				success : function(data) {
// 					var list = data["list"];
// 					var sizeOption = "<option value=''>전체</option>";
// 					for(var i=0; i<list.length; i++) {					
// 						cnumOption += '<option value="'+list[i]["cnum"]+'"> '+list[i]["cnum"]+'</option>'
// 					}				
// 					$("#cnum").html(cnumOption);
// 				}
// 			});			
// 		});		
	}); 
</script>
<script src="<c:url value='resources/js/jquery-3.6.0.min.js'/>"></script>
<style >


textarea {
    width: 250px;
    height: 100px;
    resize: none;
    /* 크기고정 */
}
.cls1 {
    font-size: 30px;
    text-align: center;
}

body,button,input {
    font-family: 'Gyeonggi_Tittle_OTF_FontInstaller';
    font-weight: bold;
}

#content {
	text-align : center;
	background-color: white;
}

div.row {
	text-align: center;
	display : block;
}
 div#stockForm { 
     text-align: center; 
     background-color: white;
     width: 100%;
 } 
  button {
   color:#666666;
   font-family:inherit;
   font-size:14px;
   line-height:1.8;
   word-wrap:break-word;
   -webkit-hyphens:auto;
    -moz-hyphens:auto;
    -ms-hyphens:auto;
         hyphens:auto;
         
         font-size:100%;
   /* Corrects font size not being inherited in all browsers */
   margin:0;
   /* Addresses margins set differently in IE6/7,F3/4,S5,Chrome */
   vertical-align:baseline;
   /* Improves appearance and consistency in all browsers */
}
button,input[type="button"],input[type="reset"],input[type="submit"] {
   border:1px solid #ccc;
   border-radius:0px;
   background:#ccc;
   color:#fff;
   cursor:pointer;
   /* Improves usability and consistency of cursor style between image-type 'input' and others */
   -webkit-appearance:button;
   /* Corrects inability to style clickable 'input' types in iOS */
   padding:3px 15px;
}
button:hover,input[type="button"]:hover,input[type="reset"]:hover,input[type="submit"]:hover {
   opacity:0.6;
}
</style>
</head>
<%
	List<String> list = (List<String>)request.getAttribute("list");
%>
    
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul
            class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
            id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a href="stock.do">
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

        <!-- Heading -->
        <!-- <div class="sidebar-heading"> -->
        <!-- Interface -->
        <!-- </div> -->

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="member.do">
                <i class="fas fa-fw fa-cog"></i>
                <span>회원관리</span>
            </a>
            <!-- <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
            data-parent="#accordionSidebar"> -->
            <!-- <div class="bg-white py-2 collapse-inner rounded"> -->
            <!-- <h6 class="collapse-header">Custom Components:</h6> -->
            <!-- <a class="collapse-item" href="buttons.html">Buttons</a> -->
            <!-- <a class="collapse-item" href="cards.html">Cards</a> -->
            <!-- </div> -->
            <!-- </div> -->
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
                    <h6 class="collapse-header">게시판관리:</h6>
                    <h6 class="collapse-header"><a href="pboard.do"> 상품게시판관리:</a> </h6>
                        <a class="collapse-item" href="pboard.do?select=귀걸이">귀걸이</a>
                            <a class="collapse-item" href="pboard.do?select=목걸이">목걸이</a>
                            <a class="collapse-item" href="pboard.do?select=반지">반지</a>
                            <a class="collapse-item" href="pboard.do?select=팔찌">팔찌</a>
                            <a class="collapse-item" href="pboard.do?select=기타">기타</a>
                            <a class="collapse-item" href="rboard.do">리뷰</a>
                            <a class="collapse-item" href="qboard.do">문의사항</a>
                            <a class="collapse-item" href="eboard.do">이벤트</a>
                            <a class="collapse-item" href="pcategory.do">카테고리</a>
                </div>
            </div>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <!-- <div class="sidebar-heading"> -->
        <!-- Addons -->
        <!-- </div> -->

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <!-- <a class="nav-link collapsed" href="#" data-toggle="collapse"
            data-target="#collapsePages" -->
            <!-- aria-expanded="true" aria-controls="collapsePages"> -->
            <!-- <i class="fas fa-fw fa-folder"></i> -->
            <!-- <span>Pages</span> -->
            <!-- </a> -->
            <div
                id="collapsePages"
                class="collapse"
                aria-labelledby="headingPages"
                data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Login Screens:</h6>
                    <a class="collapse-item" href="login.html">Login</a>
                    <a class="collapse-item" href="register.html">Register</a>
                    <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                    <div class="collapse-divider"></div>
                    <h6 class="collapse-header">Other Pages:</h6>
                    <a class="collapse-item" href="404.html">404 Page</a>
                    <a class="collapse-item" href="blank.html">Blank Page</a>
                </div>
            </div>
        </li>

        <!-- Nav Item - Charts -->
        <li class="nav-item">
            <a class="nav-link" href="buylist.do">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>주문관리</a> </span>
        	</a>
    	</li>

    <!-- Nav Item - Tables -->
    <!-- <li class="nav-item"> -->
    <!-- <a class="nav-link" href="tables.html"> -->
    <!-- <i class="fas fa-fw fa-table"></i> -->
    <!-- <span>Tables</span></a> -->
    <!-- </li> -->

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
<!--     <div class="text-center d-none d-md-inline"> -->
<!--         <button class="rounded-circle border-0" id="sidebarToggle"></button> -->
<!--     </div> -->

</ul>
<!-- End of Sidebar -->

<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">

        <!-- Topbar -->
        <nav
            class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

            <!-- Sidebar Toggle (Topbar) -->
            <button
                id="sidebarToggleTop"
                class="btn btn-link d-md-none rounded-circle mr-3">
                <i class="fa fa-bars"></i>
            </button>

            <!-- Topbar Search -->
<!--             <form -->
<!--                 class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"> -->
<!--                 <div class="input-group"> -->
<!--                     <input -->
<!--                         type="text" -->
<!--                         class="form-control bg-light border-0 small" -->
<!--                         placeholder="Search for..." -->
<!--                         aria-label="Search" -->
<!--                         aria-describedby="basic-addon2"> -->
<!--                     <div class="input-group-append"> -->
<!--                         <button class="btn btn-primary" type="button"> -->
<!--                             <i class="fas fa-search fa-sm"></i> -->
<!--                         </button> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </form> -->

            <!-- Topbar Navbar -->
            <ul class="navbar-nav ml-auto">

                <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                <li class="nav-item dropdown no-arrow d-sm-none">
                    <a
                        class="nav-link dropdown-toggle"
                        href="#"
                        id="searchDropdown"
                        role="button"
                        data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false">
                        <i class="fas fa-search fa-fw"></i>
                    </a>
                    <!-- Dropdown - Messages -->
                    <div
                        class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                        aria-labelledby="searchDropdown">
                        <form class="form-inline mr-auto w-100 navbar-search">
                            <div class="input-group">
                                <input
                                    type="text"
                                    class="form-control bg-light border-0 small"
                                    placeholder="Search for..."
                                    aria-label="Search"
                                    aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="button">
                                        <i class="fas fa-search fa-sm"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </li>

                <!-- Nav Item - Alerts -->
                <li class="nav-item dropdown no-arrow mx-1">
                    <a
                        class="nav-link dropdown-toggle"
                        href="#"
                        id="alertsDropdown"
                        role="button"
                        data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false">
                        <i class="fas fa-bell fa-fw"></i>
                        <!-- Counter - Alerts -->
                        <span class="badge badge-danger badge-counter">3+</span>
                    </a>
                    <!-- Dropdown - Alerts -->
                    <div
                        class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                        aria-labelledby="alertsDropdown">
                        <h6 class="dropdown-header">
                            Alerts Center
                        </h6>
                        <a class="dropdown-item d-flex align-items-center" href="#">
                            <div class="mr-3">
                                <div class="icon-circle bg-primary">
                                    <i class="fas fa-file-alt text-white"></i>
                                </div>
                            </div>
                            <div>
                                <div class="small text-gray-500">December 12, 2019</div>
                                <span class="font-weight-bold">A new monthly report is ready to download!</span>
                            </div>
                        </a>
                        <a class="dropdown-item d-flex align-items-center" href="#">
                            <div class="mr-3">
                                <div class="icon-circle bg-success">
                                    <i class="fas fa-donate text-white"></i>
                                </div>
                            </div>
                            <div>
                                <div class="small text-gray-500">December 7, 2019</div>
                                $290.29 has been deposited into your account!
                            </div>
                        </a>
                        <a class="dropdown-item d-flex align-items-center" href="#">
                            <div class="mr-3">
                                <div class="icon-circle bg-warning">
                                    <i class="fas fa-exclamation-triangle text-white"></i>
                                </div>
                            </div>
                            <div>
                                <div class="small text-gray-500">December 2, 2019</div>
                                Spending Alert: We've noticed unusually high spending for your account.
                            </div>
                        </a>
                        <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                    </div>
                </li>

                <!-- Nav Item - Messages -->
                <li class="nav-item dropdown no-arrow mx-1">
                    <a
                        class="nav-link dropdown-toggle"
                        href="#"
                        id="messagesDropdown"
                        role="button"
                        data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false">
                        <i class="fas fa-envelope fa-fw"></i>
                        <!-- Counter - Messages -->
                        <span class="badge badge-danger badge-counter">7</span>
                    </a>
                    <!-- Dropdown - Messages -->
                    <div
                        class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                        aria-labelledby="messagesDropdown">
                        <h6 class="dropdown-header">
                            Message Center
                        </h6>
                        <a class="dropdown-item d-flex align-items-center" href="#">
                            <div class="dropdown-list-image mr-3">
                                <img class="rounded-circle" src="img/undraw_profile_1.svg" alt="...">
                                <div class="status-indicator bg-success"></div>
                            </div>
                            <div class="font-weight-bold">
                                <div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been having.</div>
                                <div class="small text-gray-500">Emily Fowler · 58m</div>
                            </div>
                        </a>
                        <a class="dropdown-item d-flex align-items-center" href="#">
                            <div class="dropdown-list-image mr-3">
                                <img class="rounded-circle" src="img/undraw_profile_2.svg" alt="...">
                                <div class="status-indicator"></div>
                            </div>
                            <div>
                                <div class="text-truncate">I have the photos that you ordered last month, how
                                    would you like them sent to you?</div>
                                <div class="small text-gray-500">Jae Chun · 1d</div>
                            </div>
                        </a>
                        <a class="dropdown-item d-flex align-items-center" href="#">
                            <div class="dropdown-list-image mr-3">
                                <img class="rounded-circle" src="img/undraw_profile_3.svg" alt="...">
                                <div class="status-indicator bg-warning"></div>
                            </div>
                            <div>
                                <div class="text-truncate">Last month's report looks great, I am very happy with
                                    the progress so far, keep up the good work!</div>
                                <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                            </div>
                        </a>
                        <a class="dropdown-item d-flex align-items-center" href="#">
                            <div class="dropdown-list-image mr-3">
                                <img
                                    class="rounded-circle"
                                    src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                    alt="...">
                                <div class="status-indicator bg-success"></div>
                            </div>
                            <div>
                                <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                    told me that people say this to all dogs, even if they aren't good...</div>
                                <div class="small text-gray-500">Chicken the Dog · 2w</div>
                            </div>
                        </a>
                        <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                    </div>
                </li>

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

        <!-- Begin Page Content -->
        <div class="container-fluid">

            <!-- Content Row -->
			<p class="cls1">상품등록</p>
            <div class="row">
            	
				<form id="form" name="form" method="post" action="insertStock.do" autocomplete="off">
				<div id="stockForm"> 
					
					<p>type
					<select name="ptype" id="ptype" >		
						<option value="" >전체</option>
						<%
							if(list==null||list.size()==0){
								out.print("<tr><td colspan='3'>----작성된 글이 없습니다.</td></tr>");
								}else{
							for(int i=0;i<list.size();i++){			
						%>
						<option value="<%=list.get(i) %>"><%=list.get(i)%></option>
							<%
							}
						}
					%>
					</select>		
					color
					<select name="pcolor" id="pcolor" >
						<option value="">전체</option>
					</select>
					size
					<select name="psize" id="psize">
						<option value="">전체</option>
					</select>	
					</p>
					<div id='result'></div>
					<P>상품명  <input type="text" name="pname" id="pname" ></P>
					<P>상품입고수량  <input type="text" name="scount" id="scount" ></P>
					<P>상품원가  <input type="text" name="cost" id="cost" ></P>				
<!-- 					<p>카테고리번호 -->
<!-- 						<select name="cnum" id="cnum" >		 -->
<!-- 							<option value="" >전체</option> -->
<!-- 						</select></p>				 -->
					<P>상품내용  
						<textarea cols="30" rows="5" name="pcontent" id="pcontent" ></textarea></P>
					<P>상품가격  <input type="text" name="price" id="price"></P>	
						
					<input type="button" value="등록" id="addBtn">
					<input type="button" value="목록" id="listBtn">
					<input type="button" value="다시입력" id="resetBtn">
				</div>
				</form>
     

                        </div>

                        <!-- Content Row -->
<!--                         <div class="row"></div> -->

                    </div>
                    <!-- /.container-fluid -->

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
</html>