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
    <div id="wrapper">

    <!-- header -->
    <jsp:include page="a04_header.jsp" />
    
	
		<jsp:include page="a04_sidebar.jsp" />
	

		<!-- ============================================================== -->
		<!-- Start right Content here -->
		<!-- ============================================================== -->
		<div class="content-page">
			
			<!-- Start content -->
			<div class="content">
				<div class="container-fluid"> 

					<!-- 상단메뉴 -->
					<div class="page-title-box">
						<span><img class="riskimg" src="${path}/a01_com/assets/images/risk.jpg"></span>
						<h1 class="page-title float-left" >
							<a href="${path}/risk.do?method=list" id="riskTitle">Risk</a>
						</h1>
					</div>
					
					<!-- 세션으로 받아온 prjno가 기본값인지 선택값인지에 따라 화면 구성 -->
					<c:set var="prjno" value="${mem.prjno}" />
					<c:if test="${prjno eq 'pro0'}">
						<div class="noProject">
							<h3 class="page-title goPrj" >
								현재 생성된 프로젝트 혹은 선택된 프로젝트가 없습니다. 프로젝트를 생성 또는 최초선택 해주세요.
							</h3>
							
							<h3 class="page-title goPrj" >
								<a href="${path}/project.do?method=list" id="goProject">
									<i class="ion ion-md-redo"></i>프로젝트 생성 바로가기
								</a>
							</h3>
						</div>
					</c:if>
					
					<c:if test="${prjno ne 'pro0'}">
					<div class="topText">
						<c:if test="${memAuth eq 'admin'}">
							<a id="addRisk">
								<img id="addImg" src="${path}/a01_com/assets/images/addBtn.png"  />
								<h4 class="portlet-title text-uppercase" id="addh3">
					       			리스크 등록
					       	 	</h4>
				       		</a>
			       		</c:if>
					</div>
   					
   					
					<div class="content_container">
						<!-- chart -->
						<div class="portlet"><!-- /primary heading -->
		                   	<div class="portlet-heading">
		                        <h4 class="portlet-title text-uppercase" id="chartTitle">
		                           Risk 차트
		                        </h4>
		                        <div class="clearfix"></div>
		                    </div>
	                                
					<div id="portlet3" class="panel-collapse collapse show">
					    <div class="portlet-body" id="chart_main">
					    	<h5 id="risk_h5" class="portlet-title">위험도</h5>
					        <canvas id="pie" data-type="Pie" height="250" width="250" ></canvas>                               
							<div class="infoline">
								<div class="span1"></div><span>높음</span>
								<div class="span2"></div><span>중간</span>
								<div class="span3"></div><span>낮음</span>
							</div>
						</div>
	                                 
						<c:forEach var="riskdegree" items="${riskdegree}" varStatus="sts">
							<input id="degree${sts.count}" type="hidden" value="${riskdegree.riskdegree}" />
							<input id="count${sts.count}" type="hidden" value="${riskdegree.count}" />									    
						</c:forEach>
							
						<div class="chart_text">
							<div class="bar_top">
								<h5 class="portlet-title">발생가능성</h5>
								<span></span>
							</div>
							<div class="bar_content">
								<c:forEach var="posible" items="${posible}" varStatus="sts">
									<div class="bar"> ${posible.posibility} 
										<div class="progress" style="height: 16px;">
											<div class="progress-bar" id ="progress-bar" role="progressbar" style="width: ${posible.count}%;" aria-valuenow="${posible.count}" aria-valuemin="0" aria-valuemax="100">${posible.count}%</div>
										</div>
									</div>
								</c:forEach>   
							</div>                               	
						</div> 
	                    	 
						<div class="chart_text">
							<div class="bar_top">
								<h5 class="portlet-title">상태</h5>
								<span></span>
							</div>
							<div class="bar_content">
								<c:forEach var="st" items="${status}" varStatus="sts">
									<div class="bar">${st.status} 
										<div class="progress" style="height: 16px;">
											<div class="progress-bar" id ="progress-bar" role="progressbar" style="width: ${st.count}%;" aria-valuenow="${st.count}" aria-valuemin="0" aria-valuemax="100">${st.count}%</div>
										</div>
									</div>
								</c:forEach>    
							</div>
						</div>  
						
						<div class="chart_text">
							<div class="bar_top">
								<h5 class="portlet-title">등록일</h5>
								<span></span>
							</div>
							
							<div class="bar_content">
								<c:forEach var="rgs" items="${rgscount}" varStatus="sts">
									<div class="bar">${rgs.getRgsdte}
										<div class="progress" style="height: 16px;">
											<div class="progress-bar" id ="progress-bar" role="progressbar" style="width: ${rgs.count}%;" aria-valuenow="${rgs.count}" aria-valuemin="0" aria-valuemax="100">${rgs.count}%</div>
										</div>
									</div>
								</c:forEach> 
							</div>   
						</div>  
					</div>
				</div>
	                                            
	                       	
					<!-- Table -->
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									<h4 class="m-t-0 header-title mb-0">Risk 목록</h4>
								</div>
							<div class="card-body table-responsive">
				
								<table id="datatable-buttons" class="table table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
									<thead>
										<tr>
											<th>NO</th>
											<th>제목</th>
											<th>관련업무</th>
											<th>위험도</th>
											<th>가능성</th>
											<th>담당자</th>
											<th>상태</th>
											<th>등록일</th>
										</tr>
									</thead>
		
									<tbody>
										<c:forEach var="risk" items="${riskList}" varStatus="sts">
											<tr id="${risk.riskno}">
												<td>${sts.index+1}</td> 
												<td>${risk.title}</td>
												<td>${risk.taskname}</td> 
												<td>${risk.riskdegree}</td>
												<td>${risk.posibility}</td>
												<td>${risk.owner}</td> 
												<td>${risk.status}</td> 
												<td><fmt:formatDate value="${risk.rgsdte}"/></td>
											</tr>
										</c:forEach>   
									</tbody>
								</table>
								</div>
		    			<!-- end row -->                        	
							</div>
							</c:if>
						</div>
					</div>
				</div> 
			</div> <!-- container -->

		</div> <!-- content -->
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

        <!--Morris Chart-->
        <script src="${path}/a01_com/plugins/morris/morris.min.js"></script>
        <script src="${path}/a01_com/plugins/raphael/raphael.min.js"></script>

		<!-- Chart -->
		<script src="${path}/a01_com/plugins/chart.js/chart.min.js"></script>

        <!-- Dashboard -->
        <script src="${path}/a01_com/assets/pages/jquery.dashboard.js"></script>

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
        
       <!-- 기본 세팅된 script --> 
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
                
                /* BEGIN SVG WEATHER ICON */
                if (typeof Skycons !== 'undefined'){
                var icons = new Skycons(
                    {"color": "#fff"},
                    {"resizeClear": true}
                    ),
                        list  = [
                            "clear-day", "clear-night", "partly-cloudy-day",
                            "partly-cloudy-night", "cloudy", "rain", "sleet", "snow", "wind",
                            "fog"
                        ],
                        i;

                    for(i = list.length; i--; )
                    icons.set(list[i], list[i]);
                    icons.play();
                };
            });
        </script>
                
        
        <script type="text/javascript">

        /**
        * Theme: Velonic - Responsive Bootstrap 4 Admin Dashboard
        * Author: Coderthemes
        * Chart Js Page
        */

        // Risk Chart 표현
        !function($) {
            "use strict";
            
            // 계산법
            function percentage(num, per)
            {
              return (num/per)*100;
            }
            
            var ChartJs = function() {};
            // 초기화
            var count1 = 0;
            var count2 = 0;
            var count3 = 0;
            
            // 값받아오기
            if($("#count1").val()!=null){
            	count1 = parseInt($("#count1").val());
            }
            if($("#count2").val()!=null){
            	count2 = parseInt($("#count2").val());
            }
            if($("#count3").val()!=null){
            	count3 = parseInt($("#count3").val());
            }            
            
            var sum = count1 + count2 + count3;
            
            // 퍼센티지로 변환
            var count1Percent=(percentage(count1, sum)).toFixed(2);
            var count2Percent=(percentage(count2, sum)).toFixed(2);
            var count3Percent=(percentage(count3, sum)).toFixed(2);
          

            ChartJs.prototype.respChart = function respChart(selector,type,data, options) {
                // get selector by context
                var ctx = $("canvas").get(0).getContext('2d'); //selector에서 고침 $("canvas")
                // pointing parent container to make chart js inherit its width
                var container = $(selector).parent();

                // enable resizing matter
                $(window).resize( generateChart );

                // this function produce the responsive Chart JS
                function generateChart(){
                    // make chart width fit with its container
                    var ww = selector.attr('width', $(container).width() );
                    switch(type){
                        case 'Pie':
                            new Chart(ctx).Pie(data, options);
                            break;                
                    }
                    // Initiate new chart or Redraw

                };
                // run function - render chart at first load
                generateChart();
            },
            //init
            ChartJs.prototype.init = function() {

                //Pie chart
                var data2 = [
                    {
                        value: count1Percent,
                        color:"#34c73b"
                    }, //높음
                    {
                        value : count2Percent,
                        color : "#3960d1"
                    }, //중간
                    {
                        value : count3Percent,
                        color : "#fd7e14"
                    } //낮음
                ]
                this.respChart($("#pie"),'Pie',data2);
            },
            $.ChartJs = new ChartJs, $.ChartJs.Constructor = ChartJs

        }(window.jQuery),

        //initializing 
        function($) {
            "use strict";
            $.ChartJs.init()
        }(window.jQuery);
        </script>


		<!-- 내가 작성한 script -->
        <script>
            jQuery(document).ready(function($) {
                /* Counter Up */
                $('.counter').counterUp({
                    delay: 100,
                    time: 1200
                });
                        
                // 등록 클릭하면 등록창 열리기
                $("#addRisk").click(function(){
                	var win01 = window.open('${path}/risk.do?method=addForm','riskAdd', "width=900, height=1100");
                	win01.moveTo(500,100);
                });
	            var tableRows = $('table').find('tr');
                $("table").on("dblclick", "tr", function(e){
                	if (this == tableRows[0]){
                		return;
                	}
                	var riskno = $(this).attr("id");
                	var win01 = window.open('${path}/risk.do?method=detail&riskno='+riskno,'riskDetail', "width=900, height=1100");
                	win01.moveTo(500,100);
                });

 
                $('.logout').click(function(){
                    if(confirm("로그아웃 하시겠습니까?")){
                       $(location).attr("href","${path}/member.do?method=loginForm");
                    }
                 });
                
            });    
        </script>

    </body>
</html>