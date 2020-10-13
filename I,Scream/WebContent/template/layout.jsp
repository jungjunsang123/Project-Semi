<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myhome.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<c:import url="header.jsp"></c:import>
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-10 text-left"> 
    	내용들어갈것
     <%--  <c:import url="${requestScope.url }"></c:import> --%>
    </div>
    <div class="col-sm-2 sidenav">
    	<c:import url="right.jsp"></c:import>
    </div>
</div>
<c:import url="footer.jsp"></c:import>
</div>

</body>
</html>