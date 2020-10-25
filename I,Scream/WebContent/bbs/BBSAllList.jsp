<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
									<a href="${pageContext.request.contextPath}/front?command=getPostList" style="text-decoration:none;">
										<div class="p-2 rounded bg-warning text-center">
											<h1 class="font-light text-white">${requestScope.allCount}</h1>
											<h6 class="text-white">전체 게시글</h6>
										</div>
										</a>
									</div>
								</div>
								
								<!-- Column -->
								<div class="col-xs-3">
									<div class="card card-hover">
									<a href="${pageContext.request.contextPath}/front?command=YoungPostList" style="text-decoration:none;">
										<div class="p-2 rounded bg-danger text-center">
											<h1 class="font-light text-white">${requestScope.youngCount}</h1>
										<h6 class="text-white">아이돌봄 게시글</h6>
										</div>
										</a>
									</div>
								</div>
								<!-- Column -->
								<div class="col-xs-3">
									<div class="card card-hover">
									<a href="${pageContext.request.contextPath}/front?command=OldPostList" style="text-decoration:none;">
										<div class="p-2 rounded bg-success text-center">
											<h1 class="font-light text-white">${requestScope.oldCount}</h1>
											<h6 class="text-white">노인케어 게시글</h6>
										</div>
										</a>
									</div>
								</div>
								<!-- Column -->
								<div class="col-xs-3">
									<div class="card card-hover">
										<a href="${pageContext.request.contextPath}/front?command=PetPostList" style="text-decoration:none;">
										<div class="p-2 rounded bg-primary text-center">
											<h1 class="font-light text-white">${requestScope.petCount}</h1>
											<h6 class="text-white">반려동물 게시글</h6>
										</div>
										</a>
									</div>
								</div>
								<!-- Column -->
								<br>
							</div>
						</div>
						<div class="container">
							<table class="table table-bordered" style="text-align:center;">
								<thead>
									<tr>
										<th style="width: 5%" class="text-center">번호</th>
										<th style="width: 5%" class="text-center">채용분야</th>
										<th style="width: 60%" class="text-center">제목</th>
										<th style="width: 10%" class="text-center">작성자</th>
										<th style="width: 10%" class="text-center">등록일</th>
										<th style="width: 10%" class="text-center">조회수</th>
									</tr>
								</thead>
								<tbody>
									<%-- 게시글 데이터 --%>
									<c:forEach var="pvo" items="${requestScope.lvo.list}" varStatus="status">
										<tr>
											<td class="text-center">${fn:length(requestScope.lvo.list)-status.index}</td>
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
												href="${pageContext.request.contextPath}/front?command=listApplyer&bbs_no=${pvo.bbs_no}&mypage=">${pvo.title}</a></td>
											<td class="text-center">${pvo.vo.id}</td>
											<td class="text-center">${pvo.createDate}</td>
											<td class="text-center">${pvo.hits}</td>

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
									<c:set var="pb" value="${requestScope.lvo.pagingBean}" />
									<ul class="pagination">
										<c:if test="${pb.previousPageGroup}">
											<li><a
												href="front?command=getPostList&pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
										</c:if>
										<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
											end="${pb.endPageOfPageGroup}">
											<c:choose>
												<c:when test="${empty requestScope.lvo.list}"></c:when>
												<c:when test="${pb.nowPage!=i}">
													<li><a href="front?command=getPostList&pageNo=${i}">${i}</a></li>
												</c:when>
												<c:otherwise>
													<li class="active"><a href="#">${i}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<c:if test="${pb.nextPageGroup}">
											<li><a
												href="front?command=getPostList&pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a>
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

