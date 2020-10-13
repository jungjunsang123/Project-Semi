<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>     
${sessionScope.mvo.name}   ㅁㅎㄻㄴㅇㅎㄹㅇㄴ
<c:import url="${requestScope.url}"/>
<c:choose>
<c:when test="${sessionScope.mvo==null}">
<a href="${pageContext.request.contextPath}/front?command=registerForm">회원가입</a>
<form method="post" action="${pageContext.request.contextPath}/front">
	<input type="hidden" name="command" value="login">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" required="required"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="password" required="required"></td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="submit" value="로그인"></td>
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