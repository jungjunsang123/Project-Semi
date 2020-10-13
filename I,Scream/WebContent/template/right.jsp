<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>     
로그인/로그아웃, 회원정보 출력

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