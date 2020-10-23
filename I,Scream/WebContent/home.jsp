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
 <%-- 첫번째 지원자 start --%>
			  <c:set var="pb" value="${requestScope.Bchild_vo}" />
				<div class="col-sm-3">
					<h2>아이돌봄 우수회원</h2>
					<div class="card" style="width: 100%">
						<c:choose>
							<c:when test="${pb.profile_path!=NULL}">
								<img src="${pageContext.request.contextPath}/profile/${pb.id}/${pb.profile_path}" class="card-img-top" style="height: 245px;width: 245px;">
							</c:when>
							<c:otherwise>
								<img class="card-img-top" src="profile/defaultProfile.jpg" style="width: 245px; height:245.5px;">
							</c:otherwise>
						</c:choose>
						
						<div class="card-body">
						<c:choose>
						<c:when test="${pb==null}">
						우수회원에 도전하세요!
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
						<c:choose>
							<c:when test="${pb.profile_path!=NULL}">
								<img src="${pageContext.request.contextPath}/profile/${pb.id}/${pb.profile_path}" class="card-img-top" style="height: 245px;width: 245px;">
							</c:when>
							<c:otherwise>
								<img class="card-img-top" src="profile/defaultProfile.jpg" style="width: 245px; height:245.5px;">
							</c:otherwise>
						</c:choose>
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
						<c:choose>
							<c:when test="${pb.profile_path!=NULL}">
								<img src="${pageContext.request.contextPath}/profile/${pb.id}/${pb.profile_path}" class="card-img-top" style="height: 245px;width: 245px;">
							</c:when>
							<c:otherwise>
								<img class="card-img-top" src="profile/defaultProfile.jpg" style="width: 245px; height:245.5px;">
							</c:otherwise>
						</c:choose>
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




