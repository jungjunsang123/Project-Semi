<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>     
<c:choose>
<c:when test="${sessionScope.mvo==null}">
<a href="${pageContext.request.contextPath}/front?command=registerForm">회원가입</a>
<form method="post" action="${pageContext.request.contextPath}/front" id="cssforsignin">
	<input type="hidden" name="command" value="login">
	<table>
		<tr>
			<td><input type="text" name="id" placeholder="아이디" required="required"></td>
		</tr>
		<tr>
			<td><input type="password" name="password" placeholder="비밀번호"required="required"></td>
		</tr>
		<tr>
			<td align="right"><input type="submit" value="로그인"></td>
		</tr>
	</table>
</form>
</c:when>
<c:otherwise>
	${sessionScope.mvo.name} 님 로그인 상태<br>
	<a href="${pageContext.request.contextPath}/front?command=logout">로그아웃</a><br>
	회원정보수정
</c:otherwise>
</c:choose>