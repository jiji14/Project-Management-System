<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,java.net.*"
    import="z01_vo.*,c01_database.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

        <script src="${path }/Velonic_v4.1/Admin/admin_4/assets/js/modernizr.min.js"></script>

		<!-- View -->
		<script  src="${path}/a00_com/vue.js" type="text/javascript"></script>	
		
 		<!-- jQuery  -->
        <script src="${path}/a01_com/assets/js/jquery.min.js"></script>
        <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    	<script src="${path }/Velonic_v4.1/Admin/admin_4/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
    	<script src="${path}/a01_com/popper.min.js"></script>
    	<script src="${path}/a01_com/jquery-ui.js"></script>
    	
    	<style type="text/css">
    		.ui-dialog-titlebar-close {
			    visibility: hidden !important;
			}
			#dialog_alarm{
				background:#F0F0F0 !important;
				border-radius: 15px !important;
				width: 600px !important;
				display: flex !important;
				flex-direction: column !important;
				padding:20px;
			}
			#title{
				font-size: 25px;
				margin-bottom: 20px;
			}
			.clsBox{
				display: flex;
				justify-content: flex-end;
			}
			#detailCls{
				background:#17a2b8;
				color:white;
				letter-spacing:1px;
				border-radius: 0.5em;
				margin-right : 20px;
				margin-bottom : 10px;
			}
			.clearBtn{
				cursor:pointer;
			}
    	</style>
    </head>
    
    	<script type="text/javascript">
	    	jQuery(document).ready(function($) {
	    		var alarmList = [];
	    		var length = 0;
	    		
	    		$.ajax({
	                type:"post",
	                url:"${path}/dashboard.do?method=alram",
	                async: false,
	                dataType:"json",
	                success:function(data){
	                	var data = data.todolist;
	                	length = data.length;
	                    for(var idx in data){
	                       var each = data[idx];
	                       alarmList.push(each);
	                    }
			    		console.log(alarmList);	
	                }
	             });  
	    		
		    	new Vue({
					el:".topbar",
					data: {
						count : length,
						todolist : alarmList
					}
				});
	    	});
    	</script>
		<body>

        <!-- Begin page -->

            <!-- Top Bar Start -->
            <div class="topbar">

                <!-- LOGO -->
                <div class="topbar-left">
                    <a href="${path}/dashboard.do?method=list" class="logo">
                        <span>
                            <img src="${path }/Velonic_v4.1/Admin/admin_4/assets/images/logo.png" alt="" height="18">
                        </span>
                        <i>
                            <img src="${path }/Velonic_v4.1/Admin/admin_4/assets/images/logo_sm.png" alt="" height="22">
                        </i>
                    </a>
                </div>

                <nav class="navbar-custom">

                    <ul class="list-inline float-right mb-0">
                        
						
						<!-- 알람 창  -->
                        <li class="list-inline-item dropdown notification-list">
                            <a class="nav-link dropdown-toggle arrow-none" data-toggle="dropdown" href="#" role="button"
                               aria-haspopup="false" aria-expanded="false">
                                <i class="mdi mdi-bell-outline noti-icon waves-light waves-effect"></i>
                            </a>
                            <span class="badge badge-pink noti-icon-badge" v-if="count>0">{{count}}</span>
                            <div class="dropdown-menu dropdown-menu-animated dropdown-menu-right dropdown-arrow dropdown-lg">
                                <!-- item-->
                                <div class="dropdown-item noti-title">
                                    <h5 class="m-0"><span class="float-right">
                                    <a href="" class="text-dark"><small id="clearAll">Clear All</small></a>
                                    </span>Notification</h5>
                                </div>

                                <div class="slimscroll" style="max-height: 230px;" >
                                    <!-- item-->
                                    <template v-for="(alarm, index) in todolist" >
	                                    <a href="javascript:void(0);" class="dropdown-item notify-item eachClear" :id="alarm.taskid" >
	                                        <div class="notify-icon text-success"><i class="mdi mdi-comment-account-outline"></i></div>
	                                        <p class="notify-details" >{{alarm.name}} / PM {{alarm.isread}} / {{alarm.approval}}<small class="text-muted">clear</small></p>
	                                    </a>
                                    </template>
                                </div>
								
                                <!-- All-->
                                <a href="javascript:void(0);" id="view" class="dropdown-item text-center text-dark notify-item notify-all">
                                    View all <i class="fi-arrow-right"></i>
                                </a>

                            </div>
                        </li>

                        <li class="list-inline-item dropdown notification-list">
                            <a class="nav-link dropdown-toggle nav-user" data-toggle="dropdown" href="#" role="button"
                               aria-haspopup="false" aria-expanded="false">
                                <i class="noti-icon"><img src="${path }/Velonic_v4.1/Admin/admin_4/assets/images/users/avatar-1.jpg" alt="user" class="img-fluid rounded-circle"></i>
                                <span class="profile-username ml-2 text-muted">${mem.name}</span> <span class="mdi mdi-menu-down text-muted"></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-animated dropdown-menu-right profile-dropdown ">
                                <!-- item-->
                                <div class="dropdown-item noti-title">
                                    <h5 class="text-overflow"><small>Welcome ! ${mem.name}</small> </h5>
                                </div>

                                <!-- item-->
                                <a href="${path}/profile.do?method=profile" class="dropdown-item notify-item">
                                    <i class="mdi mdi-account-circle"></i> <span>Profile</span>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item" id="logout">
                                    <i class="mdi mdi-power"></i> <span>Logout</span>
                                </a>

                            </div>
                        </li>

                    </ul>

                    <ul class="list-inline menu-left mb-0">

                    </ul>
					
					<div id="dialog_alarm">
				        <div class="titleBox">
							<h2 class="page-title float-left" id="title">Alarms</h2>
						</div>
						<div class="detail">
							 <div class="table-responsive">
                                 <table class="table" id="datatable-buttons" >
                                     <thead>
                                         <tr>
                                             <th>업무명</th>
                                             <th>상세내용</th>
                                             <th>PM확인</th>
                                             <th>승인여부</th>
                                             <th>삭제</th>
                                         </tr>
                                     </thead>
                                     <tbody>
                                     	<template v-for="(alarm, index) in todolist" >
                                         <tr>
                                             <td>{{alarm.name}}</td>
                                             <td>{{alarm.description}}</td>
                                             <td>{{alarm.isread}}</td>
                                             <td>{{alarm.approval}}</td>
                                             <td class="clearBtn" :id="alarm.taskid" >clear</td>
                                         </tr>
                                         </template>
                                     </tbody>
                                 </table>
                             </div>
						</div>
						
						<div class="clsBox">
							<button type="button" class="btn btn-rounded btn-sm" id="detailCls">close</button>
						</div>

					</div>
                </nav>

            <!-- Top Bar End -->


</div>
</body>
<%

%>
        <script>
            jQuery(document).ready(function($) {
				
            	// 로그아웃
				$("#logout").click(function(e){
					if(confirm("로그아웃하시겠습니까?")){
						e.preventDefault();
						alert("로그아웃 됩니다.");
						$(location).attr("href","${path}/member.do?method=logout");
					}
				});
				
            	// 알람 자세히 보기 dialog 창 설정
				 $("#dialog_alarm").dialog({
	    				autoOpen:false,
	    				closeOnEscape: false,
	    				modal:true
	    			});
				 
            	// 알람 자세히 보기 dialog 창 오픈
				$("#view").click(function(e){
					e.preventDefault();
					$("#dialog_alarm").dialog("open");
				});
				
				// 알람 자세히 보기 dialog 창 닫기
				$(".clsBox").click(function(){
					$("#dialog_alarm").dialog("close");
				});
				
				// 알람 전체삭제
				$("#clearAll").click(function(){
					if(confirm("알람을 전체삭제 하시겠습니까?")){
						$.ajax({
			                type:"post",
			                url:"${path}/dashboard.do?method=checkAllAlarm",
			                async: false,
			                dataType:"json",
			                success:function(data){
			                	var data = data.isSucc;
					    		if(data == "ok"){
					    			alert("알람이 전체삭제 되었습니다.");
					    		}
			                }
			            });  
					}
				});
				
				// 알람 개별삭제
				$(".clearBtn").click(function(){
					var taskid = $(this).attr('id'); 
					if(confirm("해당 알람을 삭제하시겠습니까?")){
						$.ajax({
			                type:"post",
			                url:"${path}/dashboard.do?method=checkEachAlarm&taskid="+taskid,
			                async: false,
			                dataType:"json",
			                success:function(data){
			                	var data = data.isSucc;
					    		if(data == "ok"){
					    			alert("선택하신 알람이 삭제되었습니다.");
					    		}else{
					    			alert("일시적오류입니다. 다시실행해주세요.");
					    		}
			                }
			            });  
						
						$("#dialog_alarm").dialog("close");
						window.location.reload();
					}
				});
				
				// 알람창에서 바로 삭제할경우 
				$(".eachClear").click(function(e){
					e.preventDefault();
					var taskid = $(this).attr('id'); 
					if(confirm("해당 알람을 삭제하시겠습니까?")){
						$.ajax({
			                type:"post",
			                url:"${path}/dashboard.do?method=checkEachAlarm&taskid="+taskid,
			                async: false,
			                dataType:"json",
			                success:function(data){
			                	var data = data.isSucc;
					    		if(data == "ok"){
					    			alert("선택하신 알람이 삭제되었습니다.");
					    		}else{
					    			alert("일시적오류입니다. 다시실행해주세요.");
					    		}
			                }
			            }); 
					window.location.reload();
					}
				});
            });    
        </script>
</html>