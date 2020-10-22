<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>     
<script>
	$(document).ready(function(){
		//리뷰건수가 있는지 계산
		if(${requestScope.MustReviewPostSize>0}){
			alert("${requestScope.MustReviewPostSize}건 리뷰 작성이 필요합니다.");
			location.href="${pageContext.request.contextPath}/front?command=AddReviewForm&bbs_no=${requestScope.MustReviewPost.bbs_no}";		
		}
	})
</script>

홈인디?
<br>
<a href="${pageContext.request.contextPath}/front?command=getPostList">
게시판 리스트 보러가기
</a>
<br>

<div class="container">
	<!-- 1행 start -->
	<div class="row">
		<div class="col-sm-5 col-sm-offset-7" style="background-color:#green;width:300px;height:300px;" >
			<ul>
				<li>all</li>
				<li>all</li>
				<li>all</li>
			</ul>
		</div>
	</div>
	<!-- 1행 end -->
	<!-- 2행 start -->
	<div class="container">
		<div class="row">
			<div class="col-sm-5 col-sm-offset-7">
				<ul>
					<li>test</li>
					<li>test</li>
					<li>test</li>
				</ul>
			</div>
		</div>
		<!-- 1행 end -->
	</div>


</div>



