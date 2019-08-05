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


        <!-- sweet alerts -->
        <link href="${path}/a01_com/plugins/sweet-alert2/sweetalert2.min.css" rel="stylesheet">

        <!-- App css -->
        <link href="${path}/a01_com/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${path}/a01_com/assets/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="${path}/a01_com/assets/css/metismenu.min.css" rel="stylesheet" type="text/css" />
        <link href="${path}/a01_com/assets/css/app.css" rel="stylesheet" type="text/css" />
        <!-- your custom css -->
        <link href="${path}/a01_com/assets/css/style.css" rel="stylesheet" type="text/css" />

        <script src="${path}/a01_com/assets/js/modernizr.min.js"></script>

<script type="text/javascript">

	$(document).ready(function(){
		
		$('.logout').click(function(){
            if(confirm("로그아웃 하시겠습니까?")){
               $(location).attr("href","${path}/member.do?method=loginForm");
            }
         });
	
		$('#hello').click=function(){
			if(confirm("수정하시겠습니까?")){
				$("form").attr("href","${path}/profile.do?method=update");
				$("form").submit();
			}
		}
	
	});
	
	
</script>
</head>
 <body>

        <!-- Begin page -->
        <div id="wrapper">

            <!-- Top Bar Start -->
            <div class="topbar">

                <!-- LOGO -->
                <div class="topbar-left">
                     <a href="${path}/dashboard.do" class="logo">
                        <span>
                            <img src="assets/images/logo.png" alt="" height="18">
                        </span>
                        <i>
                            <img src="assets/images/logo_sm.png" alt="" height="22">
                        </i>
                    </a>
                </div>

                <nav class="navbar-custom">

                    <ul class="list-inline float-right mb-0">
                        <li class="list-inline-item dropdown notification-list">
                            <a class="nav-link dropdown-toggle arrow-none" data-toggle="dropdown" href="#" role="button"
                               aria-haspopup="false" aria-expanded="false">
                                <i class="mdi mdi-email-outline noti-icon waves-light waves-effect"></i>
                            </a>
                            <span class="badge badge-purple noti-icon-badge">3</span>
                            <div class="dropdown-menu dropdown-menu-animated dropdown-menu-right dropdown-arrow dropdown-lg">
                                <!-- item-->
                                <div class="dropdown-item noti-title">
                                    <h5 class="m-0"><span class="float-right"><a href="" class="text-dark"><small>Clear All</small></a> </span>Chat</h5>
                                </div>

                                <div class="slimscroll" style="max-height: 230px;">
                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon"><img src="assets/images/users/avatar-2.jpg" class="img-fluid rounded-circle" alt="" /> </div>
                                        <p class="notify-details">Cristina Pride</p>
                                        <p class="text-muted mb-0 user-msg">Hi, How are you? What about our next meeting</p>
                                    </a>

                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon"><img src="assets/images/users/avatar-3.jpg" class="img-fluid rounded-circle" alt="" /> </div>
                                        <p class="notify-details">Sam Garret</p>
                                        <p class="text-muted mb-0 user-msg">Yeah everything is fine</p>
                                    </a>

                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon"><img src="assets/images/users/avatar-4.jpg" class="img-fluid rounded-circle" alt="" /> </div>
                                        <p class="notify-details">Karen Robinson</p>
                                        <p class="text-muted mb-0 user-msg">Wow that's great</p>
                                    </a>

                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon"><img src="assets/images/users/avatar-5.jpg" class="img-fluid rounded-circle" alt="" /> </div>
                                        <p class="notify-details">Sherry Marshall</p>
                                        <p class="text-muted mb-0 user-msg">Hi, How are you? What about our next meeting</p>
                                    </a>

                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon"><img src="assets/images/users/avatar-6.jpg" class="img-fluid rounded-circle" alt="" /> </div>
                                        <p class="notify-details">Shawn Millard</p>
                                        <p class="text-muted mb-0 user-msg">Yeah everything is fine</p>
                                    </a>
                                </div>

                                <!-- All-->
                                <a href="javascript:void(0);" class="dropdown-item text-center text-dark notify-item notify-all">
                                    View all <i class="fi-arrow-right"></i>
                                </a>

                            </div>
                        </li>

                        <li class="list-inline-item dropdown notification-list">
                            <a class="nav-link dropdown-toggle arrow-none" data-toggle="dropdown" href="#" role="button"
                               aria-haspopup="false" aria-expanded="false">
                                <i class="mdi mdi-bell-outline noti-icon waves-light waves-effect"></i>
                            </a>
                            <span class="badge badge-pink noti-icon-badge">4</span>
                            <div class="dropdown-menu dropdown-menu-animated dropdown-menu-right dropdown-arrow dropdown-lg">
                                <!-- item-->
                                <div class="dropdown-item noti-title">
                                    <h5 class="m-0"><span class="float-right"><a href="" class="text-dark"><small>Clear All</small></a> </span>Notification</h5>
                                </div>

                                <div class="slimscroll" style="max-height: 230px;">
                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon text-success"><i class="mdi mdi-comment-account-outline"></i></div>
                                        <p class="notify-details">Caleb Flakelar commented on Admin<small class="text-muted">1 min ago</small></p>
                                    </a>

                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon text-info"><i class="mdi mdi-account-plus"></i></div>
                                        <p class="notify-details">New user registered.<small class="text-muted">5 hours ago</small></p>
                                    </a>

                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon text-danger"><i class="mdi mdi-heart"></i></div>
                                        <p class="notify-details">Carlos Crouch liked <b>Admin</b><small class="text-muted">3 days ago</small></p>
                                    </a>

                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon text-warning"><i class="mdi mdi-comment-account-outline"></i></div>
                                        <p class="notify-details">Caleb Flakelar commented on Admin<small class="text-muted">4 days ago</small></p>
                                    </a>

                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon text-purple"><i class="mdi mdi-account-plus"></i></div>
                                        <p class="notify-details">New user registered.<small class="text-muted">7 days ago</small></p>
                                    </a>

                                    <!-- item-->
                                    <a href="javascript:void(0);" class="dropdown-item notify-item">
                                        <div class="notify-icon text-primary"><i class="mdi mdi-heart"></i></div>
                                        <p class="notify-details">Carlos Crouch liked <b>Admin</b><small class="text-muted">13 days ago</small></p>
                                    </a>
                                </div>

                                <!-- All-->
                                <a href="javascript:void(0);" class="dropdown-item text-center text-dark notify-item notify-all">
                                    View all <i class="fi-arrow-right"></i>
                                </a>

                            </div>
                        </li>

                        <li class="list-inline-item dropdown notification-list">
                            <a class="nav-link dropdown-toggle nav-user" data-toggle="dropdown" href="#" role="button"
                               aria-haspopup="false" aria-expanded="false">
                                <i class="noti-icon"><img src="assets/images/users/avatar-1.jpg" alt="user" class="img-fluid rounded-circle"></i>
                                <span class="profile-username ml-2 text-muted">Thompson </span> <span class="mdi mdi-menu-down text-muted"></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-animated dropdown-menu-right profile-dropdown ">
                                <!-- item-->
                                <div class="dropdown-item noti-title">
                                    <h5 class="text-overflow"><small>Welcome ! John</small> </h5>
                                </div>

                                <!-- item-->
                                <a href="${path}/profile.do" class="dropdown-item notify-item">
                                    <i class="mdi mdi-account-circle"></i> <span>Profile</span>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <i class="mdi mdi-settings"></i> <span>Settings</span>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <i class="mdi mdi-lock-open"></i> <span>Lock Screen</span>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <i class="mdi mdi-power"></i> <span class="logout">Logout</span>
                                </a>

                            </div>
                        </li>

                    </ul>

                    <ul class="list-inline menu-left mb-0">
                        <li class="float-left">
                            <button class="button-menu-mobile open-left waves-light waves-effect">
                                <i class="mdi mdi-menu"></i>
                            </button>
                        </li>
                        <li class="hide-phone app-search">
                            <form role="search" class="">
                                <input type="text" placeholder="Search..." class="form-control">
                                <a href=""><i class="fa fa-search"></i></a>
                            </form>
                        </li>
                    </ul>

                </nav>

            </div>
            <!-- Top Bar End -->


            <!-- ========== Left Sidebar Start ========== -->
            <div class="left side-menu">
                <div class="slimscroll-menu" id="remove-scroll">

                    <!--- Sidemenu -->
                    <div id="sidebar-menu">
                        <!-- Left Menu Start -->
                         <ul class="metismenu" id="side-menu">
                            <li class="menu-title">Navigation</li>
							
                            <li>
                                <a href="${path}/dashboard.do">
                                    <i class="ion-md-speedometer"></i> 
                                    <span> Dashboard </span>
                                </a>
                            </li>
                            
                            <li>
                                <a href="javascript: void(0);">
                               		<i class="ion-md-basket"></i> 
                                	<span> Project </span> 
                                <span class="menu-arrow"></span>
                                </a>
                            </li>

                            <li>
                                <a href="javascript: void(0);">
                                <i class="ion-ios-apps"></i> 
                                <span> Member </span> 
                                <span class="menu-arrow"></span>
                                </a>
                            </li>

                            <li>
                                <a href="${path}/calendar.do">
                                <i class="ion-md-paper"></i>
                                <span> Calendar </span>
                                <span class="menu-arrow"></span>
                                </a>
                            </li>

                            <li>
                                <a href="javascript: void(0);">
                                <i class="ion-ios-list"></i>
                                <span> Task </span> 
                                <span class="menu-arrow"></span>
                                </a>
                            </li>

                            <li>
                                <a href="javascript: void(0);">
                                <i class="ion-md-pie"></i>
                                <span> Risk </span> 
                                <span class="menu-arrow"></span>
                                </a>
                            </li>

                            <li>
                                <a href="javascript: void(0);">
                                <i class="ion-md-mail"></i>
                                <span> Issue </span>
                                <span class="menu-arrow"></span>
                                </a>
                            </li>

                            <li>
                                <a href="javascript: void(0);">
                                <i class="ion-md-map"></i> 
                                <span> 미정 </span> 
                                <span class="menu-arrow"></span>
                                </a>
                            </li>

                            <li>
                                <a href="javascript: void(0);">
                                <i class="ion-md-copy"></i> 
                                <span> 미정 </span> 
                                <span class="menu-arrow"></span>
                                </a>
                            </li>

                        </ul>

                    </div>
                    <!-- Sidebar -->
                    <div class="clearfix"></div>

                </div>
                <!-- Sidebar -left -->

            </div>
            <!-- Left Sidebar End -->



            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->
            <div class="content-page">
                <!-- Start content -->
                <div class="content">
                    <div class="container-fluid">

                        <div class="row">
                            <div class="col-sm-12">
                                <div class="profile-bg-picture" style="background-image:url('assets/images/bg-profile.jpg')">
                                    <span class="picture-bg-overlay"></span><!-- overlay -->
                                </div>
                                <!-- meta -->
                                <div class="profile-user-box">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="profile-user-img"><img src="assets/images/users/avatar-1.jpg" alt="" class="thumb-lg rounded-circle"></div>
                                            <div class="">
                                                <h4 class="mt-5 m-b-5 font-18 ellipsis">${profileList.name}</h4>
                                                <p class="font-13">${profileList.job}</p>
                                                <p class="text-muted m-b-0"><small>${profileList.dept}</small></p>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="text-right">
                                                <button type="button" class="btn btn-success waves-effect waves-light">
                                                    <i class="mdi mdi-account-settings-variant m-r-5"></i> Edit Profile
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--/ meta -->
                            </div>
                            </div>
                        </div>

                        <div class="row m-t-30">
                            <div class="col-sm-12">
                                <div class="card p-0">
                                    <div class="card-body p-0"> 
                                        <ul class="nav nav-tabs profile-tabs">
                                            <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#aboutme">About Me</a></li>
                                            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#user-activities">Activities</a></li>
                                            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#edit-profile">Settings</a></li>
                                            <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#projects">Projects</a></li>
                                        </ul>
        
                                        <div class="tab-content m-0 p-4"> 
        
                                            <div id="aboutme" class="tab-pane active">
                                            <div class="profile-desk">
                                                <h4 class="text-uppercase font-weight-bold">${profileList.name}</h4>
                                                <div class="designation mb-4">PRODUCT DESIGNER (UX / UI / Visual Interaction)</div>
                                                <p class="text-muted">
                                                    I have 10 years of experience designing for the web, and specialize in the areas of user interface design, interaction design, visual design and prototyping. I’ve worked with notable startups including Pearl Street Software.
                                                </p>
                                                <a class="btn btn-primary m-t-20" href="#"> <i class="fa fa-check"></i> Following</a>
                                                
                                                <table class="table table-condensed">
                                                    <thead>
                                                        <tr>
                                                            <th colspan="3"><h4 class="mt-4">Contact Information</h4></th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td><b>Url</b></td>
                                                            <td>
                                                            <a href="#" class="ng-binding">
                                                                www.example.com
                                                            </a></td>
                                                        </tr>
                                                        <tr>
                                                            <td><b>Email</b></td>
                                                            <td>
                                                            <a href="" class="ng-binding">
                                                                suhyun27@naver.com
                                                            </a></td>
                                                        </tr>
                                                        <tr>
                                                            <td><b>Phone</b></td>
                                                            <td class="ng-binding">(123)-456-7890</td>
                                                        </tr>
                                                        <tr>
                                                            <td><b>Skype</b></td>
                                                            <td>
                                                            <a href="" class="ng-binding">
                                                                suhyun27
                                                            </a></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div> <!-- end profile-desk -->
                                        </div> <!-- about-me -->
        
        
                                        <!-- Activities -->
                                        <div id="user-activities" class="tab-pane">
                                            <div class="timeline-2">
                                                <div class="time-item">
                                                    <div class="item-info ml-3 mb-3">
                                                        <div class="text-muted">5 minutes ago</div>
                                                        <p><strong><a href="#" class="text-info">John Doe</a></strong> Uploaded a photo <strong>"DSC000586.jpg"</strong></p>
                                                    </div>
                                                </div>
        
                                                <div class="time-item">
                                                    <div class="item-info ml-3 mb-3">
                                                        <div class="text-muted">30 minutes ago</div>
                                                        <p><a href="" class="text-info">Lorem</a> commented your post.</p>
                                                        <p><em>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam laoreet tellus ut tincidunt euismod. "</em></p>
                                                    </div>
                                                </div>
        
                                                <div class="time-item">
                                                    <div class="item-info ml-3 mb-3">
                                                        <div class="text-muted">59 minutes ago</div>
                                                        <p><a href="" class="text-info">Jessi</a> attended a meeting with<a href="#" class="text-success">John Doe</a>.</p>
                                                        <p><em>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam laoreet tellus ut tincidunt euismod. "</em></p>
                                                    </div>
                                                </div>
        
                                                <div class="time-item">
                                                    <div class="item-info ml-3 mb-3">
                                                        <div class="text-muted">5 minutes ago</div>
                                                        <p><strong><a href="#" class="text-info">John Doe</a></strong>Uploaded 2 new photos</p>
                                                    </div>
                                                </div>
        
                                                <div class="time-item">
                                                    <div class="item-info ml-3 mb-3">
                                                        <div class="text-muted">30 minutes ago</div>
                                                        <p><a href="" class="text-info">Lorem</a> commented your post.</p>
                                                        <p><em>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam laoreet tellus ut tincidunt euismod. "</em></p>
                                                    </div>
                                                </div>
        
                                                <div class="time-item">
                                                    <div class="item-info ml-3 mb-3">
                                                        <div class="text-muted">59 minutes ago</div>
                                                        <p><a href="" class="text-info">Jessi</a> attended a meeting with<a href="#" class="text-success">John Doe</a>.</p>
                                                        <p><em>"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam laoreet tellus ut tincidunt euismod. "</em></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
        
                                        <!-- settings -->
                                        <div id="edit-profile" class="tab-pane">
                                            <div class="user-profile-content">
                                                <form role="form" action="${path}/profile.do?method=update" method="post">
                                                    <div class="form-group">
                                                        <label for="name">이름</label>
                                                        <input type="text" value="${profileList.name}" name="name" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="dept">부서</label>
                                                        <input type="text" value="${profileList.dept}" name="dept" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="job">직급</label>
                                                        <input type="text" value="${profileList.job}" name="job" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="Password">비밀번호</label>
                                                        <input type="password" placeholder="6 - 15 Characters" name="pw" class="form-control">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="RePassword">비밀번호(재)</label>
                                                        <input type="password" placeholder="6 - 15 Characters" id="RePassword" class="form-control">
                                                    </div>
                                                    <button class="btn btn-primary" type="submit" id="hello">Save</button>
                                                </form>
                                            </div>
                                        </div>
        
        
                                        <!-- profile -->
                                        <div id="projects" class="tab-pane">
                                            <div class="row m-t-10">
                                                <div class="col-md-12">
                                                    <div class="portlet"><!-- /primary heading -->
                                                        <div id="portlet2" class="panel-collapse collapse show">
                                                            <div class="portlet-body">
                                                                <div class="table-responsive">
                                                                    <table class="table">
                                                                        <thead>
                                                                            <tr>
                                                                                <th>#</th>
                                                                                <th>Project Name</th>
                                                                                <th>Start Date</th>
                                                                                <th>Due Date</th>
                                                                                <th>Status</th>
                                                                                <th>Assign</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <tr>
                                                                                <td>1</td>
                                                                                <td>Velonic Admin</td>
                                                                                <td>01/01/2015</td>
                                                                                <td>07/05/2015</td>
                                                                                <td><span class="label label-info">Work in Progress</span></td>
                                                                                <td>Coderthemes</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>2</td>
                                                                                <td>Velonic Frontend</td>
                                                                                <td>01/01/2015</td>
                                                                                <td>07/05/2015</td>
                                                                                <td><span class="label label-success">Pending</span></td>
                                                                                <td>Coderthemes</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>3</td>
                                                                                <td>Velonic Admin</td>
                                                                                <td>01/01/2015</td>
                                                                                <td>07/05/2015</td>
                                                                                <td><span class="label label-pink">Done</span></td>
                                                                                <td>Coderthemes</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>4</td>
                                                                                <td>Velonic Frontend</td>
                                                                                <td>01/01/2015</td>
                                                                                <td>07/05/2015</td>
                                                                                <td><span class="label label-purple">Work in Progress</span></td>
                                                                                <td>Coderthemes</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>5</td>
                                                                                <td>Velonic Admin</td>
                                                                                <td>01/01/2015</td>
                                                                                <td>07/05/2015</td>
                                                                                <td><span class="label label-warning">Coming soon</span></td>
                                                                                <td>Coderthemes</td>
                                                                            </tr>
                                                                            
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div> <!-- /Portlet -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                        
                                </div> 
                            </div>
                        </div>
                                    


                    </div> <!-- container -->

                </div> <!-- content -->

                <footer class="footer">
                    2015 - 2019 © Velonic - Coderthemes.com
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

        <!-- Jquery-Ui -->
        <script src="${path}/a01_com/plugins/jquery-ui/jquery-ui.min.js"></script>

        <script src="${path}/a01_com/plugins/moment/moment.js"></script>
        <script src="${path}/a01_com/plugins/fullcalendar/js/fullcalendar.min.js"></script>

        <!--dragging calendar event-->
        <script src="${path}/a01_com/assets/pages/calendar-init.js"></script>

        <!-- App js -->
        <script src="${path}/a01_com/assets/js/jquery.core.js"></script>
        <script src="${path}/a01_com/assets/js/jquery.app.js"></script>

    </body>
</html>