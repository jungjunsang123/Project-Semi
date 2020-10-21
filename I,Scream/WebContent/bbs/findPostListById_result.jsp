<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table class="table table-bordered  table-hover boardlist">
	<thead>
		<tr class="success">
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>작성자</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="pvo" items="${requestScope.lvo.list}">
			<tr>
				<td>${pvo.bbs_no}</td>
				<td>${pvo.title}</td>
				<td>${pvo.createDate}</td>
				<td>${pvo.hits}</td>
				<td>${pvo.vo.id}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<c:set var="pb" value="${requestScope.lvo.pagingBean}" />
<div class="pagingArea">
	<ul class="pagination">
		<c:if test="${pb.previousPageGroup}">
			<li><a
				href="front?command=findPostListById&id=${requestScope.findPostListById}&pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a>
			</li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
			end="${pb.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${pb.nowPage!=i}">
					<li><a href="front?command=findPostListById&id=${requestScope.findPostListById}&pageNo=${i}">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li class="active"><a href="#">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pb.nextPageGroup}">
			<li><a
				href="front?command=findPostListById&id=${requestScope.findPostListById}&pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a>
			</li>
		</c:if>
	</ul>
</div>