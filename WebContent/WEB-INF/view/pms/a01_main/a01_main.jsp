<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var ="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value = "utf-8"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- App favicon -->
	<link rel="shortcut icon" href="${path}/a01_com/assets/images/favicon.ico">
	
	<!--Morris Chart CSS -->
	<link rel="stylesheet" href="${path}/a01_com/plugins/morris/morris.css">
	<script src="${path}/a01_com/plugins/morris/morris.min.js"></script>
    <script src="${path}/a01_com/plugins/raphael/raphael.min.js"></script>
	
	<!-- sweet alerts -->
	<link href="${path}/a01_com/plugins/sweet-alert2/sweetalert2.min.css" rel="stylesheet">
	
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
	<link href="${path}/a01_com/assets/css/a01_main.css" rel="stylesheet" type="text/css" />
	
	<script src="${path}/a01_com/assets/js/modernizr.min.js"></script>
	
	
	<!-- Resources -->
	<script src="https://www.amcharts.com/lib/4/core.js"></script>
	<script src="https://www.amcharts.com/lib/4/charts.js"></script>
	<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

	<!-- Chart -->
	<script src="${path}/a01_com/plugins/chart.js/chart.min.js"></script>
	
	<!-- Dashboard -->
	<script src="${path}/a01_com/assets/pages/jquery.dashboard.js"></script>
	
	<!-- Required datatable js -->
	<script src="${path}/a01_com/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="${path}/a01_com/plugins/datatables/dataTables.bootstrap4.min.js"></script>
	
	<!-- Responsive examples -->
	<script src="${path}/a01_com/plugins/datatables/dataTables.responsive.min.js"></script>
	<script src="${path}/a01_com/plugins/datatables/responsive.bootstrap4.min.js"></script>

        	
	<script type="text/javascript">
	
	/* 멤버로그 - ajax로 DB에서 데이터 꺼내서 차트로 표현 */
	am4core.ready(function() {

		// Themes begin
		am4core.useTheme(am4themes_animated);
		// Themes end

		/**
		 * Chart design taken from Samsung health app
		 */
		// memberlog chart
		
		
		var chart = am4core.create("logchartdiv", am4charts.XYChart);
		chart.hiddenState.properties.opacity = 0; // this creates initial fade-in

		chart.paddingBottom = 30;
		
		var logArray = [];
		
		$.ajax({
            type:"post",
            url:"${path}/dashboard.do?method=memlog",
            async: false,
            dataType:"json",
            success:function(data){
               var loglist = data.memlog;
               var tot_done = 0;
               var tot_allwork = 0;
               
               for(var idx in loglist){
                  var each = loglist[idx];
                  logArray.push(each);
                  console.log(each);
                  tot_done += each.done;
                  tot_allwork += each.allwork;
               }
               
               var tot = {"memno":"0", "name":"전체", "done":tot_done, "allwork":tot_allwork};
               
               logArray.push(tot);
            }
         });        
		
		var newLog = logArray.map(function(log){
			log.steps = log.done/log.allwork*100
			log.href = "${path}/a01_com/assets/images/person3.jpg"
			return log;
		});
		
		chart.data = newLog;
		
		var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
		categoryAxis.dataFields.category = "name";
		categoryAxis.renderer.grid.template.strokeOpacity = 0;
		categoryAxis.renderer.minGridDistance = 10;
		categoryAxis.renderer.labels.template.dy = 35;
		categoryAxis.renderer.tooltip.dy = 35;

		var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
		valueAxis.renderer.inside = true;
		valueAxis.renderer.labels.template.fillOpacity = 0.3;
		valueAxis.renderer.grid.template.strokeOpacity = 0;
		valueAxis.min = 0;
		valueAxis.cursorTooltipEnabled = false;
		valueAxis.renderer.baseGrid.strokeOpacity = 0;

		var series = chart.series.push(new am4charts.ColumnSeries);
		series.dataFields.valueY = "steps";
		series.dataFields.categoryX = "name";
		series.tooltipText = "{valueY.value}";
		series.tooltip.pointerOrientation = "vertical";
		series.tooltip.dy = - 6;
		series.columnsContainer.zIndex = 100;

		var columnTemplate = series.columns.template;
		columnTemplate.width = am4core.percent(50);
		columnTemplate.maxWidth = 66;
		columnTemplate.column.cornerRadius(60, 60, 10, 10);
		columnTemplate.strokeOpacity = 0;

		series.heatRules.push({ target: columnTemplate, property: "fill", dataField: "valueY", min: am4core.color("#e5dc36"), max: am4core.color("#5faa46") });
		series.mainContainer.mask = undefined;

		var cursor = new am4charts.XYCursor();
		chart.cursor = cursor;
		cursor.lineX.disabled = true;
		cursor.lineY.disabled = true;
		cursor.behavior = "none";

		var bullet = columnTemplate.createChild(am4charts.CircleBullet);
		bullet.circle.radius = 30;
		bullet.valign = "bottom";
		bullet.align = "center";
		bullet.isMeasured = true;
		bullet.mouseEnabled = false;
		bullet.verticalCenter = "bottom";
		bullet.interactionsEnabled = false;

		var hoverState = bullet.states.create("hover");
		var outlineCircle = bullet.createChild(am4core.Circle);
		outlineCircle.adapter.add("radius", function (radius, target) {
		    var circleBullet = target.parent;
		    return circleBullet.circle.pixelRadius + 10;
		})

		var image = bullet.createChild(am4core.Image);
		image.width = 50;
		image.height = 50;
		image.horizontalCenter = "middle";
		image.verticalCenter = "middle";
		image.propertyFields.href = "href";

		image.adapter.add("mask", function (mask, target) {
		    var circleBullet = target.parent;
		    return circleBullet.circle;
		})

		var previousBullet;
		chart.cursor.events.on("cursorpositionchanged", function (event) {
		    var dataItem = series.tooltipDataItem;

		    if (dataItem.column) {
		        var bullet = dataItem.column.children.getIndex(1);

		        if (previousBullet && previousBullet != bullet) {
		            previousBullet.isHover = false;
		        }

		        if (previousBullet != bullet) {

		            var hs = bullet.states.getKey("hover");
		            hs.properties.dy = -bullet.parent.pixelHeight + 30;
		            bullet.isHover = true;

		            previousBullet = bullet;
		        }
		    }
		})

		}); // end am4core.ready()

   		
   		/* risk chart - ajax로 DB에서 데이터 꺼내서 차트로 표현 */
		am4core.ready(function() {
			
       // Themes begin
		am4core.useTheme(am4themes_animated);
		// Themes end

		// Create chart
		var chart = am4core.create("riskchartdiv", am4charts.PieChart);
		chart.hiddenState.properties.opacity = 0; // this creates initial fade-in
		
		var riskArray = [];
		
		$.ajax({
            type:"post",
            url:"${path}/dashboard.do?method=riskChart",
            async: false,
            dataType:"json",
            success:function(data){
               var riskList = data.riskList;
               
               for(var idx in riskList){
                  var each = riskList[idx];
                  riskArray.push(each);
               }
            }
         });
		
		chart.data = riskArray;
		
		var series = chart.series.push(new am4charts.PieSeries());
		series.dataFields.value = "count";
		series.dataFields.radiusValue = "count";
		series.dataFields.category = "status";
		series.slices.template.cornerRadius = 4;
		series.colors.step = 3;
		
		series.hiddenState.properties.endAngle = -90;
		
		chart.legend = new am4charts.Legend();
		
		}); // end am4core.ready()
        
        </script>
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
                    <div class="container-fluid">
						<!-- 첫번째 row -->
                    	<div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <h4 class="page-title float-left">Welcome !</h4>

                                    <div class="btnBox">
                                        <button id="cfBtn" class="btn btn-success waves-effect waves-light" >
                                            	화면 저장
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end row --> 

						<!-- 두번째 row -->
                        <div class="row ">
							<!-- 왼쪽 : 프로젝트 설명 -->
                            <div class="col-xl-6 eachBox" id="box1">
                            	<div id="project" class="first">
	                                <div class="portlet logBox"><!-- /primary heading -->
	                                
	                                
	                                    <div class="portlet-heading">
	                                        <h3 class="portlet-title text-dark text-uppercase textHead">
	                                            Project Information
	                                        </h3>
	                                        
	                                        <div class="clearfix"></div>
	                                    </div>
	                                    <div class="row ">
		                                    <div class="col-xl-6 ">
				                                <!-- Team-Member -->
				                                <div class="portlet "><!-- /primary heading -->
				                                    <div class="portlet-heading">
				                                        <h3 class="portlet-title text-dark text-uppercase">
				                                            Details
				                                        </h3>
				                                        <div class="clearfix"></div>
				                                    </div>
				                                    
				                                    <div id="portlet-6" class="panel-collapse collapse show">
				                                        <div class="portlet-body pt-0">
				                                            <ul class="list-group list-group-lg">
				                                                <li class="list-group-item b-0 prjinfo">
				                                                	<span class="leftText">프로젝트명</span>  
				                                                	<span class="data">${prjList.prjname }</span>
				                                                </li>
				                                                
				                                                <li class="list-group-item b-0 prjinfo">
				                                            		<span class="leftText">시작일 </span>
				                                            		<span class="data">${prjList.stdate }</span>
				                                                </li>
				                                                <li class="list-group-item b-0 prjinfo">
				                                            		<span class="leftText">마감일 </span>
				                                            		<span class="data">${prjList.duedate }</span>
				                                                </li>
	
				                                                <li class="list-group-item b-0 prjinfo">
				                                                 	<span class="leftText">관리자 </span>
				                                                 	<span class="data">${prjList.prjadmin }</span>
				                                                </li>
				                                                <li class="list-group-item b-0 prjinfo">
				                                               		<span class="leftText">클라이언트 </span>
				                                               		<span class="data">${prjList.client }</span>
				                                                </li>
				                                                	 	                                                
				                                            </ul>
				                                        </div> <!-- end portlet-body -->
				                                    </div> <!-- end portlet-collapsed -->
				                                </div> <!-- end portlet/Team-member -->
				                        	</div>                                   
		                                    
		                                    <div class="col-xl-6 ">
				                                <!-- Team-Member -->
				                                <div class="portlet"><!-- /primary heading -->
				                                    <div class="portlet-heading">
				                                        <h3 class="portlet-title text-dark text-uppercase">
				                                            Team Members
				                                        </h3>
				                                        <div class="clearfix"></div>
				                                    </div>
				                                    
				                                    <div id="portlet-6" class="panel-collapse collapse show">
				                                        <div class="portlet-body pt-0">
				                                            <ul class="list-group list-group-lg">
				                                            <c:forEach var="mem" items="${memList}" varStatus="sts">
				                                                <li class="list-group-item b-0">
				                                                    <span class="float-right label bg-info inline m-t-10" id="job">${mem.job }</span>
				                                                    <c:if test="${mem.auth eq 'admin'}">
				                                                	<span class="float-right label bg-primary inline m-t-10" id="job">PM</span>
				                                                	</c:if>
				                                                    <span class="leftText">${mem.name }<span>
				                                                </li>
				                                             </c:forEach>  
				                                            </ul>
				                                        </div> <!-- end portlet-body -->
				                                    </div> <!-- end portlet-collapsed -->
				                                </div> <!-- end portlet/Team-member -->
				                        	</div>
			                        	</div>
	                                </div> <!-- /Portlet -->
                                </div>
							</div>
							
							
							<!-- 오른쪽: 멤버별 활동로그 -->
                            <div class="col-xl-6 eachBox" id="box2">
                            	<div id="memLog" class="first">
	                                <div class="portlet logBox"><!-- /primary heading -->
	                                    <div class="portlet-heading">
	                                        <h3 class="portlet-title text-dark text-uppercase textHead">
	                                            Member log
	                                        </h3>
	                                        
	                                        <div class="clearfix"></div>
	                                    </div>
	                                    <div id="bg-default" class="panel-collapse collapse show">
	                                        <div class="descBox">
	                                        	<h6 class="logDesc">value = (done work) / (all work) % </h6>
	                                        </div>
	                                        <div id="logchartdiv"></div>
	                                    </div>
	                                </div> <!-- /Portlet -->
	                        	</div>
                            </div> <!-- end col -->
                        </div> <!-- end row -->
        
                        <div class="row">
                            <div class="col-xl-6 eachBox" id="box3">
                            	<div id="risk" class="first">
	                                <div class="portlet logBox"><!-- /primary heading -->
	                                    <div class="portlet-heading">
	                                        <h3 class="portlet-title text-dark text-uppercase textHead">
	                                            Risk
	                                        </h3>
	                                        
	                                        <div class="clearfix"></div>
	                                    </div>
	                                    <div id="bg-default" class="panel-collapse collapse show">
	                                    	<div class="descBox">
	                                        	<h6 class="logDesc">value = risk progress status (cnt)</h6>
	                                        </div>
											<div id="riskchartdiv"></div>
	                                    </div>
                                    </div>
                                </div> <!-- /Portlet -->
                            </div> <!-- end col -->
                            
                            
                            <div class="col-xl-6 logBox eachBox" id="box4">
        						<div id="board" class="first">
	                                <div class="portlet logBox"><!-- /primary heading -->
	                                    <div class="portlet-heading">
	                                        <h3 class="portlet-title text-dark text-uppercase textHead">
	                                            	Notice
	                                        </h3>
	                                        
	                                        <div class="clearfix"></div>
	                                    </div>
	                                    
	                                    <div id="portlet3" class="panel-collapse collapse show">
	                                        <div class="portlet-body">
	                                            <div class="table-responsive">
	                                                <table class="table" id="datatable-buttons" >
	                                                    <thead>
	                                                        <tr>
	                                                            <th>글번호</th>
	                                                            <th>제목</th>
	                                                            <th>작성자</th>
	                                                            <th>등록일</th>
	                                                            <th>조회수</th>
	                                                        </tr>
	                                                    </thead>
	                                                    <tbody>
	                                                    	<c:forEach var="board" items="${boarList}" varStatus="sts">
		                                                        <tr>
		                                                            <td>${board.no}</td>
		                                                            <td>${board.title}</td>
		                                                            <td>${board.writer}</td>
		                                                            <td>${board.credte }</td>
		                                                            <td>${board.readcnt }</td>
		                                                        </tr>
	                                                        </c:forEach>
	                                                    </tbody>
	                                                </table>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                        	</div>
                            </div> <!-- end col -->
                            
                        </div> <!-- end row -->
            
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
        
        <script type="text/javascript" src="${path}/a00_com/jquery-3.4.1.js"></script>
        
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		
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

        <!-- Chat -->
        <script src="${path}/a01_com/plugins/moment/moment.js"></script>
        <script src="${path}/a01_com/assets/pages/jquery.chat.js"></script>

        <!-- Dashboard -->
        <script src="${path}/a01_com/assets/pages/jquery.dashboard.js"></script>

        <!-- Todoapp -->
        <script src="${path}/a01_com/assets/pages/jquery.todo.js"></script>

        <!-- App js -->
        <script src="${path}/a01_com/assets/js/jquery.core.js"></script>
        <script src="${path}/a01_com/assets/js/jquery.app.js"></script>
        
        <!-- Responsive examples -->
        <script src="${path}/a01_com/plugins/datatables/dataTables.responsive.min.js"></script>
        <script src="${path}/a01_com/plugins/datatables/responsive.bootstrap4.min.js"></script>
        
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
       
        <script>
        	// UI 순서 받아오기 및 업데이트 
            jQuery(document).ready(function($) {
            	
            	$('#datatable').DataTable();
            	 
            	var table = $('#datatable-buttons').DataTable({
                    lengthChange: true,
                });
            	
            	table.buttons().container().appendTo('#datatable-buttons_wrapper .col-md-6:eq(0)');
            	
            	$.ajax({
                    type:"post",
                    url:"${path}/dashboard.do?method=uiFormat",
                    async: false,
                    dataType:"json",
                    success:function(data){
                       var boxArray = data.uiFormat;
  
	                	$( "#box1" ).append( $(boxArray.box1) );
	                	$( "#box2" ).append( $(boxArray.box2) );
	                	$( "#box3" ).append( $(boxArray.box3) );
	                	$( "#box4" ).append( $(boxArray.box4) );                          
                    }
                 });        
            	
            	$("#cfBtn").click(function(){
            		
            		var eachBox = document.querySelectorAll(".eachBox")
					eachBox.forEach(function(each,idx){
	            		$(each).attr("id", "box"+(idx+1));
	            		//console.log(each);
					});
            		
            		var box1 = "#"+$("#box1").children(":first").attr("id");
                	var box2 = "#"+$("#box2").children(":first").attr("id");
                	var box3 = "#"+$("#box3").children(":first").attr("id");
                	var box4 = "#"+$("#box4").children(":first").attr("id");
                	
            		$.ajax({
                        type:"post",
                        url:"${path}/dashboard.do?method=uiUpdate",
                        async: false,
                        data:{
        					box1:box1,
        					box2:box2,
        					box3:box3,
        					box4:box4
        				},
                        dataType:"text",
                        success:function(data){
							alert("화면이 변경되었습니다.");
                        }
                     });        
            	});
            	
            	
                /* Counter Up */
                $('.counter').counterUp({
                    delay: 100,
                    time: 1200
                });
                
                $('.logout').click(function(){
                	if(confirm("로그아웃 하시겠습니까?")){
                		$(location).attr("href","${path}/member.do?method=loginForm");
                	}
                });
                
                initSwap();
             
            });
            
            function initSwap(){
            	initDroppable($("#box1, #box2, #box3, #box4"));
            	initDraggable($("#box1, #box2, #box3, #box4" ));
            }
            
            function initDraggable($elements) {
                $elements.draggable({
                    appendTo: "body",
                    helper: "clone",
                    cursor: "move",
                    revert: "invalid"
                });
            }
           
            function initDroppable($elements) {
                $elements.droppable({
                    activeClass: "ui-state-default",
                    hoverClass: "ui-drop-hover",
                    accept: ":not(.ui-sortable-helper)",

                    over: function(event, ui) {
                        var $this = $(this);
                    },
                    drop: function(event, ui) {
                        var $this = $(this);

                        var linew1 = $(this).after(ui.draggable.clone());
                        var linew2 = $(ui.draggable).after($(this).clone());
                        $(ui.draggable).remove();
                        $(this).remove();
                        initSwap();
                    }
                });
            }
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

        </script>
    </body>
</html>