<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
		$(document).ready(function(){
			$("#apply").click(function(){
				if(confirm("${requestScope.pvo.vo.id}에게 지원하시겠습니까?")){
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

<div class="bbs-container">
	<div class="card-body">
		<h4 class="card-title">게시글 확인</h4>
		<div class="table-responsive">
			<table class="table table-bordered"
				style="width: 800px; margin-left: auto; margin-right: auto;">
				<tr>
					<td>글번호 ${requestScope.pvo.bbs_no }</td>
					<td>제목: ${requestScope.pvo.title}</td>
					<td>작성자 : ${requestScope.pvo.vo.id }</td>
					<td>조회수 : ${requestScope.pvo.hits }</td>
					<td>${requestScope.pvo.createDate }</td>
				</tr>
				<tr>
					<td colspan="5"><pre>${requestScope.pvo.context}</pre></td>
				</tr>
				<tr>
					<td>category :
					<select name="category">
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
					</select>
					</td>
				<tr>
					<td>업무시작일 :${requestScope.pvo.startWorkTime}</td>
					<td>업무종료일 :${requestScope.pvo.endWorkTime}</td>
				</tr>
				<%-- 하단버튼 --%>
				<tr>
					<td colspan="5" class="btnArea">
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
							<button type="button" class="btn" onclick="updatePostForm()">수정</button>
							<button type="button" class="btn" onclick="deletePost()">삭제</button>

						</c:if> 
						<!-- 글 작성자 와 로그인한 사용자가 다르면서 비회원은 아닌 사용자일때만 지원하기 기능이 가능함 -->
						<c:if test="${(!empty sessionScope.mvo)&&requestScope.pvo.vo.id!=sessionScope.mvo.id}">
							<!-- 스크랩여부 확인  -->
							<c:choose>
								<c:when test="${!requestScope.IsScrap}">
									<button type="button" class="btn" id="scrap">스크랩</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn" id="scrap">스크랩완료</button>
								</c:otherwise>
							</c:choose>
							<!-- 지원한적이 있는지 여부 확인  -->
							<c:choose>
								<c:when test="${!requestScope.IsApply}">
									<button type="button" class="btn" id="apply">지원하기</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn">지원완료</button>
								</c:otherwise>
							</c:choose>
						
						</c:if>
						<button type="button" class="btn" onclick="postBack()">뒤로</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>


