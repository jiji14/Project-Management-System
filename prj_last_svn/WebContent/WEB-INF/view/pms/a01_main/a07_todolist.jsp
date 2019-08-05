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
</head>


<body>
	<!-- Begin page -->
    <div id="wrapper">

	    <!-- header -->
	    <jsp:include page="a04_header.jsp" />
	    
		<aside>
			<jsp:include page="a04_sidebar.jsp" />
		</aside>

		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<!-- ============================================================== -->
		<div class="content-page">
			
			<!-- Start content -->
			<div class="content">
				<div class="container-fluid" id="container-fluid">
            
					<!-- 상단메뉴 -->
					<div class="page-title-box">
						<span><img class="listimg" src="${path}/a01_com/assets/images/users/todolist.png"></span>
						<h2 class="page-title float-left "  >
						<a href="${path}/todolist.do?method=list" id="todolist">To Do List</a></h2>
					</div>
					
					<!-- 세션으로 받아온 prjno가 기본값인지 선택값인지에 따라 화면 구성 -->
					<c:set var="prjno" value="${mem.prjno}" />
					<c:if test="${prjno eq 'pro0'}">
						<div class="noProject">
							<h3 class="page-title goPrj" >
								현재 생성된 프로젝트가 없습니다. 프로젝트를 생성해주세요.
							</h3>
							
							<h3 class="page-title goPrj" >
								<a href="${path}/project.do?method=list" id="goProject">
									<i class="ion ion-md-redo"></i>프로젝트 생성 바로가기
								</a>
							</h3>
						</div>
					</c:if>
					
					<c:if test="${prjno ne 'pro0'}">
					<div class="listBox">				
						<div class="workcontent">
							<h4 class="title">Planned this week</h4>
							<c:forEach var="emer" items="${todoemer}" varStatus="sts">
								<div class="workCard" >
									<span>${sts.count}. ${emer.name}</span>
									<span>${emer.dateEnd} 마감</span>
									<div class="hideBox">
										<label class="detailLabel" onclick="detailFunction('${emer.taskid}')">
											<i class="ion  ion ion-ios-redo icons"></i>										
											Detail
										</label>
										<label class="hideLabel" id="${emer.taskid}">
											<i class="ion ion-md-eye-off icons"></i>									
											Hide card
										</label>
									</div>
								</div>
							</c:forEach>
							
							<div class="addBox">
								<label class="addLabel" id="emergency">
									<i class="ion ion-md-add heart"></i>
									Add hidden work card
								</label>
							</div>
						</div>
						
						<div class="workcontent">
							<h4 class="title">Work in progress</h4>
							<c:forEach var="todo" items="${todolist}" varStatus="sts">
								<div class="workCard" >
									<span>${sts.count}. ${todo.name}</span>
									<span>${todo.dateEnd} 마감</span>
									<div class="hideBox">
										<label class="detailLabel" onclick="detailFunction('${todo.taskid}')">
											<i class="ion  ion ion-ios-redo icons"></i>										
											Detail
										</label>
										<label class="hideLabel" id="${todo.taskid}">
											<i class="ion ion-md-eye-off icons"></i>									
											Hide card
										</label>
									</div>
								</div>
							</c:forEach>	
							
							<div class="addBox">
								<label class="addLabel" id="progress">
									<i class="ion ion-md-add heart"></i>
									Add hidden work card
								</label>
							</div>												
						</div>
						
						<div class="workcontent">
							<h4 class="title">Done week</h4>
							<c:forEach var="done" items="${tododone}" varStatus="sts">
								<div class="workCard" >
									<span>${sts.count}. ${done.name}</span>
									<span>${done.dateEnd} 마감</span>
									<div class="hideBox" >
										<label class="detailLabel" onclick="detailFunction('${done.taskid}')">
											<i class="ion  ion ion-ios-redo icons"></i>									
											Detail
										</label>
										<label class="hideLabel" id="${done.taskid}" >
											<i class="ion ion-md-eye-off icons"></i>									
											Hide card
										</label>
									</div>
								</div>
							</c:forEach>
							
							<div class="addBox">
								<label class="addLabel" id="done">
									<i class="ion ion-md-add heart"></i>
									Add hidden work card
								</label>
							</div>
						</div>
					</div>
					
					<div id="dialog">
				        <div class="titleBox">
							<h2 class="page-title float-left" id="title">Add Hidden work card</h2>
						</div>
				
						<div class="cardBox">
						</div>

						<div class="clsBox">
							<button type="button" class="btn btn-rounded btn-sm" id="clsBtn">Close</button>
						</div>
					</div>
					
					<div id="dialog2">
				        <div class="titleBox">
							<h2 class="page-title float-left" id="title">Detail</h2>
						</div>
						<div class="detail">
							<div class="form-group row eachDetail">
								<label class="col-2 col-form-label">업무명</label>
								<div class="col-10">
									<input name="name" class="form-control" id="name" readOnly/>        
								</div>
							</div>
							<div class="form-group row eachDetail">
								<label class="col-2 col-form-label">내용</label>
								<div class="col-10">
									<input name="description" class="form-control" id="description" readOnly/>        
								</div>
							</div>
							<div class="form-group row eachDetail">
								<label class="col-2 col-form-label">시작일</label>
								<div class="col-10">
									<input name="dateStart" class="form-control" id="dateStart" readOnly/>        
								</div>
							</div>
							<div class="form-group row eachDetail">
								<label class="col-2 col-form-label">종료일</label>
								<div class="col-10">
									<input name="dateEnd" class="form-control" id="dateEnd" readOnly/>        
								</div>
							</div>
							<div class="form-group row eachDetail">
								<label class="col-2 col-form-label">진척도</label>
								<div class="col-10">
									<input name="progressDetail" class="form-control" id="progressDetail" readOnly/>        
								</div>
							</div>
							<div class="form-group row eachDetail">
						</div>
						
						<div class="clsBox">
							<button type="button" class="btn btn-rounded btn-sm" id="detailCls">Back</button>
						</div>
					</div>
					</div>

					<div id="chartdiv"></div>
					
					<div class="chartExp">
						** 위 차트는 workcard의 숨김여부와 상관없이 전체 업무에 대한 진척도를 나타냅니다. 
					</div>
					</c:if>
					
				</div>
				<!-- container -->
			</div> 

			<!-- footer -->
			<footer class="footer">
				eZ company 2019.08.09
			</footer>
			
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

		<!-- chart -->
		<script src="https://www.amcharts.com/lib/4/core.js"></script>
		<script src="https://www.amcharts.com/lib/4/charts.js"></script>
		<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
		
		<script>

			// ToDoList - 각 개인 업무별 진행상황 차트 표현
			am4core.ready(function() {

			// Themes begin
			am4core.useTheme(am4themes_animated);
			// Themes end

			var chart = am4core.create("chartdiv", am4charts.PieChart);
			chart.hiddenState.properties.opacity = 0; // this creates initial fade-in
			
			var cnt = [];
			cnt.push(${cnt[0]});
			cnt.push(${cnt[1]});
			cnt.push(${cnt[2]});
			
			
			chart.data = [
			  {
			    country: "Planned this week",
			    value: cnt[0]
			  },
			  {
			    country: "Work in progress",
			    value: cnt[1]
			  },
			  {
			    country: "Done week",
			    value: cnt[2]
			  }
			];
			chart.radius = am4core.percent(70);
			chart.innerRadius = am4core.percent(40);
			chart.startAngle = 180;
			chart.endAngle = 360;  

			var series = chart.series.push(new am4charts.PieSeries());
			series.dataFields.value = "value";
			series.dataFields.category = "country";

			series.slices.template.cornerRadius = 10;
			series.slices.template.innerCornerRadius = 7;
			series.slices.template.draggable = true;
			series.slices.template.inert = true;
			series.alignLabels = false;

			series.hiddenState.properties.startAngle = 90;
			series.hiddenState.properties.endAngle = 90;

			chart.legend = new am4charts.Legend();

			}); // end am4core.ready()
		
		</script>

		<!-- 내가 작성한 script -->
        <script>
            jQuery(document).ready(function($) {

				$(".hideLabel").click(function(){
					var taskid = $(this).attr('id')
					$(location).attr("href","${path}/todolist.do?method=hide&taskid="+taskid);
				});	
				
                $("#dialog").dialog({
    				autoOpen:false,
    				closeOnEscape: false,
    				modal:true
    			});
                
                $("#dialog2").dialog({
    				autoOpen:false,
    				closeOnEscape: false,
    				modal:true
    			});
                
                $('.addLabel').click(function(){
                	var step = $(this).attr('id');
					// 로딩할때마다 div 비우고 다시 생성
					$('.cardBox').empty();
					var text = "";
					$.ajax({
		                type:"post",
		                url:"todolist.do?method=addWorkcard&step="+step,
		                async: false,
		                dataType:"json",
		                success:function(data){
		                   console.log(data);
		                   var todolist = data.todolist;
		                   for(var idx in todolist){
		                       var each = todolist[idx];
									text += "<div class='addworkCard'><span>"+each.dateEnd+"</span><span>"+each.name+"</span><span class='btnBox'>";
									text +=	"<button type='button' class='btn btn-rounded btn-sm detailBtn' onclick='detailFunction(this.id)' id='"+each.taskid+"'>Detail</button>";
									text += "<button type='button' class='btn btn-rounded btn-sm addBtn' onclick='addFunction(this.id)' id='"+each.taskid+"'>Add</button></span></div>";
		                    }
		                   $('.cardBox').append(text);
		                }
		             });    
                	$("#dialog").dialog("open");
                });
                
                $('#clsBtn').click(function(){
                	$("#dialog").dialog("close");
                });
                
                $('#detailCls').click(function(){
                	$("#dialog2").dialog("close");
                });
            });
            
            function addFunction(taskid) {
           
				$.ajax({
	                type:"post",
	                url:"todolist.do?method=show&taskid="+taskid,
	                dataType:"json"
	             });
				alert("등록되었습니다.");
           	 	window.location.reload();
			}
            
            function detailFunction(taskid) {
            	/* 초기화 */
            	$("#name").val("");
            	$("#description").val("");
            	$("#dateStart").val("");
            	$("#dateEnd").val("");
            	$("#progress").val("");
            	
 				$.ajax({
	                type:"post",
	                url:"todolist.do?method=detail&taskid="+taskid,
	                dataType:"json",
	                success:function(data){
	                	console.log(data);
	                	var detail = data.detail;
	                	$("#name").val(detail.name);
	                	$("#description").val(detail.description);
	                	$("#dateStart").val(detail.dateStart);
	                	$("#dateEnd").val(detail.dateEnd);
	                	$("#progressDetail").val(detail.progress);
	                }
	             }); 
				$("#dialog2").dialog("open");
			}
            
        </script>
    </body>
</html>