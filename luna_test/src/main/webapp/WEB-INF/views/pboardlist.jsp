<%@page import="com.luna.board.dtos.PBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

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
                <script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	// core, BOM, DOM  3가지 영역으로 나눔
 	function allSel(val){
 		//val --> input객체--> Element객체 안에 구현 여러 속성들이 있음 그중에 tagName을 사용해봄
//  		alert(val.tagName);
//  		alert(val);
		// getElementById(), getElementsByTagName(), ...className ....등 
 		var chks=document.getElementsByName("chk");//[chk,chk,chk...]
 		for(var i=0;i<chks.length;i++){
 			chks[i].checked=val.checked;
 		}
//  		val.parentNode.style.backgroundColor="red";
 	}
 	//form 태그에서 submit 이벤트가 발생하면 함수실행 
	$(function(){
		$("form").submit(function(){
			var bool = true;
			var count=$(this).find("input[name=chk]:checked").length;
			if(count==0){
				alert('최소 하나이상 체크하세요!!!');
				bool= false;
			}else if(confirm("정말 삭제하시겠습니까?")==false){
				bool = false;
			}
			return bool
			
		});
		var chks = document.getElementsByName("chk");
	 	for(var i=0;i<chks.length;i++){
	 		chks[i].onclick =function(){//체크박스에서 클릭이벤트가 발생하면 함수를 실행해라
	 			var checkdObjs = document.querySelectorAll("input[name=chk]:checked");
	 			if(checkedObjs.length ==chks.length){
	 				document.getElementsByName("all")[0].checked=true;
	 			}else{
	 				document.getElementsByName("all")[0].checked=false;
	 			}
	 		}
	 	}
		$("#insertpboardform").click(function(){
// 			location.href='${path}/shop/product/list.do'
			location.href='insertpboardform.do'
		});
	})
</script>
	<style type="text/css">
		table {
    		width: 100%;
  		}
		.cls1 {
		    font-size: 30px;
		    text-align: center;
		}
		#content {
			background-color: white;
		}
		.container-fluid {
			background-color: white;
		}
		div.row {
			text-align: center;
		}
		.pboardT {
			text-align: center;
			font-size: 15px;
		}
		.pboardM {
			text-align: center;
			font-size: 13px;
		}
		.pboardD {
			text-align: left;
			font-size: 12px;
		}
	</style>
</head>
<%
	List<PBoardDTO> list= (List<PBoardDTO>) request.getAttribute("list");
%>
    
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul
            class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
            id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a href="index.do">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">
                    <img
                        id='mainLogo'
                        src='upload/logo.png'
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
                    <h6 class="collapse-header"><a href="pboard.do"> 상품게시판관리:</a> </h6>
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
<!--        <li class="nav-item"> -->
<!-- 			<a class="nav-link" href="pboard.do"> -->
<!-- 	         	<i class="fas fa-fw fa-chart-area"></i> -->
<!-- 	         	<span>상품게시판관리</span></a> -->
<!-- 		</li> -->

        <!-- Nav Item - Charts -->
        <li class="nav-item">
            <a class="nav-link" href="buylist.do">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>주문관리</a>
            </span>
        	</a>
        </li>
        <!-- Nav Item - Pages Collapse Menu -->


<!--     Nav Item - Tables -->
<!--     <li class="nav-item"> -->
<!--     <a class="nav-link" href="tables.html"> -->
<!--     <i class="fas fa-fw fa-table"></i> -->
<!--     <span>Tables</span></a> -->
<!--     </li> -->

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


<div class="row">
<p class="cls1">상품게시판관리</p>
<form action="muldelPboard.do" method="post">
<table border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#000000" style="border-collapse:collapse">
	<col width="50px">
	<col width="100px">
	<col width="300px">
	<col width="300px">
	<col width="200px">
	<col width="100px">
	<tr align="center" class="pboardT" >
		<th><input type="checkbox" name="all"  onclick="allSel(this)"/></th>
		<th>번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<%
		if(list==null||list.size()==0){
			out.print("<tr><td colspan='6'>----작성된 글이 없습니다.</td></tr>");
			}else{
		for(int i=0;i<list.size();i++){
			PBoardDTO dto=list.get(i);
	%>
				<tr align="center" class="pboardM" >
					<td><input type="checkbox" name="chk" value="<%=dto.getPseq()%>"/></td>
					 <td><%=dto.getPseq()%></td>
					<td><a href="updatePboardForm.do?pseq=<%=dto.getPseq() %>"><%=dto.getPtitle()%></a> </td>
					<td><%=dto.getPcontent()%></td>
					<td><fmt:formatDate value="<%=dto.getPdate()%>" pattern="yyyy년MM월dd일 hh:mm:ss" /> </td>
					<td><%=dto.getHit() %></td>
				</tr>
	<%
			}
		}
	%>
	</table>
	<table>
	<tr>
		<td colspan="6" class="pboardD">
<!-- 			<a href="insertpboardform.do">글쓰기</a> -->
			<input type="button" value="글쓰기" id=insertpboardform>
<!-- 			<a href="index.do">메인</a> -->
			<input type="submit" value="삭제" />
		</td>
	</tr>
</table>
</form>
        
        
       </div>
    <!-- End of Main Content -->

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
</html>