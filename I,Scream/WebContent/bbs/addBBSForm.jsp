<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>  
<div class="bbs-container">  
	<form action="${pageContext.request.contextPath}/front" method="post" >
			<div class="card-body">
				<h4 class="card-title">게시글 작성</h4>
				<div class="table-responsive">
				<input type="hidden" name="command" value="addBBS">
					<table class="table table-bordered" style="width:800px;margin-left: auto; margin-right: auto;">
								<tr>
						      		<td>Title</td>
						      		<td><input type="text" name="title"></td>
						      	</tr>
						      	<tr>
						      		<td>context</td>
						      		<td><textarea name="context" rows="5" cols="20"></textarea></td>
						      	</tr>
						      	<tr>
						      		<td>category </td>
						      		<td>
						      			<select name="category">
						      				  <option>------------------------------</option>
											  <option value="베이비시터">베이비시터</option>
											  <option value="펫시터">펫시터</option>
											  <option value="방문교사">방문교사</option>
										</select>
									</td>
						      	</tr>
						      	<tr>
						      		<td>workTime</td>
						      		<td><input type="text" name="workTime"></td>
						      	</tr>
					</table>
					
					<%-- 하단버튼 --%>
					<div class="row bbs-custom">
						<div class="col-sm-2 col-sm-offset-10">
							<div class="btn-group">
							    <button type="submit" class="btn btn-primary">등록</button>
							    <button type="button" class="btn btn-primary" id="Back()">뒤로</button>
						  	</div>
						</div>
					</div>
				</div>
			</div>
	</form>
	
</div>

									
