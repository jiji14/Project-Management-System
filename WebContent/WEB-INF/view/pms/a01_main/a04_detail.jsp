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
        <link href="${path }/Velonic_v4.1/Admin/admin_4/assets/css/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
		
		
        <script src="${path }/Velonic_v4.1/Admin/admin_4/assets/js/modernizr.min.js"></script>
        <script type="text/javascript" src="${path }/Velonic_v4.1/Admin/admin_4/assets/js/jquery-3.4.1.js"></script>
         <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    	<script src="${path }/Velonic_v4.1/Admin/admin_4/assets/js/jquery-ui-1.10.3.custom.min.js"></script>

    </head>
<body>
<% 

%>
	<div class="container" id="detail">
	
	<form:form commandName="project" method="post" >	
		<div class="input-group mb-3">
			<div class="input-group-pretend">
					<span class="input-group-text">프로젝트명</span>
				</div>
				<form:hidden path="prjno" id="prjno" value="${param.prjno }"/>
				<form:input path="prjname" class="form-control" id="prjname" value="${param.prjname }" />
				<div class="input-group-pretend">
					<span class="input-group-text">진행상태</span>
				</div>
				<form:select path="prjstatus" class="form-control" id="prjstatus" selected="${param.prjstatus }">
					<form:option value="계획됨"></form:option>
					<form:option value="완료됨"></form:option>
					<form:option value="보류"></form:option>
					<form:option value="취소"></form:option>
					<form:option value="상태없음"></form:option>
				</form:select>
			</div>
			<div class="input-group mb-3">
			<div class="input-group-pretend">
					<span class="input-group-text">상세내용</span>
				</div>
				 <form:textarea rows="10" path="description" class="form-control" value="${param.description }" />
			</div>
			
			<div class="input-group mb-3">
				<div class="input-group-pretend">
					<label class="input-group-text" for="stdate">시작일</label>
				</div>
				<input class="form-control" id="stdate" name="stdate" readonly="readonly" value='<fmt:formatDate value="${project.stdate }" pattern="yyyy/MM/dd"  />'>
				<div class="input-group-pretend">
					<label class="input-group-text" for="duedate">마감일</label>
				</div>
    		 	<input class="form-control" id="duedate" name="duedate" readonly="readonly" value='<fmt:formatDate value="${project.duedate }" pattern="yyyy/MM/dd"  />'>
				<div class="input-group-pretend">
					<label class="input-group-text" for="uptdate">수정일</label>
				</div>
    		 	<input class="form-control" id="uptdate" name="uptdate" readonly="readonly" value='<fmt:formatDate value="${project.uptdate }" pattern="yyyy/MM/dd"  />'>
			</div>
			
			<div class="input-group mb-3">
         		<div class="input-group-prepend">
           		 	<span class="input-group-text">클라이언트</span>
         		</div>
         		<form:input path="client" class="form-control" value="${param.client }" />    
         		<form:hidden path="memno" name="memno" class="memno" value="${memno}"/>
      			</div> 
					
			 <div style="text-align:center;">
            <input  type="button" class="btn btn-warning" 
            value="수정" id="uptBtn"/>   
            <input  type="button" class="btn btn-danger" 
            value="삭제" id="delBtn"/>   
            <input  type="button" class="btn btn-info" 
            value="조회화면" id="schBtn"/>
            
      		</div>
      	</form:form>      
	</div>
	
</body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#stdate").datepicker({
			dateFormat:"yy/mm/dd",
			numberOfMonths:2
		});
		$("#duedate").datepicker({
			dateFormat:"yy/mm/dd",
			numberOfMonths:2
		});
		$("#schBtn").click(function(){
			alert("리스트 화면으로 넘어갑니다\n(수정 버튼을 누르지 않은 경우 정보가 변경되지 않습니다)");
			window.opener.location.reload();
			window.close();
			$(location).attr("href","${path}/project.do?method=list");
		});
		
		$("#uptBtn").click(function(){
			//alert( $("[name=prjno]").length );
			var prjno = $("#prjno").val();
			if(confirm("수정하시겠습니까?")){
				var prjname = $("#prjname").val();
				if(prjname==""){
					alert("제목은 필수요소 입니다!");
					return;
				}
				$("form").attr("action","${path}/project.do?method=update");
				$("form").submit();
				


			}
		});
		$("#delBtn").click(function(){
			alert($("#prjno").val());
			var prjno = $("#prjno").val();
				if(confirm("삭제하시겠습니까?")){
					$("form").attr("action","${path}/project.do?method=delete");
					$("form").submit();
					window.close();
					window.opener.location.reload();
				}
		});
		
		});
</script>
</html>