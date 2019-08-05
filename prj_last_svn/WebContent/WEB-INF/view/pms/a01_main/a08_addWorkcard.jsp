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
	
	</style>
	<!-- your custom css -->
    <link href="${path}/a01_com/assets/css/a08_todoadd.css" rel="stylesheet" type="text/css" />
    <link href="${path}/a01_com/assets/css/style.css" rel="stylesheet" type="text/css" />
    
    <!-- App css -->
    <link href="${path}/a01_com/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${path}/a01_com/assets/css/icons.css" rel="stylesheet" type="text/css" />
    <link href="${path}/a01_com/assets/css/metismenu.min.css" rel="stylesheet" type="text/css" />
    <link href="${path}/a01_com/assets/css/app.css" rel="stylesheet" type="text/css" />

</head>
<body id="body">
	
	<div id="wrapper">
		<div class="content">
			<div class="container-fluid" id="container-fluid">
				<div class="titleBox">
					<h2 class="page-title float-left" id="title">Add Hidden work card</h2>
				</div>
				
				<div class="cardBox">
				<c:forEach var="todo" items="${todolist}" varStatus="sts">
					<div class="workCard" id="${todo.taskid }">
						<span>${todo.dateEnd }</span>
						<span>${todo.name }</span>
						<span class="btnBox">
							<button type="button" class="btn btn-rounded btn-sm detailBtn">Detail</button>
							<button type="button" class="btn btn-rounded btn-sm addBtn">Add</button>
						</span>	
							
					</div>
				</c:forEach>
					
					<div class="clsBox">
						<button type="button" class="btn btn-rounded btn-sm" id="clsBtn">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
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
		<script type="text/javascript">
		
			// Ajax로 Workcard 등록 업데이트 처리 
			$(document).ready(function(){
				
				$(".addBtn").click(function(){
					var taskid = $(this).parents(".workCard").attr('id');
					//alert(taskid);
					$.ajax({
		                type:"post",
		                url:"todolist.do?method=show&taskid="+taskid,
		                dataType:"json"
		             });    
					opener.location.reload();
					window.close();
				});
				
				$("#clsBtn").click(function(){
					alert("종료하시겠습니까?");
					window.close();
				});
			});
		</script>
</body>
</html>