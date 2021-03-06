<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
		$(document).ready(function(){
			var applyText = $("#apply").text();
			$("#apply").click(function(){
				applyText = $("#apply").text();
				if(applyText =='지원완료'){
					alert("이미 지원완료하였습니다.");
				}
				else if(confirm("${requestScope.pvo.vo.id}에게 지원하시겠습니까?")){
					$.ajax({	
						type: "post",
						url: "front",
						data: "command=Apply&bbs_no="+${requestScope.pvo.bbs_no},
						success:function(result){ // result변수로 응답정보가 전달된다.
							if(result=="OK"){
								alert("지원됐습니다.");
								$("#apply").text("지원완료")
							}
								
							else{
								alert("로그인부탁드립니다.");
								location.href="front?command=home";
							}
						}
					})//ajax
				}
			})//지원하기
			$("#scrap").click(function(){
				var ment;
				if($("#scrap").text()=='스크랩')
					ment="스크랩 하시겠습니까?";
				else
					ment="스크랩 해제하시겠습니까?"
				if(confirm(ment)){
					$.ajax({	
						type: "post",
						url: "front",
						data: "command=Scrap&bbs_no="+${requestScope.pvo.bbs_no}+"&isScarp="+$("#scrap").text(),
						success:function(result){ // result변수로 응답정보가 전달된다.
							if(result=="OK"){
								if($("#scrap").text()=="스크랩완료")
									$("#scrap").text("스크랩")
								else
									$("#scrap").text("스크랩완료")
							}								
							else{
								alert("로그인부탁드립니다.");
								location.href="front?command=home";
							}
						}
					})//ajax
				}
			})//스크랩
		})
</script>
<div class="container">
	<div class="col-sm-12">
		<div class="card">
			<div class="card-header">
				<h4>게시글 확인</h4>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col-sm-12">
						<input type="hidden" name="command" value="addBBS">
						<div class="col-sm-12">
							<table class="table table-bordered" style="text-align:center;">
								<tr>
									<div class="col-md-1">
										<td width="80">글번호 ${requestScope.pvo.bbs_no }</td>
									</div>
									<div class="col-md-8">
										<td colspan="12">제목: ${requestScope.pvo.title}</td>
									</div>
									<div class="col-md-1">
										<td width="80">작성자 : ${requestScope.pvo.vo.id }</td>
									</div>
									<div class="col-md-1">
										<td width="80">조회수 : ${requestScope.pvo.hits }</td>
									</div>
									<div class="col-md-1">
										<td width="150">작성일 :${requestScope.pvo.createDate }</td>
									</div>
								</tr>
								<tr>
									<td colspan="17"><pre>${requestScope.pvo.context}</pre></td>
								</tr>
								</div>
								<div class="row">
									<tr>
										<td colspan="5">category</td>

										<td colspan="4">
											<%-- SH: 카테고리 이름변경 시작--%> <select name="category">
												<option>------------------------------</option>
												<c:choose>
													<c:when test="${pvo.category=='아이돌봄'}">
														<option value="아이돌봄" selected="selected">아이돌봄</option>
														<option value="노인케어">노인케어</option>
														<option value="반려동물">반려동물</option>
													</c:when>
													<c:when test="${pvo.category=='노인케어'}">
														<option value="아이돌봄">아이돌봄</option>
														<option value="노인케어" selected="selected">노인케어</option>
														<option value="반려동물">반려동물</option>
													</c:when>
													<c:otherwise>
														<option value="아이돌봄">아이돌봄</option>
														<option value="노인케어">노인케어</option>
														<option value="반려동물" selected="selected">반려동물</option>
													</c:otherwise>
												</c:choose>
												<%-- SH: 카테고리 이름변경 끝 --%>
										</select>
										</td>

										<td colspan="2">업무 시작일</td>
										<td colspan="2">${requestScope.pvo.startWorkTime}</td>

										<td colspan="2">업무 종료일</td>
										<td colspan="2">${requestScope.pvo.endWorkTime}</td>
									</tr>
								</div>
							</table>
						</div>
						<div class="col-sm-offset-9 col-sm-3">
						<!-- 글 작성자가 로그인한 사용자일때  --> 
						<c:if test="${requestScope.pvo.vo.id==sessionScope.mvo.id}">
							<form name="deletePostForm"
								action="${pageContext.request.contextPath}/front" method="post">
								<input type="hidden" name="command" value="DeletePost">
								<input type="hidden" name="bbs_no" value="${requestScope.pvo.bbs_no}">
							</form>
							<form name="updateForm"
								action="${pageContext.request.contextPath}/front" method="post">
								<input type="hidden" name="command" value="UpdatePostForm">
								<input type="hidden" name="bbs_no" value="${requestScope.pvo.bbs_no}">
							</form>
							<button type="button" class="btn btn-secondary" onclick="updatePostForm()">수정</button>
							<button type="button" class="btn btn-secondary" onclick="deletePost()">삭제</button>

						</c:if> 
						<!-- 글 작성자 와 로그인한 사용자가 다르면서 비회원은 아닌 사용자일때만 지원하기 기능이 가능함 -->
						<c:if test="${(!empty sessionScope.mvo)&&requestScope.pvo.vo.id!=sessionScope.mvo.id}">
							<!-- 스크랩여부 확인  -->
							<c:choose>
								<c:when test="${!requestScope.IsScrap}">
									<button type="button" class="btn btn-secondary"  id="scrap">스크랩</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-secondary"  id="scrap">스크랩완료</button>
								</c:otherwise>
							</c:choose>
							<!-- 지원한적이 있는지 여부 확인  -->
							<c:choose>
								<c:when test="${!requestScope.IsApply}">
									<button type="button" class="btn btn-secondary" id="apply">지원하기</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-secondary" >지원완료</button>
								</c:otherwise>
							</c:choose>
						
						</c:if>
						<button type="button" class="btn btn-secondary" onclick="postBack()">뒤로</button>
						</div>
						
					</div>
				</div>
			</div>
		</div><!-- card끝 -->
		<c:if test="${requestScope.pvo.vo.id==sessionScope.mvo.id}">
		<!-- 지원자 현황 --><br><br>
		<div class="card">
		<div class="card-header">
				<h4>지원자 리스트</h4>
		</div>
		<div class="card-body">
			<div class="row">
				<div class="col-sm-12">
					<table class="table table-bordered table-hover boardlist" style="text-align:center;">
					<thead>
							<tr>
								<td>번호</td>
								<td>지원자 ID</td>
								<td>지원자 이름</td>
								<td>지원자 평점</td>
								<td>비고</td>
							</tr>
					</thead>
					<tbody>
							<c:forEach items="${requestScope.ListApplyer}" var="list" varStatus="ApplyNumber">
								<tr>
									<td>${ApplyNumber.count}</td>
									<td>${list.id}</td>
									<td>${list.name}</td>
									<td>${list.star}</td>
									<td>
									<!-- 채용하기 -->
										<input type="hidden" id="bbs_no" value="${requestScope.pvo.bbs_no}">
										<input type="hidden" id="applyID"  value="${list.id}">
										<button type="button" class="btn" id="Recruit">채용</button>
									</td>
								</tr>
							</c:forEach>
					</tbody>
							<%-- 하단버튼 --%>
							</table>
				</div>
			</div>
			</div>
		</div>
		</c:if>
	</div>
</div>