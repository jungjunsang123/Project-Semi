<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>     

<script>
function reviewDetailBack(){
	location.href="${pageContext.request.contextPath}/front?command=ReviewList";
}
</script>
<div class="container">
	<div class="col-sm-12">
		<div class="card">
			<div class="card-header">
				<h4>후기 확인</h4>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col-sm-12">
						<input type="hidden" name="command" value="addBBS">
						<div class="col-sm-12">
							<table class="table table-bordered">
								<tr>
									<td>작성자</td>
									<td>별점</td>
									<td>작성일</td>
								</tr>
								<tr>
									<td>${requestScope.rvo.giveReviewer.id}</td>
									<td>${requestScope.rvo.stars }</td>
									<td>${requestScope.rvo.createDate }</td>
								</tr>
								<tr>
									<td colspan="3">
										<pre>${requestScope.rvo.review_context }</pre>
									</td>
								</tr>
							
							</table>
						</div>
						<div class="col-sm-offset-11 col-sm-1">
							<tr>
								<td colspan="5" class="btnArea">
									<button type="button" class="btn btn-secondary" onclick="reviewDetailBack()">뒤로</button>
								</td>
						
							</tr>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>