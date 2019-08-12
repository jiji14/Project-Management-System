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
      <div id="wrapper">
		<!-- header -->
		<aside>
			<jsp:include page="a04_sidebar.jsp" />
		</aside>
		
	<div class="contain">
			<jsp:include page="a04_header.jsp" />
			<div class="subbar">
				<div><input type="text" placeholder="프로젝트 검색" id="search"/>
				<input type="button" class="btn btn-info" value="검색"/></div>
			</div>
	<div class="container">
		<form:form commandName="project" method="post" class="project" id="addPrj">
		<form:hidden path="prjno" class="prjno" name="prjno" />
			<div class="input-group mb-3">
			<div class="input-group-pretend">
					<span class="input-group-text">프로젝트명</span>
				</div>
				<form:input path="prjname" class="form-control" id="prjname" placeholder="새 프로젝트" />
				<div class="input-group-pretend">
					<span class="input-group-text">진행상태</span>
				</div>
				<form:select path="prjstatus" class="form-control" id="prjstatus">
					<form:option value="계획됨"></form:option>
					<form:option value="진행중"></form:option>
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
				 <form:textarea rows="10" path="description" class="form-control" placeholder="내용입력하세요"/>
				<form:hidden path="memno" name="memno" class="memno" value="${memno}" />
			</div>
			
			<div class="input-group mb-3">
				<div class="input-group-pretend">
					<label class="input-group-text" for="stdate">시작일</label>
				</div>
    		 	<form:input path="stdate" class="form-control" id="stdate" readonly="readonly" autocomplete="off" />
    		 	
				<div class="input-group-pretend">
					<label class="input-group-text" for="duedate">마감일</label>
				</div>

    		 	<form:input path="duedate" class="form-control" id="duedate" readonly="readonly" autocomplete="off" />
    		 	<div class="input-group-prepend">
      				<span class="input-group-text">클라이언트</span>
      			</div>
      		<form:input path="client" class="form-control" placeholder="클라이언트" />
			</div>
					
			 <div style="text-align:center;">
            <input  type="button" class="btn btn-info" 
            value="프로젝트 등록" id="regBtn"/>   
            <!--  input  type="button" class="btn btn-info" 
            value="프로젝트 등록" id="onlyBtn"/-->   
            <input  type="button" class="btn btn-primary"
            value="조회화면" id="schBtn"/>
      </div>      
		</form:form>	
		
		<!-- 멤버추가페이지 -->
	
	<form:form commandName="members" method="post" action="${path}/project.do?method=minsert" class="memForm">
		<h3 class="addFormDis">멤버 등록</h3>
	<div class="addMem" id="addMem0">
		<form:hidden path="memno" name="memno" class="memno" value="${id}"/>
			<div class="input-group mb-3 formethod" >
				<div class="input-group-pretend">
					<span class="input-group-text">아이디</span>
				</div>
				<input name="prjno" type="hidden" class="form-control prjno"  />
				<form:input path="id" list="actmembers" class="form-control id" value="${id}" readonly="true"/>
				<datalist id="actmembers">
      		<c:forEach var="act" items="${addMem}">
			<option value="${act.id}">
            </c:forEach>
			</datalist>
			<div class="overlap btn-outline-info btn">중복확인</div>
				<div class="input-group-pretend">
					<span class="input-group-text">권한</span>
				</div>
				<form:select path="auth" class="form-control auth">
				<form:option value="admin"></form:option>
				<form:option value="member"></form:option>
				</form:select>
				
			</div>
		</div>	
		</form:form>
	<div style="text-align:center;" class="addFormDis">
	     <input type="button" class="btn btn-outline-success addForm" value="멤버추가" />  
	     <input type="button" class="btn btn-info" value="등록" id="memRegBtn"/>  
	</div>
      </div>      
		</div>
		</div>
	
	
	
</body>
<%

%>
<script type="text/javascript">

var real = "";
var idList = [];
var checkId = "";
var callCheckId;
var idNum = 1;

function callCheckId(clsId){
	//alert("펑션안에서 clsId:"+clsId);
	var success = "";
	
	// Array 초기화
	idList = [];
	// addMem 불러오기
	//var addMem = document.querySelectorAll(".addMem");

	// 배열안에 담기
	$(".addMem").each(function(idx){
		var id = $(this).find("#id").val();
		idList.push(id);
		console.log(idList);
	});


	
	$.ajax({
		type:"post",
		url:"${path}/project.do?method=overlap",
		data:"idVal="+clsId,
		async: false,
		dataType:"json",
		success:function(data){
				 var cess = data.isSucess;
				 
				if(cess=="yes"){// 존재하는 회원, 사용가능
				$(".addMem:last-child .memno").val(data.memno);
					var x =0;
					for(cnt in idList){ //현재 중복검사하는 아이디와 전체 아이디 리스트를 비교
						if(clsId==idList[cnt]){ //같은 값이 있으면
							x++;	// 더해준다
							//alert(idList[cnt]);
						}
					}
					if(x>=2){ //만약 같은게 2개 이상이면
						alert("이미 등록된 아이디 입니다");
						// real=no는 사용할 수 없다는 것
						success="no";
					}else{
						success = "yes";
						alert("아이디 사용가능");
						$(this).closest(".addMem").find(".id").addClass("on");
						$(".addMem:last-child .overlap").css("display", "none");
						$(".addMem:last-child .id").prop("readonly", true);
						
					}
				
				}else if(cess=="no"){ // 존재하지 않는 회원이면
					alert("존재하지 않는 아이디입니다");
					success="no";
				}
		},
		error:function(error){
			console.log(error);
		}		
	});
	//alert(success);
	return success;
}


$(document).ready(function(){
	
	
	$("#stdate").datepicker({
		dateFormat:"yy/mm/dd",
		numberOfMonths:2,
		minDate: 0,
		onClose: function( selectedDate ) {    
            // 시작일(fromDate) datepicker가 닫힐때
            // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
            $("#duedate").datepicker( "option", "minDate", selectedDate );
        }       
	});
	
	$("#duedate").datepicker({
		dateFormat:"yy/mm/dd",
		numberOfMonths:2,
		minDate: 0, // 오늘 이전 날짜 선택 불가
        onClose: function( selectedDate ) {
            // 종료일(toDate) datepicker가 닫힐때
            // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
            $("#stdate").datepicker( "option", "maxDate", selectedDate );
        }                
	});
	
		
	var idx=0;
	$("#regBtn").click(function(){
		if($("#prjname").val()==""){
			alert("제목을 입력하세요");
		}else if($("#stdate").val()==""){
			alert("시작일을 입력하세요");
		}else if($("#duedate").val()==""){
			alert("마감일을 입력하세요");
		}else{
		//$("#addPrj").attr("action","${path}/project.do?method=insert");
		$.ajax({
			type:"post",
			url:"${path}/project.do?method=insert",
			data:$("#addPrj").serialize(),
			dataType:"json",
			success:function(data){
				//alert($(data.pro));
				$(".prjno").val(data.pro);
			},
			error:function(error){
				console.log(error);
			}
		});
			$(".addFormDis").css({
				"display":"block"
			});
			$(".addMem").animate({
				"opacity":"1",
				"margin-left":"0"
			},400);
		}
	});
	
	
	$("#onlyBtn").click(function(){
		alert("프로젝트가 등록됩니다");
		$.ajax({
			type:"post",
			url:"${path}/project.do?method=insert",
			data:$("#addPrj").serialize(),
			dataType:"json",
			success:function(data){
				$("#rePrj").val(data.pro);
				window.location.href = "${path}/project.do?method=list";

			},
			error:function(error){
				console.log(error);
			}
		});
	});
	
	
	
	//아이디 중복확인 비슷
	$(document).on("click",".overlap",function(){
		var clsId = $(this).closest(".addMem").find(".id").val();
		//alert(clsId);
		checkId = callCheckId(clsId);
		//idVal = $(".addMem:last-child .id").val();
	});
	
	
	/* $(".addForm").click(function(){ 
		alert("클릭");
		if($("#id").val()==''){
			alert("입력해라")
		}else{
		$(".addMem:last-child").clone().appendTo(".container");
		}
			
	}); */
	
	
	 $(document).on("click",".addForm",function(){
		
		//alert(checkId);
		//alert(idList.length);
		console.log(idList);
//		alert($(".on").length);
		/*  var idAll = document.getElementsByClassName("id").value; */
		 if($(".addMem:last-child .id").val()==""){
				alert("아이디를 입력하세요");
		}else{ //빈칸이 아닐때
			if(checkId=="yes"){//아이디가 존재하면
					$(".addMem:last-child").clone().appendTo(".memForm");
					$(".addMem:last-child").find(".id").removeClass("on");
					$(".addMem:last-child .id").prop("readonly",false).val("");
					$(".addMem:last-child .overlap").css("display", "block");
					$(".addMem:last-child").attr('id','addMem'+(idNum++)); 
					checkId = "no";
			}else{
				alert("멤버 중복확인 진행후 다음멤버 추가 가능합니다.");
			}
		}
		//$(this).Children("#id").val("");
	}); 
	
	$("#schBtn").click(function(){
		if(confirm("내용이 저장되지 않습니다\n 등록화면을 나가시겠습니까?")){
			window.location.href = "${path}/project.do?method=list";
		}
	});
	
	
	$("#memRegBtn").click(function(){
		if(checkId == "yes"){
			//var cnt = $(".addMem").size();
			//alert(cnt);
			var memno = [];
			var prjno = [];
			var auth = [];
			$(".addMem").each(function(idx){
	        // 해당 체크박스의 Value 가져오기
	        memno.push($("input[name=memno][idx]").val());
		    prjno.push($("input[name=prjno][idx]").val());
		    auth.push($("input[name=auth][idx]").val());
	        
	      	});
		
			//alert(memno.length);
			//alert(prjno.length);
			//alert(auth.length);
			
			
			$(".memForm").submit();
		}else{
			alert("아이디 중복확인 후 진행해주세요.");
			return;
		}
	});
	
	// 멤버 삭제
	 var div = "<div class='delBtn btn btn-outline-secondary'>삭제</div>";
    $(".formethod").append(div); //list라는 아이디에 html을 추가해라
    
    $(document).on("click", ".delBtn", function() { //list안의 btnDel을 선택
    	//alert($(".addMem").size());
    if($(this).closest(".addMem").index()==1){
    	alert("생성자는 프로젝트 필수 멤버입니다");
    }else{
   	   	checkId = "yes"
   	   	   	
   	  // 지정 : 
   		 var isCheck = true;
   		 $(".addMem").each(function(idx){
   			if($(this).find(".overlap").css("display", "none")){
   				isCheck = false;
   			}
   		  });
   			  
   		if(isCheck){
   			//$(this).closest(".overlap").css("display", "none");
   	   	   	$(".addMem").each(function(idx){
   	   	   		for(i in idList){
   	   	   			if($(this).find("#id").val() == idList[i]){
   	   	   				checkId = "no"
   	   	   				//alert("no");
   	   	   			}
   	   	   		}
   	   	   	});
   		}
   			
   	   	
    	$(this).closest('.addMem').find(".id").removeClass("on");
   	   	$(this).closest('.addMem').remove(); //this(btnDel)의 부모(td)의 부모(tr)를 삭제
   	 	
   		$(".addMem").each(function(idx){
   			$(".addMem:last-child .overlap").css("display", "block");
   	   		for(i in idList){
   	   			if($(".addMem:last-child").find("#id").val() == idList[i]){
   	   				$(".addMem:last-child .overlap").css("display", "none");
   	   			}
   	   		}
   	   	});
   	   	
   	   	
   	   	if($(".addMem").length == 1){
   	   		checkId = "yes";
   	   	}

    }
    //alert("클릭은되니?");
   	  });  
    
    // memno가져오기

});


</script>
</html>