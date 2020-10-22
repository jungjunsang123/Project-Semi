<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>     

<div class="table-responsive">
									<%-- <table id="zero_config"
										class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>Number</th>
												<th>Category</th>
												<th>Title</th>
												<th>Id</th>
												<th>Date</th>
												<th>Hits</th>
											</tr>
										</thead>
										<tbody>
											게시글 데이터
											<c:forEach var="spvo" items="${requestScope.slvo.list}">
												<tr>

													<td>${spvo.bbs_no}</span></td>
													<td><c:choose>
															<c:when test="${spvo.category eq '카테고리'}">
																<span class="label label-success">${spvo.category}</span>
															</c:when>

															<c:otherwise>
																<span class="label label-warning">${spvo.category}</span>
															</c:otherwise>
														</c:choose></td>
													<td><a href="${pageContext.request.contextPath}/front?command=DetailPost&bbs_no=${spvo.bbs_no}">${spvo.title}</a></td>
													<td>${spvo.vo.id}</td>
													<td>${spvo.createDate}</td>
													<td>${spvo.hits}</td> 
												</tr>
											</c:forEach>
										</tbody>
									</table> --%>
									회원 아이디로 검색결과<br><br>
									<c:choose>
										<c:when test="${requestScope.sbymco.id==null}">
											회원 아이디 검색 결과가 존재하지 않습니다.
										</c:when>
										<c:otherwise>
											${requestScope.sbymco.id}
										</c:otherwise>
									</c:choose>
									<br><br>
									글 제목으로 검색결과 <br><br>
									<!-- 검색결과가 없는 경우 -->
								 	<c:if test="${empty requestScope.slvo.list}">
								 		 검색 결과가 존재하지 않습니다.
								 	</c:if>
									<c:forEach var="spvo" items="${requestScope.slvo.list}">
										<a href="${pageContext.request.contextPath}/front?command=DetailPost&bbs_no=${spvo.bbs_no}">${spvo.title}</a><br><br>
									</c:forEach>
									
									
									
									<%-- Search Title paging 처리 START--%>
									
									<div class="pagingAreaTitle">
									<c:set var="spb" value="${requestScope.slvo.pagingBean}"/>
										<ul class="pagination">
											<c:if test="${spb.previousPageGroup}">
												<li><a
													href="front?command=searchByText&searchtitlepageNo=${spb.startPageOfPageGroup-1}">&laquo;</a>
												</li>
											</c:if>
											<c:forEach var="si" begin="${spb.startPageOfPageGroup}"
												end="${spb.endPageOfPageGroup}">
												<c:choose>
													<c:when test="${spb.nowPage!=i}">
														<li><a href="front?command=searchByText&searchtitlepageNo=${si}">${si}</a></li>
													</c:when>
													<c:otherwise>
														<li class="active"><a href="#">${si}</a></li>
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
									
									<%-- Search Title paging 처리 END  --%>
									글 내용으로 검색결과<br><br>
									<c:if test="${empty requestScope.sclvo.list}">
										검색 결과가 존재하지 않습니다.
									</c:if>
									<c:forEach var="searchContext" items="${requestScope.sclvo.list }">
										<a href="${pageContext.request.contextPath}/front?command=DetailPost&bbs_no=${searchContext.bbs_no}">${searchContext.context}</a><br><br>
									</c:forEach>
									
									<%-- Search Context paging 처리 START --%>
									
									<div class="pagingAreaContext">
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
													<c:when test="${scpb.nowPage!=i}">
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
									<%-- Search Context paging 처리 END  --%>
									</div>