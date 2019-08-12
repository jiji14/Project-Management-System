<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,java.net.*"
    import="z01_vo.*,c01_database.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Velonic - Responsive Bootstrap 4 Admin Dashboard Template</title>
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />

        <!-- App favicon -->
        <link rel="shortcut icon" href="${path }/Velonic_v4.1/Admin/admin_4/assets/images/favicon.ico">

        <!--Morris Chart CSS -->
        <link rel="stylesheet" href="${path }/Velonic_v4.1/Admin/plugins/morris/morris.css">
		 <!--calendar css-->
        <link href="${path }/Velonic_v4.1/Admin/plugins/fullcalendar/css/fullcalendar.min.css" rel="stylesheet" />

        <!-- sweet alerts -->
        <link href="${path }/Velonic_v4.1/Admin/plugins/sweet-alert2/sweetalert2.min.css" rel="stylesheet">

        <!-- App css -->
        <link href="${path }/Velonic_v4.1/Admin/admin_4/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${path }/Velonic_v4.1/Admin/admin_4/assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="${path }/Velonic_v4.1/Admin/admin_4/assets/css/metismenu.min.css" rel="stylesheet" type="text/css" />
        <link href="${path }/Velonic_v4.1/Admin/admin_4/assets/css/app.css" rel="stylesheet" type="text/css" />
        <!-- your custom css -->
        <link href="${path }/Velonic_v4.1/Admin/admin_4/assets/css/style.css" rel="stylesheet" type="text/css" />
        <link href="${path }/Velonic_v4.1/Admin/admin_4/assets/css/sjStyle.css" rel="stylesheet" type="text/css" />
		
        <script src="${path }/Velonic_v4.1/Admin/admin_4/assets/js/modernizr.min.js"></script>
        <script type="text/javascript" src="${path }/Velonic_v4.1/Admin/admin_4/assets/js/jquery-3.4.1.js"></script>
		 
    </head>
<body>
    <div id="wrapper">
		<!-- header -->
		<aside>
			<jsp:include page="a04_sidebar.jsp" />
		</aside>
	
	<div class="contain">
			<jsp:include page="a04_header.jsp" />
			<!-- 사용할 content부분 -->
			<div class="contents">
				<div class="inner">
				<div class="cre_per">업무승인요청</div>
					<!-- 달력 부분-->
	  					<div id='calendar'></div>
        		</div>
        		<div class="inner">
        		<h4 class="cls_h4" id="first_h4">요청 미승인 건</h4>
        		<!-- <div class="btn btn-outline-secondary choice" id="choice_1">+ 더보기</div> -->
        		<table class="table table-hover" id="permit_tab">
						<thead class="thead-light">
							<tr><th>요청번호</th><th>프로젝트번호</th><th>요청내용</th><th>요청일</th><th>멤버번호</th><th>상세보기</th></tr>
						</thead>
							<c:forEach var="per" items="${permit}">
								<tr class="permitList" id="${per.taskid}">
								<td><p>${per.taskid}</p></td>
								<td><p>${per.prjno}</p></td>
								<td><p>${per.name}</p></td>
								<td><p>${per.uptdate}</p></td> 
								<td><p>${per.memno}</p></td>
								<td><input  type="button" class="btn btn-primary uptBtn" value="${per.isread}"/></td>
								</tr>
							</c:forEach>
					</table>
        			
					<br>
					<!-- 여기는 반려건 -->
        		<h4 class="cls_h4">승인반려 건</h4>
        		<!-- <div class="btn btn-outline-secondary choice" id="choice_2">+ 더보기</div> -->
        			<table class="table table-hover" id="permit_tab">
						<thead class="thead-light">
							<tr><th>요청번호</th><th>프로젝트번호</th><th>요청내용</th><th>요청일</th><th>멤버번호</th><th>수정/삭제</th></tr>
						</thead>
							<c:forEach var="per" items="${reject}">
								<tr class="permitList" id="${per.taskid}">
								<td><p>${per.taskid}</p></td>
								<td><p>${per.prjno}</p></td>
								<td><p>${per.name}</p></td>
								<td><p>${per.uptdate}</p></td> 
								<td><p>${per.memno}</p></td>
								<td><input  type="button" class="btn btn-info uptBtn" value="수정/삭제"/></td>
								</tr>
							</c:forEach>
					</table>
					<br>
					
					
					<!-- 여기는 승인처리건 -->
        		<h4 class="cls_h4">요청완료 건</h4>
        		<!-- <div class="btn btn-outline-secondary choice" id="choice_3">+ 더보기</div> -->
        			<table class="table table-hover" id="permit_tab">
						<thead class="thead-light">
							<tr><th>요청번호</th><th>프로젝트번호</th><th>요청내용</th><th>요청일</th><th>멤버번호</th><th>삭제</th></tr>
						</thead>
							<c:forEach var="per" items="${done}">
								<tr class="permitList" id="${per.taskid}">
								<td><p>${per.uptdate}</p></td>
								<td><p>${per.prjno}</p></td>
								<td><p>${per.name}</p></td>
								<td><p>${per.uptdate}</p></td> 
								<td><p>${per.memno}</p></td>
								<td><input  type="button" class="btn btn-danger delBtn" value="삭제"/></td>
								</tr>
							</c:forEach>
					</table>
        		
        		</div>
        		</div>
			</div>
	</div>
	
<!-- jQuery  -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/metisMenu.min.js"></script>
<script src="assets/js/waves.js"></script>
<script src="assets/js/jquery.slimscroll.js"></script>

<!-- Jquery-Ui -->
<script src="${path }/Velonic_v4.1/Admin/plugins/jquery-ui/jquery-ui.min.js"></script>

<script src="${path }/Velonic_v4.1/Admin/plugins/moment/moment.js"></script>
<script src="${path }/Velonic_v4.1/Admin/plugins/fullcalendar/js/fullcalendar.min.js"></script>

<!--dragging calendar event-->
<script src="${path }/Velonic_v4.1/Admin/admin_4/assets/pages/calendar-init.js"></script>

<!-- App js -->
<script src="${path }/Velonic_v4.1/Admin/admin_4/assets/js/jquery.core.js"></script>
<script src="${path }/Velonic_v4.1/Admin/admin_4/assets/js/jquery.app.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$(".uptBtn").each(function(){
		if($(this).val()=="미확인"){
			$(this).removeClass("btn-primary").addClass("btn-warning");
		}
	});
	// 승인만 어떻게 처리 좀 합시다!
	$(".uptBtn").click(function(){
//		alert($(this).parents(".permitList").attr("id"));
		var taskId = $(this).parents(".permitList").attr("id");
		
		window.open("${path}/permit.do?method=detail&taskId="+taskId,"permitDetail","width=900, height=500");
		win.moveTo(500,100);
		
	});
	
	$(".delBtn").click(function(){
		taskId = $(this).parents(".permitList").attr("id");
		
		$.ajax({
			type:"post",
			url:"${path}/permit.do?method=uptProc",
			data:"taskId="+taskId,
			dataType:"json",
			success:function(data){
				//페이지띄우는 자바스크립트작성
				alert(data.isSucc);
				if(data.isSucc == "ok"){
					var win = window.open("${path}/permit.do?method=detail&taskId="+taskId,"permitDetail","width=900, height=800");
					win.moveTo(500,100);
				}else{
					alert("일시적 오류입니다. 다시시도해주세요.");
				}
				
			}
		
		});
		
	});
	
	

});
</script>

</html>