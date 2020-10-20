<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#recruitResultDiv").on("click",".recruitResultConfirm",function(){
			var spanText = $(this).next();
			var btn = $(this);
			 $.ajax({	
				type: "post",
				url: "front",
				data: "command=recruitResultConfirm&bbs_no="+$(this).val(),
				success:function(result){ // result변수로 응답정보가 전달된다.
					if(result=="OK"){
						btn.remove();
						spanText.text("합격");
						//$("#hiredResult").text("합격");
					}
					else if(result=="FAIL"){
						btn.remove();
						spanText.text("불합격");
					}
					else if(result=="NO"){
						alert("결과 미발표");
					}
					else{
						alert("로그인부탁드립니다.");
						location.href="front?command=home";
					}
				}
			})//ajax 
			
		})
	})
</script>
<div class="bbs-container">
	<div class="card-body">
		<h4 class="card-title">게시글 및 지원자 확인</h4>
		<div class="table-responsive" id="recruitResultDiv">
			<table class="table table-bordered" style="width: 800px; margin-left: auto; margin-right: auto;">
				<tr>
					<td>No</td>
					<td>Category</td>
					<td>Title</td>
					<td>Date</td>
					<td>Writer</td>
					<td>채용결과</td>
				</tr>
				<c:forEach items="${requestScope.ApplyList}" var="list" varStatus="applyNo">
					<tr>
						<td>${applyNo.count}</td>
						<td>${list.category}</td>
						<td><a href="${pageContext.request.contextPath}/front?command=DetailPost&bbs_no=${list.bbs_no}">${list.title}</a></td>
						<td>${list.createDate}</td>
						<td>${list.vo.id}</td>
						<td>
							<button type="button" class="btn recruitResultConfirm" value="${list.bbs_no}">채용결과 확인</button>
							<span class="hiredResult"></span>
						</td>
					</tr>
				</c:forEach>
				</table>
		</div>
	</div>
</div>