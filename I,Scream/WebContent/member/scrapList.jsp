<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table class="table table-bordered table-hover boardlist" style="text-align:center;">
	<thead>
		<tr class="info">
			<td>번호</td>
			<td>채용분야</td>
			<td>제목</td>
			<td>등록일</td>
			<td>공고작성자</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.ApplyList}" var="list" varStatus="applyNo">
			<tr>
				<td>${applyNo.count}</td>
				<td>${list.category}</td>
				<td><a href="${pageContext.request.contextPath}/front?command=DetailPost&bbs_no=${list.bbs_no}">${list.title}</a></td>
				<td>${list.createDate}</td>
				<td>${list.vo.id}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<c:set var="pb" value="${requestScope.lvo.pagingBean}" />
<div class="pagingArea">
	<ul class="pagination">
		<c:if test="${pb.previousPageGroup}">
			<li><a href="front?command=findPostListById&pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a>
			</li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
			end="${pb.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${empty requestScope.lvo.list}"></c:when>
				<c:when test="${pb.nowPage!=i}">
					<li><a href="front?command=findPostListById&pageNo=${i}">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li class="active"><a href="#">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pb.nextPageGroup}">
			<li><a
				href="front?command=findPostListById&pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a>
			</li>
		</c:if>
	</ul>
</div>