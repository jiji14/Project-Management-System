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
<!-- your custom css -->
<link href="${path}/a01_com/assets/css/a00_login.css" rel="stylesheet" type="text/css" />
<link href="${path}/a01_com/assets/css/style.css" rel="stylesheet" type="text/css" />

<!-- App favicon -->
<link rel="shortcut icon" href="${path}/a01_com/assets/images/favicon.ico">

<!-- App css -->
        
<script src="${path}/a01_com/assets/js/modernizr.min.js"></script>
<script src="${path}/a01_com/assets/js/jquery.min.js"></script>
<script src="${path}/a01_com/Documentation/js/bootstrap.min.js"></script>

<!-- App favicon -->
<link rel="shortcut icon" href="${path}/a01_com/assets/images/favicon.ico">

<!-- App css -->
<link href="${path}/a01_com/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="${path}/a01_com/assets/css/icons.css" rel="stylesheet" type="text/css" />
<link href="${path}/a01_com/assets/css/metismenu.min.css" rel="stylesheet" type="text/css" />
<link href="${path}/a01_com/assets/css/app.css" rel="stylesheet" type="text/css" />


<script src="${path}/a01_com/assets/js/modernizr.min.js"></script>
        
</head>
<body style="padding:0">
<%
/*
*/
%>
	<div class="container-fluid" id="contentBox">
		<div id="leftBackgnd" class="items">
			<div class="left_items">
				<ul class="first_line hidden">
					<li>P</li>
					<li>L</li>
					<li>A</li>
					<li>N</li>
				</ul>

				<ul class="second_line hidden">
					<li>S</li>
					<li>H</li>
					<li>A</li>
					<li>R</li>
					<li>E</li>
				</ul>

				<ul class="third_line hidden">
					<li>E</li>
					<li>N</li>
					<li>J</li>
					<li>O</li>
					<li>Y</li>
				</ul>
			</div>
		</div>
		<div id="rightBackgnd" class="items">
        	<div class="account-pages" id="account_info">
            	<div class="account-box" id="account-box">
                	<div class="account-logo-box bg-primary p-4" id="p-4">
                    	<div class="button-box">
		                    <button type="button" id="logBtn" class="buttons">
		                    	Sign in
		                    </button>
		                    <button type="button" id ="SignupBtn" class="buttons">
		                    	Sign up
		                    </button>
	                    
                    	</div>
                    </div>
                    
					<div class="account-content">
                    	
						<form method="post" action="${path}/member.do?method=login">
                        <div class="form-group  mb-4 row">
                        	<div class="col-12">
                            	<label for="emailaddress">Email Address :</label>
                                <input class="form-control" type="email" id="emailaddress" required="" placeholder="john@deo.com" name="id">
                            </div>
                        </div>

                        <div class="form-group row mb-4">
                        	<div class="col-12">
                        		<label for="password">Password :</label>
                        		<input class="form-control" type="password" required="" id="password" placeholder="Enter your password" name="pw">
                        	</div>
                        </div>

                        <div class="form-group row mb-4">
                        	<div class="col-12">
                        		<div class="checkbox checkbox-success">
                        			<input id="remember" type="checkbox" checked="">
                        			<label for="remember">
                        				Remember me
                        			</label>
                        			<a href="pages-recoverpw.html" class="text-muted float-right">Forgot your password?</a>
                        		</div>
                        	</div>
                        </div>

                        <div class="form-group row text-center m-t-10">
                        	<div class="col-12">
                        		<button class="btn btn-md btn-block btn-primary waves-effect waves-light" type="submit">Sign In</button>
                        	</div>
                        </div>
					</form>

                    <div class="row mt-4">
                    	<div class="col-sm-12 text-center">
                    		<p class="text-muted">Don't have an account? <a href="${path}/join.do?method=insertForm" class="text-dark m-l-5"><b>Sign Up</b></a></p>
                    	</div>
                    </div>
            	</div>
			</div>	
		</div>
	</div>
</div>



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
		
		var check = "${checklogin}";
		
 		if(check =="loginfail"){
			alert("로그인 정보가 일치하지 않습니다");
			
		} 
		
		
		setTimeout(function(){
			$('.first_line').removeClass('hidden');
			$('.second_line').removeClass('hidden');
			$('.third_line').removeClass('hidden');
		},1000);
	
		// 클릭했을때 밑줄 및 글짜크게
		$('#logBtn').click(function(){	
			$('#logBtn').css('text-decoration', 'underline');
			$('#logBtn').css('font-weight', 'bold');
			$('#SignupBtn').css('text-decoration', 'none');
			$('#SignupBtn').css('font-weight', 'normal');
			$(location).attr("href", "${path}/member.do");
			
			
			
		});
		
		$('#SignupBtn').click(function(){	
			$('#SignupBtn').css('text-decoration', 'underline');
			$('#SignupBtn').css('font-weight', 'bold');
			$('#logBtn').css('text-decoration', 'none');
			$('#logBtn').css('font-weight', 'normal');
			$(location).attr("href", "${path}/join.do?method=insertForm");
		});
		
	});
	
	
	
</script>
</body>

</html>