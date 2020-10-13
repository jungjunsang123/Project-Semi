<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>     
<nav class="navbar">
  <div class="container-fluid">
    	<div class="row">
    		<!-- 로고 -->
    		<div class="col-sm-3">
    			<a class="navbar-brand" href="#">Logo</a>
    		</div>
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
   		</div>
   		<!-- 카테고리 start -->
    	<div class="row categorybar">
    		<div class="navbar-header">
	    		<div class="collapse navbar-collapse">
			      <ul class="nav navbar-nav">
			        <li><a href="#">채용정보</a></li>
			        <li><a href="#">인재정보</a></li>
			        <li><a href="#">이용안내</a></li>
			      </ul>
			    </div>
			 </div>
		 </div>
		 <!-- 카테고리 end -->
    	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    	</div>
  
</nav>