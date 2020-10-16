<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<div style="margin-right:3px;">
	<c:choose>
	<c:when test="${sessionScope.mvo==null}">
	<a href="${pageContext.request.contextPath}/front?command=registerForm">회원가입</a>
	<form method="post" action="${pageContext.request.contextPath}/front">
		<input type="hidden" name="command" value="login">
				<fieldset class="login_form">
					<div class="id_area">
						<span class="input_box">
							<input type="text" name="id" placeholder="아이디" required="required" width= 41px;>			
						</span>
					</div>
					<div class="password_form">
						<span class="input box">
							<input type="password" name="password" placeholder="비밀번호"required="required">		
						</span>
					</div>
					<input type="submit" value="로그인">
				</fieldset>
	</form>
	</c:when>
	<c:otherwise>
		${sessionScope.mvo.name} 님 로그인 상태<br>
		<a href="${pageContext.request.contextPath}/front?command=logout">로그아웃</a><br>
		회원정보수정<!-- 회원정보수정 추가예정 -->
	</c:otherwise>
	</c:choose>
</div> 
