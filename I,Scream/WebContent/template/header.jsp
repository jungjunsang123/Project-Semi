<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
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
	      			<form class="searchForm" action="${pageContext.request.contextPath}/front">
	      			<input type="hidden" name="command" value="searchByText">
					  <div class="input-group">
					    <input type="text" class="form-control" placeholder="Search" name="searchText">
					    <div class="input-group-btn">
					      <button class="btn btn-default" type="submit">
					        <i class="glyphicon glyphicon-search"></i>
					      </button>
					    </div>
					  </div>
					</form>
    		</div>
    		<!-- 검색창 end -->
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
		     	 </ul>
				   	
		    </div>
		    <!--  -->

		 </div>
	 </div>
 </nav>
 <!-- 카테고리 end -->

    	
    	
  
