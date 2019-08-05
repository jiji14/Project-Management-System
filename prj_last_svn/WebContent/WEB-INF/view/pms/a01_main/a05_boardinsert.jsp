<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,java.net.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
<style type="text/css">
    .input-group-text{width:100%;}
    .input-group-prepend{width:20%;}
   
     #binsert {
    max-width: 900px;
    margin: 100px auto 0 auto;
  }
   
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
      var title='${board.title}';
      var no =${board.no};
      //입력 후 처리되는 내용(답글과 구분해서 처리)
      
      if(no==0 && title!=''){
         $("#title, #writer, #content").val('');
         $("#refno").val(0);
         if(confirm("등록 되었습니다!!\n메인페이지로 이동할려면 확인!")){
            $(location).attr("href","${path}/board.do?method=list");
         }
         
      }
      
      $("h1,table").attr("align","center");
      $("h1").html("게시판등록");   
      $("#regBtn").click(function(){
         if(confirm("등록하시겠습니까?")){
            if($("#title").val()==""){
               alert("제목은 반드시 등록 하여야 합니다.");
               return;
            }
            $("form").submit();
         }
      });
      $("#schBtn").click(function(){
         $(location).attr("href","${path}/board.do?method=list");
      });  
      
      //custom file input에  on change라는 이벤트가 일어나면 this(custom-file-input)이라는 애 옆에 custom-file-label(파일선택하세요!)에 input의 val를 넘겨주는 function이 일어난다. 회원가입할때 naver daum google 뒤에 있는 이메일 저절로 채워지는게 on change event 
      $(".custom-file-input").on("change",function(){
    	  //alert($(this).val()+":"+$(this).next(".custom-file-label").html());
    	  $(this).next(".custom-file-label").html($(this).val()); //custom file input 가 this.
      });
      
      
   });
</script>
</head>
<body>
   <div id="wrapper">
		<!-- header -->
		<aside>
			<jsp:include page="a04_sidebar.jsp" />
		</aside>
	
	<div class="contain">
			<jsp:include page="a04_header.jsp" />


<div class="container" id="binsert">
   <h1></h1>
   <!--  클래스의 종류 크기 commandName="모델 attribute이름"  board -->
   <!--  인코딩 타입. (txt,. img, video, 기존에 가지고 있는 form으로는 인코딩이 불가하여
       스프링 라이브러리 사용 위해 인코딩 변경해준다.	 -->
   <form:form commandName="board" method="post" enctype="MultiPart/form-data">   
   
   <div class="input-group mb-3">
      <div class="input-group-prepend">
         <span class="input-group-text">제 목</span>
      </div>
      <form:input path="title" class="form-control" placeholder="제목입력하세요" />   
      <div class="input-group-prepend">
         <span class="input-group-text">작 성 자</span>
      </div>
      <form:input path="writer" class="form-control" placeholder="작성자입력하세요" />		 
   </div>
   
   <div class="input-group mb-3">
   		<div class="input-group-prepend">
			<span class="input-group-text">카 테 고 리</span>
		</div>
		<form:select path="category" class="form-control" id="category" name="category" selected="${param.category}">
			<form:option value="공지사항"></form:option>
			<form:option value="일반글"></form:option>
			<form:option value="중요글"></form:option>
		</form:select>
   </div>
   
   <div class="input-group mb-3">
      <div class="input-group-prepend">
         <span class="input-group-text">상위 글 번호</span>
      </div>
      <form:input path="refno" class="form-control"/>    
   </div>
  
   <div class="input-group mb-3">
      <div class="input-group-prepend">
         <span class="input-group-text">내 용</span>
      </div>
      <form:textarea rows="10" path="content" class="form-control" placeholder="내용입력하세요"/>
   </div>
  
   <div class="input-group mb-3">
      <div class="input-group-prepend">
         <span class="input-group-text">파일 첨부1</span>
      </div>
      <div class="custom-file">
      		<input type="file" class="custom-file-input" id="file01" name="report">
   			<label class="custom-file-label" for="file01">파일 선택하세요!</label>
   	  </div>
   </div>
   
   <div class="input-group mb-3">
      <div class="input-group-prepend">
         <span class="input-group-text">파일 첨부2</span>
      </div>
      <div class="custom-file">
      		<input type="file" class="custom-file-input" id="file02" name="report">
   			<label class="custom-file-label" for="file02">파일 선택하세요!</label>
   	  </div>
   </div>
   
   
   <div class="input-group mb-3">
      <div class="input-group-prepend">
         <span class="input-group-text">파일 첨부3</span>
      </div>
      <div class="custom-file">
      		<input type="file" class="custom-file-input" id="file03" name="report">
   			<label class="custom-file-label" for="file03">파일 선택하세요!</label>
   	  </div>
   </div>
    
   <div style="text-align:right;">
         <input  type="button" class="btn btn-primary" 
         value="등록" id="regBtn"/>   
         <input  type="button" class="btn btn-success" 
         value="조회 화면" id="schBtn"/>
   </div>
   
   </form:form>
</div>
</div>
</div>

</body>
</html>