<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var ="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value = "utf-8"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>멤버 관리 화면</title>
        <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">
        <!-- DataTables -->
        <link href="${path}/a01_com/plugins/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <link href="${path}/a01_com/plugins/datatables/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
        <!-- Responsive datatable examples -->
        <link href="${path}/a01_com/plugins/datatables/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />

        <!-- App css -->
        <link href="${path}/a01_com/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${path}/a01_com/assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="${path}/a01_com/assets/css/metismenu.min.css" rel="stylesheet" type="text/css" />
        <link href="${path}/a01_com/assets/css/app.css" rel="stylesheet" type="text/css" />
        <!-- your custom css -->
        <link href="${path}/a01_com/assets/css/style.css" rel="stylesheet" type="text/css" />
		
		<link rel="stylesheet" href="${path}/a01_com/bootstrap.min.css">
		<link rel="stylesheet" href="${path}/a01_com/jquery-ui.css">
			
        <script src="${path}/a01_com/assets/js/modernizr.min.js"></script>

    </head>

    <body>
	
        <!-- Begin page -->
        <div id="wrapper">
			<jsp:include page="a04_header.jsp" />
			<jsp:include page="a04_sidebar.jsp" />



            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->
            <div class="content-page">
                <!-- Start content -->
                <div class="content">
                    <div class="container-fluid">

                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <h3 class="page-title float-left">멤버 관리
                                    	<button id="plusMember" type="button" name="plusMember" class="btn btn-success">Invite Member</button>
                                    </h3>

                                    <ol class="breadcrumb float-right">
                                        <li class="breadcrumb-item"><a href="#">Velonic</a></li>
                                        <li class="breadcrumb-item"><a href="#">Tables</a></li>
                                        <li class="breadcrumb-item active">Data Table</li>
                                    </ol>

                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->

                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="m-t-0 header-title mb-0">활성화 멤버
                                        </h4>
                                    </div>
                                    <div class="card-body table-responsive">
                                    
                                       <table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <thead>
                                                <tr>
                                                    <th>이름</th>
                                                    <th>이메일</th>
                                                    <th>부서</th>
                                                    <th>직위</th>
                                                    <th>활성화</th>
                                                    <th>권한</th>
                                                </tr>
                                            </thead>
                                            
											<form method="post" class="actForm">
											<c:forEach var="actmembers" items="${actmemberList}">
                                            <tbody>
                                               <tr class="actlist" id="${actmembers.memno}">
                                                	<td>${actmembers.name}</td>
                                                    <td>${actmembers.id}</td>
                                                    <td>${actmembers.dept}</td>
                                                    <td>${actmembers.job}</td>
                                                    <td>
                                                   		<a href="#" class="inactupt">
                                                    	<em><fmt:formatDate value="${actmembers.uptdate}"/></em>
                                                    	<img src="${path}/a01_com/inacticons.png"/>
                                                    	</a>
                                                    </td>
                                                    <td>
                                                    	<select name="auth" class="for-control actselect">
                                                    	<c:if test="${actmembers.auth == 'admin'}">
                                                    		<option value="admin" selected="selected">admin</option>
                                                    		<option value="member">member</option>
                                                    	</c:if>
                                                    	<c:if test="${actmembers.auth == 'member'}">
                                                    		<option value="admin">admin</option>
                                                    		<option value="member" selected="selected">member</option>
                                                    	</c:if>
                                                    	</select>
                                                    </td>
                                                </tr>
                                            </tbody>
                                            </c:forEach>
                                          	</form>
                                            
                                            
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- end row -->


                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="m-t-0 header-title mb-0">비활성화 멤버
                                        </h4>
                                    </div>
                                    <div class="card-body table-responsive">

                                        
                                        <table id="datatable" class="table table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                            <thead>
                                                <tr>
                                                	<th>이름</th>
                                                    <th>이메일</th>
                                                    <th>부서</th>
                                                    <th>직위</th>
                                                    <th>비활성화</th>
                                                    <th>멤버 삭제</th>
                                                </tr>
                                            </thead>
											
											<form method="post" class="inactDel">
											<c:forEach var="inactmembers" items="${inactmemberList}">
											<tbody>
                                               <tr class="mlist" id="${inactmembers.memno}">
                                                    <td>${inactmembers.name}</td>
                                                    <td>${inactmembers.id}</td>
                                                    <td>${inactmembers.dept}</td>
                                                    <td>${inactmembers.job}</td>
                                                    <td>
                                                    	<a href="#" class="actupt">
                                                    	<input type="hidden" name="auth" value="${inactmembers.auth}">
                                                    	<em><fmt:formatDate value="${inactmembers.uptdate}"/></em>
                                                    	<img src="${path}/a01_com/acticons.png" style="text-align:right"/>
                                                    	</a>
                                                    </td>
                                                     <td>
                                                    	<a href="#" class="on-default remove-row delbtn" data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete">
                                                    	<i class="far fa-trash-alt"></i>
                                                    	<span>해당 멤버를 삭제할 경우 클릭</span>
                                                    	</a>
                                                     </td>
                                                </tr>
                                            	</tbody>
                                            </c:forEach>
                                            </form>
                                            
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                      
                        <!-- end row -->
					
				
						<div id="dialog" title="멤버 등록">
							
					<form method="post" id="schForm">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">이메일</span>
								</div>
								
								<input name="id" id="schid" class="form-control" value="" placeholder="이메일 입력"/>	
								<div>
									<input type="button" id="schBtn" class="form-control" value="검색">
								</div>
							</div>	
					</form>
					<form id="addForm" method="post" action="${path}/members.do?method=list">
						<input type="hidden" name="memno" id="memno" />
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">사원명</span>
								</div>
								<input name="name" id="name" class="form-control" readOnly/>
							</div>    
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">이메일</span>
								</div>
								<input name="id" id="id" class="form-control" readOnly/>	
							</div>		    
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">직책</span>
								</div>
								<input name="job" id="job" class="form-control" readOnly/>	
							</div>		    
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">부서</span>
								</div>
								<input name="dept" id="dept" class="form-control" readOnly/>	
							</div>	
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">권한</span>
								</div>
								<select name="auth" id="auth" class="form-control">
									<option value="member" selected="selected">member</option>
  									<option value="admin">admin</option>
								</select>
							</div>	
					</form>
	    				</div>	
					
					

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
   		<script src="${path}/a01_com/popper.min.js"></script>
		<script src="${path}/a01_com/bootstrap.min.js"></script>
		<script src="${path}/a01_com/jquery-ui.js"></script>

		<!-- Counter js  -->
        <script src="${path}/a01_com/plugins/waypoints/jquery.waypoints.min.js"></script>
        <script src="${path}/a01_com/plugins/counterup/jquery.counterup.min.js"></script>
		
        <!-- Required datatable js -->
        <script src="${path}/a01_com/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="${path}/a01_com/plugins/datatables/dataTables.bootstrap4.min.js"></script>
        
        <!-- Buttons examples -->
        <script src="${path}/a01_com/plugins/datatables/dataTables.buttons.min.js"></script>
        <script src="${path}/a01_com/plugins/datatables/jszip.min.js"></script>
        <script src="${path}/a01_com/plugins/datatables/pdfmake.min.js"></script>
        <script src="${path}/a01_com/plugins/datatables/vfs_fonts.js"></script>
        <script src="${path}/a01_com/plugins/datatables/buttons.html5.min.js"></script>
        <script src="${path}/a01_com/plugins/datatables/buttons.print.min.js"></script>
        <script src="${path}/a01_com/plugins/datatables/buttons.colVis.min.js"></script>
        <!-- Responsive examples -->
        <script src="${path}/a01_com/plugins/datatables/dataTables.responsive.min.js"></script>
        <script src="${path}/a01_com/plugins/datatables/responsive.bootstrap4.min.js"></script>

        <!-- App js -->
        <script src="${path}/a01_com/assets/js/jquery.core.js"></script>
        <script src="${path}/a01_com/assets/js/jquery.app.js"></script>

        
        <script>
        
            $(document).ready(function() {
                $('#datatable').DataTable();
                
                //Buttons examples
                var table = $('#datatable-buttons').DataTable({
                    lengthChange: false,
                    buttons: ['copy', 'excel', 'pdf']
                });

                table.buttons().container()
                        .appendTo('#datatable-buttons_wrapper .col-md-6:eq(0)');
                
                
                $(".delbtn").click(function(){
                	if(confirm("해당 멤버를 삭제하시겠습니까?")){
                		//alert("삭제");
                		//alert("this 읽나 : "+$(this).parents(".mlist").children().val());
                		//alert("this : "+$(this).parents(".mlist").attr("id"));
                		var memno = $(this).parents(".mlist").attr("id");
            			$(location).attr("href","${path}/members.do?method=delete&memno="+memno);
                	}
                });
                
                
                $(".actupt").click(function(){
                	if(confirm("해당 멤버를 활성화 하시겠습니까?")){
                		//alert("삭제");
                		
                		alert("this : "+$(this).parents(".mlist").attr("id"));
                		var memno = $(this).parents(".mlist").attr("id");
            			$(location).attr("href","${path}/members.do?method=actupdate&memno="+memno);
                	}
                });
                
                $(".inactupt").click(function(){
                	if(confirm("해당 멤버를 비활성화 하시겠습니까?")){
                		//alert("삭제");
                		
                		//alert("this : "+$(this).parents(".actlist").attr("id"));
                		var memno = $(this).parents(".actlist").attr("id");
            			$(location).attr("href","${path}/members.do?method=inactupdate&memno="+memno);
                	}
                });
                
                
                $(".actselect").change(function(){
                	//alert("변경됨?");
                	//alert(this.value);
                	var auth = $(this).val();
                	var memno = $(this).parents(".actlist").attr("id");
                	//alert(auth);
                	$(location).attr("href","${path}/members.do?method=authupdate&memno="+memno+"&auth="+auth);
                	
                });
                
                
                $("#plusMember").click(function(){
                	if(confirm("멤버를 추가하시겠습니까?")){
                		//alert("추가");
                		$("#name").val("");
						$("#id").val("");
						$("#job").val("");
						$("#dept").val("");
						$("#auth").val("");
                		$("#dialog").dialog("open");
                	}
                });
                
                
                //var dialog = document.querySelector("#dialog");
                $("#dialog").dialog({
        			autoOpen:false,
        			buttons:{
        				"등록":function(){
        					//alert("등록");
        					var nameVal = $("#name").val();
        					var idVal = $("#id").val();
        					var jobVal = $("#job").val();
        					var deptVal = $("#dept").val();
        					var authVal = $("#auth").val();
        					//alert(idVal);
        					//alert(jobVal);
        					// ajax처리..
        					
    						var blank = $("#id").val();
    						var name = $("#name").val();
    						var auth = $("#auth option:selected").val();
        								
							if((name == null || name =="") || (auth ==null || auth == "")){
								//alert(auth);
								alert("회원검증과 권한입력후 진행해주세요.");
								$("#auth").val("");
								return;
							}
        					
        					$.ajax({
        						type:"post",
        						url:"${path}/members.do?method=insert",
        						//data:{"name":nameVal,"id":idVal,"job":jobVal,"dept":deptVal,"auth":authVal},
        						data:$("#addForm").serialize(),
        						dataType:"json",
        						success:function(data){
        							//alert("dd"+data.memIns);
        							var data = data.memIns;
        							if(data=="ok"){
        								


       									alert("멤버 등록이 진행됩니다.");
       									$("#addForm").submit();
           								if(confirm("등록 완료 \n 창을 닫으시겠습니까?")){
           									$("#dialog").dialog("close");
           								}else{
           									$("#name").val("");
           									$("#id").val("");
           									$("#job").val("");
           									$("#dept").val("");
           									$("#auth").val("");
           								}
        							}
        						},
        						error:function(err){
        							console.log(err);
        						}
        					});
        				},
        				"초기화":function(){ 	
        					alert("초기화 됩니다.");
        					$("#schid").prop("readonly", false);
        					$("#name").val("");
							$("#id").val("");
							$("#job").val("");
							$("#dept").val("");
							$("#auth").val("");
        				},
        				"닫기":function(){ 
        					alert("닫기");
        					$("#dialog").dialog("close");
        				}
        			},
        			modal:true
        		});	
                
                $('.logout').click(function(){
                    if(confirm("로그아웃 하시겠습니까?")){
                       $(location).attr("href","${path}/member.do?method=loginForm");
                    }
                 });
                
                //검색 버튼 클릭 시
                $('#schBtn').click(function(){
                	//alert("검색");
                	/* 값을 id 로 받고 ctrl 처리 후 다시 ajax 로 보내기  */
                	//chData:$(this).val()
                	var schdata = $("#schid").val();
                	//alert("id : "+schdata);
                	$.ajax({
						type:"post",
						async: false,
						url:"${path}/members.do?method=Addmem&id="+schdata,
						dataType:"json",
						success:function(data){
							var data1 = data.isable;
							if(data1 == "ok"){
								alert("등록 가능한 회원입니다.");
								var data2 = data.addMem;
								if(data2!=null){
									//alert("중복이 아닐 경우 완료");
									var data = data.addMem;
									$("#id").val(data.id);
									$("#name").val(data.name);
									$("#job").val(data.job);
									$("#dept").val(data.dept);
									$("#auth").val(data.auth);
									$("#memno").val(data.memno);
									$("#schid").prop("readonly", true);
									//alert("중복아닌경우 : "+data.job);
								}
							}else{
								alert("이미 존재하는 멤버이거나 일치하는 회원이 없습니다. 아이디를 다시 확인해주세요.");
								$("#auth").val("");
							}
							
						},
						error:function(err){
							console.log(err);
						}
					});
                	
                	
                	
                });
            });
            
        </script>
		
    </body>
</html>