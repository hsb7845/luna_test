<%@page import="com.luna.board.dtos.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- tag라이브러리 : tag모음.. JAVA코드를 치환하는 역할. -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

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

        <title>memberList</title>

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
            function delBoard() {
                var bool = true;
                var count = $("form")
                    .find("input[name=chk]:checked")
                    .length;
                if (count == 0) {
                    alert('최소 하나 이상 체크하세요!!!');
                    bool = false;
                } else if (confirm("정말 삭제하시겠습니까?") == false) {
                    bool = false;
                }
                if (bool) {
                    var formEle = document.form;
                    formEle.action = 'muldelmember.do';
                    formEle.submit(); //javascript에서 submit실행
                }
            }

            function birthMem() {
                var formEle = document.form;
                formEle.action = 'birthmember.do';
                formEle.submit();
            }

            function freshMem() {
                var formEle = document.form;
                formEle.action = 'freshmember.do';
                formEle.submit();
            }

            function addCoupon() {
                var bool = true;
                var count = $("form")
                    .find("input[name=chk]:checked")
                    .length;
                if (count == 0) {
                    alert('최소 하나 이상 체크하세요!!!');
                    bool = false;
                } else if (confirm("쿠폰을 추가하시겠습니까?") == false) {
                    bool = false;
                }
                if (bool) {
                    var formEle = document.form;
                    formEle.action = 'insertcoupon.do';
                    formEle.submit(); //javascript에서 submit실행
                }
            }

            // core, BOM, DOM  3가지 영역으로 나눔
            function allSel(val) {
                // val --> input객체--> Element객체 안에 구현 여러 속성들이 있음 그중에 tagName을 사용해봄
                // alert(val.tagName); 		alert(val); getElementById(), getElementsByTagName(),
                // ...className ....등
                var chks = document.getElementsByName("chk"); //[chk,chk,chk...]
                for (var i = 0; i < chks.length; i++) {
                    chks[i].checked = val.checked;
                }
                //		val.parentNode.style.backgroundColor="red";
            }
            //form 태그에서 submit 이벤트가 발생하면 함수실행
            $(function () {
                // $("form").submit(function(){ 		var bool = true; 		var
                // count=$(this).find("input[name=chk]:checked").length; 		if(count==0){
                // alert('최소 하나 이상 체크하세요!!!'); 			bool= false; 		}else if(confirm("정말
                // 삭제하시겠습니까?")==false){ 			bool = false; 		} 		return bool 	}); 	var chks =
                // document.getElementsByName("chk");  	for(var i=0;i<chks.length;i++){
                // chks[i].onclick =function(){//체크박스에서 클릭이벤트가 발생하면 함수를 실행해라  			var checkdObjs
                // = document.querySelectorAll("input[name=chk]:checked");
                // if(checkedObjs.length ==chks.length){
                // document.getElementsByName("all")[0].checked=true;  			}else{
                // document.getElementsByName("all")[0].checked=false;  			}  		}  	}

                $("#insertmemberform").click(function () {
                    location.href = 'insertmemberform.do'
                });

                $("#main").click(function () {
                    location.href = '.do'
                });

                var chk_arr = [];
                $("input[name='chk']:checked").each(function () {
                    var chk = $(this).val();
                    chk_arr.push(chk);
                })
            })
            // $("#insertmemberform").click(function(){ location.href='insertmemberform.do'
            // });
        </script>
        <style type="text/css">
            table {
                width: 100%;
            }
            #content {
                background-color: white;
            }
            .container-fluid {
                background-color: white;
            }
            .cls1 {
                font-size: 30px;
                text-align: center;
            }
            .memberT {
                text-align: center;
                font-size: 15px;
            }
            .memberM {
                text-align: center;
                font-size: 13px;
            }
            .memberD {
                text-align: left;
                font-size: 12px;
            }
            /* 	@font-face { */
            /* 	    font-family: 'Gyeonggi_Tittle_OTF_FontInstaller'; */
            /* 	    font-weight: normal; */
            /* 	    font-style: normal; */
            /* 	} */

            /* 	body,button,input{ */
            /* 		font-family: 'Gyeonggi_Tittle_OTF_FontInstaller'; */
            /* 		font-weight: bold; */
            /* 	}	 */
        </style>
    </head>
    <%
	List<MemberDTO> list= (List<MemberDTO>) request.getAttribute("list");
%>

        <body id="page-top">

            <!-- Page Wrapper -->
            <div id="wrapper">

                <!-- Sidebar -->
                <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" 
                id="accordionSidebar">

                    <!-- Sidebar - Brand -->
                    <a class="sidebar-brand d-flex align-items-center justify-content-center"
                        href="index.do">
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
                <!-- <li class="nav-item"> -->
                <!-- <a class="nav-link" href="pboard.do"> -->
                <!-- <i class="fas fa-fw fa-chart-area"></i> -->
                <!-- <span>상품게시판관리</span></a> -->
                <!-- </li> -->

                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="buylist.do">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>주문관리</a>
                    </span>
                </a>
            </li>
            <!-- Nav Item - Pages Collapse Menu -->

            <!-- Nav Item - Tables -->
            <!-- <li class="nav-item"> -->
            <!-- <a class="nav-link" href="tables.html"> -->
            <!-- <i class="fas fa-fw fa-table"></i> -->
            <!-- <span>Tables</span></a> -->
            <!-- </li> -->

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
                <nav
                    class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

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

                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <p style="text-align:center;">
                        <div id="outter">

                            <p class="cls1">회원 목록</p>
                            <!-- <form action="muldelmember.do" method="post"> -->
                            <form method="post" name="form">
                                <div style="float:right">
                                    <select id="arrayNum" name="sel" onchange="selChange()"><option value="1" <c:if test="${arrayNum == 1}">selected</c:if>>신규 가입자</option>
                            <option value="2" <c:if test="${arrayNum == 2}">selected</c:if>>생일자</option>
                    </select>
                </div>

                <table border="1">
                    <tr class="memberT">
                        <th id="m1"><input type="checkbox" name="all" onclick="allSel(this)"/></th>
                        <th id="m1">아이디</th>
                        <th id="m1">비밀번호</th>
                        <th id="m1">이메일</th>
                        <th id="m1">우편번호</th>
                        <th id="m1">주소</th>
                        <th id="m1">상세주소</th>
                        <th id="m1">참고주소</th>
                        <th id="m1">생년월일</th>
                        <th id="m1">성별</th>
                        <th id="m1">핸드폰</th>
                        <th id="m1">가입일</th>
                        <th id="m1">관리자</th>
                        <th id="m1">닉네임</th>
                        <th id="m1">이름</th>
                        <th id="m1">포인트</th>
                    </tr>
                    <%
		if(list==null||list.size()==0){
			out.print("<tr><td colspan='13'>----가입된 회원이 없습니다.</td></tr>");
			}else{
		for(int i=0;i<list.size();i++){
			MemberDTO dto=list.get(i);
	%>

                        <tr class="memberM">
                            <td id="m2"><input type="checkbox" name="chk" value="<%=dto.getId()%>"></td>
                            <td id="m2">
                                <a href="updatememberForm.do?id=<%=dto.getId()%>"><%=dto.getId()%></a>
                            </td>
                            <td id="m2"><%=dto.getPwd() %></td>
                            <td id="m2"><%=dto.getEmail()%></td>
                            <td id="m2"><%=dto.getAdr1()%></td>
                            <td id="m2"><%=dto.getAdr2()%></td>
                            <td id="m2"><%=dto.getAdr3()%></td>
                            <td id="m2"><%=dto.getAdr4()%></td>

                           <td id="m2"><fmt:formatDate value="<%=dto.getBirth()%>" pattern="yyyy년MM월dd일"/></td>
                            <td id="m2"><%=dto.getSex()%></td>
                            <td id="m2"><%=dto.getPhone()%></td>
                            <td id="m2"><fmt:formatDate value="<%=dto.getJoindate()%>" pattern="yyyy년MM월dd일"/></td>
                            <td id="m2"><%=dto.getAdmin()%></td>
                            <td id="m2"><%=dto.getNickName()%></td>
                            <td id="m2"><%=dto.getName()%></td>
                            <td id="m2"><%=dto.getPoint()%></td>
                        </tr>

                        <%
			}
		}
	%>
                        </table>
                        <table>
                            <tr>
                                <td class="memberD">
                                    <!-- <a href="insertmemberform.do">회원가입</a> -->
                                    <input type="button" value="회원가입" id="insertmemberform">
                                    <!-- <input type="button" value="메인" id="main"> -->
                                    <input type="button" value="삭제" onclick="delBoard()"/>
                                    <input type="button" value="생일자 보기" onclick="birthMem()"/>
                                    <input type="button" value="신규가입자 보기" onclick="freshMem()"/>
                                    <input type="button" value="쿠폰 추가" onclick="addCoupon()"/>
                                </td>
                            </tr>
                        </table>
                    </form>

                </div>
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