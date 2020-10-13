<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/myhome.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<c:import url="header.jsp" />
		<div class="row content content-custom">
			<div class="main">
				<div class="col-sm-9 text-left">
					<c:import url="${requestScope.url }"></c:import>
				</div>
			</div>
			<div class="col-sm-3 sidenav">
				<c:import url="right.jsp" />
			</div>

			<c:import url="footer.jsp" />
		</div>
	</div>

</body>
</html>