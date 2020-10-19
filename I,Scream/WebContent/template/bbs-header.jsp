<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>   
  
<nav class="navbar">
  <div class="container-fluid">
    	<div class="row">
    		<!-- 로고 start-->
    		<div class="col-sm-3">
    			<a class="navbar-brand" href="${pageContext.request.contextPath}/front?command=home">HOME</a>
    		</div>
    		<!-- 로고 end-->
    		<!-- 검색창 start -->
    		<div class="col-sm-6">
	      			<form class="searchForm" action="/action_page.php">
					  <div class="input-group">
					    <input type="text" class="form-control" placeholder="Search">
					    <div class="input-group-btn">
					      <button class="btn btn-default" type="submit">
					        <i class="glyphicon glyphicon-search"></i>
					      </button>
					    </div>
					  </div>
					</form>
    		</div>
    		<!-- 검색창 end -->
    		<!-- 로그인 start-->
    		<div class="col-sm-3">
    			<div class="container">
    			<c:choose>
					<c:when test="${sessionScope.mvo==null}">
					<a href="${pageContext.request.contextPath}/front?command=registerForm">회원가입</a>
					<form method="post" class="form-inline" action="${pageContext.request.contextPath}/front">
						<input type="hidden" name="command" value="login">
					    		<div id="s-left"><input type="text" class="form-control"  name="id" placeholder="아이디" required="required"></div>
					    		<div id="mid_contents"><input type="password" class="form-control" name="password" placeholder="비밀번호"required="required"></div>
					    		<div id="s-right"><input type="submit" value="로그인"></div>
					  </form>
					</c:when>
					<c:otherwise>
						${sessionScope.mvo.name} 님 로그인 상태&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/front?command=logout">로그아웃</a><br>
						회원정보수정<!-- 회원정보수정 추가예정 -->
					</c:otherwise>
				</c:choose>
				</div>
    		</div>
    		<!-- 로그인 end-->

   		</div><!-- /row  -->
	</div>
 </nav>
<!-- 카테고리 start -->
<nav class="navbar">
  <div class="container-fluid">
   	<div class="row categorybar">
   	 		<!--  -->
    		<div class="collapse navbar-collapse">
			      <ul class="nav navbar-nav">
		 			 <li>
		 			 	<a href="#" class="burger-custom collapsed" data-toggle="collapse" data-target="#main-navbar" aria-expanded="false">
	     					<img src="${pageContext.request.contextPath}/image/Hamburger_icon2.png"></a>
		 			 </li>
			        <li><a href="${pageContext.request.contextPath}/front?command=getPostList" class="">채용정보</a></li>
			        <li><a href="#" class="nav-item nav-link">인재정보</a></li>
			        <li><a href="#" class="nav-item nav-link">이용안내</a></li>
			         <!-- 마이페이지 임시구현 -->
			        <li><a href="${pageContext.request.contextPath}/front?command=ReviewList">마이페이지(테스트)</a></li>
		     	 </ul>
				   	
		    </div>
		    <!--  -->

		 </div>
	 </div>
 </nav>
 <!-- 카테고리 end -->

    	
    	
  
