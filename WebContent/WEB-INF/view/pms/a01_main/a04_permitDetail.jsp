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
		<style type="text/css">
			.input-group{
				width:100%;
				display: flex;
			}
			.input-group-pretend{
				width:20%;
			}
			.content {
				width:80%;
			}
		</style>
    </head>
<body>
<% 

%>
	<div class="container" id="detail">
	
	<form:form commandName="tasks" method="post" >	
		<div class="input-group mb-3">
			<div class="input-group-pretend">
				<span class="input-group-text">task번호</span>
			</div>
			<form:input path="taskid" id="taskid" value="${tasks.taskid}" class="content"/>
		</div>
		<div class="input-group mb-3">	
			<div class="input-group-pretend">
				<span class="input-group-text">프로젝트번호</span>
			</div>
			<form:input path="prjno" id="prjno" value="${tasks.prjno}" class="content"/>
		</div>
		<div class="input-group mb-3">
			<div class="input-group-pretend">
				<span class="input-group-text">내용</span>
			</div>
			<form:input path="description" id="description" value="${tasks.description}" class="content"/>
		</div>	
		<div class="input-group mb-3">
			<div class="input-group-pretend">
				<span class="input-group-text">중요도</span>
			</div>
			<form:input path="importance" id="importance" value="${tasks.importance}" class="content"/>
		</div>
			<input type="hidden" value="${tasks.approval}" id="approval"/>
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
		$("#schBtn").click(function(){
			alert("리스트 화면으로 넘어갑니다\n(수정 버튼을 누르지 않은 경우 정보가 변경되지 않습니다)");
			window.opener.location.reload();
			window.close();
			$(location).attr("href","${path}/permit.do?method=member");
		});
		
		$("#uptBtn").click(function(){
			//alert( $("[name=prjno]").length );
			var prjno = $("#prjno").val();
			if(confirm("수정하시겠습니까?")){
				var prjname = $("#prjname").val();
				var approval = $("#approval").val();
				
				if(approval == "미승인"){
					alert("미승인건은 수정하실수 없습니다. ");
					return;
				}
				
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
			var taskId=$("#taskid").val();
				if(confirm("삭제하시겠습니까?")){
					$.ajax({
						type:"post",
						url:"${path}/permit.do?method=approve",
						data:"taskId="+taskId,
						dataType:"json",
						success:function(data){
							//페이지띄우는 자바스크립트작성
							alert(data.isSucc);
							if(data.isSucc == "ok"){
								window.close();
								window.opener.location.reload();
							}else{
								alert("일시적 오류입니다. 다시시도해주세요.");
							}
							
						}
					
					});
					
					if(approval == "미승인"){
						alert("미승인건은 삭제하실수 없습니다. ");
						return;
					}
				
					
				}
		});
		
		});
</script>
</html>