<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myhome.css" />
<meta charset="UTF-8">
<title>아이스크림</title>
</head>
<body>
<div class="container">
<%-- 상단 헤더 start --%>
	<c:import url="header.jsp"/>
	<!-- 상단 헤더 end -->
	<hr>
	<div class="row content">
			<div class="container">
			 	<c:import url="${requestScope.url}"/>
		    <!-- 오른쪽 사이드바 start -->
		    <div class="col-sm-2 sidenav">
		    	<c:import url="right.jsp"/>
		    </div>
		     <!-- 오른쪽 사이드바 end -->
			</div>
	</div>
	<%-- 하단 풋터 start --%>
	<hr>
	<c:import url="footer.jsp"/>
	<%-- 하단 풋터 end --%>
</div>
</body>
</html>