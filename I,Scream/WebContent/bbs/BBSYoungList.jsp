<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<h4>게시글 현황</h4>
					</div>
					<div class="card-body">
						<div class="row">
							<!-- Column -->
							<div class="col-xs-3">
								<div class="card card-hover">
									<div class="p-2 rounded bg-warning text-center">
										<h1 class="font-light text-white">${requestScope.allCount}</h1>
										<h6 class="text-white">전체 게시글</h6>
									</div>
								</div>
							</div>
							<!-- Column -->
							<div class="col-xs-3">
								<div class="card card-hover">
									<div class="p-2 rounded bg-danger text-center">
										<h1 class="font-light text-white">${requestScope.youngCount}</h1>
										<h6 class="text-white">아이돌봄 게시글</h6>
									</div>
								</div>
							</div>
							<!-- Column -->
							<div class="col-xs-3">
								<div class="card card-hover">
									<div class="p-2 rounded bg-success text-center">
										<h1 class="font-light text-white">${requestScope.oldCount}</h1>
										<h6 class="text-white">노인케어 게시글</h6>
									</div>
								</div>
							</div>
							<!-- Column -->
							<div class="col-xs-3">
								<div class="card card-hover">
									<div class="p-2 rounded bg-primary text-center">
										<h1 class="font-light text-white">${requestScope.petCount}</h1>
										<h6 class="text-white">반려동물 게시글</h6>
									</div>
								</div>
							</div>
							<!-- Column -->
							<br>
						</div>
					</div>
					<div class="container">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th style="width: 5%" class="text-center">Number</th>
									<th style="width: 5%" class="text-center">Category</th>
									<th style="width: 60%" class="text-center">Title</th>
									<th style="width: 10%" class="text-center">Id</th>
									<th style="width: 10%" class="text-center">Date</th>
									<th style="width: 10%" class="text-center">Hits</th>
								</tr>
							</thead>
							<tbody>
								<%-- 게시글 데이터 --%>
								<c:forEach var="pvo" items="${requestScope.lvoy.list}">
									<tr>
										<td class="text-center">${pvo.bbs_no}</td>
										<td><c:choose>
												<c:when test="${pvo.category eq '아이돌봄'}">
													<span class="label label-danger">${pvo.category}</span>
												</c:when>
												<c:when test="${pvo.category eq '노인케어'}">
													<span class="label label-success">${pvo.category}</span>
												</c:when>
												<c:otherwise>
													<span class="label label-primary">${pvo.category}</span>
												</c:otherwise>
											</c:choose></td>
										<td><a
											href="${pageContext.request.contextPath}/front?command=DetailPost&bbs_no=${pvo.bbs_no}">${pvo.title}</a></td>
										<td class="text-center">${pvo.vo.id}</td>
										<td class="text-center">${pvo.createDate}</td>
										<td class="text-center">${pvo.hits}</td>

										<%-- <td>${pvo.memberVO.name }</td> --%>
									</tr>
								</c:forEach>
							</tbody>
							<%-- SH : 코드 끝 --%>
						</table>
					</div>

					<%-- paging 처리  --%>
					<div class="container">
						<div class="row">
							<div class="pagingArea col-sm-4">
								<c:set var="pb" value="${requestScope.lvoy.pagingBean}" />
								<ul class="pagination">
									<c:if test="${pb.previousPageGroup}">
										<li><a
											href="front?command=YoungPostList&pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
									</c:if>
									<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
										end="${pb.endPageOfPageGroup}">
										<c:choose>
											<c:when test="${pb.nowPage!=i}">
												<li><a href="front?command=YoungPostList&pageNo=${i}">${i}</a></li>
											</c:when>
											<c:otherwise>
												<li class="active"><a href="#">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${pb.nextPageGroup}">
										<li><a
											href="front?command=YoungPostList&pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a>
										</li>

									</c:if>

								</ul>
							</div>
							<div class="col-sm-7"></div>
							<div class="col-sm-1">
								<br> <a
									href="${pageContext.request.contextPath}/front?command=AddPostForm"><button
										type="button" class="btn btn-secondary">글쓰기</button></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
