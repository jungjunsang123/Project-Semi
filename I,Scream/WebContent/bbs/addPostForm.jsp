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
		$("#startWorkTimeInput").attr("value", currentDate);
		$("#endWorkTimeInput").attr("value", currentDate);
		
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
	<div class="col-sm-12">
		<form action="${pageContext.request.contextPath}/front" method="post"
			name="addPostForm">
			<div class="card">
				<div class="card-header">
					<h4>게시글 작성</h4>
				</div>
				<div class="card-body">
					<div class="text-center">
						<input type="hidden" name="command" value="AddPost">
						<table class="table table-bordered">
							<tr>
								<td>Title</td>
								<td colspan="5"><input type="text" name="title" id="title"
									style="width: 100%"></td>
							</tr>
							<tr>
								<td>context</td>
								<td colspan="5"><textarea name="context" rows="5" id="context"
										style="width: 100%"></textarea></td>
							</tr>
							<tr>
								<td>category</td>
								<td><select name="category" style="width: 100%" id="category">
										<%-- SH: 카테고리 이름변경 시작--%>
										<option value="null">------------------------------</option>
										<option value="아이돌봄">아이돌봄</option>
										<option value="노인케어">노인케어</option>
										<option value="반려동물">반려동물</option>
										<%-- SH: 카테고리 이름변경 끝 --%>
								</select></td>

								<td>업무 시작일</td>
								<td><input type="date" name="StartWorkTime" id="startWorkTimeInput"
									style="width: 100%"></td>

								<td>업무 종료일</td>
								<td><input type="date" name="EndWorkTime" id="endWorkTimeInput"
									style="width: 100%"></td>
							</tr>
							<%-- 하단버튼 --%>

						</table>
						<%-- 하단버튼 --%>
						<div class="col-sm-offset-10 col-sm-2">
							<tr>
								<td colspan="6" class="btnArea" style="text-align: right;">
									<button type="button" class="btn btn-secondary"
										onclick="addPost()">등록</button>
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
</div>