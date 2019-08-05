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
        		<div class="btn btn-outline-secondary choice" id="choice_1">+ 더보기</div>
        		<table class="table table-hover" id="permit_tab">
        			<col width="15%">
        			<col width="40%">
        			<col width="15%">
        			<col width="15%">
        			<col width="8%">
						<thead class="thead-light">
							<tr><th>요청일</th><th>요청처리내용</th><th>진행사항</th><th>승인일</th><th>요청취소</th></tr>
						</thead>
								<tr class="prolist">
								<td>2019.07.01</td>
								<td>3차 피드백건</td>
								<td>검토중</td>
								<td></td>
								<td><input  type="button" class="btn btn-warning delBtn" value="요청취소"/></td>
								</tr>
								<tr class="prolist">
								<td>2019.07.01</td>
								<td>3차 피드백건</td>
								<td>검토중</td>
								<td></td>
								<td><input  type="button" class="btn btn-warning delBtn" value="요청취소"/></td>
								</tr>
								<tr class="prolist">
								<td>2019.07.01</td>
								<td>3차 피드백건</td>
								<td>검토중</td>
								<td></td>
								<td><input  type="button" class="btn btn-warning delBtn" value="요청취소"/></td>
								</tr>
					</table>
        			
					<br>
					<!-- 여기는 반려건 -->
        		<h4 class="cls_h4">승인반려 건</h4>
        		<div class="btn btn-outline-secondary choice" id="choice_2">+ 더보기</div>
        			<table class="table table-hover" id="permit_tab">
        			<col width="15%">
        			<col width="40%">
        			<col width="15%">
        			<col width="15%">
        			<col width="8%">
						<thead class="thead-light">
							<tr><th>요청일</th><th>요청처리내용</th><th>진행사항</th><th>승인일</th><th>삭제</th></tr>
						</thead>
								<tr class="prolist">
								<td>2019.07.01<br>AM 11:15</td>
								<td>제안서</td>
								<td>반려</td>
								<td>2019.07.03 PM 02:07</td>
								<td><input  type="button" class="btn btn-secondary delBtn" value="수정"/></td>
								</tr>
								<tr class="prolist">
								<td>2019.07.01<br>AM 11:15</td>
								<td>1차 피드백건</td>
								<td>반려</td>
								<td>2019.07.03 PM 02:07</td>
								<td><input  type="button" class="btn btn-secondary delBtn" value="수정"/></td>
								</tr>
					</table>
					<br>
					<!-- 여기는 승인처리건 -->
        		<h4 class="cls_h4">요청완료 건</h4>
        		<div class="btn btn-outline-secondary choice" id="choice_3">+ 더보기</div>
        			<table class="table table-hover" id="permit_tab">
        			<col width="15%">
        			<col width="40%">
        			<col width="15%">
        			<col width="15%">
        			<col width="8%">
						<thead class="thead-light">
							<tr><th>요청일</th><th>요청처리내용</th><th>진행사항</th><th>승인일</th><th>삭제</th></tr>
						</thead>
								<tr class="prolist">
								<td>2019.07.01<br>AM 11:15</td>
								<td>제안서</td>
								<td>승인완료</td>
								<td>2019.07.03 PM 02:07</td>
								<td><input  type="button" class="btn btn-danger delBtn" value="삭제"/></td>
								</tr>
								<tr class="prolist">
								<td>2019.07.01<br>AM 11:15</td>
								<td>1차 피드백건</td>
								<td>승인완료</td>
								<td>2019.07.03 PM 02:07</td>
								<td><input  type="button" class="btn btn-danger delBtn" value="삭제"/></td>
								</tr>
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



</html>