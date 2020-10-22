<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<div class="container">
	<br /> <a class="navbar-brand"
		href="${pageContext.request.contextPath}/front?command=home"><img
		class="img-fluid" alt="Bootstrap Image Preview"
		src="image/SeeTer2.png" style="width: 100px;"> </a>
	<div class="row justify-content-left">
		<div class="col-sm-8">
			<div class="card-body align-items-center">
			<div class="col-sm-auto">
				<form class="searchForm"
					action="${pageContext.request.contextPath}/front">
					<input type="hidden" name="command" value="searchByText">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search"
							name="searchText">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form></div>
			</div>
		</div>
		
		<div class="col-sm-4">
			<c:choose>
				<c:when test="${sessionScope.mvo==null}">
					<form method="post"
						action="${pageContext.request.contextPath}/front">
						<input type="hidden" name="command" value="login">
						<fieldset class="login_form">
							<div class="id_area">
								<span class="input_box"> <input type="text" name="id"
									placeholder="아이디" required="required" width=41px;>
								</span>&nbsp;&nbsp;<a
									href="${pageContext.request.contextPath}/front?command=registerForm">회원가입</a>
							</div>
							<div class="password_form">
								<span class="input box"> <input type="password"
									name="password" placeholder="비밀번호" required="required">
								</span>&nbsp;&nbsp;<input type="submit" value="로그인">
								&nbsp;&nbsp;
								<a href="javascript:loginWithKakao()"> 
									<img src="${pageContext.request.contextPath}/css/kakao_login_small.png">
								</a>
							</div>
						</fieldset>
					</form>
				</c:when>
				<c:otherwise>
					${sessionScope.mvo.name} 님 로그인 상태<br>
						<a href="${pageContext.request.contextPath}/front?command=mypage">마이페이지</a><br>
					<c:choose>
						<c:when test="${sessionScope.IsKakaoLogin=='YES'}">
							<a href="javascript:logoutWithKakao()">로그아웃</a><br>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/front?command=logout">로그아웃</a><br>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
			
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-xs-3 ">
			<nav>
				<br> <a
					href="${pageContext.request.contextPath}/front?command=getPostList">
					<button type="button" class="btn btn-outline-warning btn-block">전체
						게시판</button>
				</a>
			</nav>
		</div>
		<div class="col-xs-3 ">
			<nav>
				<br> <a
					href="${pageContext.request.contextPath}/front?command=YoungPostList">
					<button type="button" class="btn btn-outline-danger btn-block">아이돌봄
						게시판</button>
				</a>
			</nav>
		</div>
		<div class="col-xs-3 ">
			<nav>
				<br> <a
					href="${pageContext.request.contextPath}/front?command=OldPostList">
					<button type="button" class="btn btn-outline-success btn-block">노인케어
						게시판</button>
				</a>
			</nav>
		</div>
		<div class="col-xs-3 ">
			<nav>
				<br> <a
					href="${pageContext.request.contextPath}/front?command=PetPostList">
					<button type="button" class="btn btn-outline-primary btn-block">반려동물</button>
				</a>
			</nav>
		</div>
	</div>
</div>





