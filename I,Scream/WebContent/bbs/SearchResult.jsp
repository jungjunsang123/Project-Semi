<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="container">
				<div class="row">
					<%-- 첫번째  검색 결과--%>
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h4>' 회원 ' 검색결과</h4>
							</div>
							<div class="card-body">
								<div class="row"></div>
								<div class="container">
									<div class="col-sm-offset-1 col-sm-1">
									
										<c:choose>
											<c:when test="${requestScope.sbymco.id!=NULL}">
												<c:choose>
														<c:when test="${requestScope.sbymco.profile_path!=NULL}">
															<img src="${pageContext.request.contextPath}/profile/${requestScope.sbymco.id}/${requestScope.sbymco.profile_path}" class="card-img-top" style="height: 70px;width: 70px;">
														</c:when>
														<c:otherwise>
															<img class="card-img-top" src="profile/defaultProfile.jpg" style="width: 70px; height:70px;">
														</c:otherwise>
													
													</c:choose>
											</c:when>
										</c:choose>
									</div>
									<div class="col-sm-9">
										<table class="table table-bordered table-hover boardlist" style="text-align:center;">
										<tbody>
											<%-- 게시글 데이터 --%>
												<c:choose>
													<c:when test="${requestScope.sbymco.id==null}">
														회원 아이디 검색 결과가 존재하지 않습니다.
													</c:when>
													<c:otherwise>
													<thead>
														<tr class="info">
															<td>아이디</td>
															<td>주소</td>
															<td>이름</td>
															<td>전화번호</td>
															<td>가입일</td>
															<td>성별</td>
															<td>생년월일</td>
															<td>평점</td>
														</tr>
														</thead>
														
														<tbody>
														<tr>
															
																<td><a href="${pageContext.request.contextPath}/front?command=getProfileDetail&id=${requestScope.sbymco.id}&avgstar=${requestScope.sbymco.star}">${requestScope.sbymco.id}</a></td>
																<td>${requestScope.sbymco.address}</td>
																<td>${requestScope.sbymco.name}</td>
																<td>${requestScope.sbymco.tel}</td>
																<td>${requestScope.sbymco.regDate}</td>
																<td>${requestScope.sbymco.sex}</td>
																<td>${requestScope.sbymco.birth}</td>
																<td>${requestScope.sbymco.star}</td>
														
														</tr>
														</tbody>
															</a>
													</c:otherwise>
												</c:choose>
										</tbody>
										<%-- SH : 코드 끝 --%>
									</table>
								
									</div>
								</div>
							</div>
						</div>
						<br>
					</div>
					<%-- 두번째 검색 결과 --%>
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h4>' 제목 ' 검색결과</h4>
							</div>
							<div class="card-body">
								<div class="row"></div>
								<div class="container">
									<table class="table  table-bordered">
										
											<%-- 게시글 데이터 --%>

											<c:if test="${empty requestScope.slvo.list}">
													 검색 결과가 존재하지 않습니다.
											</c:if>
											<c:forEach var="spvo" items="${requestScope.slvo.list}">
												<font size=12px><a href="${pageContext.request.contextPath}/front?command=listApplyer&bbs_no=${spvo.bbs_no}&mypage=NO">${spvo.title}</a></font>
												<font size=2px><textarea name="context" rows="2" id="context" style="width: 100%; border: none" readonly>${spvo.createDate}&nbsp;${spvo.context}</textarea></font>
												<br><br>
											</c:forEach>
										<%-- SH : 코드 끝 --%>
									</table>
								</div>
								<%-- paging 처리  --%>
								<div class="container">
									<div class="row">
										<div class="pagingArea" style="float: none; margin: 0 auto">
											<c:set var="spb" value="${requestScope.slvo.pagingBean}" />
											<ul class="pagination">
												<c:if test="${spb.previousPageGroup}">
													<li><a
														href="front?command=searchByText&searchtitlepageNo=${spb.startPageOfPageGroup-1}">&laquo;</a></li>
												</c:if>
												<c:forEach var="i" begin="${spb.startPageOfPageGroup}" end="${spb.endPageOfPageGroup}">
													<c:choose>
														<c:when test="${i==0}"></c:when>
														<c:when test="${spb.nowPage!=i}">
															<li><a href="front?command=searchByText&searchtitlepageNo=${i}">${i}</a></li>
														</c:when>
														<c:otherwise>
															<li class="active"><a href="#">${i}</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:if test="${spb.nextPageGroup}">
													<li><a
														href="front?command=searchByText&searchtitlepageNo=${spb.endPageOfPageGroup+1}">&raquo;</a>
													</li>
												</c:if>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<br>
					</div>
					<%-- 세번째 검색 결과 --%>
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h4>' 내용 ' 검색결과</h4>
							</div>
							<div class="card-body">
								<div class="row"></div>

								<div class="container">
									<table class="table table-bordered">
										<c:if test="${empty requestScope.sclvo.list}">
											검색 결과가 존재하지 않습니다.
										</c:if>
										<c:forEach var="searchContext" items="${requestScope.sclvo.list }">
											<font size=12px><a href="${pageContext.request.contextPath}/front?command=listApplyer&bbs_no=${searchContext.bbs_no}&mypage=NO">${searchContext.title}</a></font>
											<font size=3px><textarea name="context" rows="2" id="context" disabled="disabled" style="width: 100%; border: none" >${spvo.createDate}&nbsp;${searchContext.context}</textarea></font>
											<br><br>
										</c:forEach>
										<%-- SH : 코드 끝 --%>
									</table>
								</div>
								<%-- paging 처리  --%>
								<div class="container">
									<div class="row">
										<div class="pagingArea" style="float: none; margin: 0 auto">
											<c:set var="scpb" value="${requestScope.sclvo.pagingBean}"/>
											<ul class="pagination">
												<c:if test="${scpb.previousPageGroup}">
													<li><a
														href="front?command=searchByText&searchtextpageNo=${scpb.startPageOfPageGroup-1}">&laquo;</a>
													</li>
												</c:if>
												<c:forEach var="sci" begin="${scpb.startPageOfPageGroup}"
													end="${scpb.endPageOfPageGroup}">
													<c:choose>
														<c:when test="${i==0}"></c:when>
														<c:when test="${scpb.nowPage!=sci}">
															<li><a href="front?command=searchByText&searchtextpageNo=${sci}">${sci}</a></li>
														</c:when>
														<c:otherwise>
															<li class="active"><a href="#">${sci}</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:if test="${scpb.nextPageGroup}">
													<li><a
														href="front?command=searchByText&searchtextpageNo=${scpb.endPageOfPageGroup+1}">&raquo;</a>
													</li>
												</c:if>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<br>
					<%-- 홈으로가는 버튼 starts --%>
					<div class="col-sm-offset-11 col-sm-1">
						<br>
						<table>
							<tr>
								<td colspan=1 class="btnArea" style="text-align: right;">
									<button type="button" class="btn btn-secondary"
										onclick="goHome()">홈으로</button><br>
								</td>
							</tr>
						</table>
					</div>
					<%-- 홈으로가는 버튼 ends --%>
				</div>
			<hr>
			</div>
				
		</div>

	</div>
