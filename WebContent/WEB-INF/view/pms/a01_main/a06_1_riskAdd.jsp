<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,java.net.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<c:set var ="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value = "utf-8"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <style type="text/css">
      html,body{
         height:100%;
         margin:0;
         padding:0;
      }
      #content-page{
         display: flex;
         flex-direction: row;
         padding:0;
         margin:0;
         margin-top:20px;
      }
      #content{
         margin:0 auto;
         width:600px;
      }
      #riskTop, #possibleTop, #statusTop{
         display: flex;
         flex-direction: row;
         align-items: baseline;
      }
      #riskDiv, #possibleDiv, #statusDiv{
         display: flex;
         flex-direction: row;
         align-items: center;
      }
      .col-form-label{
      	text-align:center;
      }
      #riskDiv>.custom-radio, #possibleDiv>.custom-radio, #statusDiv>.custom-radio{
         margin-right:10px;
      }
      #prjBtn:hover, #ownerBtn:hover{
		background-color: #6acad9 !important;
    	border-color: #bc2dc3 !important;
    	}
    
   </style>
   
        <!-- your custom css -->
        <link href="${path}/a01_com/assets/css/a06_risk.css" rel="stylesheet" type="text/css" />
        <link href="${path}/a01_com/assets/css/style.css" rel="stylesheet" type="text/css" />

        <!-- App favicon -->
        <link rel="shortcut icon" href="${path}/a01_com/assets/images/favicon.ico">

        <!--Morris Chart CSS -->
        <link rel="stylesheet" href="${path}/a01_com/plugins/morris/morris.css">

        <!-- sweet alerts -->
        <link href="${path}/a01_com/plugins/sweet-alert2/sweetalert2.min.css" rel="stylesheet">

        <!-- App css -->
        <link href="${path}/a01_com/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${path}/a01_com/assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="${path}/a01_com/assets/css/metismenu.min.css" rel="stylesheet" type="text/css" />
        <link href="${path}/a01_com/assets/css/app.css" rel="stylesheet" type="text/css" />
        <script src="${path}/a01_com/assets/js/modernizr.min.js"></script>
</head>
<body>

      <!-- Begin page -->
      <div class="containerDiv">

          <!-- ============================================================== -->
          <!-- Start right Content here -->
          <!-- ============================================================== -->
          <div class="content-page" id="content-page">
              <!-- Start content -->
              <div class="content" id="content">
                  <div class="container-fluid">

                      <div class="row" id="row">
                          <div class="col-12">
                              <div class="card">
                                  <div class="card-header">
                                      <h2 class="m-t-0 header-title mb-0">리스크 등록</h2>
                                  </div>
                                  <div class="card-body">
                                      <div>
                                         <form:form commandName="risk" enctype="multipart/form-data" method="post" action="${path}/risk.do?method=add" >   
											<!-- 1. prj hidden처리 -->
											<input type="hidden" name="prjno" class="form-control" value="${prjno}" />
											
                                          	<!-- 2. 제목 -->
                                             <div class="form-group row">
                                                  <label class="col-2 col-form-label">제목</label>
                                                  <div class="col-10">
                                                     <form:input path="title" class="form-control" placeholder="제목을 입력하세요" />        
                                                  </div>
                                              </div>
                                          	
                                          	<!-- 3. 관련업무 -->
 											 <div class="form-group row">
                                                 <label class="col-2 col-form-label">관련 업무</label>
                                                  <div class="col-10">
                                                      <div class="input-group mb-3">
                                                          <div class="input-group-prepend">
	                                                          <form:select path="taskname"  id="prjBtn" class="form-control btn btn-primary waves-effect waves-light dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                                                          <form:option value="미정" class="dropdown-item">
		                                                          	미정
		                                                          </form:option>
		                                                          <c:forEach var="task" items="${taskList}">
			                                                          <form:option value="${task.name}" class="dropdown-item">
			                                                          	${task.name}
			                                                          </form:option>
		                                                          </c:forEach>
	                                                          </form:select>
                                                          </div>
                                                          	
                                                          <!--위에서 선택하면 자동으로 채어짐 -->
                                                          <input type="text" id="whatProject" placeholder="미정" class="form-control" value="" aria-label="" aria-describedby="basic-addon1">
                                                      </div>
                                                  </div>
                                              </div>  
                                              
                                 			 <!-- 4. 내용적는 구간 -->
                                              <div class="form-group row">
                                                  <label class="col-2 col-form-label">내용</label>
                                                  <div class="col-10">
                                                     <form:textarea rows="10" path="description" class="form-control" placeholder="해당 리스크에 관한 내용을 입력하세요"/>
                                                    
                                                  </div>
                                              </div>
                                              
											<!-- 5. 위험도 -->
											<div class="form-group row" id="riskTop">
												<label class="col-2 col-form-label">위험도</label>
												<div class="col-10">
													<div class="mt-3" id="riskDiv">
														<div class="custom-control custom-radio">
															<form:radiobutton id="riskRadio1" class="custom-control-input" path="riskdegree" value="높음"/> 
															<label class="custom-control-label text-s" for="riskRadio1">높음</label>
														</div>
														<div class="custom-control custom-radio">
															<form:radiobutton id="riskRadio2" class="custom-control-input" path="riskdegree" value="중간"/>
															<label class="custom-control-label text-s" for="riskRadio2">중간</label>
														</div>
														<div class="custom-control custom-radio">
															<form:radiobutton id="riskRadio3" class="custom-control-input" path="riskdegree" value="낮음"/>
														<label class="custom-control-label text-s" for="riskRadio3">낮음</label>
														</div>
													</div>
												</div>
											</div>

											<!-- 6. 발생 가능성 -->
											<div class="form-group row" id="possibleTop">
												<label class="col-2 col-form-label">발생가능성</label>
												<div class="col-10">
													<div class="mt-3" id="possibleDiv">
														<div class="custom-control custom-radio">
															<form:radiobutton id="possibleRadio1" class="custom-control-input" path="posibility" value="높음"/>
															<label class="custom-control-label text-s" for="possibleRadio1">높음</label>
														</div>
														<div class="custom-control custom-radio">
															<form:radiobutton id="possibleRadio2" class="custom-control-input" path="posibility" value="중간"/>                       
															<label class="custom-control-label text-s" for="possibleRadio2">중간</label>
														</div>
														<div class="custom-control custom-radio">
															<form:radiobutton id="possibleRadio3" class="custom-control-input" path="posibility" value="낮음"/> 
															<label class="custom-control-label text-s" for="possibleRadio3">낮음</label>
														</div>
													</div>
												</div>
											</div>   
                                                                                                                
                                  			<!-- 7. 담당자선택 -->
                                             <div class="form-group row">
                                                 <label class="col-2 col-form-label">담당자</label>
                                                  <div class="col-10">
                                                      <div class="input-group mb-3">
                                                      	 <div class="input-group-prepend">
	                                                    	  <form:select path="owner" id="ownerBtn" class="form-control btn btn-primary waves-effect waves-light dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                                                          <form:option value="미정" class="dropdown-item">
		                                                          	미정
		                                                          </form:option>
		                                                          <c:forEach var="mem" items="${mlist}">
			                                                          <form:option value="${mem.name}" class="dropdown-item">
			                                                          	${mem.name}
			                                                          </form:option>
		                                                          </c:forEach>
	                                                          </form:select>
                                                          </div>
                                                          	
                                                          <!--위에서 선택하면 자동으로 채어짐 -->
                                                          <input type="text" id="whatOwner" class="form-control" placeholder="미정" value="" aria-label="" aria-describedby="basic-addon1">
                                                      </div>
                                                  </div>
                                              </div>
                                              
											  <!-- 8. solutionPlan -->
                                              <div class="form-group row">
                                                  <label class="col-2 col-form-label">해결 계획</label>
                                                  <div class="col-10">
                                                     <form:textarea rows="10" path="solutionPlan" class="form-control" placeholder="해당 리스크를 어떻게 해결할 것인지 입력하세요."/>
                                                  </div>
                                              </div>
                                              
                                              <!-- 8. canhappen -->
                                              <div class="form-group row">
                                                  <label class="col-2 col-form-label">발생 가능 이슈</label>
                                                  <div class="col-10">
                                                     <form:textarea rows="10" path="canhappen" class="form-control" placeholder="해당 리스크가 발생했을시 추후에 일어날수 있는 이슈를 입력하세요."/>
                                                  </div>
                                              </div>
                                              
                                              <!-- 8. updateIssue -->
                                              <div class="form-group row">
                                                  <label class="col-2 col-form-label">업데이트 상황 </label>
                                                  <div class="col-10">
                                                     <form:textarea rows="10" path="updateIssue" class="form-control" placeholder="해당 리스크 등록 후 업데이트가 된 내용을 입력하세요."/>
                                                  </div>
                                              </div>
                                              
                                              <!-- 8. realSolution -->
                                              <div class="form-group row">
                                                  <label class="col-2 col-form-label">해결 방법</label>
                                                  <div class="col-10">
                                                     <form:textarea rows="10" path="realSolution" class="form-control" placeholder="해당 리스크를 실제로 해결한 방법을 입력하세요."/>
                                                  </div>
                                              </div>
                          							
											  <!-- 9. 상태 -->
											  <div class="form-group row" id="statusTop">
												<label class="col-2 col-form-label">상태</label>
												<div class="col-10">
													<div class="mt-3" id="statusDiv">
														<div class="custom-control custom-radio">
															<form:radiobutton id="statusRadio1" class="custom-control-input" path="status" value="진행중"/>
															<label class="custom-control-label text-s" for="statusRadio1">진행중</label>
														</div>
														<div class="custom-control custom-radio">
															<form:radiobutton id="statusRadio2" class="custom-control-input" path="status" value="보류"/>                       
															<label class="custom-control-label text-s" for="statusRadio2">보류</label>
														</div>
														<div class="custom-control custom-radio">
															<form:radiobutton id="statusRadio3" class="custom-control-input" path="status" value="완료"/> 
															<label class="custom-control-label text-s" for="statusRadio3">완료</label>
														</div>
													</div>
												</div>
											</div> 
                               			  <!-- submit -->
                                		  <div class="form-group text-right m-b-0">
                                              <button id="cfBtn" type="submit" class="btn btn-primary waves-effect waves-light" >
                                                     	등록
                                              </button>
                                              <button type="reset" id="exit" class="btn btn-secondary waves-effect m-l-5">
                                                     	종료
                                              </button>
                                          </div>
                                          </form:form>   
                                     </div>         
                                 </div>             
                             </div>                 
                         </div>
                     </div>
                      <!-- end row -->

                  </div> <!-- container -->

              </div> <!-- content -->

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

        <!-- App js -->
        <script src="${path}/a01_com/assets/js/jquery.core.js"></script>
        <script src="${path}/a01_com/assets/js/jquery.app.js"></script>

   <script type="text/javascript">
      
      
      $(document).ready(function(){

    	  
         // 담당자선택
         $("#chargeDiv > .dropdown-item").click(function(){
            $("#inCharge").val(this.innerHTML);
         });
         
         // 관련프로젝트 선택
         $("#prjDiv > .dropdown-item").click(function(){
            $("#whatProject").val(this.innerHTML);
         });
         
         // 등록버튼
         $("#cfBtn").click(function(){ 
        	 
            if(confirm("등록하시겠습니까?")){
            	// 제대로 입력했는지 검증
            	var riskDgr = $("input[name=riskdegree]:checked").val();
            	var posibility = $("input[name=posibility]:checked").val();
            	var status = $("input[name=status]:checked").val();
            	
            	if($("#title").val()==""){
                    alert("제목은 반드시 등록 하여야 합니다.");
                    alert(riskDgr);
                    return false;
                 }
 				if(typeof riskDgr === "undefined"){
                     alert("위험도를 선택해주세요.");
                     return false;
                 }
				if(typeof posibility === "undefined"){
                     alert("발생가능성을 선택해주세요.");
                     return false;
                 }
				if(typeof status === "undefined"){
                    alert("상태를 선택해주세요.");
                    return false;
                }   
            	alert("등록되었습니다.");
            			
            }else{
            	return false;
            }
            window.opener.location.replace("${path}/risk.do?method=list");
			window.close(); 		
         });
         
         // 나가기 버튼
         $("#exit").click(function(event){
        	event.preventDefault();
            event.stopPropagation();
            if(confirm("종료하시겠습니까?")){
                window.close();
            }
         })
         
         $("#prjBtn").change(function(){
       	 	$("#whatProject").val($("#prjBtn option:selected").val())
         });
         
         $("#ownerBtn").change(function(){
        	$("#whatOwner").val($("#ownerBtn option:selected").val()) 
         });
         
      });
      
      
      
   </script>
    </body>
</html>