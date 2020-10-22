<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	$(document).ready(function(){
		let today = new Date();   
		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1;  // 월
		let date = today.getDate();  // 날짜
		var currentDate =year+"-"+month+"-"+date;
		$("#startWorkTimeInput").attr("value",currentDate);
		$("#endWorkTimeInput").attr("value",currentDate);
		$("#startWorkTimeInput").on("change", function() {
			var selectDate = $("#startWorkTimeInput").val();
			if(selectDate<currentDate){
				alert("없어이쉐야");
			}
		});
		$("#endWorkTimeInput").on("change", function() {
			var selectDate = $("#endWorkTimeInput").val();
			if(selectDate<currentDate){
				alert("없어이쉐야");
			}
		});
	})
	function addPost() {
			var title =$("#title").val();
			var context =$("#context").val();
			var category=$("#category").val();
			
			if(title=="" || context==""){
				if(title=="" && context=="" ){
					alert("제목과 내용을 입력해주세요!!");
					$("#title").focus();
				}
				else if(context==""){
					alert("내용을 입력해주세요!!");
					$("#context").focus();
				}
				else{
					alert("제목을 입력해주세요!!");
					$("#title").focus();
				}
				return false;
			}
			if(category == "null"){
				alert("카테고리를 선택해주세요");
				$("#category").focus();
				return false;
			}
			
			if (confirm("게시글을 등록하시겠습니까?")) {
				document.addPostForm.submit();
			}
	}
</script>
<div class="bbs-container">
	<form action="${pageContext.request.contextPath}/front" method="post" name="addPostForm">
		<h4 class="card-title">게시글 작성</h4>
		<input type="hidden" name="command" value="AddPost">
		<table class="table table-bordered" style="width: 800px; margin-left: auto; margin-right: auto;">
			<tr>
				<td>Title</td>
				<td><input type="text" name="title" id="title" maxlength="20"></td>
			</tr>
			<tr>
				<td>context</td>
				<td><textarea name="context" rows="5" cols="20" id="context"></textarea></td>
			</tr>
			<tr>
				<td>category</td>
				<td><select name="category" id="category">
						<%-- SH: 카테고리 이름변경 시작--%>
						<option value="null">------------------------------</option>
						<option value="아이돌봄">아이돌봄</option>
						<option value="노인케어">노인케어</option>
						<option value="반려동물">반려동물</option>
						<%-- SH: 카테고리 이름변경 끝 --%>
				</select></td>
			</tr>
			<tr>
				<td>업무 시작일</td>
				<td><input type="date" name="StartWorkTime" id="startWorkTimeInput" ></td>
			</tr>
			<tr>
				<td>업무 종료일</td>
				<td><input type="date" name="EndWorkTime" id="endWorkTimeInput"></td>
			</tr>
			<%-- 하단버튼 --%>
			<tr>
				<td colspan="5" class="btnArea">
					<button type="button" class="btn" onclick="addPost()">등록</button>
					<button type="button" class="btn" onclick="postBack()">뒤로</button>
				</td>
			</tr>
		</table>
		<%-- 하단버튼 --%>
	</form>
</div>


