<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.net.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="path/a00_com/bootstrap.min.css">
<link rel="stylesheet" href="path/a00_com/jquery-ui.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/ui-lightness/jquery-ui.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/ui-lightness/jquery-ui.css">
<style type="text/css">
/*  */

  #container {
    max-width: 900px;
    margin: 90px auto 0 auto;
  }


input[type=text]{width:100%;}
</style>
<script type="text/javascript" src="${path}/a00_com/jquery-3.4.1.js"></script>
<script type="text/javascript">
/*  */

   $(document).ready(function(){
      $("h1,table").attr("align","center");
      $("h1").html("게시판");
      
      $("#pageSize").change(function(){
    	  $("#curPage").val(1);
    	  $("form").submit();   //페이지 크기를 바꾸었을때 자동으로 paging 번호가 몇개인지 나타나게한다.
      });
      
      $("#reg").click(function(){
         if(confirm("게시물을 등록합니다")){
            //ex) 등록 화면 호출, 등록 처리
            //   1) controller 요청 메서드 구현
            //   2) 등록 화면 page 구성
            //   3) dao -> mapper.xml insert 구문 처리
            //   4) dao -> service -> controller
            //   5) 등록 화면에서 등록 처리 클릭 시, 정의된 controller 처리
            $(location).attr("href","${path}/board.do?method=insert");
         }
      });
      //단위로 class="data"
      $(".data").dblclick(function(){
         // <tr id="key 번호(id)"
         var no = $(this).attr("id");
         //alert(no);
         //controller 호출, 기능 메서드 : method=detail
         //controller 호출, 전달할 요청 : no=10 (글번호 요청 전달)
         
         $(location).attr("href","${path}/board.do?method=detail&no="+no);
      });
   });
	
   	function goPage(cnt){
		alert("페이지번호:"+cnt);
		$("#curPage").val(cnt);  //val(1) 페이지 사이즈를 바꿀때는 무조건 1로 해주세요~
		$("form").submit();
	}

</script>
</head>
<body>
<%
/*  */

%>
    <div id="wrapper">
		<!-- header -->
		<aside>
			<jsp:include page="a04_sidebar.jsp" />
		</aside>
	
	<div class="contain">
			<jsp:include page="a04_header.jsp" />

<div class="container" id="container">

	<h1></h1>
<!-- 
#spring 에서 지원하는 tag lib 
1. taglib prefix = "form" http://www.springframework.org/tags/form
2. form : form 로 tag lib를 활용할 수 있다.
   1) 모델 단위로 form의 속성값 commandName = "모델명 선언"
   2) form : input path = "요청값" id,name이 자동으로 생성
   3) value를 할당하지 않더라도 자동으로 매핑 처리
   <input type="text" class="form-control" name="title" placeholder="제목" value="${bsch.title}"/>
   <input type="text" class="form-control" name="writer" placeholder="작성자" value="${bsch.writer}"/>
-->

	<form:form commandName="bsch" method="post">
		<form:hidden path="curPage"/>  
	    <div class="input-group mb-3">
	      <div class="input-group-prepend">
	         <span class="input-group-text">검색항목</span>
	      </div>
	      <!-- <input name="title" value=${bsch.title}" -->
	      <form:input path="title" class="form-control" placeholder="제목"/>
	      <!-- 검색된 이후 자동으로 해당 검색어가 남아있도록 -->
	      <form:input path="writer" class="form-control" placeholder="작성자"/>
	      <div class="input-group-append">
	         <input type="submit" value="검색" class="btn btn-success" id="sch" />
	         <input type="button" value="등록" class="btn btn-primary" id="reg" />
	      </div>
	      
	   </div>
	   <div class="input-group mb-3">
	      <div class="input-group-prepend">
	         <span class="input-group-text">총 ${bsch.count}건</span>
	      </div>
	     
	      <input class="form-control"/>
	      
	      <div class="input-group-append">
	        <span class="input-group-text">페이지 크기:</span>		<!-- path는 formform일때 사용하면 한꺼번에 id와 name을 부여. -->
	         <form:select path="pageSize" class="form-control"> <!-- 여기서 pageSize 1페이지당 출력할 데이터건수를 form으로 받아서 -->
	         	<form:option value="3">3</form:option>
	         	<form:option value="5">5</form:option>
	         	<form:option value="10">10</form:option>
	         	<form:option value="20">20</form:option>
	         	<form:option value="30">30</form:option>
	         </form:select>
	      </div>
	      
	    </div>
	</form:form>

	<!-- ###PAGE BLOCK 처리### -->
	<ul class="pagination justify-content-center"> <!-- 새는걸 1부터 시작해서 마지막까지 카운트. 현재 위치한 페이지는 active bootstrap(highlight maybe?) -->
		<!-- Previous가 나올 조건: 시작블럭번호가 블럭의 크기보다 클 때 -->
		<c:if test = "${bsch.startBlock>bsch.blockSize}">
			<li class="page-item">
			<!-- previous를 클릭시, 이동할 페이지는 startBlock보다 1개 작은 번호-->
			<a class="page-link" href="javascript:goPage(${bsch.startBlock-1})">Previous</a></li>
		</c:if>
		<!-- 시작 block과 마지막 block번호가 출력되게 처리. -->
		<c:forEach var="cnt" begin="${bsch.startBlock}" end="${bsch.endBlock}">
			<li class="page-item ${bsch.curPage==cnt?'active':''}"> <!-- 3번을 눌렀을때 선택되고 active이 되며, 선택되지 않은것들은 공백으로 하고 -->
			<a class="page-link" href="javascript:goPage(${cnt})">${cnt}</a></li>
		</c:forEach>
		<!-- Next가 나올 조건: 마지막 블럭번호가 젠체페이지크기보다 작을 때.. -->
		<c:if test = "${bsch.endBlock<bsch.pageCount}">
			<li class="page-item"> 
			<!-- Next를 클릭시, 이동할 페이지는 endBlock보다 1개 큰 번호 -->
			<a class="page-link" href="javascript:goPage(${bsch.endBlock+1})">Next</a></li>
		</c:if>
	</ul>
	

	<table class="table table-hover table-striped">
	 <thead class="thead-light">
	  <tr><th>번호</th><th>카테고리</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th></tr>
	   <c:forEach var="board" items="${boardList}">
	       <!-- row 별로 데이터를 확인할 수 있게 처리 
	          id는 상세 데이터를 확인할 key를 설정 board.no
	          class는 해당 row를 jquery로 지정하기 위해서 설정 
	       -->
	    <tr class="data" id="${board.no}">
	      <!-- 답글의 레벨만큼 들여쓰기 표기 -->
	       <td>${board.no}</td>
	       <td>${board.category}</td>
	       <td>  <!-- status(sts)의 level은 1부터 시작하고 ?에서 끝나는데 1보다 큰것부터 마지막 레벨까지 ->를 타이틀 뒤에 붙여준다. -->
	      	 <c:forEach varStatus="sts" begin="1" end="${board.level}">
	      		&nbsp;&nbsp;<c:if test="${board.level>1 and sts.last}">→</c:if>
	         </c:forEach>   <!-- 여기에서 화살표글자를 댓글에 넣어준다. -->
	        	${board.title}
	       </td>
	         
	       <td>${board.writer}</td>
	       <td><fmt:formatDate value="${board.credte}"/></td>
	       <td>${board.readcnt}</td>
	    </tr>
	   </c:forEach>
	</table>
	</div>
  </div>
</div>
</body>
</html>