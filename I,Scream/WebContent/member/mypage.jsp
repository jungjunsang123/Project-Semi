<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<div class="col-sm-2">
						<img src="image/img_avatar1.png" class="img-thumbnail"
							alt="Cinque Terre" width="200" height="200">
					</div>
					<div class="col-sm-10">
						<h1>${sessionScope.mvo.name}님의
							<br>현재 평균별점은 ???점 입니다!
						</h1>
					</div>
				</div>
				<div class="card-body">
					<div class="col-sm-12">
						<div class="row">
							<div class="container">
								<br>
								<!-- Nav tabs -->
								<ul class="nav nav-tabs" role="tablist">
									<li class="nav-item"><a class="nav-link active"
										data-toggle="tab" href="#home">개인정보수정</a></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab"
										href="#menu1">지원현황</a></li>
									<li class="nav-item"><a class="nav-link" data-toggle="tab"
										href="#menu2">지원목록</a></li>
								</ul>

								<!-- Tab panes -->
								<div class="tab-content">
									<div id="home" class="container tab-pane active">
										<br>
										<h3>개인정보수정</h3>
										<%-- 개인정보 수정 게시판 steart --%>
										<table id="zero_config"
											class="table table-striped table-bordered">
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
														<td><a
															href="${pageContext.request.contextPath}/front?command=ReviewDetail&bbs_no=${rvo.bVO.bbs_no}&id=${rvo.giveReviewer.id}">${rvo.review_context }</a></td>
														<td>${rvo.stars}</td>
														<td>${rvo.createDate }</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<!-- paging 처리 -->
										<div class="container">
											<div class="row">
												<div class="pagingArea col-sm-4">
													<c:set var="pb" value="${requestScope.rlvo.pagingBean}" />
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
												<div class="col-sm-7"></div>
												<div class="col-sm-1">
													<br> <a
														href="${pageContext.request.contextPath}/front?command=AddReviewForm">
														<button type="button" class="btn btn-primary">글쓰기</button>
													</a>
												</div>
												<!-- paging 처리 -->
												<%-- 개인정보수정 게시판 end --%>
											</div>
										</div>
									</div>
									<div id="menu1" class="container tab-pane fade">
										<br>
										<h3>지원현황</h3>
										<%-- 지원현황 게시판 steart --%>
										<%-- 지원현황 게시판 end --%>
									</div>
									<div id="menu2" class="container tab-pane fade">
										<br>
										<h3>지원목록</h3>
										<%-- 지원목록 게시판 steart --%>
										<%-- 지원목록게시판 end --%>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>