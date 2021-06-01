<%@page import="com.luna.board.dtos.EBoardDTO"%>
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

        <title>이벤트게사판</title>

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
        <script type="text/javascript">
		     // core, BOM, DOM  3가지 영역으로 나눔
		     	function allSel(val){
		     		//val --> input객체--> Element객체 안에 구현 여러 속성들이 있음 그중에 tagName을 사용해봄
		//      		alert(val.tagName);
		//      		alert(val);
		    		// getElementById(), getElementsByTagName(), ...className ....등 
		     		var chks=document.getElementsByName("chk");//[chk,chk,chk...]
		     		for(var i=0;i<chks.length;i++){
		     			chks[i].checked=val.checked;
		     		}
		//      		val.parentNode.style.backgroundColor="red";
		     	}
		     	//form 태그에서 submit 이벤트가 발생하면 함수실행 
		    	$(function(){
		    		$("form").submit(function(){
		    			var bool = true;
		    			var count=$(this).find("input[name=chk]:checked").length;
		    			if(count==0){
		    				alert('최소 하나 이상 체크하세요!!!');
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
		    	 	$("#inserteboardform").click(function(){
						location.href='inserteboardform.do'
					});
		    	})
        </script>
		<style type="text/css" > 
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
			@font-face {
			    font-family: 'Gyeonggi_Tittle_OTF_FontInstaller';
			    font-weight: normal;
			    font-style: normal;
			}
			.eboardT {
				text-align: center;
				font-size: 15px;
			}
			.eboardM {
				text-align: center;
				font-size: 13px;
			}			
			.eboardD {
				text-align: left;
				font-size: 12px;
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
			</style>

    </head>
<%
	List<EBoardDTO> list= (List<EBoardDTO>) request.getAttribute("list");
%>

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
                        href="eboard.do">
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
                <div class="container-fluid">
					<p class="cls1">이벤트 및 공지 글 목록</p> 
					<form action="muldelEboard.do" method="post">
					<table align="center" border="1" cellpadding="4" cellspacing="0" bordercolor="#000000" style="border-collapse:collapse" >
						<col width="50px">
						<col width="50px">
						<col width="100px">
						<col width="300px">
						<col width="200px">
						<tr class="eboardT" >
							<th><input type="checkbox" name="all"  onclick="allSel(this)"/></th>
							<th>번호</th>
							<th>분류</th>
							<th>제목</th>
							
						</tr>
						<%
							if(list==null||list.size()==0){
								out.print("<tr><td colspan='4'>----작성된 이벤트 글이 없습니다.</td></tr>");
								}else{
							for(int i=0;i<list.size();i++){
								EBoardDTO dto=list.get(i);
						%>
									<tr class="eboardM" >
										<td id="m2"><input type="checkbox" name="chk" value="<%=dto.getEseq()%>"/></td>
										<td id="m2"><%=dto.getEseq()%></td>
										<td id="m2"><%=dto.getBoa_sta()%></td>
										<td id="m2"><a href="updateeboardForm.do?eseq=<%=dto.getEseq() %>"><%=dto.getEtitle()%></a> </td>
									</tr>
						<%
								}
							}
						%>
						</table>
						<table align="left" border="0" cellpadding="10" cellspacing="0" bordercolor="#000000" style="border-collapse:collapse">
							<tr>
								<td colspan="4" class="eboardD" >
<!-- 									<a href="inserteboardform.do">이벤트 작성</a> -->
									<input type="button" value="이벤트작성" id="inserteboardform">
<!-- 									<a href=".do">메인</a> -->
									<input type="submit" value="삭제" />
								</td>
							</tr>
						</table>
					</form>
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