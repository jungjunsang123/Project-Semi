<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	$(document).ready(function() {
		let today = new Date();
		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1; // 월
		let date = today.getDate(); // 날짜
		var currentDate = year + "-" + month + "-" + date;

		$("#startWorkTimeInput").on("change", function() {
			var selectDate = $("#startWorkTimeInput").val();
			if (selectDate < currentDate) {
				alert("업무시작일은 현재 시간보다 빨라야 합니다. ");
				$("#startWorkTimeInput").val(currentDate);

			}
		});
		$("#endWorkTimeInput").on("change", function() {
			var selecStarttDate = $("#startWorkTimeInput").val();
			var selecEndtDate = $("#endWorkTimeInput").val();
			if (selecStarttDate > selecEndtDate) {
				alert("업무종료일이 시작일보다 느려야 합니다.");
				$("#endWorkTimeInput").val(selecStarttDate);
				
			}
		});
	})
	function addPost() {
		var title = $("#title").val();
		var context = $("#context").val();
		var category = $("#category").val();

		if (title == "" || context == "") {
			if (title == "" && context == "") {
				alert("제목과 내용을 입력해주세요!!");
				$("#title").focus();
			} else if (context == "") {
				alert("내용을 입력해주세요!!");
				
				$("#context").focus();
			} else {
				alert("제목을 입력해주세요!!");
				$("#title").focus();
			}
			return false;
		}
		if (category == "null") {
			alert("카테고리를 선택해주세요");
			$("#category").focus();
			return false;
		}

		if (confirm("게시글을 등록하시겠습니까?")) {
			document.addPostForm.submit();
		}
	}
</script>

<div class="container">
	<form action="${pageContext.request.contextPath}/front" method="post"
		id="updatePost">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-header">
					<h4>게시글 수정</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<input type="hidden" name="command" value="UpdatePost"> <input
							type="hidden" name="bbs_no"
							value="${requestScope.updatePost.bbs_no}">
						<table class="table table-bordered"
							style="width: 100%; margin-left: auto; margin-right: auto;">
							<tr>
								<td colspan="1">Title</td>
								<td colspan="5"><input type="text" name="title" id="title"
									value="${requestScope.updatePost.title}" style="width: 100%;"></td>
							</tr>
							<tr>
								<td colspan="1">context</td>
								<td colspan="5"><textarea name="context" rows="5" cols="20" id="context"
										style="width: 100%;">${requestScope.updatePost.context}</textarea></td>
							</tr>
							<tr>
								<td>category</td>
								<td><select name="category" id="category">
										<option value="null">------------------------------</option>
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
								</select></td>
								<td>업무시작일</td>
								<td><input type="date" name="startworkTime" id="startWorkTimeInput"
									value="${requestScope.updatePost.startWorkTime}"></td>
								<td>업무종료일</td>
								<td><input type="date" name="endworkTime" id="endWorkTimeInput"
									value="${requestScope.updatePost.endWorkTime}"></td>
							</tr>
							<tr>

							</tr>
							<%-- 하단버튼 --%>

						</table>
					</div>
					<div class="col-sm-offset-10 col-sm-2">
						<tr>
							<td colspan="5" class="btnArea" style="text-align: right;">
								<button type="button" class="btn btn-secondary"
									onclick="updatePost()">수정</button>
								<button type="button" class="btn btn-secondary"
									onclick="postBack()">뒤로</button>
							</td>
						</tr>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
