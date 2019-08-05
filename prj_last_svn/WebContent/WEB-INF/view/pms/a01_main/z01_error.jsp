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
    
    <style type="text/css">
    	html,body{
    		height:100%
    	}
    	.wrapper{
    		height:100%;
    		flex:1;
    		align-self: stretch;
    	}
    	.content-page{
    		height:100%;
    	}
    	.content_container{
			display: flex;
			flex:1;
			align-self:stretch;
			flex-direction:column;
		}
    	.content{
    		display:flex;
    		flex-direction:column;
    		align-items:center;
    		justify-content:center;
    		height:90%;
    	}
    	.loginBox{
    		text-align:center; 
    		
    	}
		.imgbox{
			text-align:center;
			margin-bottom:30px;
		}
    	.errorImg{
    		width:65%;
    		
    	}
    	.text{
    		font-size:24px;
    		color:#6c757d;
    		font-weight: bold;
    	}
    	.goback{
    		font-size:50px;
    		color:rgba(11,81,92,0.5);
    	}
    	.goback:hover{
    		letter-spacing:2px;
    		color:rgba(11,81,92,0.9);
    		transition:all 1.8s ease;
    	}
    </style>
</head>

<body>
	<!-- Begin page -->
    <div id="wrapper">

    <!-- header -->
    <jsp:include page="a04_header.jsp" />
 	<jsp:include page="a04_sidebar.jsp" />

		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<!-- ============================================================== -->
		<div class="content-page">
			<!-- Start content -->
			<div class="content">
				<div class="imgbox">
					<img class="errorImg" src="${path}/a01_com/assets/images/notfound.png">
				</div>

				<div class="loginBox">
					<p class="text">로그인 정보를 받아올 수 없습니다. 다시 로그인해주세요.</p>
					<a href="${path}/member.do?method=loginForm" class="goback">Click me to go back to Login Page!</a>
				</div>
			</div> 
		</div>
		
			<!-- footer -->
		<footer class="footer">
			eZ company 2019.07.05
		</footer>
			

	</div>
	

	<!-- END wrapper -->

        <!-- jQuery  -->
        <script src="${path}/a01_com/assets/js/jquery.min.js"></script>
        <script src="${path}/a01_com/assets/js/bootstrap.bundle.min.js"></script>
        <script src="${path}/a01_com/assets/js/metisMenu.min.js"></script>
        <script src="${path}/a01_com/assets/js/waves.js"></script>
        <script src="${path}/a01_com/assets/js/jquery.slimscroll.js"></script>

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


		<!-- 내가 작성한 script -->
        <script>
            jQuery(document).ready(function($) {

            });    
        </script>
    </body>
</html>