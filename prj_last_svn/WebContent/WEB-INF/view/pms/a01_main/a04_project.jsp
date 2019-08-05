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
			<div class="subbar">
				<div id="prj">
				<p>새 프로젝트 생성</p>
				<img src="${path}/Velonic_v4.1/Admin/admin_4/assets/images/plus.png" id="img"/>
				</div>
				<div><input type="text" placeholder="프로젝트 검색" id="search"/>
				<input type="button" class="btn btn-info" value="검색"/></div>
			</div>
	
		<form class="form-inline" method="project">
		<label for="prjno">프로젝트번호</label>
		<input class="form-control" id="prjno" name="prjno" value="${param.prjno}"/>
		<label for="prjname">프로젝트명</label>
		<input class="form-control" id="prjname" name="prjname" value="${param.prjname}"/>

		<input  type="submit" class="btn btn-primary" value="검색"/>
		<input  type="button" class="btn btn-info" id="regBtn" value="등록"/>
	</form>
	
	
		<table class="table table-hover table-striped" id="tab">
			<thead class="thead-light">
				<tr><th>No</th><th>프로젝트명</th><th>진행사항</th><th>클라이언트</th>
				<th>마감일</th><th>관리자</th><th>접근권한</th><th>상세보기</th><th>삭제</th></tr>
			</thead>
				<c:forEach var="pro" items="${project}">
					<tr class="prolist"  id="${pro.prjno}" >
					<td><p>${pro.prjno}</p></td>
					<td><p>${pro.prjname}</p></td>
					<td><p>${pro.prjstatus}</p></td>
					<td><p>${pro.client}</p></td>
					<td><p><fmt:formatDate value="${pro.duedate}" /></p></td>
					<td><p>${pro.prjadmin}</p></td>
					<td><p>${pro.permission}</p></td>
					<td><input  type="button" class="btn btn-primary uptBtn" value="상세보기"/></td>
					<td><input  type="button" class="btn btn-danger delBtn" value="삭제"/></td>
					</tr>
				</c:forEach>
		</table>

		

	</div>
	
</div>

<script>
$(document).ready(function() {
	
	var prjnum = "${sessionScope.mem.prjno}";
	var prjprjno = $(".prolist").attr("id");
	//alert(prjprjno);
	
	$("#"+prjnum).css({"background":"rgba(66, 191, 194,0.5)"});
/* 	
	if(prjprjno==prjnum){
			$("#tab tr").css({"background":"none"});
			$("#tab tr:nth-of-type(odd)").css({"background":"rgba(0,0,0,.05)"});
			$("#"+prjnum).css({"background":"rgba(66, 191, 194,0.5)"});
	} */
	$(".uptBtn").click(function(){
		alert($(this).parents(".prolist").attr("id"));
		var prjno = $(this).parents(".prolist").attr("id");
		alert("수정화면"+prjno);
		var win01 = window.open("${path}/project.do?method=detail&prjno="+prjno,"", "width=900, height=800");
    	win01.moveTo(500,100);
	});
	$(".delBtn").click(function(){
		alert($(this).parents(".prolist").attr("id"));
		var prjno = $(this).parents(".prolist").attr("id");
		//alert("수정화면"+prjno);
		$(location).attr("href","${path}/project.do?method=delete&prjno="+prjno);
	});
	
	$("#prj").mouseover(function(){
		$(this).css({
			"background":"#73d8d3"
		});
		$("#prj p").css({
			"color":"white"
		});
	}).mouseout(function(){
		$(this).css({
			"background":"#e3e3e3"
		});
		$("#prj p").css({
			"color":"#42bfc2"
		});
	});
	$("#prj").click(function(){
		$(location).attr("href","${path}/project.do?method=insertForm");		
	});
	$("#tab tr").dblclick(function(){
		var prjproc = $(this).attr("id");
			//var prjproc = $(this).attr("id");
			$.ajax({
				type:"post",
				url:"${path}/project.do?method=proc",
				data:"prjproc="+prjproc,
				dataType:"json",
				success:function(data){
					prjprjno=data.mem.prjno;
						$("#tab tr").css({"background":"none"});
						$("#tab tr:nth-of-type(odd)").css({"background":"rgba(0,0,0,.05)"});
						$("#"+prjprjno).css({"background":"rgba(66, 191, 194,0.5)"});
						
						alert(prjproc);
						 if(prjprjno==prjnum){
								$("#tab tr").css({"background":"none"});
								$("#tab tr:nth-of-type(odd)").css({"background":"rgba(0,0,0,.05)"});
								$("#"+prjnum).css({"background":"rgba(66, 191, 194,0.5)"});
						}

				},
				error:function(error){
					console.log(error);
				}
				
	});
	});
});
	</script>


</body>
</html>