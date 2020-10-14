<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table table-bordered  table-hover boardlist" border="1px">
	<%-- SH : 기존 샘플 주석처리 --%>
	<%-- 	<thead>
	
		<tr class="success">
			<th>번호</th>
			<th class="title">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회</th>
		</tr>
	</thead>
	<tbody>
	<tr>
	 <c:forEach  var="pvo" items="${requestScope.lvo.list}" >
			<tr>
				<td>${pvo.bbs_no}</td>
				<td><a href="${pageContext.request.contextPath}/front?command=BBSDetail&no=${pvo.bbs_no}">${pvo.title}</a></td>
				<td>${pvo.vo.id}</td>
				<td>${pvo.createDate}</td>
				<td>${pvo.hits}</td>
			</tr>
		</c:forEach> 
	</tbody> --%>
	<%-- SH : 코드 시작 --%>
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->
	<div class="preloader" style="display: none;">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper" data-theme="light" data-layout="vertical"
		data-navbarbg="skin1" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed"
		data-boxed-layout="full">
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper" style="display: block;">

			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<!-- basic table -->
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">게시글 현황</h4>
								<div class="row mt-5">
									<!-- Column -->
									<div class="col-md-6 col-lg-3 col-xlg-3">
										<div class="card card-hover">
											<div class="p-2 rounded bg-info text-center">
												<h1 class="font-light text-white">
												${requestScope.allCount}
												</h1>
												<h6 class="text-white">전체 게시글</h6>
											</div>
										</div>
									</div>
									<!-- Column -->
									<div class="col-md-6 col-lg-3 col-xlg-3">
										<div class="card card-hover">
											<div class="p-2 rounded bg-primary text-center">
												<h1 class="font-light text-white">${requestScope.youngCount}</h1>
												<h6 class="text-white">아이돌봄 게시글</h6>
											</div>
										</div>
									</div>
									<!-- Column -->
									<div class="col-md-6 col-lg-3 col-xlg-3">
										<div class="card card-hover">
											<div class="p-2 rounded bg-success text-center">
												<h1 class="font-light text-white">${requestScope.oldCount}</h1>
												<h6 class="text-white">노인케어 게시글</h6>
											</div>
										</div>
									</div>
									<!-- Column -->
									<div class="col-md-6 col-lg-3 col-xlg-3">
										<div class="card card-hover">
											<div class="p-2 rounded bg-dark text-center">
												<h1 class="font-light text-white">${requestScope.petCount}</h1>
												<h6 class="text-white">반려동물 게시글</h6>
											</div>
										</div>
									</div>
									<!-- Column -->
								</div>
								<div class="table-responsive">
									<table id="zero_config"
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
											<%-- 게시글 데이터 --%>
											<c:forEach var="pvo" items="${requestScope.lvo.list}">
												<tr>
													<td>${pvo.bbs_no }</span></td>
													<td><c:choose>
															<c:when test="${pvo.category eq '카테고리'}">
																<span class="label label-success">${pvo.category}</span>
															</c:when>

															<c:otherwise>
																<span class="label label-warning">${pvo.category}</span>
															</c:otherwise>
														</c:choose></td>
													<td>${pvo.title }</td>
													<td>${pvo.vo.name }</td>
													<td>${pvo.createDate }</td>
													<td>${pvo.hits }</td>

													<%-- <td>${pvo.memberVO.name }</td> --%>
												</tr>
											</c:forEach>
										</tbody>
										<%-- SH : 코드 끝 --%>
									</table>
									<%-- paging 처리  --%>

									<c:set var="pb" value="${requestScope.lvo.pagingBean}" />
									<div class="pagingArea">
										<ul class="pagination">
											<c:if test="${pb.previousPageGroup}">
												<li><a
													href="front?command=List&pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a>
												</li>
											</c:if>
											<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
												end="${pb.endPageOfPageGroup}">
												<c:choose>
													<c:when test="${pb.nowPage!=i}">
														<li><a href="front?command=List&pageNo=${i}">${i}</a></li>
													</c:when>
													<c:otherwise>
														<li class="active"><a href="#">${i}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<c:if test="${pb.nextPageGroup}">
												<li><a
													href="front?command=List&pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a>
												</li>
											</c:if>
										</ul>
									</div>