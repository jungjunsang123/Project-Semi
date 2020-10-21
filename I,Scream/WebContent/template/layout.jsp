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
<%-- SH : 잘못된 원인을 몰라 주석처리 --%>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myhome.css" /> --%>
<link href="https://fonts.googleapis.com/css?family=https://fonts.googleapis.com/css?family=Inconsolata:400,500,600,700|Raleway:400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">


</script>
</head>
<body>
<div class="container">
<%-- 상단 헤더 start --%>
	<c:import url="header.jsp"/>
	<!-- 상단 헤더 end -->
	<hr>
	<div class="row content content-custom">
			<div class="container">
			  <%-- 첫번째 지원자 start --%>
			  <c:set var="pb" value="${requestScope.Bchild_vo}" />
				<div class="col-sm-3">
					<h2>아이돌봄 우수회원</h2>
					<div class="card" style="width: 100%">
						<img class="card-img-top" src="image/img_avatar1.png"
							alt="Card image" style="width: 100%">
						<div class="card-body">
						<c:choose>
						<c:when test="${pb=='null'}">
						우수회원에 도전하세요
						</c:when>
						<c:otherwise>
						<h4 class="card-title">${pb.name}</h4>
							<p class="card-text">평균 별점: ${pb.star}</p>
							<a href="front?command=getProfileDetail&id=${pb.id}&avgstar=${pb.star}" class="btn btn-danger">프로필보러가기</a>
						</c:otherwise>
						</c:choose>
						</div>
					</div>
				</div>
				<%-- 첫번째 지원자 end --%>
				<%-- 두번째 지원자 start --%>
				 <c:set var="pb" value="${requestScope.Bsenior_vo}" />
				<div class="col-sm-3">
					<h2>노인케어 우수회원</h2>
					<div class="card" style="width: 100%">
						<img class="card-img-top" src="image/img_avatar1.png"
							alt="Card image" style="width: 100%">
						<div class="card-body">
						<c:choose>
						<c:when test="${pb==null}">
						우수회원에 도전하세요!
						</c:when>
						<c:otherwise>
						<h4 class="card-title">${pb.name}</h4>
							<p class="card-text">평균 별점: ${pb.star}</p>
							<a href="front?command=getProfileDetail&id=${pb.id}&avgstar=${pb.star}" class="btn btn-success">프로필보러가기</a>
						</c:otherwise>
						</c:choose>
						</div>
					</div>
				</div>
				<%-- 두번째 지원자 end--%>
				<%-- 세번째 지원자 start--%>
				<c:set var="pb" value="${requestScope.Bpet_vo}" />
				<div class="col-sm-3">
					<h2>반려동물 우수회원</h2>
					<div class="card" style="width: 100%">
						<img class="card-img-top" src="image/img_avatar1.png"
							alt="Card image" style="width: 100%">
						<div class="card-body">
							<c:choose>
						<c:when test="${pb==null}">
						우수회원에 도전하세요!
						</c:when>
						<c:otherwise>
						<h4 class="card-title">${pb.name}</h4>
							<p class="card-text">평균 별점: ${pb.star}</p>
							<a href="front?command=getProfileDetail&id=${pb.id}&avgstar=${pb.star}" class="btn btn-primary">프로필보러가기</a>
						</c:otherwise>
						</c:choose>
						</div>
					</div>
				</div>
				<%-- 세번째 지원자 end --%>
		    <!-- 오른쪽 사이드바 start -->
		    <div class="col-sm-2 sidenav">
		    	<c:import url="right.jsp"/>
		    </div>
		     <!-- 오른쪽 사이드바 end -->
		</div>
	<%-- 하단 풋터 start --%>
	<c:import url="footer.jsp"/>
	<%-- 하단 풋터 end --%>
</div>
</body>
</html>