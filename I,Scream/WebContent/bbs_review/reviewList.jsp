<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>     
<h2>현재 평균 별점은 ???점 입니다!</h2><br>
<h2>후기 리스트</h2>
<table id="zero_config" class="table table-striped table-bordered">
	<thead>
		<tr>
			<td>작성자</td>
			<td>후기 내용</td>
			<td>별점</td>
			<td>작성일</td>
		</tr>
	</thead>
	<tbody>
		<!-- 리뷰 데이터 -->
		<c:forEach items="${requestScope.rlvo.reviewList}" var="rvo">
			<tr>
				<td>${rvo.giveReviewer.id}</td>
				<!-- 리뷰내용 보기 -->
				<td><a href="${pageContext.request.contextPath}/front?command=ReviewDetail&bbs_no=${rvo.bVO.bbs_no}&id=${rvo.giveReviewer.id}">${rvo.review_context }</a></td>
				<td>${rvo.stars}</td>
				<td>${rvo.createDate }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<%-- paging 처리  --%>
<div class="pagingArea">
<c:set var="pb" value="${requestScope.rlvo.pagingBean}"/>
	<ul class="pagination">
		<c:if test="${pb.previousPageGroup}">
			<li><a
				href="front?command=ReviewList&pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a>
			</li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
			end="${pb.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${pb.nowPage!=i}">
					<li><a href="front?command=ReviewList&pageNo=${i}">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li class="active"><a href="#">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pb.nextPageGroup}">
			<li><a
				href="front?command=ReviewList&pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a>
			</li>
		</c:if>
	</ul>
</div>
<%-- 임시 리뷰 쓰기 버튼(리뷰작성 TEST)--%>
<div>
	<a href="${pageContext.request.contextPath}/front?command=AddReviewForm"><button type="button" class="btn btn-primary">글쓰기</button></a>
</div>
<%-- paging 처리  --%>
