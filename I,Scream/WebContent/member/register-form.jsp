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
<div id="signinCss">
<script type="text/javascript">
	$(document).ready(function(){
		var checkId="";
		$("#memberId").keyup(function(){
			checkId="";
			var idValue=$(this).val();
			if(idValue.length<4 || idValue.length>10){
				$("#checkResult").html("아이디는 4자 이상 10자 이하만 가능합니다.").css("color","red");
				return;
			}//아이디는 4자 이상 10자 이하만 가능하게 해주는 ajax 통신
			$.ajax({
				type:"get",
				url:"front",
				data:"command=idcheck&id="+idValue,
				success:function(result){
					if(result=="ok"){
						$("#checkResult").html("사용가능한 아이디 입니다.").css("color","blue");
						checkId=idValue;
					}else
						$("#checkResult").html("사용불가능한 아이디 입니다.").css("color","red");
				}
			});
		});
		$("#registerForm").submit(function(){
			if(checkId==""){
				alert("아이디 중복을 확인해주세요!");
				return false;
			}else{
				
			}
		});
	});
	function passwordCheckFunction(){
		var pw1=$("#pw1").val();
		var pw2=$("#pw2").val();
		if(pw1.length<8||pw1.length>12){
			/*비밀번호 길이 해야함*/
		}
		if(pw1!=pw2){
			$("#passwordCheckMessage").html("비밀번호가 일치하지 않습니다.").css("color","red");
		}else{
			$("#passwordCheckMessage").html("비밀번호가 일치합니다.").css("color","blue");
		}
	}
</script>
<form action="${pageContext.request.contextPath}/front" method="post" id="registerForm" >
		<input type="hidden" name="command" value="register"><br>
				<h1 align="center"><a href="${pageContext.request.contextPath }/front?command=home"><img src="css/Seeter_logo.png" width="200" height="100"></a></h1><br>
			<font size= 4px >
			<b>아이디</b><br>
			<input type="text" name="id" id="memberId" required="required"><br>
			<span id="checkResult"></span><br>
			<b>비밀번호</b><br>
			<input type="password" name="password" onkeyup="passwordCheckFunction();" id="pw1" required="required"><br><br>
			<b>비밀번호확인</b><br>
			<input type="password" name="passwordconfirm" onkeyup="passwordCheckFunction();" id="pw2"required="required"><br>
			<span id="passwordCheckMessage"></span><br><br>
			<b>이름</b><br>
			<input type="text" name="name" required="required"><br><br>
			<b>주소</b><br>
			<input type="text" name="address" required="required"><br><br>
			<b>전화번호</b><br>
			<input type="text" name="tel" required="required"><br><br>
			<b>성별</b><br>
			<select name="sex" class="sexSelect">
			  <option value="성별">성별</option>
			  <option value="남자">남자</option>
			  <option value="여자">여자</option>
			  <option value="선택하지않음">선택하지않음</option>
			</select><br><br>
			<b>생년월일</b><br>
			<input type="date" name="birth" id="birth"><br><br>
			<input type="submit" value="회원가입"><br><br>
			</font>
</form>   	
</div>
<!-- footer -->
<div id="signinfooterCsds">
<a href="${pageContext.request.contextPath }/front?command=home"><img src="css/Seeter_logo.png" width="100" height="50"></a>&nbsp;&nbsp;For you. Seeter.
<br><br><br><br>
</div>
</body>
</html>

