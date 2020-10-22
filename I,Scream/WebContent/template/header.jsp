<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
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
<div class="container"><br/>
<%-- 로고이미지 start --%>
   <a class="navbar-brand" href="${pageContext.request.contextPath}/front?command=home">
   <img class="img-fluid" alt="Bootstrap Image Preview" src="image/SeeTer2.png" style="width: 100px;"> </a>
   <div class="row justify-content-left">
   <%-- 로고이미지 end --%>
   <%-- 검색기능 start --%>
      <div class="col-sm-9">
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
      <%-- 검색기능 end --%>
   </div>
</div>
<div class="container">
   <div class="row">
   <%-- 첫번째 게시판 메뉴바 start --%>
         <div class="col-xs-3 ">
         <nav>
            <br><a href="${pageContext.request.contextPath}/front?command=getPostList">
            <button type="button" class="btn btn-outline-warning btn-block">전체 게시판</button>
         </a></nav>
      </div>
      <%-- 첫번째 게시판 메뉴바 end --%>
      <%-- 두번째 게시판 메뉴바 start --%>
      <div class="col-xs-3 ">
         <nav>
            <br><a href="${pageContext.request.contextPath}/front?command=YoungPostList">
            <button type="button" class="btn btn-outline-danger btn-block">아이돌봄 게시판</button>
         </a></nav>
      </div>
      <%-- 두번째 게시판 메뉴바 end --%>
      <%-- 세번째 게시판 메뉴바 start --%>
      <div class="col-xs-3 ">
         <nav>
            <br><a href="${pageContext.request.contextPath}/front?command=OldPostList">
            <button type="button" class="btn btn-outline-success btn-block">노인케어 게시판</button>
         </a></nav>
      </div>
      <%-- 세번째 게시판 메뉴바 end --%>
      <%-- 네번째 게시판 메뉴바 start --%>
      <div class="col-xs-3 ">
         <nav>
            <br><a href="${pageContext.request.contextPath}/front?command=PetPostList">
            <button type="button" class="btn btn-outline-primary btn-block">반려동물</button>
         </a></nav>
      </div>
      <%-- 네번째 게시판 메뉴바 end --%>
   </div>
</div>