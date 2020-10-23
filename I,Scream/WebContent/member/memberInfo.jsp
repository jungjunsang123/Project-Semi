<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 개인정보 수정 게시판 steart --%>
<table id="zero_config" class="table table-bordered table-hover boardlist" style="text-align:center;">
	<thead>
		<tr class="info">
			<td>아이디</td>
			<td>주소</td>
			<td>이름</td>
			<td>전화번호</td>
			<td>가입일</td>
			<td>성별</td>
			<td>생년월일</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>${sessionScope.mvo.id }</td>
			<td>${sessionScope.mvo.address}</td>
			<td>${sessionScope.mvo.name}</td>
			<td>${sessionScope.mvo.tel}</td>
			<td>${sessionScope.mvo.regDate}</td>
			<td>${sessionScope.mvo.sex}</td>
			<td>${sessionScope.mvo.birth}</td>
		</tr>
	</tbody>
	
	
</table>
<%-- 개인정보수정 게시판 end --%>
<div class="col-sm-offset-11 col-sm-1">
	<br> 
	<a href="${pageContext.request.contextPath}/front?command=memberUpdateForm">
	<button type="button" class="btn btn-secondary">회원정보 수정</button></a>
</div>
