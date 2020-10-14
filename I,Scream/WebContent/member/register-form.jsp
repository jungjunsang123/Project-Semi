<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>     
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myhome.css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
    	<div class="col-sm-4 col-sm-offset-4" id="signinCss">
    			<a href="${pageContext.request.contextPath }/front?command=home">HOME</a>
   		</div>


<div class="col-sm-4 col-sm-offset-4">
<form action="${pageContext.request.contextPath}/front" method="post" id="registerForm">
		<input type="hidden" name="command" value="register"><br><br><br><br>
		
		

<table>
	<thead>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" id="memberId" required="required"><span id="checkResult"></span></td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>패스워드</td>
			<td><input type="password" name="password" required="required"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" required="required"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="address" required="required"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="tel" required="required"></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><input type="radio" name="gender" value="남">남 <input type="radio" name="gender" value="여">여</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type="number" name="age"></td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="submit" value="회원가입"></td>
		</tr>
	</tbody>

</table>
		
</form>
</div>
</div>
</body>
</html>