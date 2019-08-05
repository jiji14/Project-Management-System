<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, java.net.*"
    %>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var ="path" value="${pageContext.request.contextPath}" />
<<fmt:requestEncoding value = "utf-8"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/a00_com.css">
<style type="tex/css">
	input[type=text]{width:100%;}
</style>
<script type="text/javascript" src="${path}/a00_com/jquery-3.4.1.js"></script>
<script type="text/javascript">
/*
  
 */
 $(document).ready(function(){
	 $("h1").html("스프링 환경 구축 시작 (일단 web 기본) jquery성공(jsp)");
 });

</script>
</head>
<body>
<%
/*
*/
%>
	<h1></h1>
	<table align="center">
		<tr><th>타이틀</th></tr>
		<tr><td>내용</td></tr>
	</table>
	

</body>
</html>