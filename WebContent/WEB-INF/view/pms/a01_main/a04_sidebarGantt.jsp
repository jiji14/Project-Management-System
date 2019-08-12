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

    </head>
<body>
       <!-- ========== Left Sidebar Start ========== -->
            <div class="left side-menu">
                <div class="slimscroll-menu" id="remove-scroll">

                    <!--- Sidemenu -->
                    <div id="sidebar-menu">
                        <!-- Left Menu Start -->
                        <ul class="metismenu" id="side-menu">
                            <li class="menu-title">Navigation</li>
							
                            <li>
                                <a href="${path}/dashboard.do?method=list">
                                    <i class="ion-md-speedometer"></i> 
                                    <span> Dashboard </span>
                                </a>
                            </li>
                            
                            <li>
                                <a href="${path}/project.do?method=list">
                               		<i class="ion-md-business"></i> 
                                	<span> Project </span> 
                                <span class="menu-arrow"></span>
                                </a>
                            </li>

                            <li>
                                <a href="${path}/members.do?method=list">
                                <i class="ion-md-person"></i> 
                                <span> Member </span> 
                                <span class="menu-arrow"></span>
                                </a>
                            </li>

                            <li>
                                <a href="${path}/calendar.do?method=list">
                                <i class="ion-ios-calendar"></i>
                                <span> Calendar </span>
                                <span class="menu-arrow"></span>
                                </a>
                            </li>

                            <li>
                                <a href="${path}/task.do?method=list">
                                <i class="ion-ios-bookmarks"></i>
                                <span> Task </span> 
                                <span class="menu-arrow"></span>
                                </a>
                            </li>

                            <li>
                                <a href="${path}/risk.do?method=list">
                                <i class="ion-md-flame"></i>
                                <span> Risk </span> 
                                <span class="menu-arrow"></span>
                                </a>
                            </li>

                            <li>
                                <a href="${path}/todolist.do?method=list">
                                <i class="ion-ios-leaf"></i>
                                <span> ToDoList </span>
                                <span class="menu-arrow"></span>
                                </a>
                            </li>

                            <li>
                                <a href="${path}/chat.do?method=list">
                                <i class="ion-md-map"></i> 
                                <span> CHAT </span> 
                                <span class="menu-arrow"></span>
                                </a>
                            </li>

                            <li>
                                <a href="${path}/permit.do?method=member">
                                <i class="ion-md-copy"></i> 
                                <span> Approval </span> 
                                <span class="menu-arrow"></span>
                                </a>
                            </li>
                            
                            <li>
                                <a href="${path}/board.do?method=list">
                                <i class="ion-md-copy"></i> 
                                <span> Board </span> 
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





</body>
<%

%>
</html>