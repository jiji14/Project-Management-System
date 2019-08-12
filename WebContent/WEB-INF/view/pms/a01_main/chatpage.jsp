<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"

    import="java.util.*,java.net.*"

    %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

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

 

 #chatroom {

    max-width: 900px;

    margin: 80px 0px 0px 550px;

  }

 

 

</style>

<script src="${path}/a00_com/jquery.min.js"></script>

<script src='${path}/a00_com/packages/core/main.js'></script>

<script src='${path}/a00_com/packages/interaction/main.js'></script>

<script src='${path}/a00_com/packages/daygrid/main.js'></script>

<script src='${path}/a00_com/packages/timegrid/main.js'></script>

<script src="${path}/a00_com/jquery-ui.js"></script>

 

 

<script type="text/javascript">

	$(document).ready(function(){

		/* */

		//

		$("h1,table").attr("align","center");

		$("h1").html("시작^^");		

	});

</script>

</head>

<body>

<%

/*

 

*/

%>

 

 <div id="wrapper">

		<!-- header -->

		<aside>

			<jsp:include page="a04_sidebar.jsp" />

		</aside>

	

	<div class="contain">

			<jsp:include page="a04_header.jsp" />

	<div id="ok">

		<iframe src="http://192.168.0.13:8080/" id='chatroom'width="700" height="700" style="border:0">

		</iframe>	

	</div>		

</div>

</div>

</body>

</html>