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
<div class="table-responsive" id="recruitResultDiv">
<table class="table table-bordered table-hover boardlist" style="text-align:center;">
	<thead>
		<tr class="info">
			<td>번호</td>
			<td>채용분야</td>
			<td style="width:300px;">제목</td>
			<td style="width:150px;"> 등록일</td>
			<td>공고작성자</td>
			<td style="width:230px;">채용결과</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.ApplyList}" var="list" varStatus="applyNo">
			<tr>
				<td>${applyNo.count}</td>
				<td>${list.category}</td>
				<td><a href="${pageContext.request.contextPath}/front?command=DetailPost&bbs_no=${list.bbs_no}">${list.title}</a></td>
				<td>${list.createDate}</td>
				<td>${list.vo.id}</td>
				<td >
					<button type="button" class="btn recruitResultConfirm" value="${list.bbs_no}">채용결과 확인</button>
					<span class="hiredResult"></span>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>
<c:set var="pb" value="${requestScope.lvo.pagingBean}" />
<div class="pagingArea">
	<ul class="pagination">
		<c:if test="${pb.previousPageGroup}">
			<li><a href="front?command=findPostListById&pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a>
			</li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
			end="${pb.endPageOfPageGroup}">
			<c:choose>
				<c:when test="${empty requestScope.lvo.list}"></c:when>
				<c:when test="${pb.nowPage!=i}">
					<li><a href="front?command=findPostListById&pageNo=${i}">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li class="active"><a href="#">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pb.nextPageGroup}">
			<li><a
				href="front?command=findPostListById&pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a>
			</li>
		</c:if>
	</ul>
</div>
