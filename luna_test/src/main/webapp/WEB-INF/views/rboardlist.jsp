<%@page import="com.luna.board.dtos.RBoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

<%
   	request.setCharacterEncoding("utf-8");
%>   

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
            .rboardT {
            	font-size: 15px;
            	text-align: center;
            }
             .rboardM {
            	font-size: 13px;
            	text-align: center;
            }           
             .rboardD {
            	font-size: 12px;
            	text-align: left;
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
        <script src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript">
		
			function allSel(val){
				var chks=document.getElementsByName("chk");
				for(var i=0;i<chks.length;i++){
					chks[i].checked=val.checked;
				}
			}
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
			 		chks[i].onclick =function(){
			 			var checkdObjs = document.querySelectorAll("input[name=chk]:checked");
			 			if(checkedObjs.length ==chks.length){
			 				document.getElementsByName("all")[0].checked=true;
			 			}else{
			 				document.getElementsByName("all")[0].checked=false;
			 			}
			 		}
			 	}
			 	
			 	$("#insertrboardform").click(function(){
					location.href='insertrboardform.do'
				});
		 	
		 		$("#main").click(function(){
		 			location.href='.do'
		 		});
			})
		
		</script>
    </head>
<%
	List<RBoardDTO> list= (List<RBoardDTO>) request.getAttribute("list");
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
                <div class="container-fluid">
                	<p class="cls1">리뷰 목록</p> 
					<form action="muldelRboard.do" method="post">
					<table align="center" border="1" cellpadding="4" cellspacing="0" bordercolor="#000000" style="border-collapse:collapse">
						<col width="50px">
						<col width="200px">
						<col width="100px">
						<col width="300px">
						<col width="200px">
						<col width="100px">
						<col width="100px">
						<col width="200px">
						<tr class="rboardT">
							<th><input type="checkbox" name="all"  onclick="allSel(this)"/></th>
							<th>리뷰 게시글 번호</th>
							<th>제목</th>
							<th>내용</th>
							<th>상품 게시글 번호</th>
							<th>아이디</th>
							<th>별점</th>
							<th>부모글 번호</th>
						</tr>
						<%
							if(list==null||list.size()==0){
								out.print("<tr><td colspan='8'>----작성된 리뷰가 없습니다.---</td></tr>");
								} else {
							for(int i=0;i<list.size();i++){
								RBoardDTO dto=list.get(i);
						%>
								<tr class="rboardM">
									<td><input type="checkbox" name="chk" value="<%=dto.getRseq()%>"/></td>
									<td><%=dto.getRseq()%></td>
									<td>
									<%
									if(dto.getLevel()>1){				
									%>
									<span style="padding-left:20px"></span>└
									<%
										}	
									%>
									<a href="rreply.do?rseq=<%=dto.getRseq() %>"><%=dto.getRtitle()%></a> </td>
									<td><%=dto.getRcontent()%></td>
									<td><%=dto.getPseq()%></td>
									<td><%=dto.getId()%></td>
									<td><%=dto.getStarrank()%></td>
									<td><%=dto.getPar_rseq()%></td>
								</tr>
					<%
							}
						}
					%>
					</table>
					<table align="left" border="0" cellpadding="10" cellspacing="0" bordercolor="#000000" style="border-collapse:collapse">
					<tr>
						<td colspan="8" class="rboardD">
							<input type="button" value="리뷰 등록" id="insertrboardform" />
<!-- 							<input type="button" value="메인" id="main"> -->
							<input type="submit" value="삭제" />		
					<!-- 		<a href=".do">메인</a> -->
					<!-- 		<a href="insertrboardform.do">리뷰 작성</a>  -->
						</td>
					</tr>
				</table>   

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