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
<style type="text/css">
#email,#idCheck {
	vertical-align:middle;
}

</style>

<script src="${path}/a01_com/assets/js/modernizr.min.js"></script>

       
</head>
<body style="padding:0">
<%
/*
*/
%>
   <div class="container-fluid" id="contentBox">
   <h1></h1>
   
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
                          Sign In
                       </button>
                       <button type="button" id ="SignupBtn" class="buttons">
                          Sign Up
                       </button>
                       </div>
                    </div>
                    
                    <div class="account-content">
                       <form action="${path}/join.do?method=insert" method="post">   
						
                          <div class="form-group mb-4 row">
                            
                               <div class="col-12">
                                  <label for="id">Email :</label>
 s                                    <input class="form-control" type="email" id="email" name="id" required="" placeholder="john@deo.com">
                                    <!-- VO의 getter와 여기있는 form의 name 은 똑같아야한다!!! -->
                                	<button class="btn btn-md btn-primary waves-effect waves-light" type="button" id="idCheck" name="idCheck">아이디 확인</button>
                                	
                                </div>
                            
                                
                           	
                            </div>

                            <div class="form-group mb-4 row">
                                <div class="col-12">
                                    <label for="username">User name :</label>
                                    <input class="form-control" type="text" name="name" placeholder="john deo">
                                </div>
                            </div>

                            <div class="form-group row mb-4">
                                <div class="col-12">
                                    <label for="password">Password :</label>
                                    <input class="form-control" type="password" name="pw" placeholder="Enter your password">
                                </div>
                            </div>
                           	
                            <div class="form-group row mb-4">
                                <div class="col-12">
                                    <label for="password">Confirm Password :</label>
                                    <input class="form-control" type="password" name="pwdum" placeholder="Enter your password">
                                </div>
                            </div>

                            <div class="form-group row mb-4">
                                <div class="col-12">
                                    <div class="checkbox checkbox-success">
                                        <input id="remember" type="checkbox" checked="">
                                        <label for="remember">
                                            I accept <strong><a href="#">Terms and Conditions</a></strong>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row text-right m-t-10">
                                <div class="col-12">
                                    <button class="btn btn-md btn-primary waves-effect waves-light" type="submit" id="regBtn">Register</button>
                                </div>
                            </div>
                      </form>
                  

                        <div class="row mt-4">
                            <div class="col-sm-12 text-center">
                                <a href="${path}/login.do">Already have account?</a>
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
         $(location).attr("href", "${path}/member.do?method=loginForm");
      });
      
      $('#SignupBtn').click(function(){   
         $('#SignupBtn').css('text-decoration', 'underline');
         $('#SignupBtn').css('font-weight', 'bold');
         $('#logBtn').css('text-decoration', 'none');
         $('#logBtn').css('font-weight', 'normal');
         $(location).attr("href", "${path}/join.do?method=insertForm");
      });
   
      
      $("#idCheck").click(function(){
     	 // alert("클릭");
   		//var query = {id : $("#id").val()};
   		var email = $("#email").val();
   		//var varData= 'email='+ email;
   		//console.log(varData);
   		
   		$.ajax({
   			type: "post",
   			url: "${path}/join.do?method=emailcheck",
   			
   			//dataType: "text",
   			data: {email:email},
   			dataType:"text",
   			success: function(data){
   				if(data=="no"){
   					alert("이미 가입된 이메일입니다. 다른 이메일로 가입해주세요");
   				}else{
   					alert("가입이 가능한 이메일입니다.");
   			}
   		},
  			error:function(xhr,status,error){
  				console.log(xhr);
  				console.log(status);
   				console.log(error);
   		}
   	});	
});      
      
      $(document).ready(function(){
      
      $("#regBtn").click(function(){
          if(confirm("회원가입하시겠습니까?")){
             if($("[name=id]").val()==""){
                alert("아이디는 반드시 등록 하여야 합니다.");
                return;
             }
             if($("[name=pw]").val()==""){
                 alert("비밀번호를 반드시 등록 하여야 합니다.");
                 return;
              }
             if($("[name=name]").val()==""){
                 alert("이름은 반드시 등록 하여야 합니다.");
                 return;
              }
        	    if (!address.contains("@") || !address.contains(".")){
         	 alert("이메일 주소를 입력해주세요.");
         	 return;
             }
        	 	$("form").submit();
          }
       });
      }); 
    });
    
</script>
</body>

</html>