<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var ="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value = "utf-8"/>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<!-- your custom css -->
	<link href="${path}/a01_com/assets/css/a07_todolist.css" rel="stylesheet" type="text/css" />
    <link href="${path}/a01_com/assets/css/style.css" rel="stylesheet" type="text/css" />
</head>


<body>
	<!-- Begin page -->
    <div id="wrapper">

	    <!-- header -->
	    <jsp:include page="a04_header.jsp" />
	    
		<aside>
			<jsp:include page="a04_sidebar.jsp" />
		</aside>

		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<!-- ============================================================== -->
		<div class="content-page">
			
			<!-- Start content -->
			<div class="content">
				<div class="container-fluid" id="container-fluid">
            
					<!-- 상단메뉴 -->
					<div class="page-title-box">
						<span><img class="listimg" src="${path}/a01_com/assets/images/users/todolist.png"></span>
						<h2 class="page-title float-left "  >
						<a href="${path}/todolist.do?method=list" id="todolist">My Space</a></h2>
					</div>
					
					<!-- 세션으로 받아온 prjno가 기본값인지 선택값인지에 따라 화면 구성 -->
					<c:set var="prjno" value="${mem.prjno}" />
					<c:if test="${prjno eq 'pro0'}">
						<div class="noProject">
							<h3 class="page-title goPrj" >
								현재 생성된 프로젝트가 없습니다. 프로젝트를 생성해주세요.
							</h3>
							
							<h3 class="page-title goPrj" >
								<a href="${path}/project.do?method=list" id="goProject">
									<i class="ion ion-md-redo"></i>프로젝트 생성 바로가기
								</a>
							</h3>
						</div>
					</c:if>
					
					<c:if test="${prjno ne 'pro0'}">
					
					</c:if>					
				</div>
				<!-- container -->
			</div> 

			<!-- footer -->
			<footer class="footer">
				eZ company 2019.08.09
			</footer>
			
		</div>
	<!-- ============================================================== -->
	<!-- End Right content here -->
	<!-- ============================================================== -->
	</div>
	<!-- END wrapper -->

        <!-- jQuery  -->
        <script src="${path}/a01_com/assets/js/jquery.min.js"></script>
        <script src="${path}/a01_com/assets/js/bootstrap.bundle.min.js"></script>
        <script src="${path}/a01_com/assets/js/metisMenu.min.js"></script>
        <script src="${path}/a01_com/assets/js/waves.js"></script>
        <script src="${path}/a01_com/assets/js/jquery.slimscroll.js"></script>
        <script src="${path}/a01_com/popper.min.js"></script>
		<script src="${path}/a01_com/bootstrap.min.js"></script>
		<script src="${path}/a01_com/jquery-ui.js"></script>

        <!-- Counter js  -->
        <script src="${path}/a01_com/plugins/waypoints/jquery.waypoints.min.js"></script>
        <script src="${path}/a01_com/plugins/counterup/jquery.counterup.min.js"></script>

        <!-- sparkline -->
        <script src="${path}/a01_com/plugins/jquery-sparkline/jquery.sparkline.min.js"></script>
        <script src="${path}/a01_com/assets/pages/chart-sparkline.js"></script>

        <!-- skycons -->
        <script src="${path}/a01_com/plugins/skycons/skycons.min.js"></script>

        <!-- sweet alerts -->
        <script src="${path}/a01_com/plugins/sweet-alert2/sweetalert2.min.js"></script>

        <!-- Todoapp -->
        <script src="${path}/a01_com/assets/pages/jquery.todo.js"></script>

        <!-- App js -->
        <script src="${path}/a01_com/assets/js/jquery.core.js"></script>
        <script src="${path}/a01_com/assets/js/jquery.app.js"></script>
        
        <!-- Required datatable js -->
        <script src="${path}/a01_com/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="${path}/a01_com/plugins/datatables/dataTables.bootstrap4.min.js"></script>
        
        <!-- Buttons examples -->
        <script src="${path}/a01_com/plugins/datatables/dataTables.buttons.min.js"></script>
        <script src="${path}/a01_com/plugins/datatables/buttons.bootstrap4.min.js"></script>
        <script src="${path}/a01_com/plugins/datatables/jszip.min.js"></script>
        <script src="${path}/a01_com/plugins/datatables/pdfmake.min.js"></script>
        <script src="${path}/a01_com/plugins/datatables/vfs_fonts.js"></script>
        <script src="${path}/a01_com/plugins/datatables/buttons.html5.min.js"></script>
        <script src="${path}/a01_com/plugins/datatables/buttons.print.min.js"></script>
        <script src="${path}/a01_com/plugins/datatables/buttons.colVis.min.js"></script>
        
        <!-- Responsive examples -->
        <script src="${path}/a01_com/plugins/datatables/dataTables.responsive.min.js"></script>
        <script src="${path}/a01_com/plugins/datatables/responsive.bootstrap4.min.js"></script>

		<!-- chart -->
		<script src="https://www.amcharts.com/lib/4/core.js"></script>
		<script src="https://www.amcharts.com/lib/4/charts.js"></script>
		<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
		
		
		<!-- 내가 작성한 script -->
        <script>
            jQuery(document).ready(function($) {

            });
            

        </script>
    </body>
</html>