<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>register form</title>
</head>
<body>
<div class="container">
<div class="col-sm-4 col-sm-offset-4">
<form action="${pageContext.request.contextPath}/front" method="post" id="registerForm">
		<input type="hidden" name="command" value="register">
아이디	<input type="text" name="id" id="memberId" required="required"><span id="checkResult"></span><br>
패스워드	<input type="password" name="password" required="required"><br>
이름		<input type="text" name="name" required="required"><br>
주소		<input type="text" name="address" required="required"><br>
전화번호	<input type="text" name="tel" required="required"><br>
성별		<input type="radio" name="gender" value="남">남 <input type="radio" name="gender" value="여">여<br>
생년월일	<input type="number" name="age">

<input type="submit" value="회원가입">
</form>
</div>
</div>
</body>
</html>