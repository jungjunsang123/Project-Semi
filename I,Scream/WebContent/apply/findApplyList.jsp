<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="bbs-container">
	<div class="card-body">
		<h4 class="card-title">게시글 및 지원자 확인</h4>
		<div class="table-responsive">
			<table class="table table-bordered" style="width: 800px; margin-left: auto; margin-right: auto;">
				<tr>
					<td>No</td>
					<td>Category</td>
					<td>Title</td>
					<td>Date</td>
					<td>Writer</td>
				</tr>
				<c:forEach items="ApplyList" var="list" varStatus="applyNo">
					<tr>
						<td>${applyNo.count}</td>
						<td>${list.category}</td>
						<td><a href="${pageContext.request.contextPath}/front?command=detailPost&bbs_no=${list.bbs_no}">${list.title}</a></td>
						<td>${list.createDate}</td>
						<td>${list.vo.id}</td>
					</tr>
				</c:forEach>
		</div>
	</div>
</div>