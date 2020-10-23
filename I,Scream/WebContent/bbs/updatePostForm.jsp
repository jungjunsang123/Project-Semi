<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>  
<div class="bbs-container">  
	<form action="${pageContext.request.contextPath}/front" method="post" id="updatePost">
			<div class="card-body">
				<h4 class="card-title">게시글 수정</h4>
				<div class="table-responsive">
				<input type="hidden" name="command" value="UpdatePost">
					<input type="hidden" name="bbs_no" value="${requestScope.updatePost.bbs_no}">
					<table class="table table-bordered" style="width:800px;margin-left: auto; margin-right: auto;">
								<tr>
						      		<td>Title</td>
						      		<td><input type="text" name="title" value="${requestScope.updatePost.title}"></td>
						      	</tr>
						      	<tr>
						      		<td>context</td>
						      		<td><textarea name="context" rows="5" cols="20">${requestScope.updatePost.context}</textarea></td>
						      	</tr>
						      	<tr>
						      		<td>category </td>
						      		<td>
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
						      	</tr>
						      	<tr>
						      		<td>업무시작일</td>
						      		<td><input type="date" name="startworkTime" value="${requestScope.updatePost.startWorkTime}"></td>
						      		<td>업무종료일</td>
						      		<td><input type="date" name="endworkTime" value="${requestScope.updatePost.endWorkTime}"></td>
						      	</tr>
						      	<%-- 하단버튼 --%>
						      	<tr>
									<td colspan="5" class="btnArea">
										<button type="button" class="btn" onclick="updatePost()">수정</button>
										<button type="button" class="btn" onclick="postBack()">뒤로</button>
							</td>
						</tr>
					</table>
					
					<%-- 하단버튼 --%>
	
				</div>
			</div>
	</form>
	
</div>

									
